-- Database: java_note

-- DROP DATABASE java_note;
#基本知识
#数据类型
#1、数值类型
名字	                存储长度	描述	                范围
smallint	        2 字节	小范围整数	        -32768 到 +32767
integer	            4 字节	常用的整数	        -2147483648 到 +2147483647
bigint	            8 字节	大范围整数	        -9223372036854775808 到 +9223372036854775807
decimal	            可变长	用户指定的精度，精确	小数点前 131072 位；小数点后 16383 位
numeric	            可变长	用户指定的精度，精确	小数点前 131072 位；小数点后 16383 位
real	            4 字节	可变精度，不精确	    6 位十进制数字精度
double precision	8 字节	可变精度，不精确	    15 位十进制数字精度
smallserial	        2 字节	自增的小范围整数	    1 到 32767
serial	            4 字节	自增整数	            1 到 2147483647
bigserial	        8 字节	自增的大范围整数	    1 到 9223372036854775807
#2、货币类型
名字	    存储容量	描述	    范围
money	8 字节	货币金额	-92233720368547758.08 到 +92233720368547758.07
#3、字符类型
序号	名字                                 描述
1	character varying(n), varchar(n)    变长，有长度限制
2   character(n), char(n)               定长,不足补空白
3   text                                变长，无长度限制
#4、时间类型
名字	                                    存储空间	描述	                    最低值	最高值	                分辨率
timestamp [ (p) ] [ without time zone ]	8 字节	日期和时间(无时区)	        4713 BC	294276 AD	            1 毫秒 / 14 位
timestamp [ (p) ] with time zone	    8 字节	日期和时间，有时区	        4713 BC	294276 AD	            1 毫秒 / 14 位
date	                                4 字节	只用于日期	            4713 BC	5874897 AD	            1 天
time [ (p) ] [ without time zone ]	    8 字节	只用于一日内时间	        00:00:00	24:00:00	        1 毫秒 / 14 位
time [ (p) ] with time zone	            12 字节	只用于一日内时间，带时区	00:00:00+1459	24:00:00-1459	1 毫秒 / 14 位
interval [ fields ] [ (p) ]	            12 字节	时间间隔	                -178000000 年	178000000 年     1 毫秒 / 14 位
#5、布尔类型
名称  	存储格式	描述
boolean	1 字节	true/false
#6、枚举类型
枚举类型
枚举类型是一个包含静态和值的有序集合的数据类型。
PostgtesSQL中的枚举类型类似于 C 语言中的 enum 类型。
与其他类型不同的是枚举类型需要使用 CREATE TYPE 命令创建。
CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');
创建一周中的几天，如下所示:
CREATE TYPE week AS ENUM ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
就像其他类型一样，一旦创建，枚举类型可以用于表和函数定义。
CREATE TYPE mood AS ENUM ('sad', 'ok', 'happy');
CREATE TABLE person (
    name text,
    current_mood mood
);
INSERT INTO person VALUES ('Moe', 'happy');
SELECT * FROM person WHERE current_mood = 'happy';
 name | current_mood
------+--------------
 Moe  | happy
