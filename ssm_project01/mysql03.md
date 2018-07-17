###课程回顾：
1. 主键约束 ，主键：表示数据唯一性的字段， 主键约束：限制主键值唯一且非空    primary key  
2. 主键+自增   primary key auto_increment     赋值为null数值自增，删除数据自增数值不减，delete清空表时自增数值不变， truncate可以使自增数值清零（因为删除了表 又创建了一个新表）
3. 注释 comment   
4. ` 和 '   前者修饰表名和字段面可以省略   后者修饰字符串 
5. 数据冗余 数据重复   通过拆分表的形式解决
6. 事务：数据库中执行sql的最小工作单元  
- 查看自动提交状态： show variables like '%autocommit%'
- 修改状态 set autocommit=0/1;
- 手动提交 commit
- 回滚 rollback
- 保存回滚点 savepoint xxx;
- 回滚到某个回滚点 rollback to xxx; 
7. SQL分类  DDL DML DQL TCL DCL
- DDL:数据定义语言  包括 create drop alter truncate 不支持事务
- DML:数据操作语言 包括 insert delete update select(DQL) 支持事务
- DQL:数据查询语言 包括select
- TCL: 事务控制语言 commit rollback savepoint rollback to
- DCL:数据控制语言 分配用户权限相关sql
8. 数据类型 5种
- 整数： int(m) bigint(m) m代表显示长度 需要结合zerofill使用 补0
- 浮点数：double(m,d) decimal(m,d) m代表总长度 d代表小数长度
- 字符串：char(m)长度不可变 最大值255 执行效率高  varchar(m)长度可变，最大65535建议超过255使用text 节省空间，text 可变长度 最大65535存放超过255长度的文本
- 日期：date 年月日 time 时分秒 datetime 默认值null 最大值9999-12-31 timestamp 默认值当前时间 最大值 2038年1月19号
- 其它

###Eclipse乱码问题
- 在url的连接地址后面添加 ?useUnicode=true&characterEncoding=UTF-8
		
		jdbc:mysql://localhost:3306/db3?useUnicode=true&characterEncoding=UTF-8

###判断值是否为null
####is null
1. 查询奖金为null的所有员工信息 
	
	select * from emp where comm is null;
2. 查询没有上级领导(mgr)的员工信息

	select * from emp where mgr is null;
####is not null
1. 查询emp表中有奖金的员工信息
	
	select * from emp where comm is not null;
####别名
1. 查询emp表中所有的姓名 把ename改成姓名
	-以下三种写法 等效
	select ename as '姓名' from emp;
	select ename '姓名' from emp;
	select ename 姓名 from emp;
###去重 distinct

1. 查询所有员工从事的工作 

	select distinct job from emp;
###比较运算符  >,<,>=,<=,=,!=和<>
- emp:comm奖金job工作职位sal工资mgr领导编号deptno部门编号
- t_item: price单价num库存
1. 查询工资小于等于1600的所有员工姓名和工资
	select ename,sal from emp where sal<=1600;
2. 查询部门编号是20的所有员工姓名、职位job、部门编号
	select ename,job,deptno from emp where deptno=20;
3. 查询职位是manager的所有员工的姓名和职位
	select ename,job from emp where job='manager';
4. 查询部门不是10号部门的所有员工的姓名和部门编号 使用两种写法
	select ename,deptno from emp where deptno!=10;
	select ename,deptno from emp where deptno<>10;
5. 查询t_item表中单价等于23的商品名称和价格
	select title,price from t_item where price=23;
6. 查询单价不等于8443的商品信息
	select * from t_item where price!=8443;
###and 和 or
- and 和java中的&&效果一样
- or 和java中的||效果一样

1. 查询不是10号部门并且工资小于3000的员工信息
	select * from emp where deptno!=10 and sal<3000;
2. 查询部门编号是30或者上级领导为7698的员工姓名，职位，上级领导编号和部门编号
	select ename,job,mgr,deptno from emp where deptno=30 or mgr=7698;
### in
1. 查询工资等于5000,1500,3000的员工信息
	select * from emp where sal=5000 or sal=1500 or sal=3000;
	select * from emp where sal in (5000,1500,3000);
### between x and y  查询x和y之间的数值（包含x和y）
1. 查询工资在2000和4000之间的员工信息
	select * from emp where sal>=2000 and sal<=4000;
	select * from emp where sal between 2000 and 4000;


####上午内容回顾：
1. is null 和 is not null
2. 别名   as 'abc'  'abc'   abc
3. 去重  distinct    select distinct deptno from emp;
4. 比较运算符  >  <  >=  <= !=和<> = 
5. in   和 between x and y

####练习：
1. 查询10号部门中工资小于4000的员工姓名，工资，部门编号
	select ename,sal,deptno from emp where sal<4000 and deptno=10;
2. 查询商品表中单价低于1000并且库存大于100的
商品名称title，单价，库存num
	select title,price,num from t_item where price<1000 and num>100;
3. 查询没有奖金但是有领导的员工信息
	select * from emp where comm is null and mgr is not null;
4. 查询没有领导或者有奖金的员工信息
	select * from emp where mgr is null or comm is not null;
5. 查询工资小于1000或者大于3000的员工姓名和工资
	select ename,sal from emp where sal<1000 or sal>3000;
	select ename,sal from emp where sal not between 1000 and 3000;
6. 查询工资不等于1500,3000,1300,950的员工信息
	select * from emp where sal not in (1500,3000,1300,950);

###like 
- 用于模糊查询
- _: 代表单个未知字符
- %: 代表0个或多个未知字符
- 举例：
1. 包含字符a   %a%
2. 以a开头     a%
3. 以a结尾     %a
4. 第二个字符是a    _a%
5. 倒数第三个字符是a   %a__
6. 第二个字符是a 最后一个字符是b   _a%b
####like案例
1. 查询标题中出现笔记本的商品标题
	select title from t_item where title like '%笔记本%';
2. 查询单价在50到200之间的得力商品（title中出现得力）
	select * from t_item where price between 50 and 200 and title like '%得力%';
3. 查询有图片的得力商品（image字段不为null）
		select * from t_item 
		where image is not null and title like '%得力%';
4. 查询标题中不包含得力的商品信息
		select * from t_item
		where title not like '%得力%';
5. 查询有赠品的的商品信息（在sell_point字段中包含赠字）
		select * from t_item
		where sell_point like '%赠%';
###排序
- order by 写在where的后面 
- order by 后面写排序的字段名，可以写一个或多个
- 默认排序规则为升序，也可以指定规则： 升序（asc）降序（desc）
- 举例：select name,money from person where money>5000 order by money asc/desc;

1. 查询所有员工的姓名和工资，按照工资降序排序
	select ename,sal from emp order by sal desc;
2. 查询所有的dell商品，按照单价降序排序
	select title,price from t_item 
	where title like '%dell%' order by price desc;
3. 查询所有员工的信息，按照部门编号降序，工资升序排序
	select * from emp
	order by deptno desc,sal;

###分页查询 limit
- limit x,y  x代表跳过的条数  y代表查询的条数（每页的条数）
- limit 写在最后
- 举例1：查询第一页的10条数据    limit 0,10
- 举例2：查询第五页的8条数据    limit 32,8
- 举例3：查询第三页每页3条数据  limit (3-1)*3,3
1. 查询所有商品的价格，价格升序，显示第二页，每页7条数据

	select price from t_item order by price limit 7,7;
2. 查询工资前三名的员工信息

	select * from emp order by sal desc limit 0,3;
3. 查询20部门中工资最高的员工信息
	select * from emp where deptno=20 order by sal desc limit 0,1;
4. 查询dell商品中价格最便宜的商品名称和价格
	select title,price from t_item where title like '%dell%' order by price limit 0,1;

###数值运算  + - * /  7%2等效(mod(7,2))
1. 查询员工姓名，工资，年终奖（工资*5）

	select ename,sal,sal*5 年终奖 from emp;
2. 查询商品单价，库存和总金额(单价*库存)

	select price,num,price*num 总金额 from t_item;

###日期相关函数
- select 'helloworld';

- 获取当前日期+时间  now()

	select now();
- 获取当前的日期

	select curdate();
- 获取当前时间

	select curtime();
- 从年月日时分秒中提取年月日 和提取时分秒
	
	select date(now());
	select time(now());

- 从年月日时分秒中提取年，月，日，时，分，秒
	select extract(year from now());
	select extract(month from now());
	select extract(day from now());
	select extract(hour from now());
	select extract(minute from now());
	select extract(second from now());
- 练习： 查询每位员工入职的年份 
	select ename,extract(year from hiredate) from emp;

- 日期的格式化    
	格式： date_format(日期,格式)
%Y 代表四位年  %y 两位年 
%m 两位月     %c 一位月
%d 日
%H 24小时  %h 12小时
%i 分
%s 秒
- 测试：把now()转成 2018年07月17日 16点27分30秒
	select date_format(now(),'%Y年%m月%d日 %H点%i分%s秒');
- 把非标准格式的时间转成标准格式
	str_to_date(非标准格式的时间,格式)
- 测试：把15.08.2016 08:00:00 转成标准格式
	select str_to_date('15.08.2016 08:00:00','%d.%m.%Y %H:%i:%s');

####ifnull函数

- age=ifnull(x,y) 如果x的值为null 则age=y,x不为null则age=x

- 练习： 将emp表中奖金为null的改成0 使用ifnull

	update emp set comm=ifnull(null,0);
###聚合函数
- 对多条数据进行统计查询
- 求平均值 avg(字段名)
	select avg(sal) from emp;
- 最大值 max(字段名)
	select max(sal) from emp;
- 最小值 min(字段名)
	select min(sal) from emp;
- 总和 sum(字段名)
	select sum(sal) from emp;
- 练习：查询emp表中所有员工的平均工资，最大工资，最小工资，工资总和 要求对查询内容起别名 
	select avg(sal) 平均工资,max(sal) 最大工资,min(sal) 最小工资,sum(sal) 工资总和 from emp;

- 查询符合条件的条数 count(*)
	select count(*) from emp where deptno=10;
	

 
###字符串相关函数
1. 字符串拼接 concat(s1,s2)  结果等于 s1s2
- 案例：查询emp表中 员工姓名，工资，在工资后面添加元
	
	select ename,concat(sal,'元') from emp;
2. 获取字符串的长度 char_length(str)
- 案例：查询员工姓名和姓名的字符长度
	
	select ename,char_length(ename) from emp;
3. 获取字符串在另一个字符串中出现的位置 从1开始
- 格式一：instr(str,substr);
- 格式二：locate(substr,str);
	select instr('abcdefg','d'),locate('d','abcdefg');
4. 转大写和转小写
- 格式： select upper('abc'),lower('NBa');
5. 去两端空白
- 格式： select trim('    ab c   ');
6. 截取字符串
- 从左边截取:  select left('abcdefg',2);
- 从右边截取:  select right('abcdefg',2);
- 从某个位置截取： select substring('abcdefg',2,3); //bcd 
7. 重复
- 格式： select repeat('ab',3); //ababab
8. 反转
- 格式： select reverse('abc');  // cba
9. 替换
- 格式：select replace('abcde','c','m'); //abmde
10. 插入
- 格式： select insert('abcdefg',3,2,'m'); //abmefg


###课程回顾：
1. is null   is not null
2. 别名    as ''  ''   
3. 去重  distinct
4. > <  >=  <=  =  !=和<>
5. and  和  or
6. in (10,20,30)
7. between x and y 
8. like   _ 单个未知   % 0或多个未知
9. 排序    order by 字段 asc/desc，字段
10. 分页   limit 跳过的条数,查询条数(每页条数)
11. 数值运算  + - *  /  %  mod(7,3)
12. 日期相关： now()  curdate() curtime()  date(now()) time(now()) extract(year/month/day/hour/minute/second from now()), date_format(日期，格式) %Y y m c d H h i s   , str_to_date(日期，格式)
13. ifnull(x,y)  
14. 聚合 5个   平均值 avg()  max() min() sum()  count(*)
15. 字符串相关  concat   char_length   instr() locate()   upper() lower()  trim()   left()  right()  substring  repeat() reverse()  replace()  insert()
  





### 练习
	1.案例：查询没有上级领导的员工的编号，姓名，工资
	2.案例：查询emp表中没有奖金的员工的姓名，职位，工资，以及奖金
	3.案例：查询emp表中含有奖金的员工的编号，姓名，职位，以及奖金
	4.案例：查询含有上级领导的员工的姓名，工资以及上级领导的编号
	5.案例：查询emp表中名字以‘S’开头的所有员工的姓名
	6.案例：查询emp表中名字的最后一个字符是'S'的员工的姓名
	7.案例：查询倒数的第2个字符是‘E’的员工的姓名
	8.案例：查询emp表中员工的倒数第3个字符是‘N’的员工姓名
	9.案例：查询emp表中员工的名字中包含‘A’的员工的姓名	
	10.案例：查询emp表中名字不是以'K'开头的员工的所有信息
	11.案例：查询emp表中名字中不包含‘A’的所有员工的信息
	12.案例：做文员的员工人数（job_id 中 含有 CLERK 的）
	13.案例：销售人员 job: SALESMAN 的最高薪水
	14.案例：最早和最晚入职时间
	15.案例：查询类别 163的商品总库存量
	16.案例：查询 类别 163 的商品
	17.案例：查询商品价格不大于100的商品名称列表
	18.案例：查询品牌是联想,且价格在40000以上的商品名称和价格
	19.案例：查询品牌是三木,或价格在50以下的商品名称和价格
	20.案例：查询品牌是三木、广博、齐心的商品名称和价格
	21.案例：查询品牌不是联想、戴尔的商品名称和价格
	22.案例：查找品牌是联想且价格大于10000的电脑名称
	23.案例：查询联想或戴尔的电脑名称列表
	24.案例：查询联想、戴尔、三木的商品名称列表
	25.案例：查询不是戴尔的电脑名称列表
	26.案例：查询所有是记事本的商品品牌、名称和价格
	27.案例：查询品牌是末尾字符是'力'的商品的品牌、名称和价格
	28.案例：名称中有联想字样的商品名称
	29.案例：查询卖点含有'赠'产品名称
	30.案例：查询emp表中员工的编号，姓名，职位，工资，并且工资在1000~2000之间。
	31.案例：查询emp表中员工在10号部门，并且含有上级领导的员工的姓名，职位，上级领导编号以及所属部门的编号
	32.案例：查询emp表中名字中包含'E'，并且职位不是MANAGER的员工的编号，姓名，职位，以及工资。	
	33.案例：查询emp表中10号部门或者20号部门中员工的编号，姓名，所属部门的编号
	34.案例：查询emp表中没有奖金或者名字的倒数第2个字母不是T的员工的编号，姓名，职位以及奖金
	35.案例：查询工资高于3000或者部门编号是30的员工的姓名，职位，工资，入职时间以及所属部门的编号	
	36.案例：查询不是30号部门的员工的所有信息
	37.案例：查询奖金不为空的员工的所有信息
	38.案例：查询emp表中所有员工的编号，姓名，职位，根据员工的编号进行降序排列
	39.案例：查询emp表中部门编号是10号或者30号中，所有员工姓名，职务，工资，根据工资进行升序排列
	40.案例：查询emp表中所有的数据，然后根据部门的编号进行升序排列，如果部门编号一致，根据员工的编号进行降序排列
	41.案例：查询emp表中工资高于1000或者没有上级领导的员工的编号，姓名，工资，所属部门的编号，以及上级领导的编号，根据部门编号进行降序排列，如果部门编号一致根据工资进行升序排列。
	42.案例：查询emp表中名字中不包含S的员工的编号，姓名，工资，奖金，根据工资进行升序排列，如果工资一致，根据编号进行降序排列
	43.案例：统计emp表中员工的总数量
	44.案例：统计emp表中获得奖金的员工的数量
	45.案例：求出emp表中所有的工资累加之和
	46.案例：求出emp表中所有的奖金累加之和
	47.案例：求出emp表中员工的平均工资
	48.案例：求出emp表中员工的平均奖金
	49.案例：求出emp表中员工的最高工资
	50.案例：求出emp表中员工编号的最大值
	51.案例：查询emp表中员工的最低工资。
	52.案例：查询emp表中员工的人数，工资的总和，平均工资，奖金的最大值，奖金的最小值,并且对返回的列起别名。
	53.案例：查询emp表中每个部门的编号，人数，工资总和，最后根据人数进行升序排列，如果人数一致，根据工资总和降序排列。
	54.案例：查询工资在1000~3000之间的员工信息，每个部门的编号，平均工资，最低工资，最高工资，根据平均工资进行升序排列。
	55.案例：查询含有上级领导的员工，每个职业的人数，工资的总和，平均工资，最低工资，最后根据人数进行降序排列，如果人数一致，根据平均工资进行升序排列
	56.案例：查询工资在1000~3000之间每一个员工的编号，姓名，职位，工资
	57.案例：查询emp表中奖金在500~2000之间所有员工的编号，姓名，工资以及奖金
	58.案例：查询员工的编号是7369，7521，	
	59.案例：查询emp表中，职位是ANALYST，
	60.案例：查询emp表中职位不是ANALYST,










	 

	
	



	










	








