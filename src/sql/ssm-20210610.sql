SET FOREIGN_KEY_CHECKS=0;

drop table if EXISTS t_role;
create table t_role (
                        id int(12) auto_increment,
                        role_name varchar(60) not null,
                        note varchar(256) null,
                        primary key(id)
);

insert into t_role(role_name, note) values('role_name_01', 'note_01');
insert into t_role(role_name, note) values('role_name_02', 'note_02');
insert into t_role(role_name, note) values('role_name_03', 'note_03');
insert into t_role(role_name, note) values('role_name_04', 'note_04');
insert into t_role(role_name, note) values('role_name_05', 'note_05');
insert into t_role(role_name, note) values('role_name_06', 'note_06');
insert into t_role(role_name, note) values('role_name_07', 'note_07');
insert into t_role(role_name, note) values('role_name_08', 'note_08');
insert into t_role(role_name, note) values('role_name_09', 'note_09');
insert into t_role(role_name, note) values('role_name_10', 'note_10');

drop table  if EXISTS t_user;
create table t_user
(
    id                   int(12) not null auto_increment,
    user_name            varchar(60) not null,
    password             varchar(60) not null,
    sex                  char(1) not null,
    mobile               varchar(20) not null,
    tel                  varchar(20),
    email                varchar(60),
    note                 varchar(512),
    primary key (id)
);

insert into  t_user(user_name, `password`, sex, mobile, tel, email, note)
values('user_name_1', 'pwd1', 1, '13888888888', '010-88888888', 'y666@163.com', 'note_1');


/* 将性别名称修改为varchar型，用以测试EnumTypeHandler*/
alter table t_user modify sex varchar(10);
update t_user set sex = 'FEMALE' where sex = '1';
update t_user set sex = 'MALE' where sex = '0';


/***测试自定义typeHandler****/
update t_user set sex='0' where sex = 'FEMALE';
update t_user set sex='1' where sex = 'MALE';
alter table t_user modify sex int(10);

drop table  if EXISTS t_role2;
create table t_role2 (
                         id int(12),
                         role_name varchar(60) not null,
                         note varchar(256) null,
                         primary key(id)
);

DROP TABLE IF EXISTS t_user_role;
create table t_user_role (
                             id INT(12) AUTO_INCREMENT,
                             user_id int(12) not null,
                             role_id int(12) not null,
                             PRIMARY KEY(id),
                             unique(user_id, role_id)
) ;




/*==============================================================*/
/* Table: t_employee                                            */
/*==============================================================*/
DROP TABLE IF EXISTS t_employee;
CREATE TABLE t_employee
(
    id                   INT(12) NOT NULL AUTO_INCREMENT,
    real_name            VARCHAR(60) NOT NULL,
    sex                  INT(2) NOT NULL COMMENT '1 - ��
            0 -Ů',
    birthday             DATE NOT NULL,
    mobile               VARCHAR(20) NOT NULL,
    email                VARCHAR(60) NOT NULL,
    POSITION             VARCHAR(20) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: t_employee_task                                       */
/*==============================================================*/


DROP TABLE IF EXISTS t_employee_task;
CREATE TABLE t_employee_task
(
    id                   INT(12) NOT NULL auto_increment,
    emp_id               INT(12) NOT NULL,
    task_id              INT(12) NOT NULL,
    task_name            VARCHAR(60) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: t_female_health_form                                  */
/*==============================================================*/
DROP TABLE IF EXISTS t_female_health_form;
CREATE TABLE t_female_health_form
(
    id                   INT(12) NOT NULL AUTO_INCREMENT,
    emp_id               INT(12) NOT NULL,
    heart                VARCHAR(64) NOT NULL,
    liver                VARCHAR(64) NOT NULL,
    spleen               VARCHAR(64) NOT NULL,
    lung                 VARCHAR(64) NOT NULL,
    kidney               VARCHAR(64) NOT NULL,
    uterus               VARCHAR(64) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: t_male_health_form                                    */
/*==============================================================*/
DROP TABLE IF EXISTS t_male_health_form;
CREATE TABLE t_male_health_form
(
    id                   INT(12) NOT NULL AUTO_INCREMENT,
    emp_id               INT(12) NOT NULL,
    heart                VARCHAR(64) NOT NULL,
    liver                VARCHAR(64) NOT NULL,
    spleen               VARCHAR(64) NOT NULL,
    lung                 VARCHAR(64) NOT NULL,
    kidney               VARCHAR(64) NOT NULL,
    prostate             VARCHAR(64) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: t_task                                                */
/*==============================================================*/
DROP TABLE IF EXISTS t_task;
CREATE TABLE t_task
(
    id                   INT(12) NOT NULL auto_increment,
    title                VARCHAR(60) NOT NULL,
    context              VARCHAR(256) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: t_work_card                                           */
/*==============================================================*/
DROP TABLE IF EXISTS t_work_card;
CREATE TABLE t_work_card
(
    id                   INT(12) NOT NULL AUTO_INCREMENT,
    emp_id               INT(12) NOT NULL,
    real_name            VARCHAR(60) NOT NULL,
    department           VARCHAR(20) NOT NULL,
    mobile               VARCHAR(20) NOT NULL,
    POSITION             VARCHAR(30) NOT NULL,
    note                 VARCHAR(256),
    PRIMARY KEY (id)
);

ALTER TABLE t_employee_task ADD CONSTRAINT FK_Reference_4 FOREIGN KEY (emp_id)
    REFERENCES t_employee (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE t_employee_task ADD CONSTRAINT FK_Reference_8 FOREIGN KEY (task_id)
    REFERENCES t_task (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE t_female_health_form ADD CONSTRAINT FK_Reference_5 FOREIGN KEY (emp_id)
    REFERENCES t_employee (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE t_male_health_form ADD CONSTRAINT FK_Reference_6 FOREIGN KEY (emp_id)
    REFERENCES t_employee (id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE t_work_card ADD CONSTRAINT FK_Reference_7 FOREIGN KEY (emp_id)
    REFERENCES t_employee (id) ON DELETE RESTRICT ON UPDATE RESTRICT;


SET FOREIGN_KEY_CHECKS=1;