(1 row)
例子
CREATE TYPE mood AS ENUM ('type1', 'type2', 'type3');
INSERT INTO test VALUES (100, 'type1');
INSERT INTO test VALUES (101, 'type2');
INSERT INTO test VALUES (102, 'type3');
select * from test where uname>'type2';   显示 102 type3
select * from test where uid between 100 and 103;
--#7、几何类型
--几何数据类型表示二维的平面物体。
--最基本的类型：点。它是其它类型的基础。
--
--名字	存储空间	说明	表现形式
--point	16 字节	平面中的点	(x,y)
--line	32 字节	(无穷)直线(未完全实现)	((x1,y1),(x2,y2))
--lseg	32 字节	(有限)线段	((x1,y1),(x2,y2))
--box	32 字节	矩形	((x1,y1),(x2,y2))
--path	16+16n 字节	闭合路径(与多边形类似)	((x1,y1),...)
--path	16+16n 字节	开放路径	[(x1,y1),...]
--polygon	40+16n 字节	多边形(与闭合路径相似)	((x1,y1),...)
--circle	24 字节	圆	<(x,y),r> (圆心和半径)
--#8、网络地址类型
--PostgreSQL 提供用于存储 IPv4 、IPv6 、MAC 地址的数据类型。
--用这些数据类型存储网络地址比用纯文本类型好， 因为这些类型提供输入错误检查和特殊的操作和功能。
--名字	存储空间	描述
--cidr	7 或 19 字节	IPv4 或 IPv6 网络
--inet	7 或 19 字节	IPv4 或 IPv6 主机和网络
--macaddr	6 字节	MAC 地址
--在对 inet 或 cidr 数据类型进行排序的时候， IPv4 地址总是排在 IPv6 地址前面，包括那些封装或者是映射在 IPv6 地址里的 IPv4 地址， 比如 ::10.2.3.4 或 ::ffff:10.4.3.2。
--
--位串类型
--位串就是一串 1 和 0 的字符串。它们可以用于存储和直观化位掩码。 我们有两种 SQL 位类型：bit(n) 和bit varying(n)， 这里的n是一个正整数。
--
--bit 类型的数据必须准确匹配长度 n， 试图存储短些或者长一些的数据都是错误的。bit varying 类型数据是最长 n 的变长类型；更长的串会被拒绝。 写一个没有长度的bit 等效于 bit(1)， 没有长度的 bit varying 意思是没有长度限制。
--
--文本搜索类型
--全文检索即通过自然语言文档的集合来找到那些匹配一个查询的检索。
--
--PostgreSQL 提供了两种数据类型用于支持全文检索：
--
--序号	名字 & 描述
--1
--tsvector
--
--tsvector 的值是一个无重复值的 lexemes 排序列表， 即一些同一个词的不同变种的标准化。
--
--2
--tsquery
--
--tsquery 存储用于检索的词汇，并且使用布尔操作符 &(AND)，|(OR)和!(NOT) 来组合它们，括号用来强调操作符的分组。
--
--UUID 类型
--uuid 数据类型用来存储 RFC 4122，ISO/IEF 9834-8:2005 以及相关标准定义的通用唯一标识符（UUID）。 （一些系统认为这个数据类型为全球唯一标识符，或GUID。） 这个标识符是一个由算法产生的 128 位标识符，使它不可能在已知使用相同算法的模块中和其他方式产生的标识符相同。 因此，对分布式系统而言，这种标识符比序列能更好的提供唯一性保证，因为序列只能在单一数据库中保证唯一。
--
--UUID 被写成一个小写十六进制数字的序列，由分字符分成几组， 特别是一组8位数字+3组4位数字+一组12位数字，总共 32 个数字代表 128 位， 一个这种标准的 UUID 例子如下：
--
--a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
--XML 类型
--xml 数据类型可以用于存储XML数据。 将 XML 数据存到 text 类型中的优势在于它能够为结构良好性来检查输入值， 并且还支持函数对其进行类型安全性检查。 要使用这个数据类型，编译时必须使用 configure --with-libxml。
--
--xml 可以存储由XML标准定义的格式良好的"文档"， 以及由 XML 标准中的 XMLDecl? content 定义的"内容"片段， 大致上，这意味着内容片段可以有多个顶级元素或字符节点。 xmlvalue IS DOCUMENT 表达式可以用来判断一个特定的 xml 值是一个完整的文件还是内容片段。
--
--创建XML值
--使用函数 xmlparse: 来从字符数据产生 xml 类型的值：
--
--XMLPARSE (DOCUMENT '<?xml version="1.0"?><book><title>Manual</title><chapter>...</chapter></book>')
--XMLPARSE (CONTENT 'abc<foo>bar</foo><bar>foo</bar>')
--JSON 类型
--json 数据类型可以用来存储 JSON（JavaScript Object Notation）数据， 这样的数据也可以存储为 text，但是 json 数据类型更有利于检查每个存储的数值是可用的 JSON 值。
--
--此外还有相关的函数来处理 json 数据：
--
--实例	实例结果
--array_to_json('{{1,5},{99,100}}'::int[])	[[1,5],[99,100]]
--row_to_json(row(1,'foo'))	{"f1":1,"f2":"foo"}
--数组类型
--PostgreSQL 允许将字段定义成变长的多维数组。
--
--数组类型可以是任何基本类型或用户定义类型，枚举类型或复合类型。
--
--声明数组
--创建表的时候，我们可以声明数组，方式如下：
--
--CREATE TABLE sal_emp (
--    name            text,
--    pay_by_quarter  integer[],
--    schedule        text[][]
--);
--pay_by_quarter 为一维整型数组、schedule 为二维文本类型数组。
--
--我们也可以使用 "ARRAY" 关键字，如下所示：
--
--CREATE TABLE sal_emp (
--   name text,
--   pay_by_quarter integer ARRAY[4],
--   schedule text[][]
--);
--插入值
--插入值使用花括号 {}，元素在 {} 使用逗号隔开：
--
--INSERT INTO sal_emp
--    VALUES ('Bill',
--    '{10000, 10000, 10000, 10000}',
--    '{{"meeting", "lunch"}, {"training", "presentation"}}');
--
--INSERT INTO sal_emp
--    VALUES ('Ca ',
--    '{20000, 25000, 25000, 25000}',
--    '{{"breakfast", "consulting"}, {"meeting", "lunch"}}');
--访问数组
--现在我们可以在这个表上运行一些查询。
--
--首先，我们演示如何访问数组的一个元素。 这个查询检索在第二季度薪水变化的雇员名：
--
--SELECT name FROM sal_emp WHERE pay_by_quarter[1] <> pay_by_quarter[2];
--
-- name
---------
-- Carol
--(1 row)
--数组的下标数字是写在方括弧内的。
--
--修改数组
--我们可以对数组的值进行修改：
--
--UPDATE sal_emp SET pay_by_quarter = '{25000,25000,27000,27000}'
--    WHERE name = 'Carol';
--或者使用 ARRAY 构造器语法：
--
--UPDATE sal_emp SET pay_by_quarter = ARRAY[25000,25000,27000,27000]
--    WHERE name = 'Carol';
--数组中检索
--要搜索一个数组中的数值，你必须检查该数组的每一个值。
--
--比如：
--
--SELECT * FROM sal_emp WHERE pay_by_quarter[1] = 10000 OR
--                            pay_by_quarter[2] = 10000 OR
--                            pay_by_quarter[3] = 10000 OR
--                            pay_by_quarter[4] = 10000;
--另外，你可以用下面的语句找出数组中所有元素值都等于 10000 的行：
--
--SELECT * FROM sal_emp WHERE 10000 = ALL (pay_by_quarter);
--或者，可以使用 generate_subscripts 函数。例如：
--
--SELECT * FROM
--   (SELECT pay_by_quarter,
--           generate_subscripts(pay_by_quarter, 1) AS s
--      FROM sal_emp) AS foo
-- WHERE pay_by_quarter[s] = 10000;
--复合类型
--复合类型表示一行或者一条记录的结构； 它实际上只是一个字段名和它们的数据类型的列表。PostgreSQL 允许像简单数据类型那样使用复合类型。比如，一个表的某个字段可以声明为一个复合类型。
--
--声明复合类型
--下面是两个定义复合类型的简单例子：
--
--CREATE TYPE complex AS (
--    r       double precision,
--    i       double precision
--);
--
--CREATE TYPE inventory_item AS (
--    name            text,
--    supplier_id     integer,
--    price           numeric
--);
--语法类似于 CREATE TABLE，只是这里只可以声明字段名字和类型。
--
--定义了类型，我们就可以用它创建表：
--
--CREATE TABLE on_hand (
--    item      inventory_item,
--    count     integer
--);
--
--INSERT INTO on_hand VALUES (ROW('fuzzy dice', 42, 1.99), 1000);
--复合类型值输入
--要以文本常量书写复合类型值，在圆括弧里包围字段值并且用逗号分隔他们。 你可以在任何字段值周围放上双引号，如果值本身包含逗号或者圆括弧， 你必须用双引号括起。
--
--复合类型常量的一般格式如下：
--
--'( val1 , val2 , ... )'
--一个例子是:
--
--'("fuzzy dice",42,1.99)'
--访问复合类型
--要访问复合类型字段的一个域，我们写出一个点以及域的名字， 非常类似从一个表名字里选出一个字段。实际上，因为实在太像从表名字中选取字段， 所以我们经常需要用圆括弧来避免分析器混淆。比如，你可能需要从on_hand 例子表中选取一些子域，像下面这样：
--
--SELECT item.name FROM on_hand WHERE item.price > 9.99;
--这样将不能工作，因为根据 SQL 语法，item是从一个表名字选取的， 而不是一个字段名字。你必须像下面这样写：
--
--SELECT (item).name FROM on_hand WHERE (item).price > 9.99;
--或者如果你也需要使用表名字(比如，在一个多表查询里)，那么这么写：
--
--SELECT (on_hand.item).name FROM on_hand WHERE (on_hand.item).price > 9.99;
--现在圆括弧对象正确地解析为一个指向item字段的引用，然后就可以从中选取子域。
--
--范围类型
--范围数据类型代表着某一元素类型在一定范围内的值。
--
--例如，timestamp 范围可能被用于代表一间会议室被预定的时间范围。
--
--PostgreSQL 内置的范围类型有：
--
--int4range — integer的范围
--
--int8range —bigint的范围
--
--numrange —numeric的范围
--
--tsrange —timestamp without time zone的范围
--
--tstzrange —timestamp with time zone的范围
--
--daterange —date的范围
--
--此外，你可以定义你自己的范围类型。
--
--CREATE TABLE reservation (room int, during tsrange);
--INSERT INTO reservation VALUES
--    (1108, '[2010-01-01 14:30, 2010-01-01 15:30)');
--
---- 包含
--SELECT int4range(10, 20) @> 3;
--
---- 重叠
--SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);
--
---- 提取上边界
--SELECT upper(int8range(15, 25));
--
---- 计算交叉
--SELECT int4range(10, 20) * int4range(15, 25);
--
---- 范围是否为空
--SELECT isempty(numrange(1, 5));
--范围值的输入必须遵循下面的格式：
--
--(下边界,上边界)
--(下边界,上边界]
--[下边界,上边界)
--[下边界,上边界]
--空
--圆括号或者方括号显示下边界和上边界是不包含的还是包含的。注意最后的格式是 空，代表着一个空的范围（一个不含有值的范围）。
--
---- 包括3，不包括7，并且包括二者之间的所有点
--SELECT '[3,7)'::int4range;
--
---- 不包括3和7，但是包括二者之间所有点
--SELECT '(3,7)'::int4range;
--
---- 只包括单一值4
--SELECT '[4,4]'::int4range;
--
---- 不包括点（被标准化为‘空’）
--SELECT '[4,4)'::int4range;
--对象标识符类型
--PostgreSQL 在内部使用对象标识符(OID)作为各种系统表的主键。
--
--同时，系统不会给用户创建的表增加一个 OID 系统字段(除非在建表时声明了WITH OIDS 或者配置参数default_with_oids设置为开启)。oid 类型代表一个对象标识符。除此以外 oid 还有几个别名：regproc, regprocedure, regoper, regoperator, regclass, regtype, regconfig, 和regdictionary。
--
--名字	引用	描述	数值例子
--oid	任意	数字化的对象标识符	564182
--regproc	pg_proc	函数名字	sum
--regprocedure	pg_proc	带参数类型的函数	sum(int4)
--regoper	pg_operator	操作符名	+
--regoperator	pg_operator	带参数类型的操作符	*(integer,integer) 或 -(NONE,integer)
--regclass	pg_class	关系名	pg_type
--regtype	pg_type	数据类型名	integer
--regconfig	pg_ts_config	文本搜索配置	english
--regdictionary	pg_ts_dict	文本搜索字典	simple
--伪类型
--PostgreSQL类型系统包含一系列特殊用途的条目， 它们按照类别来说叫做伪类型。伪类型不能作为字段的数据类型， 但是它可以用于声明一个函数的参数或者结果类型。 伪类型在一个函数不只是简单地接受并返回某种SQL 数据类型的情况下很有用。
--
--下表列出了所有的伪类型：
--
--名字	描述
--any	表示一个函数接受任何输入数据类型。
--anyelement	表示一个函数接受任何数据类型。
--anyarray	表示一个函数接受任意数组数据类型。
--anynonarray	表示一个函数接受任意非数组数据类型。
--anyenum	表示一个函数接受任意枚举数据类型。
--anyrange	表示一个函数接受任意范围数据类型。
--cstring	表示一个函数接受或者返回一个空结尾的 C 字符串。
--internal	表示一个函数接受或者返回一种服务器内部的数据类型。
--language_handler	一个过程语言调用处理器声明为返回language_handler。
--fdw_handler	一个外部数据封装器声明为返回fdw_handler。
--record	标识一个函数返回一个未声明的行类型。
--trigger	一个触发器函数声明为返回trigger。
--void	表示一个函数不返回数值。
--opaque	一个已经过时的类型，以前用于所有上面这些用途。


