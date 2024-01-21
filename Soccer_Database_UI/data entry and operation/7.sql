ALTER TABLE Match
ADD CONSTRAINT data_constraint CHECK ( date <= '2023-6-30');


INSERT INTO Match (identidier, date, time, round, extra_program, availability, match_length, match_name, stadium)
VALUES
    (10017, '2023-07-01', '16:00:00', 'Group Round 1', NULL, 5000, 90, 'France vs Argentina', 'Al-Rayyan Stadium');