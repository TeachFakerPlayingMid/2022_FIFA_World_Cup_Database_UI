import java.sql.* ;
import java.util.Scanner;
import java.util.regex.MatchResult;

public class Soccer {
    public static void main(String[] args) throws SQLException
    {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "exampletbl";

        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        String url = "jdbc:db2://winter2023-comp421.cs.mcgill.ca:50000/cs421";

        String your_userid = "cs421g216";
        String your_password = "tomjs123";

        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, your_userid, your_password);
        Statement stmt = con.createStatement();
        mainMenu(stmt);
    }

    public static void mainMenu(Statement statement) throws SQLException {
        System.out.println("Soccer Main Menu" + "\n"+
                            "   1. List information of matches of a country\n" +
                            "   2. Insert initial player information for a match\n" +
                            "   3. For you to design\n"+
                            "   4. Exit application\n"+
                            "Please Enter Your Option: ");
        Scanner option = new Scanner(System.in);
        String MenuSelection = option.nextLine();

        if (MenuSelection.equals("1"))
        {
            int one = -1;
            while (one == -1)
            {
                one = countryInfoList(statement);
            }
            mainMenu(statement);
        }
        else if (MenuSelection.equals("2"))
        {
            if (showPlayInfo(statement) == -1)
            {
                mainMenu(statement);
            }
        }
        else if (MenuSelection.equals("3"))
        {
            if (showRefInfo(statement) == -1)
            {
                mainMenu(statement);
            }

        }
        else if (MenuSelection.equals("4"))
        {
            return;
        }
    }

    public static int countryInfoList(Statement stmt) throws SQLException
    {
        System.out.println("please enter the country name you want to check: ");
        Scanner country = new Scanner(System.in);
        String countrySelection = country.nextLine();
        ResultSet countryInfo = stmt.executeQuery("WITH seatsInfo(identidier,seats_sold) AS\n" +
                "(\n" +
                "    SELECT IDENTIDIER,CAPACITY-AVAILABILITY as DIFFERENCE\n" +
                "    FROM MATCH INNER JOIN STADIUM\n" +
                "    ON MATCH.STADIUM = STADIUM.NAME\n" +
                ")\n" +
                "SELECT h_name,v_name,DATE,round,h_score,v_score,seats_sold\n" +
                "FROM MATCH_RESULT INNER JOIN seatsInfo\n" +
                "ON MATCH_RESULT.IDENTIDIER = seatsInfo.identidier " + "WHERE MATCH_RESULT.v_name = '"+ countrySelection + "' OR MATCH_RESULT.h_name= '"+ countrySelection + "';");
        while (countryInfo.next()) {
            System.out.println(countryInfo.getString("h_name") + ' ' + countryInfo.getString("v_name")
                    + ' ' + countryInfo.getDate("DATE") + ' ' + countryInfo.getString("round")
                    + ' ' + countryInfo.getInt("h_score") + ' ' + countryInfo.getInt("v_score")
                    + ' ' + countryInfo.getInt("seats_sold"));
        }
        System.out.println("Enter [A] to find matches of anther country, [P] to go to the previous menu:");
        Scanner countryInfoSelect = new Scanner(System.in);

        assert countryInfoSelect.hasNext("A") || countryInfoSelect.hasNext("P");
        if (countryInfoSelect.hasNext("A")) {
            return -1;
        } else if (countryInfoSelect.hasNext("P")) {
            return 0;
        }
        return 0;
    }

    public static int showPlayInfo(Statement stmt) throws SQLException {
        String currentDate = String.valueOf(java.time.LocalDate.now());
        System.out.println("Matches: ");
        ResultSet matchInfoList = stmt.executeQuery("SELECT IDENTIDIER,H_NAME,V_NAME,DATE,ROUND\n" +
                "FROM MATCH\n" +
                "WHERE MATCH.DATE -3 <= current date and MATCH.DATE >= current date" + ";");
        while (matchInfoList.next()) {
            System.out.println(matchInfoList.getInt("IDENTIDIER") + " " + matchInfoList.getString("H_NAME") + " "
                    + matchInfoList.getString("V_NAME") + " " + matchInfoList.getString("ROUND"));
        }
        System.out.println("Please enter a match identifier or you can press P to back to the previous menu: ");
        Scanner identifierSelect = new Scanner(System.in);
        String identifierInput = identifierSelect.nextLine();

        try {
            int identifier = Integer.parseInt(identifierInput);

        } catch (NumberFormatException e) {
            if (identifierInput.equalsIgnoreCase("p")) {
                return -1;
            } else {
                System.out.println("Invalid input");
                return -1;
            }
        }

        System.out.println("Please enter the country: ");
        Scanner countrySelect = new Scanner(System.in);
        String countryInput = countrySelect.nextLine();

        int identifierInt = Integer.parseInt(identifierInput);

        System.out.println("The following players from " + countryInput + " are already entered for match " + identifierInt + ":");
        ResultSet matchPlayer = stmt.executeQuery("SELECT NAME,SHIRT_NUMBER,DETAILED_POSITION_IN_GAME,0 AS ENTERED_TIME,NULL AS LEFT_TIME,0 AS YELLOW_CARD_NUMBER,0 AS RED_CARD_NUMBER\n" +
                                                      "FROM MATCH_PLAYER INNER JOIN PLAYER P on P.PID = MATCH_PLAYER.PID\n "+
                                                      "WHERE MATCH_PLAYER.IDENTIDIER  = " + identifierInt + " AND P.COUNTRY = '" + countryInput + "';");
        while (matchPlayer.next()) {
            System.out.println(matchPlayer.getString("NAME") + " " + matchPlayer.getInt("SHIRT_NUMBER") + " "
                    + matchPlayer.getString("DETAILED_POSITION_IN_GAME") + " from minute " + matchPlayer.getInt("ENTERED_TIME") + " to minute "
                    + matchPlayer.getInt("LEFT_TIME") + " yellow: " + matchPlayer.getInt("YELLOW_CARD_NUMBER") + " red: " + matchPlayer.getInt("RED_CARD_NUMBER"));
        }

        int twotwo = -1;
        while (twotwo == -1)
        {
            twotwo = insertPlayInfo(stmt,countryInput,identifierInt);
            showPlayInfo(stmt);
        }

        return 0;
    }
