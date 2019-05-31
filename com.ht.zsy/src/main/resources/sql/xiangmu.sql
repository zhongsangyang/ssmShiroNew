use testshop;
CREATE table t_shop(
	shopid int PRIMARY KEY auto_increment ,
	shopName varchar(200),
	shopPrice double,
	shopDescription varchar(500),
	shopImageUrl varchar(1000)
)charset=utf8 ENGINE=InnoDB;

select * from t_shop;


use testshop;
CREATE table t_shop(
	shopid int PRIMARY KEY auto_increment ,
	shopName varchar(200),
	shopPrice double,
	shopDescription varchar(500),
	shopImageUrl varchar(1000)
)charset=utf8 ENGINE=InnoDB;
use testshop;
create table shoporder(
	orderid int PRIMARY key auto_increment,
	shopid int,
	buycount int,
	oneprice double,
	allprice double,
	user_id int,
	shopName varchar(200)
)charset=utf8 ENGINE=InnoDB;


