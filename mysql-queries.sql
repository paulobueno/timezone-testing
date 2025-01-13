CREATE TABLE timezone_test (
id int NOT NULL AUTO_INCREMENT,
created_at datetime NOT NULL,
PRIMARY KEY (id)
);


-- Computer -> Terminal commad `date` -> Sun Jan 12 10:23:47 PM -03 2025
-- Docker -> Terminal commad `date` -> Jan 13 01:23:47 UTC 2025
SELECT @@global.time_zone, @@session.time_zone, NOW(); -- SYSTEM, SYSTEM, 2025-01-13 01:23:47
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00"); -- 2024-01-01 00:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+03:00"); -- 2023-12-31 21:00:00

SET GLOBAL time_zone = 'America/Sao_Paulo';
SELECT @@global.time_zone, @@session.time_zone, NOW(); -- America/Sao_Paulo, SYSTEM, 2025-01-13 01:23:47 (It remains the same)
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00"); -- 2024-01-01 00:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+03:00"); -- 2023-12-31 21:00:00

SET SESSION time_zone = 'America/Sao_Paulo';
SELECT @@global.time_zone, @@session.time_zone, NOW(); -- America/Sao_Paulo, America/Sao_Paulo, 2025-01-13 22:23:47
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00"); -- 2024-01-01 00:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+03:00"); -- 2023-12-31 18:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+00:00"); -- 2023-12-31 21:00:00

-- IF IT COMES WITHOUT TIME ZONE +XX:XX:XX, IT WILL BE SAVED AS IT IS
SELECT NOW(); -- 2025-01-12 22:50:51
INSERT INTO timezone_test (created_at) VALUES (NOW()); -- 2025-01-12 22:50:41

TRUNCATE TABLE timezone_test;

-- SETTING DOCKER AS America/Sao_Paulo
-- Docker -> Terminal commad `date` -> Sun Jan 12 10:23:47 PM -03 2025
SELECT @@global.time_zone, @@session.time_zone, NOW(); -- SYSTEM, SYSTEM, 2025-01-12 22:23:47
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00"); -- 2024-01-01 00:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+03:00"); -- 2023-12-31 18:00:00
INSERT INTO timezone_test (created_at) VALUES ("2024-01-01 00:00:00+00:00"); -- 2023-12-31 21:00:00