//---------------------------------------------------------------------------------------------------------------------------------------
    public static int insertPlayInfo(Statement stmt,String countryInput,int identifierInt) throws SQLException
    {
        System.out.println("Possible players from" + countryInput + "not yet selected: ");
        ResultSet notSelectedPlayer = stmt.executeQuery("with pid_no(pid) AS\n" +
                                                            "(   SELECT pid FROM PLAYER EXCEPT SELECT pid\n" +
                                                            "    FROM MATCH INNER JOIN MATCH_PLAYER ON MATCH.IDENTIDIER = MATCH_PLAYER.IDENTIDIER)\n" +
                                                            "SELECT NAME,GENERAL_POSITION,SHIRT_NUMBER\n" +
                                                            "FROM PLAYER\n" +
                                                            "WHERE PLAYER.PID IN (SELECT * FROM pid_no) AND PLAYER.COUNTRY = '"+countryInput +"';");
        while (notSelectedPlayer.next())
        {
            int count = 1;
            System.out.println(count +". "+ notSelectedPlayer.getString("NAME") + ' ' + notSelectedPlayer.getString("GENERAL_POSITION")
                                    + ' ' + notSelectedPlayer.getInt("SHIRT_NUMBER"));
            count++;
        }

        System.out.println("Enter the shirt number of the player you want to insert or [P]" +
                " to go to the previous menu");

        Scanner shirtNumSelect = new Scanner(System.in);
        String shirtNumInput = shirtNumSelect.nextLine();

        try {
            int shirtNum = Integer.parseInt(shirtNumInput);

        } catch (NumberFormatException e)
        {
            if (shirtNumInput.equalsIgnoreCase("p"))
            {
                return -1;
            }
            else
            {
                System.out.println("Invalid input");
                return -1;
            }
        }
        int shirtNum = Integer.parseInt(shirtNumInput);
        stmt.executeUpdate( "INSERT INTO MATCH_PLAYER (\n" +
                "                          SELECT PID,10007,FALSE AS ATTENDANCE,'00:00:00' AS ENTERED_TIME,'00:00:00' AS LEFT_TIME,GENERAL_POSITION,0 AS YELLOW_CARD_NUMBER,0 AS RED_CARD_NUMBER\n" +
                "                          FROM PLAYER WHERE PLAYER.COUNTRY = '"+countryInput +"' AND PLAYER.SHIRT_NUMBER = "+shirtNum+");");

    return 0;
    }

    public static int showRefInfo(Statement stmt) throws SQLException {
        System.out.println("Enter the referees ID or [P] to main menu");
        Scanner refereesID = new Scanner(System.in);
        String refereesIDInput = refereesID.nextLine();

        try {
            int Input = Integer.parseInt(refereesIDInput);

        } catch (NumberFormatException e) {
            if (refereesIDInput.equalsIgnoreCase("p")) {
                return -1;
            } else {
                System.out.println("Invalid input");
                return -1;
            }
        }
        int refID = Integer.parseInt(refereesIDInput);

        ResultSet resultSet = stmt.executeQuery("SELECT *\n" +
                                                    "FROM REFEREES\n" +
                                                    "WHERE REFEREES.RID = "+refID+";");
        while (resultSet.next()){
        System.out.println(resultSet.getInt("RID") + ' ' + resultSet.getString("NAME") + ' '
                + resultSet.getInt("YEAR_OF_EXPERIENCE") + ' ' + resultSet.getString("COUNTRY"));}
        return 0;
    }



}