#基本命令

#查询数据库版本
select version();

#数据库操作
#1、创建数据库
#create database databasename;
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

createdb 命令创建数据库
createdb [option...] [dbname [description]]
序号	选项    描述
1	-D     tablespace指定数据库默认表空间。
2	-e将    createdb 生成的命令发送到服务端。
3   -E     encoding指定数据库的编码。
4   -l     locale指定数据库的语言环境。
5   -T     template指定创建此数据库的模板。
6   --help 显示 createdb 命令的帮助信息。
7   -h     host指定服务器的主机名。
8   -p     port指定服务器监听的端口，或者 socket 文件。
9   -U     username连接数据库的用户名。
10	-w     忽略输入密码。
11	-W     连接时强制要求输入密码。
#2、删除数据库
DROP DATABASE [ IF EXISTS ] name
参数说明：
IF EXISTS：如果数据库不存在则发出提示信息，而不是错误信息。
name：要删除的数据库的名称。

dropdb 命令删除数据库 dropdb 是 DROP DATABASE 的包装器。
dropdb 用于删除 PostgreSQL 数据库。
dropdb 命令只能由超级管理员或数据库拥有者执行。
dropdb 命令语法格式如下：

dropdb [connection-option...] [option...] dbname
参数说明：

dbname：要删除的数据库名。

