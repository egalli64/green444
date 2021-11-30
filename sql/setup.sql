clients-- run it on MySQL as root

drop user if exists green;
drop schema if exists green;

-- !!! don't choose such a lousy password in real life! !!!
create user green identified by 'password';
create schema green;

grant all privileges on green.* to green;
grant alter routine on green.* to green;


