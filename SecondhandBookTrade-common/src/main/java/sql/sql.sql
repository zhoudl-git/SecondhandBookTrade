SELECT * FROM tb_item WHERE title = '中华五千年'
UPDATE tb_item SET title = '高等数学'
UPDATE tb_item SET created = '2017-03-25 21:28:44'
UPDATE tb_item SET updated = '2017-04-01 21:28:44'

CREATE TABLE tb_item_cat (
  id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  parent_id BIGINT(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  NAME VARCHAR(50) DEFAULT NULL COMMENT '类目名称',
  STATUS INT(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
  sort_order INT(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  is_parent TINYINT(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id),
  KEY parent_id (parent_id,STATUS) USING BTREE,
  KEY sort_order (sort_order)
) ENGINE=INNODB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8 COMMENT='书籍类目';

SELECT * FROM tb_item_cat
SELECT * FROM tb_item_desc


CREATE TABLE tb_item_param_item (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  item_id BIGINT(20) DEFAULT NULL COMMENT '商品ID',
  param_data TEXT COMMENT '参数数据，格式为json格式',
  created DATETIME DEFAULT NULL,
  updated DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  KEY item_id (item_id) USING BTREE
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';

SELECT * FROM tb_item_param_item
SELECT * FROM tb_item_cat WHERE NAME = '经济类目'
UPDATE tb_item_cat SET STATUS = '1',sort_order = '1',is_parent = '1' WHERE id = 74

DELETE tb_item_cat WHERE id = 74

SELECT COUNT(*) FROM tb_item_desc

SELECT id, title, sell_point, price, num, barcode, image, cid, STATUS, created, updated FROM tb_item ORDER BY updated DESC

CREATE TABLE tb_item_desc (
  item_id BIGINT(20) NOT NULL COMMENT '商品ID',
  item_desc TEXT COMMENT '商品描述',
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (item_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='商品描述表';
DROP TABLE tb_user	
CREATE TABLE tb_user (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL COMMENT '用户名',
  pass VARCHAR(32) NOT NULL COMMENT '密码，加密存储',
  phone VARCHAR(20) DEFAULT NULL COMMENT '注册手机号',
  email VARCHAR(50) DEFAULT NULL COMMENT '注册邮箱',
  sex VARCHAR(20) NOT NULL COMMENT '性别',
  identity VARCHAR(50) DEFAULT NULL COMMENT '身份证号',
  address VARCHAR(500) DEFAULT NULL COMMENT '用户常住地址',
  addressDetail VARCHAR(500) DEFAULT NULL COMMENT '用户详细地址',
  likes VARCHAR(500) DEFAULT NULL COMMENT '用户爱好',
  created DATETIME NOT NULL,
  updated DATETIME NOT NULL,
  birthday DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY username (username) USING BTREE,
  UNIQUE KEY phone (phone) USING BTREE,
  UNIQUE KEY email (email) USING BTREE
) ENGINE=INNODB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户表';

SELECT * FROM tb_user



BEGIN;
INSERT INTO auth_function(id, NAME, parent_id, url, serial_num, accordion)
VALUES 
  (0, '菜单树', '-1', '', 1, 0),
  (1, '安全权限', 0, '', 1, 1),
  (2, '用户管理', 1, '/user/index', 2, 0),
  (3, '角色管理', 1, '/role/index', 3, 0),
  (4, '菜单管理', 1, '/function/index', 4, 0),
  (5, '用户授权', 1, '/authorize/index', 5, 0),
  (6, '用户角色', 1, '/authorize/userRole', 6, 0);
COMMIT;

/*修改用户表爱好列 名称*/
alter table tb_user change likes interest  varchar(500)
/*用户表增加 用户状态列  0  被禁用 1 正常 2 其他状态（暂定） */
alter table tb_user add status varchar(50)

DROP TABLE IF EXISTS tb_role;
CREATE TABLE tb_role (
  id BIGINT(20) AUTO_INCREMENT NOT NULL,
  name varchar(64) NOT NULL comment '角色名称',
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS tb_function;
CREATE TABLE tb_function (
  id BIGINT(20) AUTO_INCREMENT NOT NULL,
  name varchar(64) NOT NULL comment '姓名',
  parent_id BIGINT(20) NOT NULL comment '父节点ID',
  url varchar(128) NOT NULL comment '模块URL',
  serial_num int NOT NULL,
  accordion int NOT NULL,
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS tb_role_function;
CREATE TABLE tb_role_function (
  id BIGINT(20) AUTO_INCREMENT NOT NULL,
  role_id BIGINT(20) NOT NULL,
  function_id BIGINT(20) NOT NULL,
  status int NOT NULL,
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE tb_user_role (
  id BIGINT(20) AUTO_INCREMENT NOT NULL,
  role_id BIGINT(20) NOT NULL,
  user_id BIGINT(20) NOT NULL,
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


/*模块表增加 创建时间 和修改时间字段*/
ALTER TABLE tb_function ADD  updated DATETIME DEFAULT NULL COMMENT '创建时间'



/*用户权限查询SQL*/
SELECT DISTINCT t.id,t.NAME,t.parent_id AS pId
FROM tb_function t,tb_role_function f,tb_role r,tb_user u,tb_user_role e
WHERE 
t.id = f.function_id AND r.id = f.role_id AND u.id = e.user_id 
AND e.role_id = r.id AND u.id = 37



DROP TABLE tb_shop_cat
CREATE TABLE tb_shop_cat(
  id BIGINT(20) AUTO_INCREMENT NOT NULL COMMENT '购物车ID',
  user_id BIGINT(20) NOT NULL COMMENT '用户ID',
  item_id BIGINT(20) NOT NULL COMMENT '商品ID',
  item_name VARCHAR(100) NOT NULL COMMENT '商品名称', 
  num INT(10) NOT NULL COMMENT '商品数量',
  price BIGINT(20) NOT NULL COMMENT '商品价格',
  function_id BIGINT(20) NOT NULL COMMENT '商品数量',
  created DATETIME DEFAULT NULL COMMENT '创建时间',
  updated DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '购物车';


SELECT * FROM tb_shop_cat
ALTER TABLE tb_shop_cat ADD image VARCHAR(100)



CREATE TABLE tb_order (
  order_id VARCHAR(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
  payment VARCHAR(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  payment_type INT(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  STATUS INT(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
  create_time DATETIME DEFAULT NULL COMMENT '订单创建时间',
  update_time DATETIME DEFAULT NULL COMMENT '订单更新时间',
  payment_time DATETIME DEFAULT NULL COMMENT '付款时间',
  consign_time DATETIME DEFAULT NULL COMMENT '发货时间',
  end_time DATETIME DEFAULT NULL COMMENT '交易完成时间',
  close_time DATETIME DEFAULT NULL COMMENT '交易关闭时间',
  shipping_name VARCHAR(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  shipping_code VARCHAR(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  user_id BIGINT(20) DEFAULT NULL COMMENT '用户id',
  buyer_message VARCHAR(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  buyer_nick VARCHAR(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  addressDetail VARCHAR(50) COLLATE utf8_bin DEFAULT NULL COMMENT '送货地址',
  buyer_rate INT(2) DEFAULT NULL COMMENT '买家是否已经评价',

  PRIMARY KEY (order_id),
  KEY create_time (create_time),
  KEY buyer_nick (buyer_nick),
  KEY STATUS (STATUS),
  KEY payment_type (payment_type)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



DROP TABLE tb_image
CREATE TABLE tb_image (
 id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
 url VARCHAR(500) DEFAULT NULL COMMENT '图片路径',
 link VARCHAR(500) DEFAULT NULL COMMENT '图片链接地址',
 STATUS INT(1) DEFAULT '1' COMMENT '图片状态 1 添加到首页轮播 2 禁止轮播',
 PRIMARY KEY (id) 
)ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '轮播图管理表';


r table tb_image add create_time DATETIME DEFAULT NULL COMMENT '创建时间',
 alter table tb_image add  update_time DATETIME DEFAULT NULL COMMENT '更新时间'
 
 
 
 

CREATE TABLE tb_message(
 id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
 content VARCHAR(2000) DEFAULT NULL COMMENT '留言内容',
 create_time datetime DEFAULT NULL COMMENT '留言创建时间',
 update_time datetime DEFAULT NULL COMMENT '留言更新时间',
 isDelte INT(1) DEFAULT '1' COMMENT '是否删除',
 issuer_id BIGINT(20) DEFAULT NULL COMMENT '发布人ID',
 item_id BIGINT(20) DEFAULT NULL COMMENT '商品ID',
 reply_id BIGINT(20) DEFAULT NULL COMMENT '回复人ID',
 reply_content VARCHAR(2000) DEFAULT NULL COMMENT '回复留言内容',
 status INT(1) DEFAULT '1' COMMENT '备用字段 是否已阅读',
 PRIMARY KEY (id) 
)ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT '留言表';