options：参数可选项，可以是以下值：

序号	选项 & 描述
1	-e
	显示 dropdb 生成的命令并发送到数据库服务器。
2	-i
	在做删除的工作之前发出一个验证提示。
3	-V
	打印 dropdb 版本并退出。
4	--if-exists
	如果数据库不存在则发出提示信息，而不是错误信息。
5	--help
	显示有关 dropdb 命令的帮助信息。
6	-h host
	指定运行服务器的主机名。
7	-p port
	指定服务器监听的端口，或者 socket 文件。
8	-U username
	连接数据库的用户名。
9	-w
	连接数据库的用户名。
10	-W
	连接时强制要求输入密码。
11	--maintenance-db=dbname
	删除数据库时指定连接的数据库，默认为 postgres，如果它不存在则使用 template1。

#数据库账号权限相关
#1、角色
create user shida;
GRANT  ALL ON  test to shida;
alter USER shida PASSWORD '1qaz!QAZ';

#2、权限
#分配权限
在 PostgreSQL 中，权限分为以下几种：
SELECT
INSERT
UPDATE
DELETE
TRUNCATE
REFERENCES
TRIGGER
CREATE
CONNECT
TEMPORARY
EXECUTE
USAGE
要向用户分配权限，可以使用 GRANT 命令。
GRANT 语法
GRANT 命令的基本语法如下：
GRANT privilege [, ...]
ON object [, ...]
TO { PUBLIC | GROUP group | username }
privilege − 值可以为：SELECT，INSERT，UPDATE，DELETE， RULE，ALL。
object − 要授予访问权限的对象名称。可能的对象有： table， view，sequence。
PUBLIC − 表示所有用户。
GROUP group − 为用户组授予权限。
username − 要授予权限的用户名。PUBLIC 是代表所有用户的简短形式。
例子
GRANT  ALL ON  test to shida;

#移除权限
REVOKE privilege [, ...]
ON object [, ...]
FROM { PUBLIC | GROUP groupname | username }

revoke all on test from postgre;

#表操作
#建表
表格创建语句格式
CREATE TABLE table_name(
   column1 datatype,
   column2 datatype,
   column3 datatype,
   ...
   columnN datatype,
   PRIMARY KEY( 一个或多个列 )
);
例子:
create table test(title varchar(255),content text);
drop table test;
create table test(uid int,uname varchar(20));
#约束
1、主键(primary key)
2、外键(foreign key)：被参照的键必须有唯一约束或是主键
3、非空(not null)
4、默认(default)
5、检查(check)：oracle独有
6、唯一(unique)

#删除表格
DROP TABLE table_name;

#修改表格语法
用 ALTER TABLE 在一张已存在的表上添加列的语法如下：

ALTER TABLE table_name ADD column_name datatype;
在一张已存在的表上 DROP COLUMN（删除列），语法如下：

ALTER TABLE table_name DROP COLUMN column_name;
修改表中某列的 DATA TYPE（数据类型），语法如下：

ALTER TABLE table_name ALTER COLUMN column_name TYPE datatype;
给表中某列添加 NOT NULL 约束，语法如下：

ALTER TABLE table_name MODIFY column_name datatype NOT NULL;
给表中某列 ADD UNIQUE CONSTRAINT（ 添加 UNIQUE 约束），语法如下：

ALTER TABLE table_name
ADD CONSTRAINT MyUniqueConstraint UNIQUE(column1, column2...);
给表中 ADD CHECK CONSTRAINT（添加 CHECK 约束），语法如下：

ALTER TABLE table_name
ADD CONSTRAINT MyUniqueConstraint CHECK (CONDITION);
给表 ADD PRIMARY KEY（添加主键），语法如下：

ALTER TABLE table_name
ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (column1, column2...);
DROP CONSTRAINT （删除约束），语法如下：

ALTER TABLE table_name
DROP CONSTRAINT MyUniqueConstraint;
如果是 MYSQL ，代码是这样：

ALTER TABLE table_name
DROP INDEX MyUniqueConstraint;
DROP PRIMARY KEY （删除主键），语法如下：

ALTER TABLE table_name
DROP CONSTRAINT MyPrimaryKey;
如果是 MYSQL ，代码是这样：

ALTER TABLE table_name
DROP PRIMARY KEY;

