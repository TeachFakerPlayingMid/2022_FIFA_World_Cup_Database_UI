CREATE VIEW playerinfo(name, shirt_number,DOB, country, national_assiciation,group)
AS SELECT name, shirt_number,DOB, p.country, t.national_association,group
FROM PLAYER p INNER JOIN TEAM t
ON p.country = t.country;

SELECT * FROM playerinfo LIMIT 5;

SELECT name
FROM playerinfo
WHERE playerinfo.group = 'A'
LIMIT 5;

INSERT INTO playerinfo
VALUES('Ángel Fabián Di María', 11,'1988-2-14', 'Argentina','Argentine Football Association','A')