-- +user
CREATE USER elmalving WITH PASSWORD 'admin';

CREATE ROLE moderator;

-- +role
GRANT moderator TO elmalving;

-- Rights to access DB
GRANT CONNECT ON DATABASE RDBS TO elmalving;

-- Role 'moderator' can use any of these commands on table 'student'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE student TO moderator;

-- -role from user
REVOKE moderator FROM elmalving;

-- -user
DROP USER elmalving;

-- -role
DROP ROLE nova_role;