comment on table public.表名 is '描述名';
create table test03(
	videoname int,
	videLngLat point
)
comment on table public.test03 is '点位经纬度表';
例子
create table test02(
	uid serial primary key ,
	uname varchar(20) not null,
	areacode real,
	hobbies varchar(30)

);
alter table test02 modify uid serrial
alter table test02 add sex varchar(2) default'男';
insert into  test02(uname,areacode,hobbies) values('shida',350121,'study');
show  test02；
select * from test02;




#查询数据库、表
#命令行
\l  查看已经创建的数据库
\c  数据库名  进入数据库
\d   查看已经创建的表




#查询表结构
SELECT
 A.attnum,
	( SELECT description FROM pg_catalog.pg_description WHERE objoid = A.attrelid AND objsubid = A.attnum ) AS descript,
	A.attname,
	( select typname from pg_type where oid = A.atttypid) AS type,
	A.atttypmod AS data_type
FROM
	pg_catalog.pg_attribute A
WHERE
	1 = 1
	AND A.attrelid = ( SELECT oid FROM pg_class WHERE relname = '表名 ' )
	AND A.attnum > 0
	AND NOT A.attisdropped
ORDER BY
	A.attnum;

#增删改查
#增加
insert into tablename(column1,column2.....)values(value1,value2,value3.....)
insert into tablename values(value1,value2,value3.....),(value1,value2,value3.....);
#删除
delete from tablename1，tablename2 where 条件;
#修改
update 表名 set column1=valuexxxxx
update 语句要加where
update 表名 set column1=valuexxxxx  where columnx=xxxx;
#查询
select 列名1，列名2..... from 表名1，表名2 where 条件;

#运算符
PostgreSQL 运算符
运算符是一种告诉编译器执行特定的数学或逻辑操作的符号。
PostgreSQL 运算符是一个保留关键字或字符，一般用在 WHERE 语句中，作为过滤条件。
常见的运算符有：

算术运算符

比较运算符

逻辑运算符

按位运算符



算术运算符
假设变量 a 为 2，变量 b 为 3，则：
运算符	描述	实例
+	加	a + b 结果为 5
-	减	a - b 结果为 -1
*	乘	a * b 结果为 6
/	除	b / a 结果为 1
%	模（取余）	b % a 结果为 1
^	指数	a ^ b 结果为 8
|/	平方根	|/ 25.0 结果为 5
||/	立方根	||/ 27.0 结果为 3
!	阶乘	5 ! 结果为 120
!!	阶乘（前缀操作符）	!! 5 结果为 120
实例
runoobdb=# select 2+3;
 ?column?
----------
5
(1 row)


runoobdb=# select 2*3;
 ?column?
----------
6
(1 row)


runoobdb=# select 10/5;
 ?column?
----------
2
(1 row)


runoobdb=# select 12%5;
 ?column?
----------
2
(1 row)


runoobdb=# select 2^3;
 ?column?
----------
8
(1 row)


runoobdb=# select |/ 25.0;
 ?column?
----------
5
(1 row)


runoobdb=# select ||/ 27.0;
 ?column?
----------
3
(1 row)


runoobdb=# select 5 !;
 ?column?
----------
120
(1 row)


runoobdb=# select !!5;
 ?column?
----------
120
(1 row)


比较运算符
假设变量 a 为 10，变量 b 为 20，则：
运算符	描述	实例
=	等于	(a = b) 为 false。
!=	不等于	(a != b) 为 true。
<>	不等于	(a <> b) 为 true。
>	大于	(a > b) 为 false。
<	小于	(a < b) 为 true。
>=	大于等于	(a >= b) 为 false。
<=	小于等于	(a <= b) 为 true。
实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：
runoobdb=# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
读取 SALARY 字段大于 50000 的数据：
runoobdb=# SELECT * FROM COMPANY WHERE SALARY > 50000;
 id | name  | age |address    | salary
----+-------+-----+-----------+--------
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
(2 rows)
读取 SALARY 字段等于 20000 的数据：
runoobdb=#  SELECT * FROM COMPANY WHERE SALARY = 20000;
 id | name  | age |  address    | salary
 ----+-------+-----+-------------+--------
   1 | Paul  |  32 | California  |  20000
   3 | Teddy |  23 | Norway      |  20000
(2 rows)
读取 SALARY 字段不等于 20000 的数据：
runoobdb=#  SELECT * FROM COMPANY WHERE SALARY != 20000;
 id | name  | age |  address    | salary
----+-------+-----+-------------+--------
  2 | Allen |  25 | Texas       |  15000
  4 | Mark  |  25 | Rich-Mond   |  65000
  5 | David |  27 | Texas       |  85000
  6 | Kim   |  22 | South-Hall  |  45000
  7 | James |  24 | Houston     |  10000
(5 rows)

runoobdb=# SELECT * FROM COMPANY WHERE SALARY <> 20000;
 id | name  | age | address    | salary
----+-------+-----+------------+--------
  2 | Allen |  25 | Texas      |  15000
  4 | Mark  |  25 | Rich-Mond  |  65000
  5 | David |  27 | Texas      |  85000
  6 | Kim   |  22 | South-Hall |  45000
  7 | James |  24 | Houston    |  10000
(5 rows)
读取 SALARY 字段大于等于 65000 的数据：
runoobdb=# SELECT * FROM COMPANY WHERE SALARY >= 65000;
 id | name  | age |  address  | salary
----+-------+-----+-----------+--------
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
(2 rows)


逻辑运算符
PostgreSQL 逻辑运算符有以下几种：
序号	运算符 & 描述
1	AND
	逻辑与运算符。如果两个操作数都非零，则条件为真。
	PostgresSQL 中的 WHERE 语句可以用 AND 包含多个过滤条件。

2	NOT
	逻辑非运算符。用来逆转操作数的逻辑状态。如果条件为真则逻辑非运算符将使其为假。
	PostgresSQL 有 NOT EXISTS, NOT BETWEEN, NOT IN 等运算符。
