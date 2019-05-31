create  database testshop;
use testshop;
drop table if exists sys_users;
drop table if exists sys_roles;
drop table if exists sys_permissions;
drop table if exists sys_users_roles;
drop table if exists sys_roles_permissions;

create table sys_users (
  id bigint auto_increment,
  username varchar(100),
  password varchar(100),
  salt varchar(100),
  locked bool default false,
  constraint pk_sys_users primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_users_username on sys_users(username);

create table sys_roles (
  id bigint auto_increment,
  role varchar(100),
  description varchar(100),
  available bool default false,
  constraint pk_sys_roles primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_roles_role on sys_roles(role);

create table sys_permissions (
  id bigint auto_increment,
  permission varchar(100),
  description varchar(100),
  available bool default false,
  constraint pk_sys_permissions primary key(id)
) charset=utf8 ENGINE=InnoDB;
create unique index idx_sys_permissions_permission on sys_permissions(permission);

create table sys_users_roles (
  user_id bigint,
  role_id bigint,
  constraint pk_sys_users_roles primary key(user_id, role_id)
) charset=utf8 ENGINE=InnoDB;

create table sys_roles_permissions (
  role_id bigint,
  permission_id bigint,
  constraint pk_sys_roles_permissions primary key(role_id, permission_id)
) charset=utf8 ENGINE=InnoDB;

INSERT INTO `sys_users` VALUES ('2', 'zhong', '0ea3d84e01585567ba4c86614850d171', 'b948daec328c83f57a9701dc46d7afb5', '0');
alter table sys_users AUTO_INCREMENT=1;
alter table sys_roles AUTO_INCREMENT=100001;
alter table sys_permissions AUTO_INCREMENT=200001;


INSERT INTO `sys_permissions` VALUES ('200001', '/admin/**', '管理员下面的所有操作', '0');
INSERT INTO `sys_permissions` VALUES ('200002', '/user/**', '普通用户的所有操作', '0');
INSERT INTO `sys_permissions` VALUES ('200003', 'test', 'no', '0');
INSERT INTO `sys_roles_permissions` VALUES ('100001', '200001');
INSERT INTO `sys_roles_permissions` VALUES ('100001', '200003');
INSERT INTO `sys_roles_permissions` VALUES ('100002', '200002');
INSERT INTO `sys_roles` VALUES ('100001', 'admin', '超级管理员', '0');
INSERT INTO `sys_roles` VALUES ('100002', 'common user', '普通用户', '0');
INSERT INTO `sys_roles` VALUES ('100003', 'guest', '游客', '0');
INSERT INTO `sys_users_roles` VALUES ('2', '100001');
INSERT INTO `sys_users_roles` VALUES ('2', '100002');
INSERT INTO `sys_users_roles` VALUES ('2', '100003');



