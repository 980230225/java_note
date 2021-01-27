-- Database: java_note

-- DROP DATABASE java_note;

CREATE DATABASE java_note
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Chinese (Simplified)_China.936'
    LC_CTYPE = 'Chinese (Simplified)_China.936'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE java_note
    IS 'java_note';
	
create table test(title varchar(255),content text);
drop table test;
create table test(uid int,uname varchar(20));

select version(); 