3	OR
	逻辑或运算符。如果两个操作数中有任意一个非零，则条件为真。
	PostgresSQL 中的 WHERE 语句可以用 OR 包含多个过滤条件。
SQL 使用三值的逻辑系统，包括 true、false 和 null，null 表示"未知"。
a	b	a AND b	a OR b
TRUE	TRUE	TRUE	TRUE
TRUE	FALSE	FALSE	TRUE
TRUE	NULL	NULL	TRUE
FALSE	FALSE	FALSE	FALSE
FALSE	NULL	FALSE	NULL
NULL	NULL	NULL	NULL
a	NOT a
TRUE	FALSE
FALSE	TRUE
NULL	NULL
实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：
runoobdb=# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
读取 AGE 字段大于等于 25 且 SALARY 字段大于等于 6500 的数据：
runoobdb=# SELECT * FROM COMPANY WHERE AGE >= 25 AND SALARY >= 6500;
 id | name  | age |                      address                  | salary
----+-------+-----+-----------------------------------------------+--------
  1 | Paul  |  32 | California                                    |  20000
  2 | Allen |  25 | Texas                                         |  15000
  4 | Mark  |  25 | Rich-Mond                                     |  65000
  5 | David |  27 | Texas                                         |  85000
(4 rows)
读取 AGE 字段大于等于 25 或 SALARY 字段大于 6500 的数据：
runoobdb=# SELECT * FROM COMPANY WHERE AGE >= 25 OR SALARY >= 6500;
 id | name  | age |  address    | salary
----+-------+-----+-------------+--------
  1 | Paul  |  32 | California  |  20000
  2 | Allen |  25 | Texas       |  15000
  3 | Teddy |  23 | Norway      |  20000
  4 | Mark  |  25 | Rich-Mond   |  65000
  5 | David |  27 | Texas       |  85000
  6 | Kim   |  22 | South-Hall  |  45000
  7 | James |  24 | Houston     |  10000
  8 | Paul  |  24 | Houston     |  20000
  9 | James |  44 | Norway      |   5000
 10 | James |  45 | Texas       |   5000
(10 rows)
读取 SALARY 字段不为 NULL 的数据：
runoobdb=#  SELECT * FROM COMPANY WHERE SALARY IS NOT NULL;
 id | name  | age |  address    | salary
----+-------+-----+-------------+--------
  1 | Paul  |  32 | California  |  20000
  2 | Allen |  25 | Texas       |  15000
  3 | Teddy |  23 | Norway      |  20000
  4 | Mark  |  25 | Rich-Mond   |  65000
  5 | David |  27 | Texas       |  85000
  6 | Kim   |  22 | South-Hall  |  45000
  7 | James |  24 | Houston     |  10000
  8 | Paul  |  24 | Houston     |  20000
  9 | James |  44 | Norway      |   5000
 10 | James |  45 | Texas       |   5000
(10 rows)


位运算符
位运算符作用于位，并逐位执行操作。&、 | 和 ^ 的真值表如下所示：
p	q	p & q	p | q
0	0	0	0
0	1	0	1
1	1	1	1
1	0	0	1
假设如果 A = 60，且 B = 13，现在以二进制格式表示，它们如下所示：
A = 0011 1100
B = 0000 1101
-----------------
A&B = 0000 1100
A|B = 0011 1101
A^B = 0011 0001
~A  = 1100 0011
下表显示了 PostgreSQL 支持的位运算符。假设变量 A 的值为 60，变量 B 的值为 13，则：
运算符	描述	实例
&	按位与操作，按二进制位进行"与"运算。运算规则：	(A & B) 将得到 12，即为 0000 1100
	0&0=0;
	0&1=0;
	1&0=0;
	1&1=1;
|	按位或运算符，按二进制位进行"或"运算。运算规则：	(A | B) 将得到 61，即为 0011 1101
	0|0=0;
	0|1=1;
	1|0=1;
	1|1=1;
#	异或运算符，按二进制位进行"异或"运算。运算规则：	(A # B) 将得到 49，即为 0011 0001
	0#0=0;
	0#1=1;
	1#0=1;
	1#1=0;
~	取反运算符，按二进制位进行"取反"运算。运算规则：	(~A ) 将得到 -61，即为 1100 0011，一个有符号二进制数的补码形式。
	~1=0;
	~0=1;
<<	二进制左移运算符。将一个运算对象的各二进制位全部左移若干位（左边的二进制位丢弃，右边补0）。	A << 2 将得到 240，即为 1111 0000
>>	二进制右移运算符。将一个数的各二进制位全部右移若干位，正数左补0，负数左补1，右边丢弃。	A >> 2 将得到 15，即为 0000 1111
实例
runoobdb=# select 60 | 13;
 ?column?
----------
61
(1 row)


runoobdb=# select 60 & 13;
 ?column?
----------
12
(1 row)


runoobdb=#  select  (~60);
 ?column?
----------
-61
(1 row)


runoobdb=# select  (60 << 2);
 ?column?
----------
240
(1 row)


runoobdb=# select  (60 >> 2);
 ?column?
----------
15
(1 row)


runoobdb=#  select 60 # 13;
 ?column?
----------
49
(1 row)

#查询语句
PostgreSQL LIKE 子句
在 PostgreSQL 数据库中，我们如果要获取包含某些字符的数据，可以使用 LIKE 子句。

在 LIKE 子句中，通常与通配符结合使用，通配符表示任意字符，在 PostgreSQL 中，主要有以下两种通配符：

百分号 %
下划线 _
如果没有使用以上两种通配符，LIKE 子句和等号 = 得到的结果是一样的。

语法
以下是使用 LIKE 子句搭配百分号 % 和下划线 _ 从数据库中获取数据的通用语法：

