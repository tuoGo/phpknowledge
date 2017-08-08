-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: rm-bp121oh6jne1a0nls.mysql.rds.aliyuncs.com
-- Generation Time: 2017-08-08 16:34:43
-- 服务器版本： 5.6.16-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `home`
--

-- --------------------------------------------------------

--
-- 表的结构 `sanda_ad`
--

CREATE TABLE `sanda_ad` (
  `ad_id` bigint(20) NOT NULL COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_asset`
--

CREATE TABLE `sanda_asset` (
  `aid` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_auth_access`
--

CREATE TABLE `sanda_auth_access` (
  `role_id` mediumint(8) UNSIGNED NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_auth_rule`
--

CREATE TABLE `sanda_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限规则表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_auth_rule`
--

INSERT INTO `sanda_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '文章管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Demo', 'admin_url', 'demo/adminindex/index', NULL, '', 1, ''),
(163, 'Demo', 'admin_url', 'demo/adminindex/last', NULL, '', 1, ''),
(166, 'Admin', 'admin_url', 'admin/mailer/test', NULL, '测试邮件', 1, ''),
(167, 'Admin', 'admin_url', 'admin/setting/upload', NULL, '上传设置', 1, ''),
(168, 'Admin', 'admin_url', 'admin/setting/upload_post', NULL, '上传设置提交', 1, ''),
(169, 'Portal', 'admin_url', 'portal/adminpost/copy', NULL, '文章批量复制', 1, ''),
(170, 'Admin', 'admin_url', 'admin/menu/backup_menu', NULL, '备份菜单', 1, ''),
(171, 'Admin', 'admin_url', 'admin/menu/export_menu_lang', NULL, '导出后台菜单多语言包', 1, ''),
(172, 'Admin', 'admin_url', 'admin/menu/restore_menu', NULL, '还原菜单', 1, ''),
(173, 'Admin', 'admin_url', 'admin/menu/getactions', NULL, '导入新菜单', 1, ''),
(174, 'Admin', 'admin_url', 'admin/car/default', NULL, '业务管理', 1, ''),
(175, 'Admin', 'admin_url', 'admin/car/index', NULL, '车辆管理', 1, ''),
(176, 'Admin', 'admin_url', 'admin/service/index', NULL, '网点管理', 1, ''),
(177, 'Admin', 'admin_url', 'admin/car/add', NULL, '新增车辆', 1, ''),
(178, 'Admin', 'admin_url', 'admin/emaillog/index', NULL, '租车申请', 1, ''),
(179, 'Admin', 'admin_url', 'admin/brand/index', NULL, '品牌管理', 1, ''),
(180, 'Admin', 'admin_url', 'admin/brand/add', NULL, '新增', 1, ''),
(181, 'Admin', 'admin_url', 'admin/brand/edit', NULL, '编辑', 1, ''),
(182, 'Admin', 'admin_url', 'admin/brand/del', NULL, '删除', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sanda_brand`
--

CREATE TABLE `sanda_brand` (
  `id` int(11) UNSIGNED NOT NULL COMMENT 'id',
  `brand` varchar(255) NOT NULL COMMENT '品牌',
  `img` varchar(255) NOT NULL COMMENT '默认图片',
  `img_hover` varchar(255) NOT NULL COMMENT '浮动图片',
  `img_car` varchar(255) NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态 0-下架 1-上架',
  `top1` tinyint(3) UNSIGNED NOT NULL COMMENT '首页轮播推荐 0-不推荐 1-推荐',
  `top2` tinyint(3) UNSIGNED NOT NULL COMMENT '首页轮播下品牌列表推荐 0-不推荐 1-推荐',
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `en_brand` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sanda_brand`
--

INSERT INTO `sanda_brand` (`id`, `brand`, `img`, `img_hover`, `img_car`, `create_time`, `status`, `top1`, `top2`, `price`, `description`, `en_brand`) VALUES
(1, '阿斯顿马丁', 'admin/20170106/586f2858d2a02.png', 'admin/20170106/586f28959601f.png', 'admin/20170216/58a51f0bef20c.png', 1483679907, 1, 1, 1, 4000, ' 由莱昂内尔&amp;middot;马丁(LionelMartin)和罗伯特&amp;middot;班福特(RobertBamford)于1913年共同组建，公司名为Bamford &amp;amp; Martin。其品牌一直是造型别致、精工细作、性能卓越的运动跑车的代名词，被称为跑车中的劳斯莱斯。马丁是一个赛车手，而班福特则是一名工程师，1913年两人合作开始制造高档赛车，公司当时的名称是马丁&amp;middot;班福德公司，1914年他们生产出自己的第一辆汽车。', 'Aston Martin'),
(2, '奥迪', 'admin/20170109/5872f6081fb51.png', 'admin/20170109/5872f60d10c42.png', '', 1483680125, 1, 0, 0, 0, '', ''),
(3, '宾利', 'admin/20170106/586f298e56821.png', 'admin/20170106/586f2993048a0.png', 'admin/20170216/58a51f1a6c5cc.png', 1483680149, 1, 1, 1, 3500, ' 宾利飞驰外观造型流畅动感，LED日间行车灯、会车灯以及尾灯分别成为前部和后部的点睛之笔。宾利飞驰的造型确立了宾利高性能四门轿车新的设计特征。更低的车顶设计、具有强烈雕塑感的车身面板、精细的特征线条以及富于肌肉感的后腰造型，使宾利飞驰呈现出更具冲击力的姿态和动感有力的轮廓。', 'Bentley'),
(4, '奔驰', 'admin/20170106/586f29a236c26.png', 'admin/20170106/586f29a7e6ae1.png', '', 1483680170, 1, 0, 1, 0, '', ''),
(5, '宝马', 'admin/20170106/586f29b6a861a.png', 'admin/20170106/586f29bc04582.png', '', 1483680189, 1, 0, 1, 0, '', ''),
(6, '布加迪', 'admin/20170106/586f29cddb3a0.png', 'admin/20170106/586f29d3549b2.png', '', 1483680214, 0, 0, 0, 0, '', ''),
(7, '法拉利', 'admin/20170106/586f29e6870d8.png', 'admin/20170106/586f29ec2dd4d.png', 'admin/20170216/58a51f2ce2d9d.png', 1483680238, 1, 1, 1, 5980, ' 法拉利458 Italia是一款中后置8缸双门跑车，在2009年法兰克福车展上推出，标志着法拉利（Ferrari）在其原有中后置发动机跑车的基础上实现了重大飞跃。458指的是4.5升、8缸发动机，Italia象征458 Italia的诞生不仅是法拉利的骄傲，更是所有意大利人的荣耀。458 Italia出自意大利著名的宾尼法利纳（Pininfarina）汽车设计工作室，但它的整体造形却完全颠覆了过去法拉利跑车给人的既有印象，充满了前所未有的束炜式未来感。', 'Ferrari'),
(8, '兰博基尼', 'admin/20170106/586f29ff79e0d.png', 'admin/20170106/586f2a070491f.png', 'admin/20170216/58a51f38a7df1.png', 1483680264, 1, 1, 1, 2980, '兰博基尼Gallardo是兰博基尼推出的一款超级跑车，最早在2003年日内瓦车展上亮相，兰博基尼Gallardo已服役10年，从最入门级车型Gallardo到GallardoLP570-4，期间推出超过11个以上车型，Gallardo是一款暴力的超级跑车，配备5.0或5.2升的V10发动机，在最早的第一代Gallardo就超过500马力，最高车速可达325km/h。 ', 'Lamborghini'),
(9, '路虎', 'admin/20170109/5872f5ed74059.png', 'admin/20170109/5872f5f2d8ead.png', '', 1483680288, 1, 0, 0, 0, '', ''),
(10, '玛莎拉蒂', 'admin/20170106/586f2a2d14bfc.png', 'admin/20170106/586f2a33969b2.png', 'admin/20170216/58a51f4689c99.png', 1483680309, 1, 1, 1, 1600, ' GranTurismo的设计灵感源自玛莎拉蒂Birdcage 75周年概念车，完美融合优雅格调与卓越工程设计，由意大利设计巨擘宾尼法利纳亲自操刀的车身轮廓饱满有型，搭载强悍无双的发动机，令这款四座跑车焕发澎湃动力，带来动感激扬的驾驭享受。', 'Maserati'),
(11, '迈凯伦', 'admin/20170106/586f2a4b608e8.png', 'admin/20170106/586f2a51c1437.png', '', 1483680339, 1, 0, 1, 0, '', ''),
(12, '劳斯莱斯', 'admin/20170106/586f2a65485bd.png', 'admin/20170106/586f2a6dc8253.png', '', 1483680367, 1, 0, 1, 0, '', ''),
(13, '特斯拉', 'admin/20170109/5872f5dbcf9fb.png', 'admin/20170109/5872f5e041110.png', '', 1483680391, 1, 0, 0, 0, '', ''),
(14, '丰田', 'admin/20170109/5872f5ca66de6.png', 'admin/20170109/5872f5d0f34f5.png', '', 1483680417, 0, 0, 0, 0, '', ''),
(15, '保时捷', 'admin/20170109/5872f56366655.png', 'admin/20170109/5872f56d3e7c2.png', 'admin/20170216/58a51ec35758a.png', 1483689142, 1, 1, 1, 1300, ' 搭载从3.2升排气量升级至3.6升之V6汽缸引擎，可输出最大马力290匹，较前一款提升了40匹，由静止加速至时速破百公里仅需8.1秒，极速可达227公里。', 'Cayenne');

-- --------------------------------------------------------

--
-- 表的结构 `sanda_cars`
--

CREATE TABLE `sanda_cars` (
  `id` int(10) UNSIGNED NOT NULL,
  `cover` text NOT NULL COMMENT '封面',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `attribute` text NOT NULL COMMENT '其他属性',
  `brand` varchar(255) NOT NULL COMMENT '品牌',
  `price` int(10) UNSIGNED NOT NULL COMMENT '价格/天',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `status` tinyint(3) UNSIGNED NOT NULL COMMENT '是否可用 1正常 0 不正常',
  `istop` tinyint(1) UNSIGNED NOT NULL COMMENT ' 0 不上首页 1 上首页',
  `index_img` varchar(255) NOT NULL COMMENT '首页图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sanda_cars`
--

INSERT INTO `sanda_cars` (`id`, `cover`, `name`, `description`, `attribute`, `brand`, `price`, `create_time`, `update_time`, `status`, `istop`, `index_img`) VALUES
(4, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0bbe5e18.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0bd9c2e3.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0bf4f225.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0c099b1d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0c1d0f3f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0c5b4227.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0c7c9e6c.jpg\"]', '劳斯莱斯 古斯特', '劳斯莱斯古斯特搭载6.6升双涡轮增压V12发动机，匹配ZF公司的8速自动变速箱，功率发挥直逼500马力，尽管定位低于幻影Phantom，但是古斯特的动力却占了上风。', '{\"size\":\"5399mm*1948mm*1550mm\",\"oil\":\"13.8L\\/100km\",\"engine\":\"6.6T V12\\u53d1\\u52a8\\u673a\",\"max\":\"250km\\/h\",\"acceleration\":\"4.9\\u79d2\",\"drive\":\"\\u524d\\u7f6e\\u540e\\u9a71\"}', '劳斯莱斯', 5500, 1483605990, 1487130396, 1, 0, ''),
(5, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd240dd3.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd3c7028.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd4e0f0b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd6232ff.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd732598.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd80e93d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfd913734.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bfdaa6334.jpg\"]', '奥迪R8 Spyder V10', '奥迪R8 Spyder是一款集结了超凡性能、出色操控及大胆创新的超级跑车，颠覆了国人对于奥迪品牌“公务车”的认知。在2010年初，奥迪R8 Spyder便以潮流的设计和卓越的性能荣获著名汽车杂志auto motor und sport颁发的“2010年度最佳敞篷车”大奖。此外，奥迪R8 Spyder还承载着奥迪赛车的传奇历史。其时尚且个性的外表下流淌着上世纪三十年代赛车的高贵血脉，现代版原型车勒芒R8赛车更是拥有5次问鼎勒芒24小时耐力赛冠军的优异成绩。2011年7月4日，奥迪R8 Spyder车型正式登', '{\"size\":\"4441\\u00d71904\\u00d71239mm\",\"oil\":\"21.5L\\/100km\",\"engine\":\"386kW(5.2L\\u81ea\\u7136\\u5438\\u6c14)\",\"max\":\"311\",\"acceleration\":\"3.8\\u79d2\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '奥迪', 3980, 1483682814, 1487060957, 1, 0, ''),
(6, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf6f78317.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf7226410.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf740e771.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf757e5b3.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf768510f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf7790700.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bf7aa7462.jpg\"]', '特斯拉 MODEL S 85', 'Model S 拥有极佳的驾驶体验。驾驶室将精密的噪声工程设计与特斯拉独有的安静动力总成相结合，实现了录音室般的音效控制。 17 英寸超大触摸屏是内饰中的亮点，其位置略偏向于驾驶者以方便操作，有日间和夜间两种模式，通过互联网提供丰富的媒体娱乐功能，同时内置导航功能，方便搜索目的地或附近的新餐厅。\n\n双电机 Model S 是对传统全轮驱动系统的一项创新性改进。车身前后各搭载一台电动机，通过对前后轮扭矩分别进行数字化独立控制，实现了在各种路况下的全天候牵引力控制。\n\n传统全轮驱动汽车通过复杂的机械联动装置，', '{\"size\":\"4970mm*1964mm*1445mm\",\"oil\":\"19\\u5343\\u74e6\\u65f6\\/\\u767e\\u516c\\u91cc\",\"engine\":\"\\u7eaf\\u7535\\u52a8 367\\u9a6c\\u529b\",\"max\":\"200\",\"acceleration\":\"2.7\",\"drive\":\"\\u540e\\u7f6e\\u540e\\u9a71\"}', '特斯拉', 1600, 1483683076, 1487060902, 1, 0, ''),
(7, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bea5c7778.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bea77a82f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bea8b9d9c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bea9de70c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2beac94acb.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2beaeb20bf.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2beb201f26.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2beb42d284.jpg\"]', '玛莎拉蒂Gran Turismo', 'GranTurismo的设计灵感源自玛莎拉蒂Birdcage 75周年概念车，完美融合优雅格调与卓越工程设计，由意大利设计巨擘宾尼法利纳亲自操刀的车身轮廓饱满有型，搭载强悍无双的发动机，令这款四座跑车焕发澎湃动力，带来动感激扬的驾驭享受。\n柔和起伏的曲线，勾勒出俊朗流畅、符合空气动力学原理的迷人外观，尽显纯正赛车风范。车头极富力量与动感，椭圆形前格栅和水平布局的前照灯可谓点睛之笔，LED日间行车灯与前保险杠的线条完美相融。修长的发动机罩上的经典V型凸起，以及两侧翼子板上的三个进气口，都体现了玛莎拉蒂的悠久', '{\"size\":\"4933mm*1915mm*1343mm\",\"oil\":\"15.5L\\/km\",\"engine\":\"4.7L 460\\u9a6c\\u529b V8\",\"max\":\"303\",\"acceleration\":\"4.9\",\"drive\":\"\\u524d\\u7f6e\\u540e\\u9a71\"}', '玛莎拉蒂', 3000, 1483683357, 1487060663, 1, 0, ''),
(8, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd1aecdee.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd20a25b9.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd2610391.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd27d2856.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd29a9e0f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd2baeb08.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bd300d20c.jpg\"]', '法拉利458 Spyder', '法拉利458 Italia是一款中后置8缸双门跑车，在2009年法兰克福车展上推出，标志着法拉利（Ferrari）在其原有中后置发动机跑车的基础上实现了重大飞跃。458指的是4.5升、8缸发动机，Italia象征458 Italia的诞生不仅是法拉利的骄傲，更是所有意大利人的荣耀。458 Italia出自意大利著名的宾尼法利纳（Pininfarina）汽车设计工作室，但它的整体造形却完全颠覆了过去法拉利跑车给人的既有印象，充满了前所未有的束炜式未来感', '{\"size\":\"4527mm\\u00d71937mm\\u00d71213mm\",\"oil\":\"13.3\\u5347\\/\\u767e\\u516c\\u91cc\",\"engine\":\"4.5L 578\\u9a6c\\u529b V8\\u53d1\\u52a8\\u673a\",\"max\":\"325\",\"acceleration\":\"3.4\",\"drive\":\"\\u540e\\u8f6e\\u9a71\\u52a8\"}', '法拉利', 7500, 1483684208, 1487060604, 1, 0, ''),
(9, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcce91fb4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bccfad410.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcd1711db.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcd3e9449.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcd642949.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcd7d0694.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bcda45c24.jpg\"]', '迈凯轮MP4-12 Spyder 敞篷版', '在超跑市场竞争日趋激烈的今天，英国超跑制造商迈凯伦已经意识到其稍显薄弱的产品线并不足以对抗法拉利等传统豪强，继推出超级跑车650S Coupe后，迈凯伦将在新车型的推出上继续发力。日前网通社从车迷世界Worldcarfans获悉，迈凯伦将推出全新勒芒版超跑650S Coupe Le Mans。新车将基于迈凯伦650SCoupe车型打造而来，并于2018年问世。', '{\"size\":\"4509mm*1908mm*1203mm\",\"oil\":\"\",\"engine\":\"\",\"max\":\"329\",\"acceleration\":\"3.3\",\"drive\":\"\\u4e2d\\u7f6e\\u540e\\u9a71\"}', '迈凯伦', 6980, 1483684573, 1487060190, 1, 0, ''),
(10, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc29b5936.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc2b7f823.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc2d2fd31.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc2fe38b4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc3231307.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc3404874.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc377184c.jpg\"]', '奔驰 SLS AMG', '奔驰SLS AMG是AMG级别的顶级产品，是优雅外形与高强动力结合的典范，价格昂贵、动力强劲而不乏豪华气息[1]  。它搭载的是一台AMG为其量身打造的6.2L V8发动机，最高时速高达317km/h[2]  ，上掀式的鸥翼门是古典车型300SL的延续，在量产车型中极为稀有，彰显出奔驰跑车独有的华贵气质。目前，该系列的衍生车型有SLS AMG GT、SLS AMG Blackseries、SLS AMG E-Cell、SLS AMG Electric Drive等。', '{\"size\":\"4638mm*1939mm*1262mm\",\"oil\":\"11.9~14.8L\",\"engine\":\"6.2L V8\\u53d1\\u52a8\\u673a\",\"max\":\"317\",\"acceleration\":\"3.6\",\"drive\":\"\\u524d\\u7f6e\\u540e\\u9a71\"}', '奔驰', 2980, 1483684842, 1487060027, 1, 0, ''),
(11, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc0735560.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc08706a1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bc099a7ad.jpg\"]', '兰博基尼LP570-4', '兰博基尼Gallardo是兰博基尼推出的一款超级跑车，最早在2003年日内瓦车展上亮相，兰博基尼Gallardo已服役10年，从最入门级车型Gallardo到GallardoLP570-4，期间推出超过11个以上车型，Gallardo是一款暴力的超级跑车，配备5.0或5.2升的V10发动机，在最早的第一代Gallardo就超过500马力，最高车速可达325km/h。\n截至2012年底，Gallardo总销量已超过13,000辆，不仅是兰博基尼历史上产量最高的车型，更是世界上最成功的高性能跑车之一。', '{\"size\":\"4386mm*1900mm*1165mm\",\"oil\":\"15L\",\"engine\":\"CEH\",\"max\":\"325\",\"acceleration\":\"3.4\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '兰博基尼', 3800, 1483685228, 1488421474, 1, 0, ''),
(12, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbb9275bc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbbbdd84e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbbe0bed2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbbf9116b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbc2c48c2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbc575fef.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bbc79c1f7.jpg\"]', '法拉利 California', '法拉利California是一款豪华旅行跑车，2008年在巴黎汽车展上首次亮相，是有史以来第一款采用中前置V8发动机、第一款采用折叠硬顶敞篷的法拉利GT跑车，可以在3.9秒完成0-100km/h的冲刺，最高时速可达310km/h。California由宾尼法利纳（Pininfarina）设计，传承了1957年法拉利推出的一款针对美国市场的250 GT California Spyder敞篷跑车的精髓。California将毫不妥协的运动性能和实用的灵活性结合在一起，同时也提供了所有法拉利跑车所共有的无与伦', '{\"size\":\"4.56\\u7c73\\u00d71.9\\u7c73\\u00d71.234\\u7c73\",\"oil\":\"13\\u5347\\/\\u767e\\u516c\\u91cc\",\"engine\":\"4.3L 460\\u9a6c\\u529b V8\\u53d1\\u52a8\\u673a\",\"max\":\"310\",\"acceleration\":\"3.9\",\"drive\":\"\\u524d\\u7f6e\\u540e\\u9a71\"}', '法拉利', 3800, 1483685384, 1487059914, 0, 0, ''),
(13, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28196aec.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28358348.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c2852a359.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c2867be7a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c288724f8.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28a0af3f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28bc162d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28d21be1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c28f0ab1d.jpg\"]', '宾利 飞驰', '宾利飞驰外观造型流畅动感，LED日间行车灯、会车灯以及尾灯分别成为前部和后部的点睛之笔。宾利飞驰的造型确立了宾利高性能四门轿车新的设计特征。更低的车顶设计、具有强烈雕塑感的车身面板、精细的特征线条以及富于肌肉感的后腰造型，使宾利飞驰呈现出更具冲击力的姿态和动感有力的轮廓。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宾利', 3500, 1483685484, 1487061651, 1, 0, ''),
(14, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0398ab71.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c03d6551f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c03f0f2bc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0412c99b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c042da424.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0442cd01.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0452c39c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c046209f5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c0842d3f8.jpg\"]', '奥迪R8 Spyder', '作为奥迪第一款中置引擎跑车，R8结合了奥迪公司从众多赛车运动冠军中所得到的车色外型设计以及R8车专业的品牌技术。这些专长使奥迪公司推崇的“科技引领进步”这句口号变成了在赛道和公路上面的领跑者。', '{\"size\":\"\\u957f4441mm \\u5bbd1930mm \\u9ad81244mm\",\"oil\":\"\\u7efc\\u5408\\u5de5\\u51b5\\u6cb9\\u801713.2L \\u5e02\\u533a\\u5de5\\u51b5\\u6cb9\\u801721.2L \\u5e02\\u90ca\\u5de5\\u51b5\\u6cb9\\u80178.6L\",\"engine\":\"V8 4.2 FSI\\u53d1\\u52a8\\u673a\\u6216V10 5.2 FSI\\u53d1\\u52a8\\u673a\",\"max\":\"330\",\"acceleration\":\"3.5\\u79d2\\uff080-100km\\/h\\uff09\\uff08V10\\u8f66\\u578b\\uff09\",\"drive\":\"\\u5168\\u65f6\\u56db\\u9a71\"}', '奥迪', 3980, 1483685660, 1487061127, 1, 0, ''),
(15, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb490ad86.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb4c30c55.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb4d7e31c.jpg\"]', '玛莎拉蒂SUV lavante', '\nLevante莱凡特是一股来自地中海的暖风，它可以从微风瞬息爆发为强劲狂风。Levante莱凡特设计独特工艺精湛，它将卓越的公路驾乘与优异的越野性能完美融合，将为您带来难以忘怀的专属体验，让激情随时迸发。玛莎拉蒂SUV Levante莱凡特震撼来袭！\n\n发动机：3.0T\n变速箱：手自一体\n\n车身结构：SUV\n', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '玛莎拉蒂', 3500, 1483685826, 1487059796, 1, 0, ''),
(16, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4086c3541.jpg\"]', '兰博基尼LP570-4', '这个特别版车型为全黑色设计，由黑色金属漆与黑色哑光混搭而成，视觉效果非常的酷。而特别设计的黑色哑光发动机通风盖板能够更有效地为发动机辅助散热。黄色的刹车卡钳配合碳纤维陶瓷复合刹车盘，为LP570-4 Blancpain提供足够的刹车力。内饰也采用全黑色调设计，内饰中充斥着大量碳纤维和Alcantara麂皮材料。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '兰博基尼', 3980, 1483686092, 1486957045, 0, 0, ''),
(17, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb015ed6f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb02d4693.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb064c0da.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb07ba7ee.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb0a74c11.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb0c67359.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb0dc26e2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb0f69eff.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bb111070e.jpg\"]', '路虎揽胜 行政版', '路虎揽胜经过精心设计成为有史以来最精致、最强悍的路虎。采用最新的车身和底盘技术，无论是其越野能力的广度和可通过性，还是公路的操控和舒适性，车辆的全地形性能都被提升到另一个层面。[1]  整体造型依旧延续着经典的方正外观，最大的优点是空间宽敞、操控出色、油耗经济。搭配三款不同的发动机，各有优点，整体看来动力表现充沛，提升乘客和驾驶者的体验。', '{\"size\":\"4999\\u00d72073\\u00d71835 mm\",\"oil\":\"7.4 \\uff08L\\/100km\\uff09\",\"engine\":\"V\\u578b6\\u7f38\",\"max\":\"210\",\"acceleration\":\"7.9s\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '路虎', 2200, 1483686327, 1487059733, 0, 0, ''),
(18, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bacd1ce2c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bace78cfc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bacfdbc3c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bad12e491.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bad26b66f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2bad36c5b9.jpg\"]', '阿斯顿马丁 V8 Vantage 敞篷版', '由莱昂内尔·马丁(LionelMartin)和罗伯特·班福特(RobertBamford)于1913年共同组建，公司名为Bamford &amp; Martin。其品牌一直是造型别致、精工细作、性能卓越的运动跑车的代名词，被称为跑车中的劳斯莱斯。马丁是一个赛车手，而班福特则是一名工程师，1913年两人合作开始制造高档赛车，公司当时的名称是马丁·班福德公司，1914年他们生产出自己的第一辆汽车。', '{\"size\":\"4710mmx1875mmx1270mm\",\"oil\":\"\",\"engine\":\"6.0L V12 470\\u9a6c\\u529b\\u81ea\\u7136\\u5438\\u6c14\\u53d1\\u52a8\\u673a\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\\u524d\\u7f6e\\u540e\\u9a71\"}', '阿斯顿马丁', 4000, 1483686463, 1487059671, 1, 0, ''),
(19, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f42b1e527d.jpg\"]', '路虎极光（白色）', '揽胜极光（Evoque）是路虎品牌中车身最为紧凑的SUV车型。作为路虎LRX概念车的量产版本，其定位略高于神行者（Freelander）系列。路虎Evoque在2010年12月的广州车展上全球首发，并确定了“揽胜极光”这一中文名称。路虎揽胜极光于2011年下半年正式进入中国市场，普通版售价为52.80~63.80万，分为三门版和五门版。此后，路虎汽车公司在2012年推出了维多利亚限量版极光车型，动力性能与普通版本无异，而内饰材质奢华典雅，售价为98.89万。', '{\"size\":\"4355mm*1965mm*1605mm\",\"oil\":\"9L\\/100km\",\"engine\":\"2.0T 240\\u9a6c\\u529b L4\\u53d1\\u52a8\\u673a\",\"max\":\"217\",\"acceleration\":\"7.6\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '路虎', 800, 1483686581, 1488252470, 0, 0, ''),
(20, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f42de1f26a.jpg\"]', '丰田埃尔法', '埃尔法（Alphard）是丰田应对日产Elgrand而开发的豪华MPV，采用了Previa的底盘加以改进而成。 第一代埃尔法于2002年诞生，动力有2.4升和3.0升两款发动机，都可选装四驱系统。2008年埃尔法更新换代，为了对抗宿敌Elgrand，丰田同时推出了姐妹车Vellfire，主打年轻运动风格，但是和Elgrand相比还是略显保守。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '丰田', 1000, 1483686652, 1483686652, 0, 0, ''),
(21, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c2d15c36d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c2d3cdf0e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c2d5b27f8.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c6959733c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c69666a17.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c6a1a4ff6.jpg\"]', '玛莎拉蒂总裁', '玛莎拉蒂总裁（quattroporte）是意大利汽车制造商玛莎拉蒂推出的高性能豪华轿车。1963年，玛莎拉蒂首创“高性能豪华四门轿车”概念，第一代玛莎拉蒂Quattroporte总裁轿车问世。1玛莎拉蒂第五代总裁车型（quattroporte）最早在2003年法兰克福车展亮相；全新第六代总裁轿车于2013年1月首次亮相底特律北美国际车展，并于同年3月登陆中国市场，共有两款车型：总裁V8和总裁V6。其中， V8车型配备3.8升V8发动机，车辆由静止加速到100 km/h仅需4.7秒，最高车速达307 km/', '{\"size\":\"4971mm\\u00d72100mm\\u00d71461mm\",\"oil\":\"\",\"engine\":\"3.0L V6\\u53cc\\u6da1\\u8f6e\\u589e\\u538b\\u53d1\\u52a8\\u673a\",\"max\":\"285\",\"acceleration\":\"4.8\",\"drive\":\"\\u56db\\u8f6e\\u9a71\\u52a8\"}', '玛莎拉蒂', 2500, 1483686752, 1487063591, 1, 0, ''),
(22, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ba3b3dda2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ba3c92e52.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ba7799161.jpg\"]', '奔驰 AMG GTS', '梅赛德斯-AMG始终以尖端科技与卓越动力，追求淋漓尽致的感官体验.48年性能锤炼，追求自我突破。梅赛德斯-AMG 只需一眼，便足以摄人心魄!', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '奔驰', 3980, 1483686883, 1487059579, 1, 0, ''),
(23, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c7083b390.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c709a4e57.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2c70b7aa95.jpg\"]', '宾利 欧陆GT V8敞篷版', 'Bentley全新的欧陆GT传乘了宾利完美无瑕的贵族轿跑车血统：气质高贵而脱俗；材质精选而完美；做工精湛而考究，每一个细枝末节都散发着纯正宾利不可言传的阳刚之气——宾利的DNA：那就是英式传统、经典设计、传奇色彩和含蓄自信的绅士风范。欧陆GT 彰显着宾利鲜明的设计风格：霸气的车头、网状的电镀格栅、四个圆形车灯、大轮毂和强悍的车轮拱板，这些都象征着活力与激情。值得一提的是欧陆GT的仪表盘面板上镶有一款别致的小钟。这是由以精确著称于世的飞行表百年灵特别为宾利欧陆GT设计的。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宾利', 5000, 1483686944, 1487062798, 1, 0, ''),
(24, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b99458fcc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b996457e3.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b9979d26f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b998b7031.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b999bda1c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b99b93d46.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b99cf1fbd.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b99ebb9ed.jpg\"]', '阿斯顿马丁 Rapide', '阿斯顿·马丁Rapide是一款高性能豪华轿跑车（也称运动轿车），由英国汽车品牌阿斯顿·马丁于2010年年初推出。Rapide做为概念车首次亮相是在2006年的北美国际车展，Rapide量产版车型自2009年9月在法兰克福车展上亮相后，好评倍出。Rapide是一款豪华的实用跑车，可同时容纳四个成人，与其它所有阿斯顿·马丁车款一样，它具有极佳的驾乘体验。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '阿斯顿马丁', 4500, 1483687007, 1487059364, 1, 0, ''),
(25, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b420b82f1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b422679d6.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b4249a96a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b426179f2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b42738bfb.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b429c5ebc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b42bde4e5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b4315a078.jpg\"]', '劳斯莱斯 古斯特', '劳斯莱斯古斯特搭载6.6升双涡轮增压V12发动机，匹配ZF公司的8速自动变速箱，功率发挥直逼500马力，尽管定位低于幻影Phantom，但是古斯特的动力却占了上风。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '劳斯莱斯', 5500, 1483687080, 1487057973, 0, 0, ''),
(26, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f44cd32a32.jpg\"]', '劳斯莱斯 幻影', '劳斯莱斯幻影（Rolls-Royce Phantom）是劳斯莱斯被宝马（BMW）收购后推出的第一个产品，通过铝的使用，庞大的车身还不到2.5吨重，再加上6.7升V12发动机与六速自动变速箱的通力合作，幻影0-100Km/h的加速不到6秒，出于对安全的考虑最高时速被限制在240Km/h。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '劳斯莱斯', 7500, 1483687123, 1483687123, 1, 0, ''),
(27, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4609e3679.jpg\"]', '奔驰S400L', '梅赛德斯-奔驰130年创新激情永不灭，作为矢志创新的引领者，我们从未停下脚步，为心中所向，驰之以恒。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '奔驰', 1800, 1483687493, 1488421353, 1, 0, ''),
(28, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f467129325.jpg\"]', '宝马740（黑色）', '宝马（BMW）740Li 是德国BMW公司生产的一款高端豪华轿车。属于“宝马7系”，仅在德国本土生产。新的740Li配备了4.0升V8发动机，是在旧款的3.6升V8发动机的基础上升级而来。小改款后的新7系拥有了更加有亲和力的外观。新发动机除了采用宝马的Double-VANOS双凸轮轴可变气门正时系统外，还采用了可无级调节的Valvetronic电子气门驱动机构，使耗油量和排放显著降低。发动机最大功率为225千瓦，最大扭矩达390牛米，从静止加速到100公里/时仅需4.6秒新的i-drive系统也进行了升级', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宝马', 1100, 1483687546, 1483687546, 1, 0, ''),
(29, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f46a336e47.jpg\"]', '奔驰ML350（黑色）', '奔驰ML350不像一般越野车大量采用那种方方正正而过于强悍的造型，其动感、流畅的线条使高大的车身显得非常利落，表现出一种卓然不凡的名门气质。车身以深色调为主，中控台依然采用了高档的桃木作为修饰，方向盘在视觉上给人以厚重的感受，精心设计的圆滑线条也使其内部观感非同凡响。奔驰ML350秉承了梅赛德斯-奔驰的高贵血统和经典品质，堪称豪华SUV里的典范。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '奔驰', 1000, 1483687591, 1483687591, 1, 0, ''),
(30, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f46d08292b.jpg\"]', '宝马740（灰色）', '宝马（BMW）740Li 是德国BMW公司生产的一款高端豪华轿车。属于“宝马7系”，仅在德国本土生产。新的740Li配备了4.0升V8发动机，是在旧款的3.6升V8发动机的基础上升级而来。小改款后的新7系拥有了更加有亲和力的外观。新发动机除了采用宝马的Double-VANOS双凸轮轴可变气门正时系统外，还采用了可无级调节的Valvetronic电子气门驱动机构，使耗油量和排放显著降低。发动机最大功率为225千瓦，最大扭矩达390牛米，从静止加速到100公里/时仅需4.6秒新的i-drive系统也进行了升级', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宝马', 1100, 1483687635, 1483687635, 1, 0, ''),
(31, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f46fbc9c91.jpg\"]', '路虎揽胜 运动版', '路虎揽胜经过精心设计成为有史以来最精致、最强悍的路虎。采用最新的车身和底盘技术，无论是其越野能力的广度和可通过性，还是公路的操控和舒适性，车辆的全地形性能都被提升到另一个层面。整体造型依旧延续着经典的方正外观，最大的优点是空间宽敞、操控出色、油耗经济。搭配三款不同的发动机，各有优点，整体看来动力表现充沛，提升乘客和驾驶者的体验。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '路虎', 2200, 1483687687, 1483687687, 0, 0, ''),
(32, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3c8d185a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3cad4b73.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3cc8d834.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3cdefd57.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3cfa5195.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3d15a566.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3d953fea.jpg\"]', '保时捷Boxster', '采用新的轻型合金轮毂减少非簧载质量，前方保险杠较低部分空气进气口更加的突出，增加前唇并明显伸长以及配备其它标准装备。这些改进能改善气流的通过以及车周围的气流的活动。车侧面亦有空气进气口将冷却空气带入boxster的引擎，也同样是经过重新的设计，效果更佳，并且水平格栅与车身同色。车后部有新的转向灯罩，排气管也是新风格位于后保险杠宽而细的进气口中央，后进气口不仅风格独特而也以可以提供更多的冷酷空气给排气系统。重新设计的篷顶有4个支撑架以及一个玻璃后窗并带有电动除霜功能。车顶的开合只需要12秒钟，改良的车篷顶外', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1200, 1483687778, 1487057885, 1, 0, ''),
(33, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b375194bc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b37664007.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b3783fdf0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b379acdd4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b37ae73da.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b382c472d.jpg\"]', '保时捷Panamera', '它对高性能、安全、纯种跑车的操控性追求均做的非常彻底。像cayenne turbo般个性如此鲜明的suv，是绝对不会经常出现的，这也正适应了当今世界的潮流——追求个性。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1300, 1483687811, 1488421288, 1, 0, ''),
(34, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f47ae26862.jpg\"]', '奥迪A8（黑色）', '奥迪A8是奥迪车系中最高档的豪华车，市场定位是用以跟奔驰S级和宝马7系竞争的。奥迪A8率先使用了全铝车身，不仅坚固耐用，而且减轻了车身重量，为汽车带来更加强劲的性能表现。奥迪A8目前有4个排量14款车型可选，分别是装备了2.8FSI减小排量得到的2.5L V6 FSI直喷发动机两款车型；装备3.0L V6 TFSI机械增压直喷发动机。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '奥迪', 1000, 1483687857, 1488421274, 1, 0, ''),
(35, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f480b2394e.jpg\"]', '保时捷卡宴(香槟色）', '它对高性能、安全、纯种跑车的操控性追求均做的非常彻底。像cayenne turbo般个性如此鲜明的suv，是绝对不会经常出现的，这也正适应了当今世界的潮流——追求个性。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1300, 1483687950, 1486956630, 0, 0, ''),
(36, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4849ded6d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f485b0a1b9.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f48786231d.jpg\"]', '保时捷卡宴(白色）', '它对高性能、安全、纯种跑车的操控性追求均做的非常彻底。像cayenne turbo般个性如此鲜明的suv，是绝对不会经常出现的，这也正适应了当今世界的潮流——追求个性。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1300, 1483688063, 1486956611, 0, 0, ''),
(37, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1e225247.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1e423671.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1e67396c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1e91ca95.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a3f6d711374.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a3f6dae974c.jpg\"]', '玛莎拉蒂GHIBLI（蓝色）', 'Ghibli搭载3.0L V6汽油发动机，其中动力最强的车型为Ghibli S Q4，拥有301kW（410hp）的最大功率，0至100km/h加速时间仅为4.8秒，最高车速可达284km/h。\n全新玛莎拉蒂Ghibli将感性的意大利设计、极致的动感驾驶乐趣和无与伦比的日常舒适驾乘体验融于一身，能更好地满足日益差异化的消费者需求。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '玛莎拉蒂', 2000, 1483688115, 1489726418, 1, 0, ''),
(38, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1883fb2b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1894cd40.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b18e07049.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1909fe90.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b1973d314.jpg\"]', '保时捷卡宴(白色）', '它对高性能、安全、纯种跑车的操控性追求均做的非常彻底。像cayenne turbo般个性如此鲜明的suv，是绝对不会经常出现的，这也正适应了当今世界的潮流——追求个性。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1300, 1483688153, 1487057306, 1, 0, ''),
(39, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b09e83845.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b0a0e82a6.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b0a2c081d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b0a6bab7c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b0aa3f2ec.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2b0c5784ec.jpg\"]', '玛莎拉蒂Ghibli（白色）', '传承意大利经典设计和手工定制传统,玛莎拉蒂旗下QP总裁轿车,GT跑车,GC敞篷跑车.完美诠释优雅,奢华,运动激情,带您体验无与伦比的驾乘感受.伟大的旅行从玛莎拉蒂开始!', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '玛莎拉蒂', 2000, 1483688417, 1489726408, 1, 0, ''),
(40, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4a054dc7a.jpg\"]', '路虎揽胜 运动版（白色）', '路虎揽胜经过精心设计成为有史以来最精致、最强悍的路虎。采用最新的车身和底盘技术，无论是其越野能力的广度和可通过性，还是公路的操控和舒适性，车辆的全地形性能都被提升到另一个层面。整体造型依旧延续着经典的方正外观，最大的优点是空间宽敞、操控出色、油耗经济。搭配三款不同的发动机，各有优点，整体看来动力表现充沛，提升乘客和驾驶者的体验。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '路虎', 2000, 1483688456, 1483688456, 0, 0, ''),
(41, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5b8492a.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5beac48.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5c6848f.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5cda8e5.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5d53100.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5dc1dba.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2af5e3f3ae.jpeg\"]', '路虎揽胜 运动版', '路虎揽胜经过精心设计成为有史以来最精致、最强悍的路虎。采用最新的车身和底盘技术，无论是其越野能力的广度和可通过性，还是公路的操控和舒适性，车辆的全地形性能都被提升到另一个层面。整体造型依旧延续着经典的方正外观，最大的优点是空间宽敞、操控出色、油耗经济。搭配三款不同的发动机，各有优点，整体看来动力表现充沛，提升乘客和驾驶者的体验。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '路虎', 2000, 1483688480, 1487056746, 1, 0, ''),
(42, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae4ba4c1d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae4c588f1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae513dd5a.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae5d559f1.jpg\"]', '保时捷卡宴', '它对高性能、安全、纯种跑车的操控性追求均做的非常彻底。像cayenne turbo般个性如此鲜明的suv，是绝对不会经常出现的，这也正适应了当今世界的潮流——追求个性', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '保时捷', 1300, 1483688531, 1487056480, 1, 0, ''),
(43, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4af99660a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2adef0a525.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2adf5dabd8.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2adfb4fd7b.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae0292deb.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ae11192e9.JPG\"]', '兰博基尼 550-2', 'Gallardo 550-2在少了四轮驱动的完美制御系统之后，变得更加狂野，在少了前传动轴的机械原件之后，车身配重也更为轻巧，且对于驾驶技巧的掌控性也要求更高！考量到整体的输出动力与协调性，新推出的LP550-2，在动力上也稍微调整了输出动力，让动力减少了10hp的输出', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '兰博基尼', 3800, 1483688703, 1488421229, 1, 0, ''),
(44, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4b4168852.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4b446e09d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4b4730019.jpg\"]', '玛莎拉蒂 总裁', '据说拥有quattroporte的人大多都是名人、影星、皇室，更一直是意大利总理和政府高级官员的座驾。 总裁quattroporte作为世界顶级的跑车，漫不经心流露出很多其他豪华轿车所没有的美貌和青春，以及让很多其他豪华轿车汗颜的激情，让你在不经意中享受你曾刻意追求的刺激。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '玛莎拉蒂', 2500, 1483688779, 1483688779, 0, 0, ''),
(45, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad425811f.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad485453d.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad4eed800.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad53dd6fe.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad597b0a9.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad699dc77.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ad7c0e9b4.JPG\"]', '路虎揽胜行政版', '路虎揽胜经过精心设计成为有史以来最精致、最强悍的路虎。采用最新的车身和底盘技术，无论是其越野能力的广度和可通过性，还是公路的操控和舒适性，车辆的全地形性能都被提升到另一个层面。整体造型依旧延续着经典的方正外观，最大的优点是空间宽敞、操控出色、油耗经济。搭配三款不同的发动机，各有优点，整体看来动力表现充沛，提升乘客和驾驶者的体验。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '路虎', 2500, 1483688814, 1487056258, 1, 0, ''),
(46, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170213\\/58a1517454cd3.jpg\"]', '兰博基尼610-4', '低矮的车身、遍布车身四周的巨大进气口以及玻璃下一览无余的发动机，依旧是为人熟知的兰博基尼风格，并且保留了兰博基尼公司一直以来的V12发动机。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '兰博基尼', 9000, 1483688858, 1486978461, 1, 0, ''),
(47, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ace7cda39.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ace864a05.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2acf64a901.jpg\"]', '宾利欧陆GT', '全新的欧陆GT传乘了宾利完美无瑕的贵族轿跑车血统：气质高贵而脱俗；材质精选而完美；做工精湛而考究，每一个细枝末节都散发着纯正宾利不可言传的阳刚之气——宾利的DNA：那就是英式传统、经典设计、传奇色彩和含蓄自信的绅士风范。欧陆GT 彰显着宾利鲜明的设计风格：霸气的车头、网状的电镀格栅、四个圆形车灯、大轮毂和强悍的车轮拱板，这些都象征着活力与激情。值得一提的是欧陆GT的仪表盘面板上镶有一款别致的小钟。这是由以精确著称于世的飞行表百年灵特别为宾利欧陆GT设计的。\n品 牌 宾利欧陆GT', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宾利', 4500, 1483688899, 1487056122, 0, 0, ''),
(48, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac2407038.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac2968493.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac2e4161b.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac35dab6c.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac4449d29.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac4c8a800.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ac76ef53e.JPG\"]', '法拉利458', '法拉利458 Italia是一款中后置8缸双门跑车，在2009年法兰克福车展上推出，标志着法拉利（Ferrari）在其原有中后置发动机跑车的基础上实现了重大飞跃。458指的是4.5升、8缸发动机，Italia象征458 Italia的诞生不仅是法拉利的骄傲，更是所有意大利人的荣耀。458 Italia出自意大利著名的宾尼法利纳（Pininfarina）汽车设计工作室，但它的整体造形却完全颠覆了过去法拉利跑车给人的既有印象，充满了前所未有的束炜式未来感。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '法拉利', 5980, 1483688938, 1487055996, 1, 0, ''),
(49, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ab896239b.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ab90194ee.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ab953b135.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2ab9abe7ee.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2aba225457.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2aba6e6440.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2abab13abf.jpeg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2abd1f2c50.jpeg\"]', '宝马I8', '宝马i8的外观，最早参考了宝马Vision ED概念车的设计。随后在宝马i8概念车的基础上稍加改动，就成了量产后大家看到的样子。宝马i8的车身采用了轻量化结构，共有两部分组成，包括铝合金制成的底盘以及碳纤维复合材料的座舱，使整车的空载质量为1.54吨。那么一辆超跑除了需要“减重”外，降低风阻也是必不可少的考量。宝马i8除了拥有全系车型中最为低矮的车身外，还运用了大量的空气动力学设计，使得该车的风阻系数仅为0.26。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宝马', 3980, 1483688974, 1487055832, 1, 0, ''),
(50, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2a9c3cf8d9.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2a9d58d726.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2a9e7b2677.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2a9f8eeb10.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2aa0b49fbe.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2aa600a77a.JPG\"]', '法拉利California', '法拉利California是一款豪华旅行跑车，是有史以来第一款采用中前置V8发动机、第一款采用折叠硬顶敞篷的法拉利GT跑车，可以在3.9秒完成0-100km/h的冲刺，最高时速可达310km/h。California由宾尼法利纳（Pininfarina）设计，传承了1957年法拉利推出的一款针对美国市场的250 GT California Spyder敞篷跑车的精髓。California将毫不妥协的运动性能和实用的灵活性结合在一起，同时也提供了所有法拉利跑车所共有的无与伦比的驾驶乐趣。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '法拉利', 3800, 1483689017, 1487055466, 1, 0, ''),
(51, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170106\\/586f4c6b8240f.jpg\"]', '宝马（BMW）730', '宝马(BMW)是享誉世界的豪华汽车品牌。宝马的车系有1、2、3、4、5、6、7、i、X、Z、等几个系列，还有在各系基础上进行改进的M系（宝马官方的高性能改装部门）。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宝马', 1100, 1483689098, 1483689098, 1, 0, ''),
(52, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a41452dc922.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a41453623ac.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a414544768b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a4145567b1e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a41456b82d4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a41457d8bd2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a41458d93d9.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170216\\/58a5103c06b88.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170216\\/58a5103f30ac2.jpg\"]', '法拉利488', '法拉利488是法拉利旗下的一款超级跑车，采用了3.9升V8双涡轮发动机，满足高速运动的需要。', '{\"size\":\"4568*1952*1213\",\"oil\":\"11L\",\"engine\":\"V8\\u53cc\\u6da1\\u8f6e\\u589e\\u538b\",\"max\":\"330\",\"acceleration\":\"3\",\"drive\":\"\\u4e2d\\u7f6e\\u540e\\u9a71\"}', '法拉利', 13000, 1486965509, 1487212610, 1, 0, ''),
(53, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170213\\/58a14d5bbce0d.jpg\"]', '兰博基尼LP700-4', '兰博基尼Aventador LP700-4搭载一台全新研发的代号为L539的6.5L DOHC 48Valve 65° V12自然吸气发动机，最大马力：700ps/8250rpm、最大扭矩:690Nm/5500rpm，该发动机配合兰博基尼自主独立研发的ISR独立换挡杆7前速单离合自动变速箱，其0~96km/h仅耗时2.9s（激光测速，且需要Launch Control）、最高时速高达350km/h！', '{\"size\":\"4780*2030*1136\",\"oil\":\"17.2\",\"engine\":\"V12\",\"max\":\"350\",\"acceleration\":\"2.9\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '兰博基尼', 15000, 1486966181, 1486966466, 0, 0, ''),
(54, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b324a754.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b38728ce.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b3d9bc73.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b42bba4c.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b47c40f9.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24b4d49848.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24bb4bb032.JPG\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170310\\/58c24bc5f11e4.JPG\"]', '奔驰G63', '奔驰G63 AMG在动力方面也表现十分出色，新车搭载5.5L V8双涡轮增压发动机，最大功率544马力，最大扭矩760N·m。据官方信息显示该车从0-100km/h的加速时间为5.4秒，最大时速可以达到210km/h。奔驰G级AMG完美的兼顾了动力、舒适性和越野性能，而对应这款车的售价也十分高昂。', '{\"size\":\"4769\\u00d71855\\u00d71938\",\"oil\":\"14.3\",\"engine\":\"V8\",\"max\":\"210\",\"acceleration\":\"5.4\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '奔驰', 5500, 1486971108, 1489128398, 1, 0, ''),
(55, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170213\\/58a1622a82a75.jpg\"]', '奔驰G55', '配置功率高达 368 千瓦/500马力·钛灰色AMG轻质合金轮毂标准配置有所提升出色的动力性是梅赛德斯-AMG车系最引以为傲的一点，如今这一点又得到了进一步的加强。动力输出高达368千瓦（折合500匹马力）的G 55 AMG，超过了老款车型18千瓦（折合24匹马力）。与此同时，这款经典越野车的标准配置也得到了相应的提升，包括全新的轻质合金轮毂，双氙气灯，带转弯照明功能的雾灯以及全新的基于纳米技术的增强型防划伤油漆等。', '{\"size\":\"4738\\u00d71855\\u00d71952\",\"oil\":\"16.3\",\"engine\":\"V8\",\"max\":\"210\",\"acceleration\":\"5.5\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '奔驰', 4500, 1486971439, 1488421105, 1, 0, ''),
(56, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4a800824.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4a868e59.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4a8e415b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4a964935.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4a9e03a1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4aa64109.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4aae7c3e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170419\\/58f6c4abc76ec.jpg\"]', '奔驰G500', '奔驰最新一代的5.0LV8发动机，具有216kw/5500rpm的最大功率和456nm/2800-4000rpm的最大扭矩。机械增压器的装备使得它在近1800rpm时就能爆发出80%的最大扭矩，再加上梯形大梁非独立悬挂和前中后桥三道差速锁（均能100%锁死），使得G500具有强悍的通过能力。不过这些并不意味着这款车的公路性能的丧失，推动近三吨重车身的时候，依然有0-100km/h加速10.2秒的好成绩。', '{\"size\":\"4764\\u00d71867\\u00d71960\",\"oil\":\"12.9\",\"engine\":\"V8\",\"max\":\"210\",\"acceleration\":\"6.1\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '奔驰', 4500, 1486972452, 1492567218, 1, 0, ''),
(59, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbbdb32a6.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbbf77694.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbc170cf5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbc29e1dc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbc39e1e0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170214\\/58a2cbc4e1628.jpg\"]', '迈凯伦 MP4-12', '在超跑市场竞争日趋激烈的今天，英国超跑制造商迈凯伦已经意识到其稍显薄弱的产品线并不足以对抗法拉利等传统豪强，继推出超级跑车650S Coupe后，迈凯伦将在新车型的推出上继续发力。日前网通社从车迷世界Worldcarfans获悉，迈凯伦将推出全新勒芒版超跑650S Coupe Le Mans。新车将基于迈凯伦650SCoupe车型打造而来，并于2018年问世。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '迈凯伦', 5980, 1487064010, 1487127814, 1, 0, ''),
(60, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e2de2e5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e403c1b.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e52a8af.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e633716.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e705215.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e7e65c5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e888a2f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170215\\/58a415e93fff3.jpg\"]', '宾利GT', 'Bentley全新的欧陆GT传乘了宾利完美无瑕的贵族轿跑车血统：气质高贵而脱俗；材质精选而完美；做工精湛而考究，每一个细枝末节都散发着纯正宾利不可言传的阳刚之气——宾利的DNA：那就是英式传统、经典设计、传奇色彩和含蓄自信的绅士风范。欧陆GT 彰显着宾利鲜明的设计风格：霸气的车头、网状的电镀格栅、四个圆形车灯、大轮毂和强悍的车轮拱板，这些都象征着活力与激情。值得一提的是欧陆GT的仪表盘面板上镶有一款别致的小钟。这是由以精确著称于世的飞行表百年灵特别为宾利欧陆GT设计的。', '{\"size\":\"\",\"oil\":\"\",\"engine\":\"\",\"max\":\"\",\"acceleration\":\"\",\"drive\":\"\"}', '宾利', 4500, 1487148526, 1488445004, 1, 1, ''),
(61, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f10c169.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f2a67dd.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f3be355.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f4edfe1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f640e83.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f7242a8.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f88f0e6.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9f9a7dc1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9fa91641.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170306\\/58bcc9fe8b3ad.jpg\"]', '兰博基尼LP560敞篷', '兰博基尼盖拉多 LP560 4是首先于日内瓦车展上发布的，这是现行盖拉多跑车的后继车型。新车所采用的5.2升V10引擎采用直喷技术，最大马力达到560匹，相比现款增加40匹，而车重却减少了20KG。极速超过300KM/H，百公里加速时间为3.4秒，完成1/4英里仅需11.4秒', '{\"size\":\"4345*1900*1184\",\"oil\":\"15\",\"engine\":\"V10\",\"max\":\"324\",\"acceleration\":\"3.4\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '兰博基尼', 5500, 1488767496, 1489649055, 1, 0, ''),
(62, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56d9f1f49.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56da93573.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56db35ed7.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56dcdf105.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56deabe5c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56df93bba.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56e0ec6f6.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170316\\/58ca56e4ee69e.jpg\"]', '兰博基尼LP700-4', '兰博基尼Aventador LP700-4搭载一台全新研发的代号为L539的6.5L DOHC 48Valve 65° V12自然吸气发动机，最大马力：700ps/8250rpm、最大扭矩：690Nm/5500rpm，该发动机配合兰博基尼自主独立研发的ISR独立换挡杆7前速单离合自动变速箱，其0~96km/h仅耗时2.9s（激光测速，且需要Launch Control）、最高时速高达350km/h！', '{\"size\":\"4780*2030*1136\",\"oil\":\"17.2\",\"engine\":\"V12\",\"max\":\"350\",\"acceleration\":\"2.9\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '兰博基尼', 15000, 1489655538, 1489655538, 1, 0, ''),
(63, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d37345a8927.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734643245.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734805d85.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d37348d87c0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734a207bc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734bc168e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734d776d0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3734f8ffa2.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d3735102e60.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d37351cce67.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d373529b2fc.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170323\\/58d373562fe2f.jpg\"]', '玛莎拉蒂Levante', '。外观方面，既然新款紧凑型SUV的设计理念是延续Kubang概念车的样式，那么整体的设计风格将会更加偏运动感。而从其前的巴黎车展上可以看到Kubang概念车整车曲线更加流畅饱满，看上去更显大气。同时前脸造型也更加伸展，依然延续了玛莎拉蒂的家族式设计。', '{\"size\":\"5003*1968*1679\",\"oil\":\"10.7\",\"engine\":\"V6\",\"max\":\"251\",\"acceleration\":\"6\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '玛莎拉蒂', 3500, 1490252640, 1490252640, 1, 0, '');
INSERT INTO `sanda_cars` (`id`, `cover`, `name`, `description`, `attribute`, `brand`, `price`, `create_time`, `update_time`, `status`, `istop`, `index_img`) VALUES
(64, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a535f7f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a5d6be4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a66be3c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a70e91e.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a7977e0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a89f3db.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1a9297b5.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1aa347ce.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1aae4aae.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1ab98c91.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170324\\/58d4c1af3f207.jpg\"]', '宝马I8（白色）', '两台电动机将动力传递至前轮。在强劲动力的驱动下，从静止加速到100公里每小时仅需4.8秒，最高车速在电子装置的限制下为250公里每小时，而且百公里平均油耗仅为3.76升。另外，全新宝马i8还可以支持纯电力驱动方式，从而实现真正意义上的零排放。', '{\"size\":\"4689\\u00d71942\\u00d71299\",\"oil\":\"2.1\",\"engine\":\"1.5L\\u6da1\\u8f6e\\u589e\\u538b+\\u7535\\u52a8\\u673a\",\"max\":\"250\",\"acceleration\":\"4.4\",\"drive\":\"\\u4e2d\\u7f6e\\u56db\\u9a71\"}', '宝马', 3980, 1490338227, 1490338227, 1, 0, ''),
(65, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db9697b71.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db971fe76.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db97a80e4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db9833df0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db99272e8.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db9997a7d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db9a0d5f1.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170327\\/58d8db9aa84fe.jpg\"]', '迈凯伦540C', '迈凯伦540C Coupé的动力经由后轮通过7速无缝变速箱（SSG）输出，得益于轻盈的车身，0-100公里/小时加速仅为3.5秒，0-200公里/小时加速为10.5秒，最高时速可达320公里/小时。新车仍将发扬迈凯伦传统，采用碳纤维单体壳车身，搭配中置V8引发动机。这台3.8T V8双涡轮发动机最大动力输出将在335kW和373kW之间。', '{\"size\":\"4530*2095*1202\",\"oil\":\"14\",\"engine\":\"3.8T 540\\u9a6c\\u529b V8\",\"max\":\"320\",\"acceleration\":\"3.4\",\"drive\":\"\\u4e2d\\u7f6e\\u540e\\u9a71\"}', '迈凯伦', 6500, 1490607011, 1490607011, 1, 0, ''),
(66, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180b2ffed.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180ba2704.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180c1d599.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180c8b6c0.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180cec30a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180d5f0d4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180dc65b9.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170328\\/58da180e3bd05.jpg\"]', '丰田埃尔法白色', '埃尔法（Alphard）是丰田应对日产Elgrand而开发的豪华MPV，采用了Previa的底盘加以改进而成。 第一代埃尔法于2002年诞生，动力有2.4升和3.0升两款发动机，都可选装四驱系统。2008年埃尔法更新换代，为了对抗宿敌Elgrand，丰田同时推出了姐妹车Vellfire，主打年轻运动风格，但是和Elgrand相比还是略显保守。', '{\"size\":\"4925*1850*1890\",\"oil\":\"12\",\"engine\":\"V6\",\"max\":\"200\",\"acceleration\":\"11\",\"drive\":\"\\u524d\\u7f6e\\u524d\\u9a71\"}', '丰田', 1000, 1490688019, 1490688019, 1, 0, ''),
(67, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86aaf4039.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86ab6eb9a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86abf037f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86ac78f0d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86ad01db4.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86ad67616.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86add2b5f.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86b5c8a01.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170329\\/58db86b97e94a.jpg\"]', '兰博基尼LP550', 'LP550-2在引擎配置上基本上与LP560-4完全相同，除了动力调降为550hp/8000rpm之外，最大输出维持55kgm/6500rpm，输出效率（每公升可输出的最大马力）也由原先560-4的107.6hp/L下修为105.7hp/L，而在重量马力比方面，LP550-2尽管车重轻了30kg，达到1380kg，不过为了维持最完美的输出与配重，重量马力比维持了与LP560-4相同的2.5kg/hp表现。', '{\"size\":\"4345*1900*1165\",\"oil\":\"15\",\"engine\":\"V10\",\"max\":\"320\",\"acceleration\":\"3.9\",\"drive\":\"\\u4e2d\\u7f6e\\u540e\\u9a71\"}', '兰博基尼', 3800, 1490781892, 1490781892, 1, 0, ''),
(68, '[\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f58674c1d0c.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f586754011a.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f58675c02cd.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f586763a58d.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f58676a1382.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f5867711a29.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f58677863d9.jpg\",\"http:\\/\\/sandazuche.oss-cn-shanghai.aliyuncs.com\\/admin\\/20170418\\/58f58677e9451.jpg\"]', '宾利添越', '宾利添越内饰的延续了宾利的奢华风格。添越的内部采用大量真皮材质，还配有包括夜视系统、抬头显示、触控式发动机停启按键以及带导航功能的全液晶高清仪表盘等。添越的座椅可进行16项或22项调节，包括宾利首次采用的可调节坐垫与靠垫，包括六种可选模式按摩、加热以及通风等功能。[\n动力系统方面，宾利添越搭载的是一台6.0L W12双涡轮增压发动机，其最大输出功率为608马力/6000rpm（447kW），峰值扭矩为900牛·米/1250-4500rpm。传动系统与发动机匹配的是8速自动变速箱。官方称，该车0-100km', '{\"size\":\"5141*1998*1742\",\"oil\":\"12.8\",\"engine\":\"W12\",\"max\":\"302\",\"acceleration\":\"4.1\",\"drive\":\"\\u524d\\u7f6e\\u56db\\u9a71\"}', '宾利', 25000, 1492485761, 1492485761, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `sanda_comments`
--

CREATE TABLE `sanda_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_common_action_log`
--

CREATE TABLE `sanda_common_action_log` (
  `id` int(11) NOT NULL,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问记录表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_email`
--

CREATE TABLE `sanda_email` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` char(20) NOT NULL COMMENT '电话',
  `car_type` varchar(255) NOT NULL COMMENT '预定车型',
  `plan_date` char(10) NOT NULL COMMENT '租车时间',
  `car_use` varchar(255) NOT NULL COMMENT '租赁用途',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '提交时间',
  `ip` varchar(255) NOT NULL COMMENT 'ip',
  `status` varchar(255) NOT NULL COMMENT '0 未发送 1 已发送',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `car_model` varchar(255) NOT NULL COMMENT '车型',
  `date_num` int(10) UNSIGNED NOT NULL COMMENT '租车天数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sanda_email`
--

INSERT INTO `sanda_email` (`id`, `name`, `mobile`, `car_type`, `plan_date`, `car_use`, `create_time`, `ip`, `status`, `remark`, `car_model`, `date_num`) VALUES
(6, '我', '15757101550', '奥迪', '2017-01-10', '一礼拜', 1484026100, '122.234.136.176', '1', '', '', 0),
(7, '唐晓白', '15088617820', '阿斯顿马丁', '2017-01-10', '自驾', 1484046013, '112.17.242.244', '1', '', '', 0),
(8, '蒋康佳', '13586888336', '玛莎拉蒂', '2017-02-09', '结果', 1486652530, '112.17.246.224', '1', '', '', 0),
(12, '徐磊', '13812917909', '宝马', '2017-02-11', '接亲', 1486708865, '117.136.103.15', '1', '', '', 0),
(13, '吴建庆', '13867290878', '宾利', '2017-2-19', '婚庆', 1486776460, '101.70.139.119', '1', '', '', 0),
(14, '张三', '18664800500', '兰博基尼', '2017-02-11', '泡妞', 1486783283, '183.240.20.74', '1', '', '', 0),
(15, '邹航', '18805020930', '兰博基尼', '2017-2-20', '泡妹子  装逼  炫富', 1486803071, '120.36.23.112', '1', '', '', 0),
(16, '向良红', '15058967300', '丰田', '2017-02-11', '去上海', 1486806776, '112.14.96.202', '1', '', '', 0),
(17, '陈志浩', '13819894932', '奔驰', '2017-02-11', '结婚用', 1486808383, '112.17.245.178', '1', '', '', 0),
(19, '黄豪', '13544266136', '兰博基尼', '2017-2-15', '装B', 1486813165, '183.33.169.240', '1', '', '', 0),
(20, '侯静', '18326727520', '奥迪', '2017-02-11', '家用', 1486821629, '112.26.231.26', '1', '', '', 0),
(21, '陈让', '13739133633', '兰博基尼', '2017-2-28', 'sb', 1486828033, '183.31.157.19', '1', '', '', 0),
(22, '余杰', '13666080893', '奔驰', '2017-02-13', '婚车', 1486867165, '14.152.68.229', '1', '', '', 0),
(23, '樊亮亮', '18757166662', '奔驰', '2017-02-13', '参加朋友婚礼', 1486885114, '112.17.243.216', '1', '', '', 0),
(24, '蓝春金', '18959453445', '宾利', '2017-02-12', '去办事', 1486887752, '120.38.121.227', '1', '', '', 0),
(30, '大', '15367582813', '劳斯莱斯', '2017-02-13', '装逼', 1486957667, '175.3.208.171', '1', '', '', 0),
(31, '罗星', '15367582816', '兰博基尼', '2017-02-13', '婚车', 1486957848, '175.3.208.171', '1', '', '', 0),
(39, '吕佩刚', '15868100475', '阿斯顿马丁', '2017-2-23', '测试', 1486973712, '125.120.31.233', '1', '', '', 0),
(40, '费明明', '15056000906', '玛莎拉蒂', '2017-02-13', '婚车', 1486976528, '117.136.102.78', '1', '', '', 0),
(41, '杨益峰', '13736573994', '兰博基尼', '2017-02-24', '结婚', 1486977258, '115.216.214.101', '1', '', '', 0),
(42, '方睿', '15215878211', '宝马', '2017-02-19', '婚车', 1486979377, '101.226.89.14', '1', '', '', 0),
(43, '柯威', '18505943517', '玛莎拉蒂', '2017-03-18', '婚车', 1487054014, '117.26.90.33', '1', '', '', 0),
(44, '冯建国', '18367348205', '兰博基尼', '2017-02-14', '29800', 1487056676, '112.11.2.0', '1', '', '', 0),
(45, '李晓状', '13377733500', '兰博基尼', '2017-02-14', '自驾', 1487059322, '183.43.177.177', '1', '', '', 0),
(46, '沈小姐', '13902468886', '宝马', '2017-03-08', '短途旅游', 1487063872, '113.87.205.115', '1', '', '', 0),
(47, 'vvcgcf', '13450425428', '兰博基尼', '2017-2-1', 'gfgyyyryf+625141252', 1487066488, '61.140.214.151', '1', '', '', 0),
(48, '蔡建清', '18599996162', '奥迪', '2017-02-15', '自驾游', 1487075450, '117.136.75.82', '1', '', '', 0),
(49, '李林', '15956612236', '兰博基尼', '2017-02-15', '婚车', 1487120942, '114.99.156.57', '1', '', '', 0),
(50, '王艇锐', '18098744488', '劳斯莱斯', '2017-04-18', '婚车', 1487135837, '36.60.44.236', '1', '', '', 0),
(51, '尹峰', '13486115557', '奔驰', '2017-04-30', '个人使用', 1487143846, '101.226.89.14', '1', '', '', 0),
(52, '孔联东', '13515976773', '兰博基尼', '2017-02-16', '新鲜感', 1487213220, '27.154.155.42', '1', '', '', 0),
(53, '吕佩刚', '15868100475', '玛莎拉蒂', '2017-2-17', '测试', 1487228035, '125.118.85.190', '1', '', '', 0),
(54, '郭磊', '13763015555', '奔驰', '2017-02-17', '接待', 1487228942, '183.60.52.5', '1', '', '', 0),
(55, '肖小荣', '18270088750', '奥迪', '2017-02-16', '临时用车', 1487233332, '223.104.169.76', '1', '', '', 0),
(56, '褚自强', '13535224889', '法拉利458', '2017-02-16', '自驾游', 1487238941, '113.67.158.168', '1', '', '', 0),
(57, 'we', '15757101550', '阿斯顿马丁', '2017-2-2', '123', 1487298232, '125.118.85.190', '1', '', '', 0),
(59, '吕佩刚', '15868100475', '阿斯顿马丁', '2017-2-18', '测试', 1487299881, '125.118.85.190', '1', '测试', '阿斯顿马丁 V8 Vantage 敞篷版', 1),
(60, '123', '15757101550', '宾利', '2017-02-17', '123', 1487300684, '125.118.85.190', '1', '测试', '宾利 欧陆GT V8敞篷版', 12),
(61, '郑小平', '13059663752', '兰博基尼', '2017-5-30', '随便开一下', 1487338586, '115.209.216.64', '1', '红色', '兰博基尼LP570-4', 1),
(62, '郑小平', '13059663752', '奥迪', '2017-5-30', '随便开一下', 1487338786, '115.209.216.64', '1', '红色', '路虎揽胜极光（白色）', 1),
(63, '陈威杰', '13631853503', '玛莎拉蒂', '2017-03-08', '婚庆', 1487413652, '223.104.1.186', '1', '玛莎拉蒂ghibli白色', '玛莎拉蒂Ghibli（白色）', 2),
(64, '吴伟', '13712880138', '宾利', '2017-2-28', '谈判', 1487560564, '60.173.167.49', '1', '都可以', '宾利 欧陆GT V8敞篷版', 15),
(68, '李新荣', '15715879766', '奔驰', '2017-02-22', '公司用', 1487753641, '61.130.237.74', '1', '', '奔驰G500', 30),
(69, '毛泽东', '15679790188', '兰博基尼', '2017-2-25', '装逼', 1487922610, '220.176.20.109', '1', '都阔仪', '兰博基尼LP700-4', 2),
(70, '123', '15635985658', '劳斯莱斯', '2017-2-28', '装逼', 1487987519, '27.159.204.123', '1', '', '劳斯莱斯 古斯特', 365),
(71, '刘旭', '13975253084', '宾利', '2017-02-25', '泡女人', 1487990098, '111.22.19.192', '1', '红色', '宾利GT', 500),
(72, '龙黄', '18998102118', '保时捷', '2017-2-25', '接人', 1487993653, '183.31.102.222', '1', '黑', '保时捷卡宴(白色）', 500),
(73, '你爸爸', '13751681111', '兰博基尼', '2017-2-1', '玩', 1488018108, '223.73.56.196', '1', '红色', '兰博基尼LP570-4', 360),
(74, '曹宗亮', '13968055515', '奔驰', '2017-02-25', '代步', 1488030169, '60.176.191.246', '1', '13968055515', '奔驰ML350（黑色）', 2),
(75, '刘聪', '15335803069', '兰博基尼', '2017-2-26', '100000', 1488071236, '112.14.231.166', '1', '', '兰博基尼LP700-4', 365),
(76, '杨志远', '18075941636', '路虎', '2017-06-03', '婚庆', 1488081686, '106.19.23.166', '1', '红色', '路虎揽胜行政版', 1),
(77, '李高雅', '18818286731', '法拉利', '2017-04-02', '探亲', 1488089428, '117.136.75.104', '1', '', '法拉利488', 3),
(78, '李家祥', '13926949800', '保时捷', '2017-05-14', '婚车', 1488201554, '113.76.184.84', '1', '', '保时捷Panamera', 1),
(79, '姜华阳', '15156886678', '奔驰', '2017-03-03', '接亲', 1488365497, '112.132.51.53', '1', '', '奔驰ML350（黑色）', 1),
(80, '周致园', '18370006000', '宝马', '2017-03-05', '因公司拓展业务', 1488703455, '106.6.195.229', '1', '白色', '宝马740（灰色）', 30),
(81, '王浩', '18046792661', '迈凯伦', '2017-3-7', '结婚', 1488777966, '110.52.39.54', '1', '白色', '迈凯伦 MP4-12', 5),
(82, '王散', '18888888888', '阿斯顿马丁', '2017-3-8', '装逼', 1488872218, '58.48.82.61', '1', '红色', '阿斯顿马丁 Rapide', 365),
(83, '吕海青', '13806728701', '奔驰', '2017-03-07', '婚礼', 1488873478, '112.17.243.224', '1', '黑色', '奔驰S400L', 2),
(84, '王', '13681704699', '奥迪', '2017-05-01', '结婚', 1489030617, '117.136.8.67', '1', '黑色', '奥迪A8（黑色）', 1),
(85, '李阳', '18859286848', '兰博基尼', '2017-03-10', '自驾游', 1489111334, '223.104.6.5', '1', '', '兰博基尼LP700-4', 2),
(86, '邓先生', '13429022028', '奥迪', '2017-03-11', '13429022028', 1489224894, '125.112.79.232', '1', '', '奥迪A8（黑色）', 2),
(87, '邓先生', '13429022028', '奥迪', '2017-03-11', '自用', 1489225030, '125.112.79.232', '1', '', '奥迪A8（黑色）', 2),
(88, '周女士', '13703002346', '保时捷', '2017-3-18', '参加婚礼', 1489300880, '113.76.35.34', '1', '白色', '保时捷Boxster', 1),
(89, '李海成', '13870995102', '阿斯顿马丁', '2017-3-13', '自己用', 1489304274, '59.55.140.104', '1', '白', '阿斯顿马丁 Rapide', 5),
(90, '熊才霞', '18665900362', '奔驰', '2017-03-14', '商务接待', 1489386835, '218.13.98.167', '1', '', '奔驰G55', 7),
(91, '陈先生', '13703002347', '保时捷', '2017-3-19', '代步', 1489497918, '113.76.32.115', '1', '白色', '保时捷Boxster', 1),
(92, '周建东', '18221989803', '兰博基尼', '2017-3-23', '结婚', 1489570130, '180.166.161.210', '1', '红色', '兰博基尼LP560敞篷', 1),
(93, '吕佩刚', '15868100475', '法拉利', '2017-3-31', '1111', 1490089035, '60.186.174.201', '1', '111111测试', '法拉利488', 2),
(94, '谷硕', '15757101550', '豪咖', '2017-3-1', '豪咖', 1490089600, '60.186.174.201', '1', '', '豪咖', 0),
(95, '郭锐松', '13761633357', '保时捷', '2017-03-23', '自己开', 1490262188, '117.136.8.70', '1', '黑色或者白色', '保时捷Panamera', 3),
(96, '舒焕', '18368381925', '豪咖', '2017-3-28', '豪咖', 1490680073, '124.160.56.67', '1', '', '豪咖', 0),
(97, '龙先生', '13880778022', '奔驰', '2017-3-30', '广州市区用', 1490757300, '202.167.250.99', '1', '无', '奔驰 SLS AMG', 7),
(98, '薛栋益', '13168135660', '玛莎拉蒂', '2017-04-17', '婚车', 1492430666, '183.61.51.226', '1', '蓝色', '玛莎拉蒂总裁', 2),
(99, '张李华', '13554157255', '豪咖', '5.20', '豪咖', 1492530927, '59.172.153.2', '1', '', '豪咖', 0),
(100, '812731', '15948577729', '豪咖', '5月', '豪咖', 1492662934, '183.156.119.24', '1', '', '豪咖', 0),
(101, '1', '15168200071', '', '', '', 1501924457, '125.120.39.193', '', '', '', 0),
(102, '1', '15168200071', '', '', '', 1501924526, '125.120.39.193', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_guestbook`
--

CREATE TABLE `sanda_guestbook` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_links`
--

CREATE TABLE `sanda_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_log`
--

CREATE TABLE `sanda_log` (
  `id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_menu`
--

CREATE TABLE `sanda_menu` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `parentid` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台菜单表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_menu`
--

INSERT INTO `sanda_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '文章管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 0, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 0, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '其它管理', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 0, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 0, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 0, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 0, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '网站设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 0, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 0, '注册邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 0, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 109, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(166, 127, 'Admin', 'Mailer', 'test', '', 1, 0, '测试邮件', '', '', 0),
(167, 109, 'Admin', 'Setting', 'upload', '', 1, 1, '上传设置', '', '', 0),
(168, 167, 'Admin', 'Setting', 'upload_post', '', 1, 0, '上传设置提交', '', '', 0),
(169, 7, 'Portal', 'AdminPost', 'copy', '', 1, 0, '文章批量复制', '', '', 0),
(174, 100, 'Admin', 'Menu', 'backup_menu', '', 1, 0, '备份菜单', '', '', 0),
(175, 100, 'Admin', 'Menu', 'export_menu_lang', '', 1, 0, '导出后台菜单多语言包', '', '', 0),
(176, 100, 'Admin', 'Menu', 'restore_menu', '', 1, 0, '还原菜单', '', '', 0),
(177, 100, 'Admin', 'Menu', 'getactions', '', 1, 0, '导入新菜单', '', '', 0),
(187, 0, 'Admin', 'Car', 'default', '', 0, 1, '业务管理', 'car', '三达管理', 0),
(188, 187, 'Admin', 'Car', 'index', '', 1, 1, '车辆管理', 'car', '车辆管理', 0),
(189, 187, 'Admin', 'Service', 'index', '', 1, 1, '网点管理', '', '网点管理', 0),
(190, 188, 'Admin', 'Car', 'add', '', 1, 0, '新增', '', '新增车辆', 0),
(191, 188, 'Admin', 'Car', 'edit', '', 1, 0, '编辑', NULL, '编辑车辆', 0),
(192, 188, 'Admin', 'Car', 'del', '', 1, 0, '删除', NULL, '删除车辆', 0),
(193, 189, 'Admin', 'Service', 'add', '', 1, 0, '新增', NULL, '新增网点', 0),
(194, 189, 'Admin', 'Service', 'edit', '', 1, 0, '编辑', NULL, '编辑网点', 0),
(195, 189, 'Admin', 'Service', 'del', '', 1, 0, '删除', NULL, '删除网点', 0),
(196, 187, 'Admin', 'Emaillog', 'index', '', 0, 1, '租车申请', '', '租车申请记录', 0),
(197, 187, 'Admin', 'Brand', 'index', '', 1, 1, '品牌管理', '', '品牌管理', 0),
(198, 197, 'Admin', 'Brand', 'add', '', 1, 0, '新增', '', '', 0),
(199, 197, 'Admin', 'Brand', 'edit', '', 1, 0, '编辑', '', '', 0),
(200, 197, 'Admin', 'Brand', 'del', '', 1, 0, '删除', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_nav`
--

CREATE TABLE `sanda_nav` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台导航表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_nav_cat`
--

CREATE TABLE `sanda_nav_cat` (
  `navcid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台导航分类表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_nav_cat`
--

INSERT INTO `sanda_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航');

-- --------------------------------------------------------

--
-- 表的结构 `sanda_oauth_user`
--

CREATE TABLE `sanda_oauth_user` (
  `id` int(20) NOT NULL,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_options`
--

CREATE TABLE `sanda_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全站配置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_options`
--

INSERT INTO `sanda_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', 1),
(6, 'site_options', '{\"site_name\":\"\\u5a01\\u98ce\\u51fa\\u884c\",\"site_admin_url_password\":\"vfly\",\"site_tpl\":\"html\",\"mobile_tpl_enabled\":\"0\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\\u6d59ICP\\u590717031828\\u53f7\",\"tel\":\"400-000-2777\",\"mobile\":\"400-000-2777\",\"companyAddress\":\"\\u6d59\\u6c5f\\u7701\\u676d\\u5dde\\u5e02\\u62f1\\u5885\\u533a\\u6559\\u5de5\\u8def586\\u53f7\",\"customServiceEmail\":\"m13738133633@163.com\",\"orderReceiveEmail\":\"337910846@qq.com\",\"site_copyright\":\"\\u676d\\u5dde\\u5b59\\u884c\\u8005\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\",\"site_tongji\":\"var _hmt = _hmt || [];\\n(function() {\\n  var hm = document.createElement(\'script\');\\n  hm.src = \'https:\\/\\/hm.baidu.com\\/hm.js?3487039ea22444ac6205f3d02efde826\';\\n  var s = document.getElementsByTagName(\'script\')[0]; \\n  s.parentNode.insertBefore(hm, s);\\n})();var cnzz_protocol = ((\'https:\' == document.location.protocol) ? \' https:\\/\\/\' : \' http:\\/\\/\');document.write(unescape(\'%3Cspan id=\'cnzz_stat_icon_1263293753\'%3E%3C\\/span%3E%3Cscript src=\'\' + cnzz_protocol + \'s19.cnzz.com\\/z_stat.php%3Fid%3D1263293753%26show%3Dpic\' type=\'text\\/javascript\'%3E%3C\\/script%3E\'));\",\"site_seo_title\":\"\\u676d\\u5dde\\u5b59\\u884c\\u8005\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8 \\u5a01\\u98ce\\u51fa\\u884c \\u8c6a\\u8f66\\u79df\\u8d41 \",\"site_seo_keywords\":\"\\u5a01\\u98ce\\u51fa\\u884c \\u8c6a\\u8f66\\u79df\\u8d41 \\u5317\\u4eac\\u8c6a\\u8f66\\u51fa\\u79df \\u5168\\u56fd\\u8d85\\u8dd1\\u79df\\u8d41 \\u5a5a\\u8f66\\u79df\\u8d41 \",\"site_seo_description\":\"&quot;\\u676d\\u5dde\\u5b59\\u884c\\u8005\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u8d23\\u4efb\\u516c\\u53f8\\u662f\\u4e00\\u5bb6\\u96c6\\u6c7d\\u8f66\\u9500\\u552e\\uff0c\\u6c7d\\u8f66\\u79df\\u8d41\\uff0c\\u8d85\\u8dd1\\u79df\\u8d41\\uff0c\\u5a5a\\u8f66\\u79df\\u8d41\\u7684\\u516c\\u53f8\\u3002\\u65d7\\u4e0b\\u54c1\\u724c\\u5a01\\u98ce\\u51fa\\u884c\\uff0c\\u62e5\\u6709\\u8c6a\\u8f66400\\u4f59\\u8f86\\uff0c\\u5728\\u8fd9\\u91cc\\uff0c\\u60a8\\u53ef\\u4ee5\\u79df\\u8d85\\u8dd1\\uff0c\\u79df\\u8c6a\\u8f66\\uff0c\\u79df\\u5a5a\\u8f66\\uff01&quot;\",\"urlmode\":\"2\",\"html_suffix\":\"html\"}', 1),
(7, 'cmf_settings', '{\"banned_usernames\":\"\",\"storage\":{\"type\":\"Qiniu\",\"Qiniu\":{\"accessKey\":\"KWGWdmHINodWi96xb56ZgcCFmsHPiG5JSuWG6s7c\",\"secretKey\":\"O08f09e0-tyOnl2SDBFLR8fmAkXK6gulqYVyAefm\",\"upHost\":\"http:\\/\\/up.qiniu.com\",\"setting\":{\"protocol\":\"http\",\"enable_picture_protect\":\"0\",\"style_separator\":\"!\",\"styles\":{\"watermark\":\"watermark\",\"avatar\":\"watermark\",\"thumbnail120x120\":\"thumbnail120x120\",\"thumbnail300x300\":\"thumbnail300x300\",\"thumbnail640x640\":\"thumbnail640x640\",\"thumbnail1080x1080\":\"thumbnail1080x1080\"}},\"domain\":\"vfly-cdn.joyingnet.com\",\"bucket\":\"vfly\"}}}', 1),
(8, 'cdn_settings', '{\"cdn_static_root\":\"\"}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_plugins`
--

CREATE TABLE `sanda_plugins` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_posts`
--

CREATE TABLE `sanda_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) UNSIGNED DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Portal文章表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_posts`
--

INSERT INTO `sanda_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `sort`) VALUES
(1, 1, '缤纷夏日 泳池派对 超跑来袭', '缤纷夏日 泳池派对 超跑来袭', '2017-01-06 20:30:27', '<p style=\"text-align: center;\"><span style=\"color: #ff0000;\">7月30日</span></p><p style=\"text-align: center;\"><span style=\"color: #ff0000;\">SD</span>超跑俱乐部携手杭州首家潮流夜店<span style=\"color: #ff0000;\">LINX</span></p><p style=\"text-align: center;\">在绿城玫瑰园合作举办了一场夏日泳池派对</p><p style=\"text-align: center;\"><img class=\"size-medium wp-image-2448 aligncenter\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_5696-300x200.jpg\" alt=\"MTB_5696\" width=\"300\" height=\"200\"/></p><p style=\"text-align: center;\">派对邀请了SD和LINX的VIP客户一同享受这激情凉快一夏<br/></p><p style=\"text-align: center;\">美女 &nbsp; &nbsp; &nbsp; &nbsp;美酒 &nbsp; &nbsp; &nbsp;超跑</p><p style=\"text-align: center;\"><img class=\"alignnone size-medium wp-image-2449\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_4948-300x200.jpg\" alt=\"MTB_4948\" width=\"300\" height=\"200\"/> <img class=\"alignnone size-medium wp-image-2451\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_5732-300x200.jpg\" alt=\"MTB_5732\" width=\"300\" height=\"200\"/></p><p><br/></p>', '缤纷夏日 泳池派对 超跑来袭', '缤纷夏日 泳池派对 超跑来袭', 3, 1, '2017-01-06 20:40:06', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170106\\/586f90215e943.jpg\",\"template\":\"newsdetail\"}', 0, 0, 0, 0, 0),
(2, 1, '缤纷夏日', NULL, '2017-01-10 10:47:06', '<p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">7月30日</span></p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\"><span style=\"color: rgb(255, 0, 0);\">SD</span>超跑俱乐部携手杭州首家潮流夜店<span style=\"color: rgb(255, 0, 0);\">LINX</span></p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\">在绿城玫瑰园合作举办了一场夏日泳池派对</p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\"><img class=\"size-medium wp-image-2448 aligncenter\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_5696-300x200.jpg\" alt=\"MTB_5696\" style=\"width: auto; vertical-align: middle;\" height=\"200\" width=\"300\"/></p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\">派对邀请了SD和LINX的VIP客户一同享受这激情凉快一夏<br/></p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\">美女 &nbsp; &nbsp; &nbsp; &nbsp;美酒 &nbsp; &nbsp; &nbsp;超跑</p><p style=\"color: rgb(255, 255, 255); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(0, 0, 0); text-align: center;\"><img class=\"alignnone size-medium wp-image-2449\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_4948-300x200.jpg\" alt=\"MTB_4948\" style=\"width: auto; vertical-align: middle;\" height=\"200\" width=\"300\"/>&nbsp;<img class=\"alignnone size-medium wp-image-2451\" src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/MTB_5732-300x200.jpg\" alt=\"MTB_5732\" style=\"width: auto; vertical-align: middle;\" height=\"200\" width=\"300\"/></p><p><br/></p>', '缤纷夏日 泳池派对 超跑来袭', '缤纷夏日 泳池派对 超跑来袭...', 3, 1, '2017-02-11 15:22:25', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170110\\/58744e2eb272f.jpg\",\"pcbanner\":\"portal\\/20170110\\/58744bbcbd808.png\",\"wapbanner\":\"portal\\/20170110\\/58744ba4b0635.png\"}', 0, 0, 1, 1, 3),
(3, 1, '123', NULL, '2017-01-10 15:17:05', '<p>123</p>', '123', '123', 3, 1, '2017-01-10 15:17:12', NULL, 0, 1, '', 0, '{\"thumb\":\"\",\"pcbanner\":\"\",\"wapbanner\":\"\"}', 0, 0, 0, 0, 0),
(4, 1, '123', NULL, '2017-01-10 16:37:17', '<p>12312312</p>', '12', '123', 3, 1, '2017-01-10 16:37:31', NULL, 0, 1, '', 0, '{\"thumb\":\"\",\"pcbanner\":\"\",\"wapbanner\":\"\"}', 0, 0, 0, 0, 0),
(5, 1, '三达 宁波 乔迁', NULL, '2017-01-20 14:02:55', '<section style=\"margin: 0px; padding: 0px; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: medium; line-height: 25.6px; white-space: normal; box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; box-sizing: border-box; text-align: center;\"><section class=\"\" style=\"margin: 0px; padding: 10px; display: inline-block; width: 556px; border: 1px solid rgb(192, 200, 209); box-sizing: border-box; background-color: rgb(239, 239, 239);\"><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; box-sizing: border-box;\"><section class=\" __bg_gif\" style=\"margin: 0px; padding: 2px 3px; display: inline-block; width: 534px; vertical-align: top; line-height: 1.6; box-sizing: border-box; background-image: url(https://mmbiz.qlogo.cn/mmbiz_gif/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKTXjxy25pxLxzU0YkGaa0ppzicv2DCHm5sicqKnzIDKNOyIcAMvGX6S4w/s640?); background-attachment: scroll; background-size: auto; background-position: 0% 0%; background-repeat: repeat;\"><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 1px 0px; padding: 0px; transform: translate3d(0px, 0px, 0px); text-align: center; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 10px; display: inline-block; width: 528px; border: 1px solid transparent; box-sizing: border-box; background-color: rgb(255, 255, 255);\"><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; text-align: left; font-size: 14px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box;\"><span style=\"color: rgb(0, 0, 0);\">从千年人文之都，到世界峰会之地。三达亲历了杭州的荣耀。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box;\"><span style=\"color: rgb(0, 0, 0);\">从人间天堂杭州，到人杰地灵鄞州，宁波见证了三达的新升。</span></p></section></section></section></section></section></section></section></section></section></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKJjhAYdmibRSV9eUibE1qYjCBibuoiaHGxV92rBpjoaYK7ibwza63Ol3NZicw/0?wx_fmt=jpeg\" data-ratio=\"0.665625\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; font-size: 14px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 1.6; box-sizing: border-box;\">2016年12月21号，时值农历冬至佳节。<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">三达豪车宁波分店迎来了乔迁盛典。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">三达豪车的领导们、业界同行、战略合作伙伴们欢聚一堂。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">见证三达豪车的又一次新跨越。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">现场豪车云集，格外瞩目</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKzRpvicIPY7Oo6lxfiaTGdR6NJQ1teO3n38YlwvnzV5Dz1rkITO5OmDxQ/0?wx_fmt=jpeg\" data-ratio=\"0.696875\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKEMoUdnlLbiaubVzlEr5Kugrtuu6Eb9wBnpDy69m8NLicI6GHMibYBiaxSw/0?wx_fmt=jpeg\" data-ratio=\"0.653125\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; letter-spacing: 0px; line-height: 1.6; box-sizing: border-box; color: rgb(0, 0, 0);\">庄严肃穆的时刻、喜庆欢腾的气氛、激动人心的瞬间、光辉灿烂的永恒....<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">用这些词来形容这场乔迁盛典，像天空中那轮太阳，耀眼无比，独一无二！</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">当乔迁盛典的剪彩瞬间，注定这是一场让人铭记一生的精彩盛典！</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbK6I4Q2oVsNrdaPVmKcBs27icuXqxSLU25cFRCX7tYiaNXTLHib4FCmLFpA/0?wx_fmt=jpeg\" data-ratio=\"0.68125\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; letter-spacing: 0px; line-height: 2; box-sizing: border-box;\">中午12点的钟声刚刚敲响，舞狮剪彩也准时开始<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">现场的气氛被到场嘉宾的热情点燃。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">乔迁盛典现场由宁波电视台主持人悠然主持。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">三达豪车董事长祝凤归先生和三达豪车宁波分店总经理罗光磊先生</span><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px;\">联袂剪彩。</span></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKSC8BrlzhVjetTGnCdYq4Nr3fwxTicIqPVzSZu1NHjckia6UMkuDNJaibQ/0?wx_fmt=jpeg\" data-ratio=\"0.709375\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKv3Q4EUSsQFnzqx0ZxLfMIsyGJDmAuaYhb6nbRNcvznj9K1ef4jLMew/0?wx_fmt=jpeg\" data-ratio=\"1.5594541910331383\" data-w=\"513\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">祝凤归先生和罗光磊先生为舞狮点睛</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">龙狮开光，万事如意</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">寓意宁波分店乔迁大吉<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; font-size: 14px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 2; box-sizing: border-box;\">现场不仅有精彩的舞狮表演，还有乐队表演<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">吸引了所有过路人的眼光。</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKIzQxp10jSzH5FYPanziausA05LBffGgTVfibcHqoLwMbuEPmYdtwgrvg/0?wx_fmt=jpeg\" data-ratio=\"0.6015625\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKBXteXDh9j7iaohNZ0U1YN00k0Vv0Odqld3rUTCf0N4myNXD9c7N4qibg/0?wx_fmt=jpeg\" data-ratio=\"1\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; font-size: 14px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">午宴过后，天气放晴</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">现场安排了超跑巡礼仪式</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">多台超跑齐齐游街</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">赚足了眼球</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbK0fJNozHXr5MF1SlBopiap83fWqaGJnmlyI5cPwiaaaVQG7AKkibWicBetg/0?wx_fmt=jpeg\" data-ratio=\"0.596875\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKICb1UMOT1ZIwlbsVW0lToDyicaibtfjibC3zpibR75IEsqZdj4k6HXUxeQ/0?wx_fmt=jpeg\" data-ratio=\"0.665625\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKk2FKwBZqSFprqVKiaajTrTE9YiaqNPt08TNsC0wPyENiam4h4RhLa4W3A/0?wx_fmt=jpeg\" data-ratio=\"0.665625\" data-w=\"640\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKzDM0OhAbT3iaH0KTABpm5ctEriaAe1zLZmrd0XFwQg3MCXF4S7xUHxbw/0?wx_fmt=jpeg\" data-ratio=\"1.5009380863039399\" data-w=\"533\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_jpg/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKGkj5Q6BqpdJFO8h0o3CYP8a9jQ5aeiaB0yXDspZWibOuQAYWK9GkdbHQ/0?wx_fmt=jpeg\" data-ratio=\"1.5009380863039399\" data-w=\"533\" class=\"\" data-type=\"jpeg\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">此次乔迁盛典还安<span style=\"font-size: 14px; color: rgb(0, 0, 0); margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 1.6; box-sizing: border-box;\">排了答谢晚宴</span></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 1.6; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0);\">感谢各位来宾的到场支持</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKUxWniafje9P2bsAL9byIWs50bLhAhVr5H7U6R3LrrtWLCMCWjs6ajDw/0?wx_fmt=png\" data-ratio=\"0.66875\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; font-size: 14px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 1.6; box-sizing: border-box; color: rgb(0, 0, 0);\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; letter-spacing: 0px; line-height: 1.6; box-sizing: border-box;\">晚宴以气势恢宏的鼓舞作为开场</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKURvcv0TLrkqK9xKNo6ialSecCPBnIClWicNx5q9X1MNpZUoAQydLib1iag/0?wx_fmt=png\" data-ratio=\"0.571875\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; font-size: 14px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">三达豪车董事长祝凤归先生和宁波分公司总经理罗光磊先生致辞并向来宾敬酒<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKGVdhf2sjpJUtB9zvaxVwJvVzymGv2bTdDHhOsJyOFOsDFqbXZbyZZA/0?wx_fmt=png\" data-ratio=\"0.6078125\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; font-size: 14px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">晚宴现场还有各种精彩的表演</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKyIWTY6tLVpMdP1G0Y7ehM7iccmbQeKCBOgcjE5AWsyJuNu6aicLCp5kw/0?wx_fmt=png\" data-ratio=\"0.66875\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; line-height: 2; font-size: 14px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">精彩纷呈的魔术表演</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKZxXs6PJw6qCOzTkKib10ibp25xQSK758KrMFibQ6uiaMR73sznHcj0AhUg/0?wx_fmt=png\" data-ratio=\"0.6375\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">热辣十足的韩国劲舞<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKSALliaEqxUKKyJnPfw0OsvwicNiaOE8Cr2aaAleMaS5CrpPO8NyJugRtw/0?wx_fmt=png\" data-ratio=\"0.671875\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">超美的歌手演唱超好听的歌曲<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKwiaIib1QJlV5sjCRNcOkiaiasiccD4HwbcOqEvn9FsR2KA5BTA0HCCbRLQw/0?wx_fmt=png\" data-ratio=\"0.640625\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">笑声不断的互动游戏<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25.6px; text-align: center; margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">以及最最最最激动人心的抽奖时刻！</span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKNRuOqp2YUPY3wyfClERb6rUTUvT7op37tOfGgq8MtdChbeqtRBSdng/0?wx_fmt=png\" data-ratio=\"0.65625\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; text-align: center; vertical-align: middle; box-sizing: border-box;\"/></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0); margin: 0px; padding: 0px; font-size: 14px; box-sizing: border-box;\">没错！就是这位帅气年轻的小哥抽中了iPhone7大奖<br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></span></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; text-align: center; box-sizing: border-box;\"><img src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbK4l7hn5VlGiaJaPoMxrBcflScUnXxsrECicnFOsib2VYKiaGCWGmiaVNgyPw/0?wx_fmt=png\" data-ratio=\"0.6734375\" data-w=\"640\" class=\"\" data-type=\"png\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important; vertical-align: middle; box-sizing: border-box;\"/></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box;\"><br style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"/></p></section></section></section><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 10px 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; width: 556px; transform: rotate(0deg); box-sizing: border-box;\"><section style=\"margin: 0px; padding: 0px; width: 50px; height: 4px; box-sizing: border-box; background-color: rgb(71, 193, 168);\"></section></section><section class=\"\" style=\"margin: -4px 0px 0px; padding: 10px; box-sizing: border-box; background-color: rgb(239, 239, 239);\"><section class=\"Powered-by-XIUMI V5\" powered-by=\"xiumi.us\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; box-sizing: border-box;\"><section class=\"\" style=\"margin: 0px; padding: 0px; font-size: 14px; line-height: 2; box-sizing: border-box;\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">砥砺奋进</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">三达豪车自2009年成立以来</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">服务成千上百的客户</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">为客户提供高端出行体验</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">提供自驾租车、商务用车、机场接送、婚庆用车、静态展示、影视用车等多项用车服务</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">继往开来</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">2016年12月21日对于宁波分店来说是一个新的开始</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">我们相信，宁波分店将宏图大展，业绩蒸蒸日上</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">同时，三达豪车的发展离不开各位同仁、各界朋友的支持</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; box-sizing: border-box; text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">在此，三达豪车全体员工衷心地感谢朋友们一路以来的陪伴和支持</span></p></section></section></section></section></section></section></section><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: medium; line-height: 25.6px; white-space: normal; text-align: center;\"><img data-s=\"300,640\" data-type=\"png\" src=\"https://mmbiz.qlogo.cn/mmbiz_png/9rlpfehXzETKywqfJWZTlqMwPyIZoHbKFHOsBQpmjnkYS6S61v22ymHUM3fRwfWRJqDVibel77y1mfroIiaibZ7TQ/0?wx_fmt=png\" data-ratio=\"0.5591689250225835\" data-w=\"1107\" style=\"margin: 0px; padding: 0px; max-width: 100%; height: auto !important;\"/><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: medium; line-height: 25.6px; white-space: normal;\"><br style=\"margin: 0px; padding: 0px;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; clear: both; font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; font-size: medium; line-height: 25.6px; white-space: normal;\"></p><p><br/></p>', '宁波分店乔迁盛典丨砥砺奋进铸华章 继往开来启新程', '从千年人文之都，到世界峰会之地。三达亲历了杭州的荣耀。\r\n从人间天堂杭州，到人杰地灵鄞州，宁波见证了三达的新升。', 3, 1, '2017-01-20 14:13:02', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170120\\/5881a8f5a73f6.jpg\",\"pcbanner\":\"portal\\/20170120\\/5881a8fe37298.jpg\",\"wapbanner\":\"portal\\/20170120\\/5881a905f05a1.jpg\"}', 0, 0, 0, 0, 0);
INSERT INTO `sanda_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `sort`) VALUES
(6, 1, '三达 乔迁', NULL, '2017-01-20 14:14:26', '<p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">从千年人文之都，到世界峰会之地。三达亲历了杭州的荣耀。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">从人间天堂杭州，到人杰地灵鄞州，宁波见证了三达的新升。</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b05d55cf4.jpg\" title=\"1.webp.jpg\" alt=\"1.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">2016年<span style=\"font-size: 14px; font-family: Calibri; color: rgb(255, 255, 255);\">12</span>月<span style=\"font-size: 14px; font-family: Calibri; color: rgb(255, 255, 255);\">21</span>号，时值农历冬至佳节。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车宁波分店迎来了乔迁盛典。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车的领导们、业界同行、战略合作伙伴们欢聚一堂。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">见证三达豪车的又一次新跨越。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">现场豪车云集，格外瞩目</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b0fb0156a.jpg\" style=\"\" title=\"2.webp.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b0fb42096.jpg\" style=\"\" title=\"3.webp.jpg\"/></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 255, 255); font-family: 宋体; font-size: 14px;\">&nbsp;<br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">庄严肃穆的时刻、喜庆欢腾的气氛、激动人心的瞬间、光辉灿烂的永恒....</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">用这些词来形容这场乔迁盛典，像天空中那轮太阳，耀眼无比，独一无二！</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">当乔迁盛典的剪彩瞬间，注定这是一场让人铭记一生的精彩盛典！</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b110d3d86.jpg\" title=\"4.webp.jpg\" alt=\"4.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">中午12点的钟声刚刚敲响，舞狮剪彩也准时开始</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">现场的气氛被到场嘉宾的热情点燃。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">乔迁盛典现场由宁波电视台主持人悠然主持。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车董事长祝凤归先生和三达豪车宁波分店总经理罗光磊先生联袂剪彩。</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1308f603.jpg\" title=\"5.webp.jpg\" style=\"white-space: normal;\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b12fda8b8.jpg\" style=\"\" title=\"6.webp.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">祝凤归先生和罗光磊先生为舞狮点睛</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">龙狮开光，万事如意</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">寓意宁波分店乔迁大吉</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">现场不仅有精彩的舞狮表演，还有乐队表演</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">吸引了所有过路人的眼光。</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b15476c9e.jpg\" title=\"7.webp.jpg\" style=\"white-space: normal;\"/></span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b153a7272.jpg\" style=\"\" title=\"8.webp.jpg\"/></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">午宴过后，天气放晴</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">现场安排了超跑巡礼仪式</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">多台超跑齐齐游街</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">赚足了眼球</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b19887f8b.jpg\" style=\"\" title=\"9.webp.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b198c1cd4.jpg\" style=\"\" title=\"11.webp.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b19907304.jpg\" style=\"\" title=\"22.webp.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b199495e9.jpg\" style=\"\" title=\"33.webp.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b199c205b.jpg\" style=\"\" title=\"0.webp.jpg\"/><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">此次乔迁盛典还安排了答谢晚宴</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">感谢各位来宾的到场支持</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1ba2c3ae.jpg\" title=\"44.webp.jpg\" alt=\"44.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">晚宴以气势恢宏的鼓舞作为开场</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1caee33f.jpg\" title=\"55.webp.jpg\" alt=\"55.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车董事长祝凤归先生和宁波分公司总经理罗光磊先生致辞并向来宾敬酒</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1de2d5e5.jpg\" title=\"66.webp.jpg\" alt=\"66.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">晚宴现场还有各种精彩的表演</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1f2d5dd9.jpg\" title=\"77.webp.jpg\" alt=\"77.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">精彩纷呈的魔术表演</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b1fc79158.jpg\" title=\"88.webp.jpg\" alt=\"88.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">热辣十足的韩国劲舞</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b20b0d0c7.jpg\" title=\"99.webp.jpg\" alt=\"99.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">超美的歌手演唱超好听的歌曲</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">笑声不断的互动游戏</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">以及最最最最激动人心的抽奖时刻！</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b22c920ba.jpg\" title=\"111.webp.jpg\" alt=\"111.webp.jpg\"/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">没错！就是这位帅气年轻的小哥抽中了iPhone7大奖</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b242af65c.jpg\" title=\"222.webp.jpg\" alt=\"222.webp.jpg\"/></span></p><p style=\"text-align: center;\"><br/></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">砥砺奋进</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车自2009年成立以来</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">服务成千上百的客户</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">为客户提供高端出行体验</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">提供自驾租车、商务用车、机场接送、婚庆用车、静态展示、影视用车等多项用车服务</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">继往开来</span></p><p><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">2016年<span style=\"font-size: 14px; font-family: Calibri; color: rgb(255, 255, 255);\">12</span>月<span style=\"font-size: 14px; font-family: Calibri; color: rgb(255, 255, 255);\">21</span>日对于宁波分店来说是一个新的开始</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">我们相信，宁波分店将宏图大展，业绩蒸蒸日上</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">同时，三达豪车的发展离不开各位同仁、各界朋友的支持</span></p><p style=\"text-align: center;\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(255, 255, 255);\">在此，三达豪车全体员工衷心地感谢朋友们一路以来的陪伴和支持</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体; font-size: 14px; color: rgb(0, 0, 0);\">&nbsp;</span><span style=\"color: rgb(255, 255, 255); font-family: 宋体; font-size: 14px;\">&nbsp;</span></span></p><p style=\"text-align: center;\"><span style=\"font-family: Calibri; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;<img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170120/5881b259c5d7b.jpg\" title=\"333.webp.jpg\" alt=\"333.webp.jpg\"/></span></p><p><br/></p>', '宁波分店乔迁盛典丨砥砺奋进铸华章 继往开来启新程', '三达豪车宁波开业盛典，感谢一路有你！', 3, 1, '2017-08-01 14:52:00', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170120\\/5881b30714efc.jpg\",\"pcbanner\":\"portal\\/20170120\\/5881b2fa22e41.jpg\",\"wapbanner\":\"portal\\/20170120\\/5881b31023222.jpg\"}', 0, 0, 0, 1, 1),
(7, 1, '三达 ', NULL, '2017-01-20 14:57:54', '<p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px;\"><span style=\"font-family: 宋体;\">总部位于美丽的人间天堂义乌，三达豪车自</span>2009年成立以来服务用户</span><span style=\"font-family: Calibri; letter-spacing: 0px; font-size: 14px;\">20</span><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体;\">余万人次</span></span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">为用户提供安全的出行保障和驾驭体验。随着业务的发展，</span><a href=\"http://www.sandazuche.com/\" style=\"text-decoration: underline; letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\"><span style=\"text-decoration: underline; letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">三达豪车</span></a><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">品牌齐全，数量众多</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">随着市场的发展，用户的选择倾向也朝多样化发展</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 255, 255); font-family: 宋体; letter-spacing: 0px; font-size: 14px;\"><span style=\"color: rgb(255, 255, 255); font-family: 宋体;\">根据客户用车场景、猎奇的消费心理，三达豪车引进了宝马</span>I8、迈凯伦</span><span style=\"color: rgb(255, 255, 255); font-family: Calibri; letter-spacing: 0px; font-size: 14px;\">MP4-12C</span></span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 255, 255); letter-spacing: 0px; font-size: 14px; font-family: 宋体;\">特斯拉、玛莎拉蒂</span><span style=\"color: rgb(255, 255, 255); font-family: Calibri; letter-spacing: 0px; font-size: 14px;\">lavante</span><span style=\"color: rgb(255, 255, 255); letter-spacing: 0px; font-size: 14px; font-family: 宋体;\">、兰博基尼</span><span style=\"color: rgb(255, 255, 255); font-family: Calibri; letter-spacing: 0px; font-size: 14px;\">Aventador</span><span style=\"color: rgb(255, 255, 255); letter-spacing: 0px; font-size: 14px; font-family: 宋体;\">等多种稀有车型，以满足客户的用车需求</span></span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">价格实惠，车况良好。豪车租赁市场信息的不对称、不透明，造成了价格参差不齐</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">三达豪车为客户提供真正低于市场价的租赁价格，为客户节省出行费用</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">三达豪车拥有完善的车辆保养体系，每一辆车在交付给客户之前，都会进行全面的检查</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">维修人员根据规定，每天对车辆情况进行统计，及时处理车辆存在隐患，为用户出行提供保障</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">服务良好，售后到位。三达豪车为客户提供7*24小时的人工系统客服服务体系</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">无论是租赁咨询、用车疑虑、紧急道路救援都能第一时间得到人工反馈</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">三达豪车为客户提供上门送车、取车服务，真正做到送车上门服务</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">全时段的送车服务满足客户的用车需求，节省客户时间成本</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"font-family: 宋体; letter-spacing: 0px; font-size: 14px; color: rgb(255, 255, 255);\">&nbsp;</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">三达豪车旨在将更全的车型、更好的服务、更棒的出行体验提供给每一个客户</span></p><p style=\"margin: 5px 0px; text-indent: 0px; text-align: center;\"><span style=\"letter-spacing: 0px; font-size: 14px; font-family: 宋体; color: rgb(255, 255, 255);\">轻松出行，尽在三达豪车</span></p><p><br/></p>', '三达豪车——专业的超跑豪车租赁专家', '总部位于美丽的人间天堂义乌，三达豪车自2009年成立以来服务用户20余万人次，为用户提供安全的出行保障和驾驭体验。随着业务的发展，三达豪车现业务范围覆盖全国，全国分店23家。', 3, 1, '2017-03-13 13:02:34', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170120\\/5881b60a09161.jpg\",\"pcbanner\":\"portal\\/20170206\\/58980e9c8aeb8.jpg\",\"wapbanner\":\"portal\\/20170120\\/5881b6186c9b0.jpg\"}', 0, 0, 0, 1, 100),
(8, 1, '威风出行 豪车租赁 超跑出租 婚车出租 ', NULL, '2017-01-20 15:03:46', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">每一个人都值得拥有高端出行的体验</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">超跑、豪车不再遥不可及</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">最优的价格，最全的车型</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">最刺激的驾驭体验</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">威风出行——专业的超跑豪车租赁专家</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">旗下拥有超跑豪车四百余台</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">全国主要城市都有能力调车<br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">业务范围覆盖全国</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">您自驾旅行我为您保驾护航助您越玩越有面</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">您求婚表白我为您私人订制助您赢得美人心</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">您商务用车我为您提高bigeer助您事业有成</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">您举办婚礼我为您提供尊贵体验助您风光出场</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">您新店开业我为您提供豪华排场助您排场满满</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">最安全的道路救援服务</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">最贴心的送车上门及取车服务</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">7*24小时人工客服系统</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">帮您解决用车及租车过程中遇到的一切问题</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"font-size: 18px; color: rgb(0, 0, 0);\">精彩用车生活，尽在威风出行</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, &#39;Apple Color Emoji&#39;, &#39;Emoji Symbols Font&#39;, &#39;Segoe UI Symbol&#39;, Arial, sans-serif; white-space: normal; text-align: center; line-height: 3em;\"><span style=\"color: rgb(255, 255, 255); font-size: 18px;\">跑、豪车不再遥不可及<br/></span></p><p><br/></p><p><br/></p><p><br/></p>', '精彩用车生活 尽在威风出行！', '每一个人都值得拥有高端出行的体验\r\n超跑、豪车不再遥不可及\r\n最优的价格，最全的车型\r\n最刺激的驾驭体验', 1, 1, '2017-08-07 09:44:59', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170807\\/5987c6176a34c.jpg\",\"pcbanner\":\"portal\\/20170206\\/58980d0ca6ba4.jpg\",\"wapbanner\":\"portal\\/20170206\\/58980d1ce9c31.jpg\"}', 0, 0, 1, 0, 2),
(9, 1, '婚车租赁', NULL, '2017-02-08 10:42:06', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">随着人们生活水平和经济基础的提高，越来越多的人选择在结婚是使用豪车进行嫁娶，既体面又比较省事方便，但是在<strong><a href=\"http://www.sandazuche.com\" target=\"_blank\">婚车租赁</a></strong>的时候会有很多的细节需要大家注意，一些事项如果能够清楚了解的话在婚车租赁时能够找到专业放心的婚车租赁。</p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px; text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170211/589eabcb2895a.jpg\" title=\"IMG_3964_副本.jpg\" alt=\"IMG_3964_副本.jpg\"/></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px;\"><br/></p><p style=\"margin-right: 0px; margin-left: 0px; text-indent: 32px;\"><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">一、选择正规车行租赁</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">现在市场上黑车较多，混淆大众的视野，不仅危险也扰乱了社会秩序，受众在进行婚车租赁的时候要选择正规的车行，选择信誉可靠的婚车租赁，甚至是有工商局注册信息的规范车行，在一定程度上能够减少风险，如果是零散的车行，也要有一定的凭证才能签订合同，此合同为具有法律效力的凭证。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">二、认清车牌号及实物车</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">大多数情况下，商家会给消费者提供婚车的照片，但是消费者一定要选择见到婚车的真实样子，只有实地看到婚车的样子才能够确保婚礼当天不会出现临时换车的情况，并且预订的婚车比较多的话还要记下婚车的车牌号。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">三、确认收费方式</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">这是一种直接与金钱挂钩的方面，很多情况下世事难料，消费者们很难保证都能够准时准点的归还婚车，因此婚车租赁会有一个超时的收费标准，因此受众在租车时必须事先问清楚租赁公司的收费情况，按规定收费。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">婚车租赁是一项时兴的方式，碰上旺季的时候生意红火，因此如果选择在忘记结婚的话消费者们就要提前预定，以免耽误自己的婚期，延误吉时。有些公司是不按照公里数而是按照时间收费的，所以消费者在选择时需要注意自己的需求是什么，如果时间较短的话可以选择按照时间收费的，如果是距离较近的话就可以找按照公里数收费而轻时间的。</p>', '婚车租赁有哪些注意事项', '随着人们生活水平和经济基础的提高，越来越多的人选择在结婚是使用豪车进行嫁娶，既体面又比较省事方便，但是在婚车租赁的时候会有很多的细节需要大家注意，一些事项如果能够清楚了解的话在婚车租赁时能够找到专业放心的婚车租赁。', 1, 1, '2017-02-11 14:14:42', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170211\\/589eab2ab0b08.jpg\",\"pcbanner\":\"portal\\/20170210\\/589d8b170c35c.jpg\",\"wapbanner\":\"portal\\/20170211\\/589ea92ef124f.jpg\"}', 0, 0, 1, 1, 0),
(10, 1, '豪车租赁', NULL, '2017-02-08 11:37:50', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">专业的<strong><a href=\"http://www.sandazuche.com\" target=\"_blank\">豪车租赁</a></strong>给很多个人以及企业用户提供了方便，而且租用操作简单、灵活，所以这种用车方式深受用户的喜爱。在租车的时候，为了确保己方的利益，同时也为了让豪车租赁的利益有保障，租赁公司往往都会要求租车开户办理一些手续。接下来一起了解一下相关的租用手续。</p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170211/589eab9e34260.jpg\" title=\"IMG_3953_副本.jpg\" alt=\"IMG_3953_副本.jpg\"/></p><p><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">1、提供证件资料</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">为了确保豪车租赁的客户能够合法使用车辆，首先要向租赁公司提供本人的身份证、驾驶证等证件资料。如果是港澳客户，则要提供港澳居民来往内地通行证；台湾客户要提供大陆通行证；外籍客户则要提供护照、签证或者居住证。租赁公司会将客户提供的身份信息以及联系方法进行记录。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">2、填写验车信息</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">填写验车单是对豪车租赁公司以及可户利益的一种有效保障。在提车之前，租赁公司会邀请客户一同对所租用的车辆进行检查，包括看外观是否有凹陷和划痕，以及冷冻油、灯光等一些车况的基本情况，同时会让客户进行试驾，确保车辆没有异常，然后根据检验的结果填写详细的验车信息单。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">3、签订租赁协议</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">选定车型之后，租赁公司就会要求客户与其签订一份正式的豪车租赁协议，并在协议中约定租用时间、日规定里程、超时及超里程的计费标准、出现异常状况的处理方式以及租用期间所发生各类费用的支付方及其方式等等内容。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">以上三个方面就是在豪车租赁的时候需要办理的一些手续。由此可以看出，其实选择一家口碑好的豪车租赁服务公司，其所需要办理的手续非常简单，只要确认是合法的驾驶人，并且具有一定的支付能力就能够租用一辆豪车，但是需要注意的是在填验车信息单和签协议时，一定要认真仔细，避免产生异议。</p>', '豪车租赁要办理什么手续？', '专业的豪车租赁给很多个人以及企业用户提供了方便，而且租用操作简单、灵活，所以这种用车方式深受用户的喜爱。在租车的时候，为了确保己方的利益，同时也为了让豪车租赁的利益有保障，租赁公司往往都会要求租车开户办理一些手续。接下来一起了解一下相关的租用手续。', 1, 1, '2017-02-11 14:13:54', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170210\\/589d8af2f11f4.jpg\",\"pcbanner\":\"portal\\/20170210\\/589d8afe345f8.jpg\",\"wapbanner\":\"portal\\/20170211\\/589ea91c90416.jpg\"}', 0, 0, 1, 1, 0),
(11, 1, '豪车租赁', NULL, '2017-02-09 14:20:31', '<p style=\"text-indent: 2em; text-align: left;\">一辆豪车价格动辄几百上千万，是很多工薪阶层不能企及的奢侈品，但是有时候为了撑场面又必须驾驶豪车，所以通过口碑好的<a href=\"http://www.sandazuche.com/\"><strong>豪车租赁</strong></a>公司就能为这些用户提供服务。虽然和普通车型的租赁价格比较起来要昂贵一点，但是豪车在各个方面的表现力也是普通车型无法比拟的。下面来看看豪车租赁具有哪些优势。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-align:center\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170211/589eab5cc2e7f.jpg\" title=\"IMG_3790_副本.jpg\" alt=\"IMG_3790_副本.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em; text-align: left;\">1、随租随用经济实惠</p><p style=\"text-indent: 2em; text-align: left;\">和自己购买一台豪车驾驶相比，豪车租赁的方式则显得更为方便灵活。当遇到有使用豪车的迫切需要时，只要通过信誉好的豪车租赁公司选择租用一台自己中意的款式即可，虽然需要支付一定的租赁费用，但是在无需使用时自己则不用负担支付昂贵的保养费。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">2、比普通汽车更气派</p><p style=\"text-indent: 2em; text-align: left;\">豪华汽车有一个非常重要的特点就是气场十足，是个人身份和显赫地位的象征。所以如果是小微型企业在需要接待非常重要的客户时，豪车租赁能够让对方感觉到自己的诚意和尊重，以及对己方实力的信任，从而可以让公司和对方更容易的达成合作目标。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">3、可有专业司机服务</p><p style=\"text-indent: 2em; text-align: left;\">一般在豪车租赁的时候，汽车租赁公司可以根据用户的需求提供专业的司机服务。所以无论租用的豪车是用于婚礼的迎亲队伍之中，还是用于企业重要的商务接待，都能够由一名技术娴熟、路况熟悉且服务周到的租赁公司服务人员担任司机并全程陪同，从而让用户没有后顾之忧。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">以上三个方面就是豪车租赁的主要优势。租车的主要目的就是为了方便客户出行，或者是为了满足使用场合对车型的需要，因此，在租用豪车之前，应该对租赁市场多方了解，通过本地的生活信息网或者租车网多了解哪家的信誉最好，服务最优，以便能够租用一台车辆品质有保障的豪车来使用。</p>', '豪车租赁有哪些优势？', '辆豪车价格动辄几百上千万，是很多工薪阶层不能企及的奢侈品，但是有时候为了撑场面又必须驾驶豪车，所以通过口碑好的豪车租赁公司就能为这些用户提供服务。虽然和普通车型的租赁价格比较起来要昂贵一点，但是豪车在各个方面的表现力也是普通车型无法比拟的。下面来看看豪车租赁具有哪些优势。', 1, 1, '2017-02-11 14:12:49', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170211\\/589ea1b67028c.jpg\",\"pcbanner\":\"portal\\/20170210\\/589d7f3631fdf.jpg\",\"wapbanner\":\"portal\\/20170211\\/589ea1cc1ffbc.jpg\"}', 0, 0, 1, 0, 0),
(12, 1, '豪车租赁', NULL, '2017-02-09 14:23:15', '<p style=\"text-indent: 2em; text-align: left;\">现在很多的个人和企业在遇到特别重要的客户需要接待时，都会租用豪车来显示自己的实力，同时也表示出对对方的一种尊重和重视。那么<a href=\"http://www.sandazuche.com/\"><strong>豪车租赁</strong></a>就成为这些人的用车首选方式，而且通过信誉好的豪车租赁服务选择租用一款自己满意的车辆既方便又经济。那么就来了解一下租赁的正确步骤。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-align:center\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170209/589c0b1fdcd64.png\" title=\"豪车租赁的正确步骤！\" alt=\"豪车租赁的正确步骤！\"/></p><p><br/></p><p style=\"text-indent: 2em; text-align: left;\">1、选公司</p><p style=\"text-indent: 2em; text-align: left;\">首先要选择专业、有规模的豪车租赁公司。因为规模大的公司拥有的车辆会更多，所以能够在车辆出现故障、需要换车时提供更有力的保障。选则公司时则可以通过当地的一些租车、汽车论坛事先了解一下，根据网友对这些租车公司的评价来给予甄选。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">2、选车型</p><p style=\"text-indent: 2em; text-align: left;\">豪车租赁在选豪车车型之时，一定要从用户租车的实际用途出发。如果是结婚迎亲之用，那么就要考虑充分造型和颜色；如果是用于非常重要的商务接待，那么就要选择比较稳重的颜色和造型，并且要内部空间宽敞、舒适的车型。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">3、签合约</p><p style=\"text-indent: 2em; text-align: left;\">在签订豪车租赁合同时，有一些注意事项一定要记牢：首先要了解所租用车辆的日限公里数和超限后的计费标准；同时还要充分了解有关续租的规定和超时计费标准，以免因故不能及时还车时，和租赁公司产生异议和纠纷。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">4、验豪车</p><p style=\"text-indent: 2em; text-align: left;\">在提车前的最后一个步骤就是填写验车单，需要客户和豪车租赁公司共同对车况进行认定。通过外观、以及其他设备零件的完整性和状态进行确认，并一定要进行试驾，判断基本车况，并将其记录在验车表之中。</p><p style=\"text-indent: 2em; text-align: left;\"><br/></p><p style=\"text-indent: 2em; text-align: left;\">以上四个步骤就是租赁豪车时的流程，验车完毕之后就能开走租赁的豪车。由于专业的豪车租赁价格比普通车型的租赁价格要贵很多，所以，在租赁之前一定要多了解几家租赁公司，对其进行比较后选择一家质量高、车型多、服务好的租赁公司，这样才能让自己的租车之旅更顺心。</p>', '豪车租赁的正确步骤！', '现在很多的个人和企业在遇到特别重要的客户需要接待时，都会租用豪车来显示自己的实力，同时也表示出对对方的一种尊重和重视。那么豪车租赁就成为这些人的用车首选方式，而且通过信誉好的豪车租赁服务选择租用一款自己满意的车辆既方便又经济。那么就来了解一下租赁的正确步骤。', 1, 1, '2017-02-11 15:09:26', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170210\\/589d88d5ea537.jpg\",\"pcbanner\":\"portal\\/20170210\\/589d7d7dd8867.jpg\",\"wapbanner\":\"portal\\/20170211\\/589ea93d60ef3.jpg\"}', 0, 0, 1, 0, 0),
(13, 1, '酒吧 豪车租赁 超跑出租 合作 威风出行', NULL, '2017-02-22 17:03:27', '<p style=\"margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding:0 0 0 0 ;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">威风出行的合作伙伴—三达集团与皇后娱乐集团签约仪式于</span>2017<span style=\"font-family:宋体\">年</span><span style=\"font-family:Calibri\">2</span><span style=\"font-family:宋体\">月</span><span style=\"font-family:Calibri\">18</span><span style=\"font-family:宋体\">日下午举行，于</span><span style=\"font-family:Calibri\">18</span><span style=\"font-family:宋体\">点圆满结束。</span></span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding:0 0 0 0 ;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">三达集团董事长祝总与皇后娱乐集团夏总、梅德赛斯奔驰</span>AMG<span style=\"font-family:宋体\">总监出席本次签约仪式。</span></span></p><p style=\"margin: 0px; padding: 0px; text-align: center;\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\"><br/></span></span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad574ac563b.jpg\" title=\"4C5A4049_副本_副本.jpg\" alt=\"4C5A4049_副本_副本.jpg\"/></p><p><br/></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">签约仪式上</span></span></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">三达集团祝总与皇后集团品牌总监李总代表双方出席并签约战略合作协议。</span></span></p><p style=\"margin: 5px 0px; text-align: center;\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\"><br/></span></span></p><p style=\"margin: 5px 0px; text-align: center;\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\"></span></span></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad57b2f2181.jpg\" style=\"\" title=\"4C5A4189_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad57b340a63.jpg\" style=\"\" title=\"4C5A4199_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad5d91dec3a.jpg\" title=\"4C5A4202_副本.jpg\" alt=\"4C5A4202_副本.jpg\"/></p><p><br/></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">期间，祝总暨合作事宜发表讲话：</span>“<span style=\"font-family:宋体\">三达是个团结的大集体，已一起走过八个年头</span></span></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">在这八年里，三达的业务足迹遍布全国各个角落，并且今年又在武汉、长沙</span></span></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">珠海、南昌、厦门、上海等地开设了新店，使客户用车更加便捷</span>”</span></p><p style=\"margin: 5px 0px; text-align: center;\"><br/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad5806acdb9.jpg\" style=\"\" title=\"4C5A4063_副本_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad5806e4e46.jpg\" title=\"4C5A4097_副本_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad580763315.jpg\" title=\"4C5A4150_副本_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad5807d4c70.jpg\" title=\"4C5A4268_副本_副本.jpg\"/></p><p style=\"text-align: center;\"><img src=\"http://sandazuche.oss-cn-shanghai.aliyuncs.com/ueditor/20170222/58ad580850ff6.jpg\" style=\"\" title=\"4C5A4270_副本_副本.jpg\"/></p><p style=\"margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding:0 0 0 0 ;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">高端品牌汽车与高端娱乐场所的强强联手是为了更好的服务广大城市精英们</span></span></p><p style=\"margin-top:0;margin-right:0;margin-bottom:0;margin-left:0;padding:0 0 0 0 ;text-align:center\"><span style=\";font-family:Calibri;font-size:16px\"><span style=\"font-family:宋体\">相信在不久的未来，将卷起一阵新式娱乐消费升级风暴。</span></span></p><p><br/></p>', '威风合作伙伴—三达集团＆杭州知名酒吧皇后战略合作签约仪式圆满结束', '三达集团与皇后娱乐集团签约仪式于2017年2月18日下午举行，于18点圆满结束。', 1, 1, '2017-08-05 15:39:31', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170222\\/58ad5864c7b58.jpg\",\"pcbanner\":\"portal\\/20170222\\/58ad5ab0b25c3.jpg\",\"wapbanner\":\"portal\\/20170222\\/58ad5ab5a8be4.jpg\"}', 0, 0, 1, 0, 1),
(14, 1, '三亚租跑车', NULL, '2017-03-20 15:20:41', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">在国内以独特的海滨风光闻名，三亚光凭景色就可以独步旅游江湖榜前几名.在<span style=\"color: rgb(255, 255, 0); background-color: rgb(255, 0, 0);\"><strong><a href=\"http://www.sandazuche.com\" target=\"_blank\">三亚租跑车</a></strong></span>自由行的人比比皆是，提起三亚游客们脑海里自动出现独特的海滨风光，在海边开着跑车享受着沙滩、美女、帅哥、游艇、美食。。。生活无比惬意。网络时代非常发达的今天，要想租车是非常方便的.我们先了解下三亚租跑车的注意事项有哪些？</p><p style=\"text-align: center;\"><img width=\"469\" height=\"274\" title=\"三亚租跑车的注意事项有哪些？\" style=\"width: 469px; height: 274px;\" alt=\"三亚租跑车的注意事项有哪些？\" src=\"http://www.niumowang.com/attached/SeoArticle/17699/20170318/6362544673326522452288809.jpg\"/></p><p><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">1、选择汽车租赁公司：</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">在三亚租跑车一定要选择规模比较大的租赁公司，因为跑车价格昂贵，大的汽车租凭公司手续齐全，车型、种类和数量都比小型公司占优势，在信誉方面也非常好。大型的三亚租跑车公司因种类繁多数量齐全可选择余地也比较大，是出行租跑车的首选。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">2、细心检查车况：</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">三亚因独特的迷人风光所以去三亚旅行的人特别多。在三亚租跑车自由行已经成为一种时尚，在选择车型时不但要看外观是否是自己心仪的，还要选择省油皮实的车。提车的时候必须要进行试驾，熟悉车况细心检查车体、车灯、车锁的情况，还要打开车盖查看下冷冻液、电瓶、油表以及刹车和机油。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">3、明确租赁细节：</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">大型租凭公司凭借高效办理的三亚租跑车服务而使自己名声在外。在签定租凭协议时要明确自己的责任和注意事项，一般大的租赁公司手续齐全，所有车辆手续合法有效。租车时要带上租金、押金、身份证和驾驶证，你可以根据自己的需求选择租凭方式和时间长短。出行时遇到问题马上联系租凭公司，细心周到的服务一定会让你感到体贴周到。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">4、提前联系预定：</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">其实这一点是最最重要的，你如果有去三亚租跑车的计划，一定要提前预定。避免一切都准备好了租不上自己看上的爱车，就太扫兴了得不偿失。最好提前一个月或一周就进行预订，不要影响你出行的心情和旅游的质量。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">以上这几个方面就是在三亚租跑车的时候应该主要的一些事项。多样化的三亚租跑车可以让用户获得超值的享受和服务，但是一定要谨记在租车时需要注意上述这些问题，这样才能够开开心心的带着心爱的人开着跑车去享受面朝大海、春暖花开的美好。</p>', '三亚租跑车的注意事项有哪些？', '在国内以独特的海滨风光闻名，三亚光凭景色就可以独步旅游江湖榜前几名.在三亚租跑车自由行的人比比皆是，提起三亚游客们脑海里自动出现独特的海滨风光，在海边开着跑车享受着沙滩、美女、帅哥、游艇、美食。。。生活无比惬意。网络时代非常发达的今天，要想租车是非常方便的.我们先了解下三亚租跑车的注意事项有哪些？', 1, 1, '2017-04-20 14:15:23', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170320\\/58cf832131974.png\",\"pcbanner\":\"portal\\/20170420\\/58f851187fd07.jpg\",\"wapbanner\":\"portal\\/20170420\\/58f8511defa1e.jpg\"}', 0, 0, 0, 0, 0),
(15, 1, '三亚租跑车', NULL, '2017-03-20 17:26:26', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">海南岛三亚市，拥有宜人气候，和煦的阳光，清新的空气，柔软沙滩以及美味海鲜，这些得天独厚的天然地理条件让想去三亚旅游的人趋之若鹜。在三亚旅游，首要解决的就是交通问题，如果会开车可以考虑租车，现在比较流行在<a href=\"http://www.sandazuche.com/\" target=\"_blank\" style=\"text-decoration: underline; color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(255, 0, 0); background-color: rgb(255, 255, 255);\"><strong>三亚租跑车</strong></span></a>，但是在三亚租跑车有一些事项需要注意。</p><p style=\"text-align: center;\"><img width=\"613\" height=\"325\" src=\"http://www.niumowang.com/attached/SeoArticle/14767/20170320/6362543533319467187538584.jpg\" title=\"三亚租跑车需注意事项\" alt=\"三亚租跑车需注意事项\" style=\"width: 613px; height: 325px;\"/></p><p><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">第一点，因为是去旅游，所以在三亚租跑车就要知道三亚租跑车哪里有提供，知道哪里可以租赁跑车后，还需要知道三亚租跑车市场最低价，了解三亚租跑车的市场价格，做到心中有数。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">第二点，了解清楚第一点之后，就要选择跑车的车型，因为多样化的三亚租跑车市场，所以可以选的车型也比较多，主要有两座的兰博基尼，奥迪R8，保时捷，宝马Z4等，四座的福特悍马，宝马4系等车型，这时就要根据个人的自身情况来选择租两座还是四座的车型，另外，因为跑车的后备箱空间都比较小，所以最好不要携带过多行李，多余的行李可以放在入住的酒店。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">第三，三亚租跑车在跑车租到手以后，一定要清楚所租用的跑车的使用方法，除此之外，如果租的是敞篷跑车，还需要向相关人员咨询清楚跑车顶篷的操作事项，因为跑车属于高档商品，所以对于跑车的相关使用事项还是要多注意。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">在三亚租跑车只要注意了以上几点，就可以尽情享受三亚的美丽风光，美味海鲜，柔软海滩......租到了车，我们可以随心所欲的调整自己的旅游路线，可以随心所欲的购物而不必受行李所累，也不用因为司机的原因而影响自己的旅游好心情。</p>', '三亚租跑车需注意事项', '海南岛三亚市，拥有宜人气候，和煦的阳光，清新的空气，柔软沙滩以及美味海鲜，这些得天独厚的天然地理条件让想去三亚旅游的人趋之若鹜。在三亚旅游，首要解决的就是交通问题，如果会开车可以考虑租车，现在比较流行在三亚租跑车，但是在三亚租跑车有一些事项需要注意。', 1, 1, '2017-04-20 14:15:52', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170320\\/58cfa0718593d.png\",\"pcbanner\":\"portal\\/20170420\\/58f852060ec20.jpg\",\"wapbanner\":\"portal\\/20170420\\/58f852142cdc6.jpg\"}', 0, 0, 0, 0, 0),
(16, 1, '豪车租赁', NULL, '2017-03-24 16:17:13', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">随着经济的迅猛发展，人们对物质的关注和喜好有一种特殊的偏爱，尤其是豪车的出现总与关注度遥相呼应，赚足人们的眼球。豪车作为身份的象征，更多的体现着拥有着的综合实力，然而对大多数怀揣梦想之士而言，一些需要豪车作为辅助用途的场合，却对于其价格望尘莫及，这时，<span style=\"color: rgb(255, 0, 0); background-color: rgb(255, 0, 0);\"><strong><a href=\"http://www.sandazuche.com\" target=\"_blank\">豪车租赁</a></strong></span>就显得至关重要，那么豪车租赁应该注意什么？</p><p style=\"text-align: center;\"><img width=\"514\" height=\"282\" title=\"豪车租赁的注意事项\" alt=\"豪车租赁的注意事项\" src=\"http://www.niumowang.com/attached/SeoArticle/14767/20170324/6362587523099525789810996.png\" style=\"width: 514px; height: 282px;\"/></p><p><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">首先，客户对于豪车租赁，应当根据自身需求、用途、场合、租赁费用等各方面因素综合考量所要租赁豪车的品牌、性能。在进行豪车租赁时，应当对租赁公司经营的合法正规性，车辆来源的安全可靠性等主要方面进行全面了解；再者，对豪车的车身外观、内饰、配件、性能、车辆手续等进行检查，保证租赁之前的完好无损；而后，应对与租赁公司签订租赁合同，明确租赁品牌、期限、金额、权利义务以及违约责任。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">其次，客户对豪车租赁应当选择最有实力的豪车租赁公司，因为实力雄厚的租赁公司在内部管理、拥有车辆品牌、性能、服务等各方面上都要高于其他租赁公司，从而保证客户对车辆租赁的放心使用。服务比较好的豪车租赁公司能够对客户提供更加细致周到的服务，会对于车辆可能出现的状况或根据客户的驾驶习惯给予相应的提示和建议，能够在对客户豪车租赁期间所发生的问题耐心快速的进行解决。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">简单了解了豪车租赁的注意事项，相信客户在进行选择时更加得心应手。对于客户而言，豪车租赁在满足特定场合的情况下，收获自己预期中的成功，也体现出身份品味的高品位；对于豪车租赁公司而言，能够在急客户所急的同时解决客户需求，又提高公司的成交额，满足他人，又利于自己，可谓两全其美。</p>', '豪车租赁的注意事项', '随着经济的迅猛发展，人们对物质的关注和喜好有一种特殊的偏爱，尤其是豪车的出现总与关注度遥相呼应，赚足人们的眼球。豪车作为身份的象征，更多的体现着拥有着的综合实力，然而对大多数怀揣梦想之士而言，一些需要豪车作为辅助用途的场合，却对于其价格望尘莫及，这时，豪车租赁就显得至关重要，那么豪车租赁应该注意什么？', 1, 1, '2017-04-20 14:08:52', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170324\\/58d4d64b95aa4.png\",\"pcbanner\":\"portal\\/20170420\\/58f8506a6dfa1.jpg\",\"wapbanner\":\"portal\\/20170420\\/58f8507112f2e.jpg\"}', 0, 0, 0, 0, 0);
INSERT INTO `sanda_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`, `sort`) VALUES
(17, 1, '豪车租赁', NULL, '2017-04-14 13:46:30', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\">现在想要开豪车不需要花费高昂的价格去购买，如果你愿意，选择<a href=\"http://www.sandazuche.com\" target=\"_blank\" textvalue=\"豪车租赁\" style=\"text-decoration: underline; color: rgb(255, 192, 0);\"><span style=\"color: rgb(255, 192, 0);\"><strong>豪车租赁</strong></span></a>就可以了。那么豪车租赁到底有哪些优点能值得人们去选择它呢？本文所要介绍的就是其众多优点中的三个，至于它的其他优点，如果你选择了这种租车方式，你会有更直观的感受。</p><p style=\"text-align: center; text-indent: 2em;\"><img src=\"http://arobot.paiming.net/ueditor/net/upload/image/20170414/6362777425483973878377268.png\" title=\"为什么要选择豪车租赁\" alt=\"为什么要选择豪车租赁\" width=\"450\" height=\"303\" style=\"width: 450px; height: 303px;\"/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">首先，豪车租赁是一种较为经济的用车方式。购买豪车会花费很大一笔钱，并且购买以后对车的保养也是一笔很大的花销，这对于一般家庭而言不是一个小数目。而租赁的话就只是在自己需要的时候才会去选择，也不需要自己去做什么特别的保养，这样就在满足自己需要的同时也节省了开支，并且如果是服务比较好的豪车租赁，还会根据客户不同需求来推荐合适的车型，这样也能比较省心。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">其次，选择豪车租赁的话，想要更换车型也不用考虑太多问题。不管是性能还是外形等，现在车辆的更新换代是很快的，并且每个人的喜好都会发生不一样的变化，如果是买车的话，想要换车不仅会有多余的花费，对旧车也是一种资源的浪费。而租车的话就不用顾虑这些，想换哪种车型就换哪种车型，经济又方便。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">最后，开车的安全问题是极为重要的，一旦不幸发生了事故，一般会比较难处理，但是如果选择的是最有实力的豪车租赁公司，那么它一般会有合作的保险公司，对这类事故的处理能够比较专业，也会方便很多，能为自己省去很多麻烦。</p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\">综上所述，选择豪车租赁可以将买车用的钱应用在更多的地方，提高了资金利用率，也能降低用车成本，不需要对其进行检修维护，省去了很多麻烦，这也符合现在的生活方式。所以如果你也想体验一把开豪车的感觉但又怕有经济上的负担，那么建议你可以选择豪车租赁。</p>', '为什么要选择豪车租赁', '现在想要开豪车不需要花费高昂的价格去购买，如果你愿意，选择豪车租赁就可以了。那么豪车租赁到底有哪些优点能值得人们去选择它呢？本文所要介绍的就是其众多优点中的三个，至于它的其他优点，如果你选择了这种租车方式，你会有更直观的感受。', 1, 1, '2017-04-20 14:08:30', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170414\\/58f0624665e25.png\",\"pcbanner\":\"portal\\/20170420\\/58f850517610e.jpg\",\"wapbanner\":\"portal\\/20170420\\/58f8505749ea5.jpg\"}', 0, 0, 0, 0, 0),
(18, 1, '杭州豪车租赁', NULL, '2017-04-18 11:34:41', '<p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">豪车租赁成为我们出门旅行、结婚车队、重要行程的首要选择。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">在众多的豪车租赁市场中<strong>威风出行</strong>凭借周全细致的服务、豪车种类的多样化、平价的费用受到广大消费者朋友的亲睐和一致好评。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">但杭州豪车租赁企业众多，杭州豪车租赁的服务哪家好成为消费者最为关注的话题。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">下面就消费者关心的如何选择满意的杭州豪车租赁进行如下陈述。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px; text-align: center;\"><span style=\"font-size: 20px;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987cd4e6dcba.png\" title=\"图片1.png\" alt=\"图片1.png\"/></span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><strong><span style=\"font-size: 20px;\">1、选择正规的企业</span></strong></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">消费者在选择杭州豪车租赁时，一定要选择正规的企业。正规企业有营业资质能给消费者开专用的发票方便日后报销使用。正规的杭州豪车租赁公司有一整套完整的预约、使用、付费的流程，对于各环节中企业和消费者双方减少不必要的争议。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><strong><span style=\"font-size: 20px;\">2、对比企业服务</span></strong></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">消费者在选择杭州豪车租赁时，一流热情的服务是我们考虑的一个重要方面。良好优质的服务水平和服务意识对于整个用车流程都是美好的消费体验。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><strong><span style=\"font-size: 20px;\">3、对比车辆品质</span></strong></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">消费者在选择杭州豪车租赁时一定要查看车辆的完好状态和车辆保险的齐全性，我们可以通过查看车辆的使用年限、车辆入险合同、使用前车辆试开状况进行判别。这对于我们使用过程中的安全行驶和车辆归还时的车辆例行检查而引发不必要的争执。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><strong><span style=\"font-size: 20px;\">4、进行成本对比</span></strong></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">消费者在选择杭州豪车租赁时，可根据自己的预算进行多家询价，通过货比三家选择满意的杭州豪车租赁。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><span style=\"font-size: 20px;\">上面讲述的四个方面就是选择满意的杭州豪车租赁的选购技巧。由于专业的杭州豪车租赁已成为消费者豪车租赁的理想选择。所以消费者在进行选择时一定要注意比对杭州豪车租赁哪家口碑好，毕竟选择一家满意的杭州豪车租赁对于消费者的使用安全有着重要的作用。</span></p><p style=\"text-indent: 32px; margin-bottom: 16.5px;\"><br/></p>', '如何选择满意的杭州豪车租赁？', '​豪车租赁成为我们出门旅行、结婚车队、重要行程的首要选择。在众多的豪车租赁市场中杭州豪车租赁凭借周全细致的服务、豪车种类的多样化、平价的费用受到广大消费者朋友的亲睐和一致好评。但杭州豪车租赁企业众多，杭州豪车租赁的服务哪家好成为消费者最为关注的话题。', 1, 1, '2017-08-07 10:16:11', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170418\\/58f58a05e4ee3.png\",\"pcbanner\":\"portal\\/20170420\\/58f850267a3b3.jpg\",\"wapbanner\":\"portal\\/20170420\\/58f8502d59c47.jpg\"}', 0, 0, 0, 0, 1),
(19, 1, '威风出行 豪车租赁  杭州孙行者网络科技有限责任公司', NULL, '2017-08-01 13:57:15', '<pre style=\"text-align: left;\" class=\"js_message_plain ng-binding\"><span style=\"font-size: 18px;\"></span><span style=\"font-size: 18px;\">杭州孙行者网络科技有限责任公司是一家专注豪车租赁的公司。<br/><br/>旗下品牌威风出行名下车型有：<br/><br/>兰博基尼、法拉利、迈凯伦、劳斯莱斯、保时捷、玛莎拉蒂、宾利、路虎、奥迪、奔驰、宝马、特斯拉、品牌限量车等高端车型。<br/><br/>自成立公司以来，一直秉承着“让所有用户放心”的企业精神，以优质、用心的服务赢得了众多用户的信赖和好评，<br/><br/>且同时公司还建立了完善的售后服务体系，为用户在租车过程中遇到的问题提供指导帮助。<br/><br/>我们相信，通过我们的不断努力和追求，定能实现与用户的互利共赢。<br/><br/>『威风出行』的前身『豪咖』APP，于2016年8月正式上线，是国内首个豪车租赁软件。<br/><br/>不同于传统的线下租赁方式，『威风出行』APP可一键浏览在线的所有车型及价格，操作简便、一目了然，只要用户输入所在地区，直接手机下单，便可实现送车到家。<br/>&nbsp;<br/>&nbsp;现产品再升级，新加入『威风合伙人』与『威风会员』两大版块。<br/>&nbsp;<br/>&nbsp;威风合伙人是针对手头上有客户，且想加入威风而开创的一个版块，高佣金高回报，用户下单后即可实现佣金秒到账户。<br/>&nbsp;<br/>&nbsp;威风会员是针对多次租车的用户，注册成为会员后即可享受租车折扣、生日福利、公里数限额等等。<br/></span></pre><p><br/></p>', '威风出行简介', '威风出行-专注豪车租赁', 1, 1, '2017-08-07 10:02:11', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170807\\/5987c6e14ccdc.jpg\",\"pcbanner\":\"portal\\/20170801\\/598023b50cfe6.jpg\",\"wapbanner\":\"portal\\/20170801\\/598023bae517a.jpg\"}', 0, 0, 1, 0, 2),
(20, 1, '豪车租赁 威风出行 超跑出租 豪车租赁公司', NULL, '2017-08-02 17:13:16', '<p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">豪车历来都是成功人士的标配，而近来因豪车租赁行业的兴起，豪车开始走下神坛揭开面纱，变得不再神秘。据悉，从2010年开始，各色大小不一的线下租车店便开始兴起，大的有几十辆甚至几百辆之多，小的三五辆，甚至一两辆，发展良莠不齐。</p><center style=\"LIST-STYLE-TYPE: none; WORD-WRAP: break-word; FONT-SIZE: medium; FONT-FAMILY: &#39;Microsoft Yahei&#39;, 宋体, Arial, Helvetica, sans-serif; WHITE-SPACE: normal; TEXT-TRANSFORM: none; WORD-SPACING: 0px; FONT-WEIGHT: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\"><p style=\"text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/207/103/2227/144837147.jpg\"/></p></center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">然在国外，特别是发达国家，租车行业已然发展成熟。关于租车行业的各项制度、法规也建设完毕，线下租车方便、快捷。而在国内，这才刚刚兴起，也恰好迎上“互联网+”这个风口，国家开始重视，银行开始放低利息放款，不得不说这既是机遇也是挑战。</p><center style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/210/103/2227/144837150.jpg\"/> </center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">个人需求不同，有需要代步车的，就有需要高端车的。据行业数据调查显示，保时捷、玛莎拉蒂、路虎这三款为高端车租赁中频次最高，占80%，而像法拉利、兰博基尼这类顶级高端品牌，只有少数公司引进，且只允许乘坐不允许自驾。</p><center style=\"LIST-STYLE-TYPE: none; WORD-WRAP: break-word; FONT-SIZE: medium; FONT-FAMILY: &#39;Microsoft Yahei&#39;, 宋体, Arial, Helvetica, sans-serif; WHITE-SPACE: normal; TEXT-TRANSFORM: none; WORD-SPACING: 0px; FONT-WEIGHT: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\"><p style=\"text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/209/103/2227/144837149.jpg\"/></p></center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">豪车租赁是个高风险行业，没有完善的定位系统、车辆故障处理渠道以及车辆丢失追回方案，那在出现问题后，一个寻常的追车问题就可以击垮一家公司，所以豪车自驾有难度。而目前在豪车租赁这个行业内，做的长久的不足十家，做大的不出三家。</p><center style=\"LIST-STYLE-TYPE: none; WORD-WRAP: break-word; FONT-SIZE: medium; FONT-FAMILY: &#39;Microsoft Yahei&#39;, 宋体, Arial, Helvetica, sans-serif; WHITE-SPACE: normal; TEXT-TRANSFORM: none; WORD-SPACING: 0px; FONT-WEIGHT: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\"><p style=\"text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/208/103/2227/144837148.jpg\"/></p></center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">2016\r\n年夏天，国内出现了第一个专门租豪车的手机APP——豪咖。豪咖APP作为国内第一个线上APP产品，一经上市便马上拥有了超过十万的注册用户，而在这些\r\n用户中，年轻人尤为居多。88%是90后，究其原因：80后消费更为务实稳重，租车需求不大;60后以及70后对手机使用不熟练，偏爱传统的线下租车方\r\n式。所以，可以说90后对这个行业今后的发展至关重要。然90后这个群体，大多数喜好自驾，而大多数租车公司为了减少风险，大多只支持配司机，不支持自\r\n驾。</p><center style=\"LIST-STYLE-TYPE: none; WORD-WRAP: break-word; FONT-SIZE: medium; FONT-FAMILY: &#39;Microsoft Yahei&#39;, 宋体, Arial, Helvetica, sans-serif; WHITE-SPACE: normal; TEXT-TRANSFORM: none; WORD-SPACING: 0px; FONT-WEIGHT: normal; COLOR: rgb(0,0,0); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px\"><p style=\"text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/206/103/2227/144837146.jpg\"/></p></center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">很多人好奇，为何买豪车的人群比例还不到5%?原因有二，第一对于中产家庭来说，一辆车的价格能买一套房，豪车的性价比不够高;第二，豪车的养护费用高昂，每月养车的费用抵得上养孩子，不合算。所以，大多数家庭对于豪车都是望而却步，持可远观而不可驾驶的态度。</p><center style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 0px; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/213/103/2227/144837153.jpg\"/> </center><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">近日，“豪咖”的升级版“威风出行”横空出世，相比于“豪咖”，现在的“威风出行”，多加入了供应商(商家版)，以及合伙人(分佣系统)，这两大版块。据悉，“威风出行”现在的供应商已接入56家，自有车辆达400台。</p><p style=\"text-align: center;\"><img alt=\"豪车租赁领头军 “威风出行”开启新纪元\" src=\"http://img1.gtimg.com/autohangzhou/pics/hv1/216/103/2227/144837156.jpg\"/></p><p style=\"list-style-type: none; word-wrap: break-word; font-size: medium; font-family: &quot;Microsoft Yahei&quot;,宋体,Arial,Helvetica,sans-serif; white-space: normal; text-transform: none; word-spacing: 0px; font-weight: normal; color: rgb(0, 0, 0); padding: 5px 0px; font-style: normal; margin: 0px; letter-spacing: normal; background-color: rgb(255, 255, 255); text-indent: 2em; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">可以说“威风出行”现在的版本更为贴合互联网时代，全民都可以成为合伙人，全民也都能成为供应商，定位更合理，路线更亲民。</p><p style=\"text-align: center;\">总而言之，豪车租赁这个行业仍笼罩在一片迷雾之下，威风会不会是这个拨开迷雾的导向灯，我们拭目以待</p><p><br/></p>', '豪车租赁领头军 “威风出行”开启新纪元', '威风出行专注豪车租赁，是首家互联网下单的公司', 1, 1, '2017-08-07 09:40:40', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170807\\/5987c505426eb.jpg\",\"pcbanner\":\"portal\\/20170802\\/59819c395ab43.jpg\",\"wapbanner\":\"portal\\/20170802\\/59819c3fe8ead.jpg\"}', 0, 0, 1, 0, 100),
(21, 1, '威风出行 使用方式 豪车租赁 超跑出租 租赁平台', NULL, '2017-08-02 18:10:44', '<p style=\"text-align: center;\"></p><p style=\"text-indent:14px\"><span style=\"font-family: 宋体; font-size: 16px;\">“威风出行”是拥有全国自有车辆最多，用户规模最大的豪车租赁平台。</span></p><p style=\"text-align: center;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987ebb3e891f.png\" title=\"11.png\" alt=\"11.png\"/></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;主营业务包含高端汽车自驾，豪车接送，商务合作，婚庆合作，静态展示和媒体合作等。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;</span></p><p><span style=\"font-family: 宋体;\">&nbsp; 主要租赁的车型为保时捷卡宴起步，车价在</span><span style=\"font-family: 宋体;\">100</span><span style=\"font-family: 宋体;\">万</span><span style=\"font-family: Calibri;\">-1000</span><span style=\"font-family: 宋体;\">万不等。包含顶级豪华车型为劳斯莱斯全系，宾利全系，兰博基尼全系，法拉利全系，迈凯伦</span></p><p><span style=\"font-family: 宋体;\">&nbsp;</span></p><p><span style=\"font-family: 宋体;\">&nbsp; 阿斯顿</span><span style=\"font-family: 宋体;\">马丁，保时捷，奔驰（</span><span style=\"font-family: Calibri;\">G63</span><span style=\"font-family: 宋体;\">、</span><span style=\"font-family: Calibri;\">G500</span><span style=\"font-family: 宋体;\">、</span><span style=\"font-family: Calibri;\">SLS</span><span style=\"font-family: 宋体;\">、</span><span style=\"font-family: Calibri;\">GTS</span><span style=\"font-family: 宋体;\">），宝马（</span><span style=\"font-family: Calibri;\">i8</span><span style=\"font-family: 宋体;\">），奥迪（</span><span style=\"font-family: Calibri;\">R8</span><span style=\"font-family: 宋体;\">敞篷）等。</span></p><p style=\"text-align: center;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987ebc1aa335.png\" title=\"22.png\" alt=\"22.png\"/></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp; 威风出行拥有完善的车辆管理和风控监察体系，能够保障在出行中实现“威风出行”与你同在，应急处理所有可能发生的车辆租赁及出行问题。给用户全方&nbsp;</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp; 位的优质服务体验。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;</span></p><p><span style=\"font-family: 宋体;\">&nbsp; 从</span><span style=\"font-family: 宋体;\">2009</span><span style=\"font-family: 宋体;\">年至今本公司专注全国豪车超跑自驾租赁市场，豪车超跑自驾国内市场占有率</span><span style=\"font-family: Calibri;\">40%</span><span style=\"font-family: 宋体;\">，自有车辆</span><span style=\"font-family: Calibri;\">400</span><span style=\"font-family: 宋体;\">多辆，上百款车型。线下全国覆盖</span><span style=\"font-family: Calibri;\">50</span><span style=\"font-family: 宋体;\">多家服务点</span></p><p><span style=\"font-family: 宋体;\">&nbsp;&nbsp;</span></p><p><span style=\"font-family: 宋体;\">&nbsp; 服</span><span style=\"font-family: 宋体;\">务用户达到</span><span style=\"font-family: Calibri;\">20W+</span><span style=\"font-family: 宋体;\">，关注用户达到</span><span style=\"font-family: Calibri;\">100W+</span><span style=\"font-family: 宋体;\">。满足用户随时租车，异地还车的需求。</span></p><p style=\"text-align: center;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987ebca24c15.png\" title=\"33.png\" alt=\"33.png\"/></p><p><span style=\"font-size: 20px;\"><strong><span style=\"font-family: 宋体;\">“威风出行”四大承诺</span></strong></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">1.&nbsp;</span><span style=\"font-size: 16px; font-family: 宋体;\">承诺车价最低</span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-size: 16px; font-family: 宋体;\"><br/></span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">2.&nbsp;</span><span style=\"font-size: 16px; font-family: 宋体;\">承诺车况良好</span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-size: 16px; font-family: 宋体;\"><br/></span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">3.&nbsp;</span><span style=\"font-size: 16px; font-family: 宋体;\">承诺事故无忧</span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-size: 16px; font-family: 宋体;\"><br/></span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">4.&nbsp;</span><span style=\"font-size: 16px; font-family: 宋体;\">承诺无其他服务费</span></span></p><p style=\"text-align: center;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987ebf375a37.png\" title=\"44.png\" alt=\"44.png\"/></p><p><span style=\"font-size: 20px;\"><strong><span style=\"font-family: 宋体;\">“威风出行”租赁流程</span></strong></span><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体; font-size: 14px;\"></span></strong><strong> </strong></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">1．下载威风出行<span style=\"font-size: 16px; font-family: Calibri;\">APP</span></span><span style=\"font-family: 宋体;\">。</span></p><p><span style=\"font-family: 宋体;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">2．打开<span style=\"font-size: 16px; font-family: Calibri;\">APP</span>。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">3．完成注册并登陆。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">3．进入<span style=\"font-size: 16px; font-family: Calibri;\">APP</span>，可根据自我需求进行租车。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">4．选择一辆车型，按照提示，完善基本信息。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">5．提交订单，支付订金，等待平台调车（<span style=\"font-size: 16px; font-family: Calibri;\">24</span>小时以内）。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">6．调车成功后，支付剩余的“租金”、“押金”和“违章保证金”。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">7．车辆交接成功后，即可使用车辆。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">8．完成用车，归还车辆，审核无误后，平台退还押金。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">9．退还违章保证金。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">10．完成租车。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">您提车需要带的：两证一卡（身份证、驾驶证、银行卡）</span></p><p style=\"text-align: center;\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987ebfeea26a.png\" title=\"55.png\" alt=\"55.png\"/></p><p><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 16px; font-family: 宋体;\">用车期间故障及事故应急处理</span></strong></span></p><p><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 16px; font-family: 宋体;\">事故处理</span></strong></span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 16px;\">当车辆发生事故时，客户应立即向警方（报警电话“<span style=\"font-size: 16px; font-family: Calibri;\">110</span>”）报案，并与威风出行联系报告情况（<span style=\"font-size: 16px; font-family: Calibri;\">4000002777</span>），由威风出行向保险公司报案，威风出行将</span></p><p style=\"text-indent:21px\"><span style=\"font-family: 宋体; font-size: 16px;\">为客户提供必要的咨询和指引。因客户未及时通知威风出行或由于其他不可归责于威风出行的原因致保险公司拒赔的，客户须自行承担事故全部损失。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;&nbsp;a. 如车辆发生交通事故，客户须①垫付维修相关费用（包括但不限于车辆维修费、清障费、施救费、拖车费及停车费等，威风出行向保险公司实现理赔后</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">扣除客户应当承担费用后返还）；②支付车辆经营损失；③支付车辆贬值损失；④垫付事故中第三方损失（包括但不限于物损、医疗费、残疾<span style=\"font-size: 16px; font-family: Calibri;\">/</span>死亡赔偿金、抚</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">养费、精神抚慰金等，威风出行向保险公司实现理赔后扣除客户应当承担费用后返还）；⑤承担保险说明列表中列明的保险公司理赔范围以外的损失</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;&nbsp;b. 如车辆被盗抢或报废的，客户须自承租车辆之日起持续支付租赁费用至公安部门立案或车辆管理部门出具报废证明之日止。</span></p><p><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 16px; font-family: 宋体;\">车辆事故处理指引</span></strong></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">客户所承租的车辆发生事故后，租赁汽车由保险公司定损后到威风出行指定维修地点维修，客户垫付相关费用，包括但不限于车辆维修费、拖车费、施救费、</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">清障费及停车费等，还须提供理赔所需材料。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;a. 发生于交通道路上的交通事故，无论本车是否承担事故责任、第三方车辆是否损坏，客户均不得与第三方自行和解。若客户与第三方自行和解，保险公司将不予以理赔。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;b. 如交通事故发生于交通道路上，客户必须向交警报案，首先由交警现场处理并出具道路交通事故责任认定书，然后由保险公司对事故所涉全部车辆进行定</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">损后方可修理车辆。若交通事故发生于非交通道路上，客户必须前往当地公安部门报案并取得相关证明，不得自行移动、改变事故现场及相关痕迹。客户须提</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">供并保留被撞物体的痕迹与车辆损坏部位相吻合的现场<span style=\"font-size: 16px; font-family: Calibri;\">,</span>以便保险公司查勘定损。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;c. 由于保险公司只对当次事故产生损失进行赔偿<span style=\"font-size: 16px; font-family: Calibri;\">,</span>车辆维修完毕后，客户在交还车辆同时持真实有效的维修发票，维修明细单与威风出行结算各项费用，包括但不限于经营损失、贬值损失等。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\"><br/></span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;d. 如车辆在停车时或其他类似情形下被碰撞无法找到肇事者的，应立即向当地公安部门报案，该类事故按保险条款规定保险公司赔付的上限为绝对免赔额以外损失的<span style=\"font-size: 16px; font-family: Calibri;\">70</span>％。</span></p><p><span style=\"font-family: Calibri; font-size: 16px;\">&nbsp;</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">客户出险涉及本车（威风出行）以外的赔付费用时：</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;&nbsp;a.事故中其他各方的赔付费用须由客户先行垫付，然后将保险理赔所需材料移交威风出行，由威风出行向保险公司申请理赔。理赔期间保险公司认定理赔材</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">料缺失的，客户在接到威风出行告知后<span style=\"font-size: 16px; font-family: Calibri;\">5</span>日内，须将缺失材料补充提供至威风出行。非因威风出行原因致使保险公司不足额理赔或拒绝理赔的，客户自行承担相</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">应损失。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;&nbsp;b.保险公司理赔完成后，威风出行将理赔款中客户已垫付部分扣除客户应付费用后的部分返还客户（具体理赔款额以保险公司实际赔付为准，不以客户实际垫付额为准）。</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp;&nbsp;c.客户提供的材料均须完整清晰<span style=\"font-size: 16px; font-family: Calibri;\">,</span>否则因此造成保险公司拒赔，将由客户自行承担责任。</span></p><p><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 宋体; font-size: 14px;\">&nbsp;</span></strong></span></p><p><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 16px; font-family: 宋体;\">押金计算与违章保障金退还问题</span></strong></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">1.&nbsp;</span><span style=\"font-family: 宋体; font-size: 14px;\"><span style=\"font-size: 16px; font-family: 宋体;\">根据不同车型，租车押金收费范围一般在</span>2<span style=\"font-size: 16px; font-family: 宋体;\">万</span><span style=\"font-size: 16px; font-family: Calibri;\">-15</span><span style=\"font-size: 16px; font-family: 宋体;\">万元之间。</span></span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: 宋体; font-size: 14px;\"><span style=\"font-size: 16px; font-family: 宋体;\"><br/></span></span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-family: Calibri; font-size: 14px;\">2.&nbsp;</span><span style=\"font-size: 16px; font-family: 宋体;\">请确保有足够可用额度做为车辆押金。如单张信用卡额度不足，可以使用租车人名下的多张信用卡和储蓄卡。</span></span></p><p style=\"margin-left:24px\"><span style=\"font-size: 16px;\"><span style=\"font-size: 16px; font-family: 宋体;\"><br/></span></span></p><p style=\"margin-left:24px\"><span style=\"font-family: 宋体; font-size: 16px;\">还车后，威风出行会24h内退还押金。违章保证金一般为<span style=\"font-size: 16px; font-family: Calibri;\">5000</span>元，还车后<span style=\"font-size: 16px; font-family: Calibri;\">30</span>天退还。期间如果产生任何违章罚款，您可以选择由威风出行为您代缴或您自行处理。</span></p><p style=\"margin-left:24px\"><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;</span></p><p><span style=\"font-family: 宋体; font-size: 16px;\">正确使用“威风出行”，高端出行路上无忧无虑，享受出行！</span></p><p><br/></p>', '正确姿势使用威风出行', '威风出行app的使用方式及流程和一些注意事项', 1, 1, '2017-08-07 13:09:33', NULL, 0, 1, '', 0, '{\"thumb\":\"\",\"pcbanner\":\"\",\"wapbanner\":\"\"}', 0, 0, 0, 0, 3),
(22, 1, '微风出行 豪车 豪车租赁 ', NULL, '2017-08-07 09:54:17', '<p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">8</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">月</span>1<span style=\"font-family:宋体\">日消息，据</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">媒体报道，近日，</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">威风出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">宣布将于今年</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">8</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">月</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">5<span style=\"font-family:宋体\">日</span></span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">进入</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">计划在北京投放</span>50<span style=\"font-family:宋体\">辆高端车型</span></span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">，并根据需求增加投放量。</span></span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">近期国内汽车租赁市场发展迅速，从低端车为主的凹凸车，神州租车到以高端车为主的威风出行，整体市场备受外界关注。</span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c974e6590.png\" title=\"图片1.png\" alt=\"图片1.png\"/><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">&nbsp;</span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">根据数据显示，作为高端车租赁行业巨头之一，威风出行已在全国的</span>10<span style=\"font-family:宋体\">多个一二线城市（包括广州、深圳、杭州等）设立了</span><span style=\"font-family:Calibri\">10</span><span style=\"font-family:宋体\">多个服务网点，可调配汽车数量已经超过</span><span style=\"font-family:Calibri\">500</span><span style=\"font-family:宋体\">辆。</span></span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c98612195.png\" title=\"图片2.png\" alt=\"图片2.png\"/><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">&nbsp;</span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">在北京，汽车租赁市场较成熟，自驾出游对于北京人来说更是稀疏平常。人们更愿意把豪车租赁当做一种体验性质的生活方式。用户只需打开威风出行客户端，在客户端内就能完成下单与付款。威风出行就能送车上门，上门取车。一站式服务，让用户更轻松。</span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c98e960ea.png\" title=\"图片3.png\" alt=\"图片3.png\"/></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">据了解，威风出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">在</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">全国</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场布局中，已相继开启</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">南京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">和</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">深圳等多个</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，此番再次开拓</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，方便快捷</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">体验式</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">的</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">豪车租赁</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">服务将会吸引</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京更多热爱自驾出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">的</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">高端</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">用户。</span></span></p><p><br/></p>', '威风出行将于今年8月进驻北京 预计投放豪车价值1.5亿', '威风出行宣布将于今年8月5日进入北京市场，计划在北京投放50辆高端车型，并根据需求增加投放量。', 1, 1, '2017-08-07 10:03:08', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170807\\/5987c9a75c03c.png\",\"pcbanner\":\"\",\"wapbanner\":\"\"}', 0, 0, 0, 0, 5),
(23, 1, '微风出行 豪车 豪车租赁 ', NULL, '2017-08-07 09:54:17', '<p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">8</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">月</span>1<span style=\"font-family:宋体\">日消息，据</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">媒体报道，近日，</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">威风出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">宣布将于今年</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">8</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">月</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">5<span style=\"font-family:宋体\">日</span></span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">进入</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">计划在北京投放</span>50<span style=\"font-family:宋体\">辆高端车型</span></span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">，并根据需求增加投放量。</span></span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">近期国内汽车租赁市场发展迅速，从低端车为主的凹凸车，神州租车到以高端车为主的威风出行，整体市场备受外界关注。</span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c974e6590.png\" title=\"图片1.png\" alt=\"图片1.png\"/><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">&nbsp;</span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">根据数据显示，作为高端车租赁行业巨头之一，威风出行已在全国的</span>10<span style=\"font-family:宋体\">多个一二线城市（包括广州、深圳、杭州等）设立了</span><span style=\"font-family:Calibri\">10</span><span style=\"font-family:宋体\">多个服务网点，可调配汽车数量已经超过</span><span style=\"font-family:Calibri\">500</span><span style=\"font-family:宋体\">辆。</span></span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c98612195.png\" title=\"图片2.png\" alt=\"图片2.png\"/><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">&nbsp;</span></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">在北京，汽车租赁市场较成熟，自驾出游对于北京人来说更是稀疏平常。人们更愿意把豪车租赁当做一种体验性质的生活方式。用户只需打开威风出行客户端，在客户端内就能完成下单与付款。威风出行就能送车上门，上门取车。一站式服务，让用户更轻松。</span></p><p style=\";margin-bottom:20px;text-align:center;line-height:30px\"><img src=\"http://vfly-cdn.joyingnet.com/ueditor/20170807/5987c98e960ea.png\" title=\"图片3.png\" alt=\"图片3.png\"/></p><p style=\";margin-bottom:20px;line-height:30px\"><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">据了解，威风出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">在</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">全国</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场布局中，已相继开启</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">南京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">和</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">深圳等多个</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，此番再次开拓</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">市场，方便快捷</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">体验式</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">的</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">豪车租赁</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">服务将会吸引</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">北京更多热爱自驾出行</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">的</span></span><span style=\";font-family:宋体;color:rgb(51,51,51);font-size:16px\">高端</span><span style=\";font-family:Calibri;color:rgb(51,51,51);font-size:16px\"><span style=\"font-family:宋体\">用户。</span></span></p><p><br/></p>', '威风出行将于今年8月进驻北京 预计投放豪车价值1.5亿', '威风出行宣布将于今年8月5日进入北京市场，计划在北京投放50辆高端车型，并根据需求增加投放量。', 3, 1, '2017-08-07 10:00:55', NULL, 0, 1, '', 0, '{\"thumb\":\"portal\\/20170807\\/5987c9a75c03c.png\",\"pcbanner\":\"\",\"wapbanner\":\"\"}', 0, 0, 0, 0, 5);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_role`
--

CREATE TABLE `sanda_role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_role`
--

INSERT INTO `sanda_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0),
(2, '阿德萨', NULL, 1, '啊飒飒的', 1488789000, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_role_user`
--

CREATE TABLE `sanda_role_user` (
  `role_id` int(11) UNSIGNED DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_route`
--

CREATE TABLE `sanda_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url路由表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_service`
--

CREATE TABLE `sanda_service` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '分店名',
  `tel` varchar(255) NOT NULL COMMENT '分店电话号码',
  `email` varchar(255) NOT NULL COMMENT '分店邮箱',
  `title` varchar(255) NOT NULL COMMENT '标题：三达 · 杭州',
  `zipcode` int(6) UNSIGNED NOT NULL COMMENT '邮编',
  `x` varchar(255) NOT NULL COMMENT '经度',
  `y` varchar(255) NOT NULL COMMENT '纬度',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态 0 删除 1 正常'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sanda_service`
--

INSERT INTO `sanda_service` (`id`, `name`, `tel`, `email`, `title`, `zipcode`, `x`, `y`, `address`, `create_time`, `update_time`, `status`) VALUES
(1, '义乌总店', '152-1294-1733', 'm13738133633@163.com', '三达 · 义乌', 322001, '120.087807', '29.320282', '义乌市城中北路43号', 1483689354, 1489381497, 1),
(2, '杭州分店', '400-166-0333', 'm13738133633@163.com', '三达 · 杭州', 310011, '120.140473', '30.303275', '教工路588号', 1483613531, 1489381507, 1),
(3, '广州分店', '187-1215-6789', 'm13738133633@163.com', '三达 · 广州', 510623, '113.361139', '23.117215 ', '广州市天河区临江大道T26产业园内', 1483689466, 1487578332, 1),
(4, '上海分店', '150-1177-7000', 'm13738133633@163.com', '三达 · 上海', 201101, '121.443858', '31.175576', '上海市徐汇区龙漕路（现代商务中心303）51弄4号303', 1483689879, 1487740578, 1),
(5, '宁波分店', '183-2919-1313', 'm13738133633@163.com', '三达 · 宁波', 315192, '121.548997', '29.835152 ', '宁波市鄞州区宁南北路1016号', 1483689972, 1487578400, 1),
(6, '温州分店', '135-8868-6853', 'm13738133633@163.com', '三达 · 温州', 325088, '120.68752', '27.994638 ', '温州市鹿城区锦绣路53号', 1483690037, 1483690037, 1),
(7, '台州分店', '135-8868-6853', 'm13738133633@163.com', '三达 · 台州', 318000, '121.425788', '28.67665 ', '台州市椒江区云溪路130号', 1483690279, 1483690279, 1),
(8, '杭州富阳店', '135-8868-6853', 'm13738133633@163.com', '三达 · 富阳', 311400, '119.94569', '30.042986', '富阳区文教路80-5号', 1483690372, 1483690372, 1),
(9, '杭州萧山店', '188-6754-8777', 'm13738133633@163.com', '三达 · 萧山', 311217, '120.55379', '30.285844 ', '萧山区人民路739号', 1483690503, 1483690503, 1),
(10, '绍兴诸暨店', '188-6754-8777', 'm13738133633@163.com', '三达 · 诸暨', 311899, '120.22236', '29.747995 ', '诸暨市陶朱街道创业路8号', 1483690833, 1483690833, 1),
(11, '合肥分店', '135-8868-6853', 'm13738133633@163.com', '三达 · 合肥', 230061, '117.268427', '31.870382 ', '蜀山区长丰南路126号兰桂公寓4幢', 1483690902, 1483690902, 1),
(12, '深圳分店', '187-1215-6789', 'm13738133633@163.com', '三达 · 深圳', 518010, '114.115836', '22.546509 ', '罗湖区书城路都市名园B座25D', 1483690952, 1487578232, 1),
(13, '河南郑州店', '135-8868-6853', 'm13738133633@163.com', '三达 · 郑州', 450016, '113.753089', '34.761808', '商鼎路与黄河南路交叉口', 1483691005, 1483691005, 1),
(14, '三亚分店', '151-5569-0727', 'm13738133633@163.com', '三达 · 三亚', 572011, '109.60529', '18.28751 ', '三亚市吉阳镇新红村村委会7楼705市', 1483691084, 1487578344, 1),
(15, '珠海分店', '187-1215-6789', 'm13738133633@163.com ', '三达·珠海', 518000, '113.543937', '22.227871', '珠海市拱北港昌路175号', 1487576986, 1487578259, 1),
(16, '长沙分店', '151-6820-0065', 'm13738133633@163.com ', '三达·长沙', 410000, '112.883344', '28.22695', '岳麓区桐梓坡西路408号保利麓谷林语D区6栋2单元1105', 1487577638, 1487578312, 1),
(17, '宁波北仑分店', '183-2919-1313', 'm13738133633@163.com ', '三达·宁波北仑', 315800, '121.835764', '29.893515', '宁波市北仑区庐山东路635号', 1487577936, 1487578298, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_slide`
--

CREATE TABLE `sanda_slide` (
  `slide_id` bigint(20) UNSIGNED NOT NULL,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_slide`
--

INSERT INTO `sanda_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, '今日现车Banner', 'admin/20170302/58b7d867ebf6a.png', 'http://www.sandazuche.com/index/cars.html', '', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_slide_cat`
--

CREATE TABLE `sanda_slide_cat` (
  `cid` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_slide_cat`
--

INSERT INTO `sanda_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页幻灯片', 'Home_img', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_terms`
--

CREATE TABLE `sanda_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) UNSIGNED DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_terms`
--

INSERT INTO `sanda_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(4, '关于我们', '', 'article', '', 0, 0, '0-4', '', '', '', 'list', 'article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_term_relationships`
--

CREATE TABLE `sanda_term_relationships` (
  `tid` bigint(20) NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_term_relationships`
--

INSERT INTO `sanda_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 4, 0, 1),
(2, 2, 4, 0, 1),
(3, 3, 4, 0, 1),
(4, 4, 4, 0, 1),
(5, 5, 4, 0, 1),
(6, 6, 4, 0, 1),
(7, 7, 4, 0, 1),
(8, 8, 4, 0, 1),
(9, 9, 4, 0, 1),
(10, 10, 4, 0, 1),
(11, 11, 4, 0, 1),
(12, 12, 4, 0, 1),
(13, 13, 4, 0, 1),
(14, 14, 4, 0, 1),
(15, 15, 4, 0, 1),
(16, 16, 4, 0, 1),
(17, 17, 4, 0, 1),
(18, 18, 4, 0, 1),
(19, 19, 4, 0, 1),
(20, 20, 4, 0, 1),
(21, 21, 4, 0, 1),
(22, 22, 4, 0, 1),
(23, 23, 4, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sanda_users`
--

CREATE TABLE `sanda_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `sanda_users`
--

INSERT INTO `sanda_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'lipeijie', '###de9779004e57950861bffcd93c078d0d', 'admin', '2252390865@qq.com', '', NULL, 0, '2000-01-01', NULL, '125.120.39.193', '2017-08-07 12:10:20', '2017-01-03 01:13:52', '', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `sanda_user_favorites`
--

CREATE TABLE `sanda_user_favorites` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `sanda_vflyhome_apply`
--

CREATE TABLE `sanda_vflyhome_apply` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `use_time` int(10) DEFAULT NULL COMMENT '用车时间',
  `ip` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='官网用车申请表';

--
-- 转存表中的数据 `sanda_vflyhome_apply`
--

INSERT INTO `sanda_vflyhome_apply` (`id`, `name`, `mobile`, `create_time`, `use_time`, `ip`) VALUES
(1, '吕佩刚', '15868100475', NULL, NULL, ''),
(2, 'gu', '15168200071', 1501924615, 2017, '125.120.39.193'),
(3, '1', '15168200071', 1501924806, 2017, '125.120.39.193'),
(4, '1', '15168200071', 1501925262, 1502812800, '125.120.39.193'),
(5, '1', '15168200071', 1501925387, 2017, '125.120.39.193'),
(6, 'gushuo', '15757101550', 1501925451, 1502899200, '125.120.39.193');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sanda_ad`
--
ALTER TABLE `sanda_ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ad_name` (`ad_name`);

--
-- Indexes for table `sanda_asset`
--
ALTER TABLE `sanda_asset`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `sanda_auth_access`
--
ALTER TABLE `sanda_auth_access`
  ADD KEY `role_id` (`role_id`),
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `sanda_auth_rule`
--
ALTER TABLE `sanda_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `sanda_brand`
--
ALTER TABLE `sanda_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_cars`
--
ALTER TABLE `sanda_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_comments`
--
ALTER TABLE `sanda_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post_ID` (`post_id`),
  ADD KEY `comment_approved_date_gmt` (`status`),
  ADD KEY `comment_parent` (`parentid`),
  ADD KEY `table_id_status` (`post_table`,`post_id`,`status`),
  ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `sanda_common_action_log`
--
ALTER TABLE `sanda_common_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user`,`object`,`action`),
  ADD KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`);

--
-- Indexes for table `sanda_email`
--
ALTER TABLE `sanda_email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_guestbook`
--
ALTER TABLE `sanda_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_links`
--
ALTER TABLE `sanda_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_status`);

--
-- Indexes for table `sanda_log`
--
ALTER TABLE `sanda_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_menu`
--
ALTER TABLE `sanda_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `parentid` (`parentid`),
  ADD KEY `model` (`model`);

--
-- Indexes for table `sanda_nav`
--
ALTER TABLE `sanda_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_nav_cat`
--
ALTER TABLE `sanda_nav_cat`
  ADD PRIMARY KEY (`navcid`);

--
-- Indexes for table `sanda_oauth_user`
--
ALTER TABLE `sanda_oauth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_options`
--
ALTER TABLE `sanda_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `sanda_plugins`
--
ALTER TABLE `sanda_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_posts`
--
ALTER TABLE `sanda_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`),
  ADD KEY `post_date` (`post_date`) USING BTREE;

--
-- Indexes for table `sanda_role`
--
ALTER TABLE `sanda_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sanda_role_user`
--
ALTER TABLE `sanda_role_user`
  ADD KEY `group_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sanda_route`
--
ALTER TABLE `sanda_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_service`
--
ALTER TABLE `sanda_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanda_slide`
--
ALTER TABLE `sanda_slide`
  ADD PRIMARY KEY (`slide_id`),
  ADD KEY `slide_cid` (`slide_cid`);

--
-- Indexes for table `sanda_slide_cat`
--
ALTER TABLE `sanda_slide_cat`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `cat_idname` (`cat_idname`);

--
-- Indexes for table `sanda_terms`
--
ALTER TABLE `sanda_terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `sanda_term_relationships`
--
ALTER TABLE `sanda_term_relationships`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `term_taxonomy_id` (`term_id`);

--
-- Indexes for table `sanda_users`
--
ALTER TABLE `sanda_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- Indexes for table `sanda_user_favorites`
--
ALTER TABLE `sanda_user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `sanda_vflyhome_apply`
--
ALTER TABLE `sanda_vflyhome_apply`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sanda_ad`
--
ALTER TABLE `sanda_ad`
  MODIFY `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id';
--
-- 使用表AUTO_INCREMENT `sanda_asset`
--
ALTER TABLE `sanda_asset`
  MODIFY `aid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_auth_rule`
--
ALTER TABLE `sanda_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键', AUTO_INCREMENT=183;
--
-- 使用表AUTO_INCREMENT `sanda_brand`
--
ALTER TABLE `sanda_brand`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `sanda_cars`
--
ALTER TABLE `sanda_cars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- 使用表AUTO_INCREMENT `sanda_comments`
--
ALTER TABLE `sanda_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_common_action_log`
--
ALTER TABLE `sanda_common_action_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_email`
--
ALTER TABLE `sanda_email`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- 使用表AUTO_INCREMENT `sanda_guestbook`
--
ALTER TABLE `sanda_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_links`
--
ALTER TABLE `sanda_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `sanda_log`
--
ALTER TABLE `sanda_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `sanda_menu`
--
ALTER TABLE `sanda_menu`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- 使用表AUTO_INCREMENT `sanda_nav`
--
ALTER TABLE `sanda_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `sanda_nav_cat`
--
ALTER TABLE `sanda_nav_cat`
  MODIFY `navcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `sanda_oauth_user`
--
ALTER TABLE `sanda_oauth_user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_options`
--
ALTER TABLE `sanda_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `sanda_plugins`
--
ALTER TABLE `sanda_plugins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- 使用表AUTO_INCREMENT `sanda_posts`
--
ALTER TABLE `sanda_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `sanda_role`
--
ALTER TABLE `sanda_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `sanda_route`
--
ALTER TABLE `sanda_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id';
--
-- 使用表AUTO_INCREMENT `sanda_service`
--
ALTER TABLE `sanda_service`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `sanda_slide`
--
ALTER TABLE `sanda_slide`
  MODIFY `slide_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `sanda_slide_cat`
--
ALTER TABLE `sanda_slide_cat`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `sanda_terms`
--
ALTER TABLE `sanda_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `sanda_term_relationships`
--
ALTER TABLE `sanda_term_relationships`
  MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `sanda_users`
--
ALTER TABLE `sanda_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `sanda_user_favorites`
--
ALTER TABLE `sanda_user_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `sanda_vflyhome_apply`
--
ALTER TABLE `sanda_vflyhome_apply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
