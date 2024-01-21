--a.Write a SQL query that lists all the stadium names and their locations and the match date of matches
--in which player Christine Sinclair has played and scored at least one goal.
-- I will change Christine Sinclair into Kylian Mbappe, whose pid = 9000012
SELECT s.name, s.location, m.date
FROM STADIUM s INNER JOIN MATCH m
                          ON s.name = m.stadium
WHERE m.identidier IN ( SELECT identidier
                        FROM Player p INNER JOIN MatchGoals
                        ON p.pid = MatchGoals.who_scored
                        WHERE p.name = 'Kylian Mbappe' AND MATCHGoals.occurrence >=1)
AND m.identidier IN ( SELECT ATTENDANCE
                      FROM Match_Player
                      WHERE MATCH_PLAYER.ATTENDANCE = true);

-----------------------------------------------------------------------------------------------------
--b.Write a SQL query that lists the name, shirt number and country of all players that have played in all
--matches of their teams.
SELECT name,shirt_number,country
FROM PLAYER
WHERE PLAYER.pid IN (SELECT pid
                     FROM MATCH_PLAYER
                     WHERE MATCH_PLAYER.attendance = true
                     EXCEPT
                     SELECT pid
                     FROM MATCH_PLAYER
                     WHERE MATCH_PLAYER.attendance = false);

-------------------------------------------------------------------------------------------------------
--c.Write a SQL query that lists for each team, the country, the number of matches they have played and the
--total number of goals they have scored during normal play

with goal_info(pid,goals) AS
(
    SELECT who_scored,COUNT(who_scored) as num_goals
    FROM Matchgoals m
    GROUP BY who_scored
)
SELECT Country,COUNT(goals) AS goal_num
FROM Player INNER JOIN goal_info
ON Player.PID = goal_info.pid
GROUP BY Country;

ALTER TABLE TEAM
ADD goal_num INTEGER;

UPDATE TEAM
SET TEAM.goal_num = 1
WHERE COUNTRY = 'Argentina';

UPDATE TEAM
SET TEAM.goal_num = 2
WHERE COUNTRY = 'England';

UPDATE TEAM
SET TEAM.goal_num = 2
WHERE COUNTRY = 'France';

UPDATE TEAM
SET TEAM.goal_num = 1
WHERE COUNTRY = 'Germany';

UPDATE TEAM
SET TEAM.goal_num = 0
WHERE COUNTRY = 'Brazil';

UPDATE TEAM
SET TEAM.goal_num = 0
WHERE COUNTRY = 'Spain';

with total_info(country,count_total) AS
         (SELECT Match.country, SUM(Match.COUNTS) AS COUNT_TOTAL
          FROM (SELECT Match.h_name AS country, COUNT(*) AS COUNTS
                FROM Match
                GROUP BY h_name
                UNION ALL
                SELECT Match.v_name AS country, COUNT(*) AS COUNTS
                FROM Match
                GROUP BY v_name) Match
          GROUP BY Match.country)
SELECT TEAM.country,count_total,goal_num FROM total_info INNER JOIN TEAM
ON TEAM.COUNTRY = total_info.country;

SELECT *
FROM TEAM;


