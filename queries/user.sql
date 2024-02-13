-- +user
CREATE USER elmalving WITH PASSWORD 'admin';

CREATE ROLE moderator;

-- +role
GRANT moderator TO elmalving;

-- Rights to access DB
GRANT CONNECT ON DATABASE RDBS TO elmalving;

-- Role 'moderator' can use any of these commands on table 'student'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE student TO moderator;

-- Role 'moderator' won't be able to use these commands
REVOKE SELECT ON TABLE student FROM moderator;

-- -role from user
REVOKE moderator FROM elmalving;

-- -user
DROP USER elmalving;

-- -role
DROP ROLE nova_role;