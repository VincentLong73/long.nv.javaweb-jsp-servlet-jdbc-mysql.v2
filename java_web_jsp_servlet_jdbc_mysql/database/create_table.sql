use java_web_jdbc_servlet_jsp_mysql;
create table role(
id bigint not null auto_increment,
name varchar(255) not null,
code varchar(255) not null,
createddate timestamp null,
modifieddate timestamp null,
createdby varchar(255) null,
modifiedby varchar(255) null,
primary key(id)
);

create table user(
id bigint not null auto_increment,
username varchar(255) not null,
password varchar(255) not null,
fullname varchar(255) null,
status int not null,
roleid bigint not null,
createddate timestamp null,
modifieddate timestamp null,
createdby varchar(255) null,
modifiedby varchar(255) null,
primary key(id)
);
alter table user add constraint fk_user_role foreign key(roleid) references role(id);

create table news(
id bigint not null auto_increment,
title varchar(255) null,
thumbnail varchar(255) null,
shortdescription text null,
content text null,
categoryid bigint not null,
createddate timestamp null,
modifieddate timestamp null,
createdby varchar(255) null,
modifiedby varchar(255) null,
primary key(id)
);

create table category(
id bigint not null auto_increment,
name varchar(255) not null,
code varchar(255) not null,
createddate timestamp null,
modifieddate timestamp null,
createdby varchar(255) null,
modifiedby varchar(255) null,
primary key(id)
);

alter table news add constraint fk_new_category foreign key(categoryid) references category(id);

create table comment(
id bigint not null auto_increment,
content text not null,
user_id bigint not null,
new_id bigint not null,
createddate timestamp null,
modifieddate timestamp null,
createdby varchar(255) null,
modifiedby varchar(255) null,
primary key(id)
);

alter table comment add constraint fk_comment_user foreign key(user_id) references user(id);
alter table comment add constraint fk_comment_news foreign key(new_id) references news(id);