SELECT FROM table_name WHERE column LIKE 'XXXX%';
或者
SELECT FROM table_name WHERE column LIKE '%XXXX%';
或者
SELECT FROM table_name WHERE column LIKE 'XXXX_';
或者
SELECT FROM table_name WHERE column LIKE '_XXXX';
或者
SELECT FROM table_name WHERE column LIKE '_XXXX_';
你可以在 WHERE 子句中指定任何条件。

你可以使用 AND 或者 OR 指定一个或多个条件。

XXXX 可以是任何数字或者字符。

实例
下面是 LIKE 语句中演示了 % 和 _ 的一些差别:

实例	描述
WHERE SALARY::text LIKE '200%'	找出 SALARY 字段中以 200 开头的数据。
WHERE SALARY::text LIKE '%200%'	找出 SALARY 字段中含有 200 字符的数据。
WHERE SALARY::text LIKE '_00%'	找出 SALARY 字段中在第二和第三个位置上有 00 的数据。
WHERE SALARY::text LIKE '2 % %'	找出 SALARY 字段中以 2 开头的字符长度大于 3 的数据。
WHERE SALARY::text LIKE '%2'	找出 SALARY 字段中以 2 结尾的数据
WHERE SALARY::text LIKE '_2%3'	找出 SALARY 字段中 2 在第二个位置上并且以 3 结尾的数据
WHERE SALARY::text LIKE '2___3'	找出 SALARY 字段中以 2 开头，3 结尾并且是 5 位数的数据

PostgreSQL LIMIT 子句
PostgreSQL 中的 limit 子句用于限制 SELECT 语句中查询的数据的数量。

语法
带有 LIMIT 子句的 SELECT 语句的基本语法如下：

SELECT column1, column2, columnN
FROM table_name
LIMIT [no of rows]
下面是 LIMIT 子句与 OFFSET 子句一起使用时的语法：

SELECT column1, column2, columnN
FROM table_name
LIMIT [no of rows] OFFSET [row num]
实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：

runoobdb# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
下面实例将找出限定的数量的数据，即读取 4 条数据：

runoobdb=# SELECT * FROM COMPANY LIMIT 4;
得到以下结果：

 id | name  | age | address     | salary
----+-------+-----+-------------+--------
  1 | Paul  |  32 | California  |  20000
  2 | Allen |  25 | Texas       |  15000
  3 | Teddy |  23 | Norway      |  20000
  4 | Mark  |  25 | Rich-Mond   |  65000
(4 rows)
PostgreSQL ORDER BY 语句
在 PostgreSQL 中，ORDER BY 用于对一列或者多列数据进行升序（ASC）或者降序（DESC）排列。

语法
ORDER BY 子句的基础语法如下：

SELECT column-list
FROM table_name
[WHERE condition]
[ORDER BY column1, column2, .. columnN] [ASC | DESC];
您可以在 ORDER BY 中使用一列或者多列，但是必须保证要排序的列必须存在。

ASC 表示升序，DESC 表示降序。

实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：

runoobdb# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
下面实例将对结果根据 AGE 字段值进行升序排列：

runoobdb=# SELECT * FROM COMPANY ORDER BY AGE ASC;
得到以下结果：

 id | name  | age |                      address                       | salary
----+-------+-----+----------------------------------------------------+--------
  6 | Kim   |  22 | South-Hall                                         |  45000
  3 | Teddy |  23 | Norway                                             |  20000
  7 | James |  24 | Houston                                            |  10000
  4 | Mark  |  25 | Rich-Mond                                          |  65000
  2 | Allen |  25 | Texas                                              |  15000
  5 | David |  27 | Texas                                              |  85000
  1 | Paul  |  32 | California                                         |  20000
(7 rows)
下面实例将对结果根据 NAME 字段值和 SALARY 字段值进行升序排序：

runoobdb=# SELECT * FROM COMPANY ORDER BY NAME, SALARY ASC;
得到以下结果：

 id | name  | age |                      address                       | salary
----+-------+-----+----------------------------------------------------+--------
  2 | Allen |  25 | Texas                                              |  15000
  5 | David |  27 | Texas                                              |  85000
  7 | James |  24 | Houston                                            |  10000
  6 | Kim   |  22 | South-Hall                                         |  45000
  4 | Mark  |  25 | Rich-Mond                                          |  65000
  1 | Paul  |  32 | California                                         |  20000
  3 | Teddy |  23 | Norway                                             |  20000
(7 rows)
下面实例将对结果根据NAME字段值进行降序排列：

runoobdb=# SELECT * FROM COMPANY ORDER BY NAME DESC;
得到以下结果：

 id | name  | age |                      address                       | salary
----+-------+-----+----------------------------------------------------+--------
  3 | Teddy |  23 | Norway                                             |  20000
  1 | Paul  |  32 | California                                         |  20000
  4 | Mark  |  25 | Rich-Mond                                          |  65000
  6 | Kim   |  22 | South-Hall                                         |  45000
  7 | James |  24 | Houston                                            |  10000
  5 | David |  27 | Texas                                              |  85000
  2 | Allen |  25 | Texas                                              |  15000
(7 rows)
PostgreSQL GROUP BY 语句
在 PostgreSQL 中，GROUP BY 语句和 SELECT 语句一起使用，用来对相同的数据进行分组。

GROUP BY 在一个 SELECT 语句中，放在 WHRER 子句的后面，ORDER BY 子句的前面。

语法
下面给出了 GROUP BY 子句的基本语法:
SELECT column-list
FROM table_name
WHERE [ conditions ]
GROUP BY column1, column2....columnN
ORDER BY column1, column2....columnN
GROUP BY 子句必须放在 WHERE 子句中的条件之后，必须放在 ORDER BY 子句之前。

在 GROUP BY 子句中，你可以对一列或者多列进行分组，但是被分组的列必须存在于列清单中。

