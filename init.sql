create database service;
use service;
source /db/service.sql;

create user 'cardviewer'@'%'  identified by 'cardviewer';
grant all privileges on service.* to cardviewer@'%';