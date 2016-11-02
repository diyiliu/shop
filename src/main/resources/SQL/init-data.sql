INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`available`) VALUES('1','管理平台','menu','','0','0/','1');

INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`sort`,`available`) VALUES('11','网站管理','menu','','1','0/1/',1,'1');
INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`sort`,`available`) VALUES('12','系统配置','menu','','1','0/1/',2,'1');


INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`sort`,`available`) VALUES('121','用户管理','menu','','12','0/1/12/',1,'1');
INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`sort`,`available`) VALUES('122','角色管理','menu','','12','0/1/12/',2,'1');
INSERT INTO `sys_resource` (`id`, `name`, `type`, `url`, `parent_id`, `parent_ids`,`sort`,`available`) VALUES('123','资源管理','menu','','12','0/1/12/',3,'1');