实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：

runoobdb# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
下面实例将根据 NAME 字段值进行分组，找出每个人的工资总额：

runoobdb=# SELECT NAME, SUM(SALARY) FROM COMPANY GROUP BY NAME;
得到以下结果：

  name  |  sum
 -------+-------
  Teddy | 20000
  Paul  | 20000
  Mark  | 65000
  David | 85000
  Allen | 15000
  Kim   | 45000
  James | 10000
(7 rows)
现在我们添加使用下面语句在 CAMPANY 表中添加三条记录：

INSERT INTO COMPANY VALUES (8, 'Paul', 24, 'Houston', 20000.00);
INSERT INTO COMPANY VALUES (9, 'James', 44, 'Norway', 5000.00);
INSERT INTO COMPANY VALUES (10, 'James', 45, 'Texas', 5000.00);
现在 COMPANY 表中存在重复的名称，数据如下：

 id | name  | age | address      | salary
 ----+-------+-----+--------------+--------
   1 | Paul  |  32 | California   |  20000
   2 | Allen |  25 | Texas        |  15000
   3 | Teddy |  23 | Norway       |  20000
   4 | Mark  |  25 | Rich-Mond    |  65000
   5 | David |  27 | Texas        |  85000
   6 | Kim   |  22 | South-Hall   |  45000
   7 | James |  24 | Houston      |  10000
   8 | Paul  |  24 | Houston      |  20000
   9 | James |  44 | Norway       |   5000
  10 | James |  45 | Texas        |   5000
(10 rows)
现在再根据 NAME 字段值进行分组，找出每个客户的工资总额：

runoobdb=# SELECT NAME, SUM(SALARY) FROM COMPANY GROUP BY NAME ORDER BY NAME;
这时的得到的结果如下：

name  |  sum
-------+-------
 Allen | 15000
 David | 85000
 James | 20000
 Kim   | 45000
 Mark  | 65000
 Paul  | 40000
 Teddy | 20000
(7 rows)
下面实例将 ORDER BY 子句与 GROUP BY 子句一起使用：

runoobdb=#  SELECT NAME, SUM(SALARY) FROM COMPANY GROUP BY NAME ORDER BY NAME DESC;
得到以下结果：

name  |  sum
-------+-------
 Teddy | 20000
 Paul  | 40000
 Mark  | 65000
 Kim   | 45000
 James | 20000
 David | 85000
 Allen | 15000
(7 rows)
PostgreSQL HAVING 子句
HAVING 子句可以让我们筛选分组后的各组数据。

WHERE 子句在所选列上设置条件，而 HAVING 子句则在由 GROUP BY 子句创建的分组上设置条件。

语法
下面是 HAVING 子句在 SELECT 查询中的位置：

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
HAVING 子句必须放置于 GROUP BY 子句后面，ORDER BY 子句前面，下面是 HAVING 子句在 SELECT 语句中基础语法：

SELECT column1, column2
FROM table1, table2
WHERE [ conditions ]
GROUP BY column1, column2
HAVING [ conditions ]
ORDER BY column1, column2
实例
创建 COMPANY 表（下载 COMPANY SQL 文件 ），数据内容如下：

runoobdb# select * from COMPANY;
 id | name  | age | address   | salary
----+-------+-----+-----------+--------
  1 | Paul  |  32 | California|  20000
  2 | Allen |  25 | Texas     |  15000
  3 | Teddy |  23 | Norway    |  20000
  4 | Mark  |  25 | Rich-Mond |  65000
  5 | David |  27 | Texas     |  85000
  6 | Kim   |  22 | South-Hall|  45000
  7 | James |  24 | Houston   |  10000
(7 rows)
下面实例将找出根据 NAME 字段值进行分组，并且 name(名称) 字段的计数少于 2 数据：

SELECT NAME FROM COMPANY GROUP BY name HAVING count(name) < 2;
得到以下结果：

  name
 -------
  Teddy
  Paul
  Mark
  David
  Allen
  Kim
  James
(7 rows)
我们往表里添加几条数据：

INSERT INTO COMPANY VALUES (8, 'Paul', 24, 'Houston', 20000.00);
INSERT INTO COMPANY VALUES (9, 'James', 44, 'Norway', 5000.00);
INSERT INTO COMPANY VALUES (10, 'James', 45, 'Texas', 5000.00);
此时，COMPANY 表的记录如下：

 id | name  | age | address      | salary
 ----+-------+-----+--------------+--------
   1 | Paul  |  32 | California   |  20000
   2 | Allen |  25 | Texas        |  15000
   3 | Teddy |  23 | Norway       |  20000
   4 | Mark  |  25 | Rich-Mond    |  65000
   5 | David |  27 | Texas        |  85000
   6 | Kim   |  22 | South-Hall   |  45000
   7 | James |  24 | Houston      |  10000
   8 | Paul  |  24 | Houston      |  20000
   9 | James |  44 | Norway       |   5000
  10 | James |  45 | Texas        |   5000
(10 rows)
下面实例将找出根据 name 字段值进行分组，并且名称的计数大于 1 数据：

runoobdb-# SELECT NAME FROM COMPANY GROUP BY name HAVING count(name) > 1;
得到结果如下：

 name
-------
 Paul
 James
(2 rows)
在 PostgreSQL 中，DISTINCT 关键字与 SELECT 语句一起使用，用于去除重复记录，只获取唯一的记录。

我们平时在操作数据时，有可能出现一种情况，在一个表中有多个重复的记录，当提取这样的记录时，DISTINCT 关键字就显得特别有意义，它只获取唯一一次记录，而不是获取重复记录。

语法
用于去除重复记录的 DISTINCT 关键字的基本语法如下：

SELECT DISTINCT column1, column2,.....columnN
FROM table_name
WHERE [condition]
