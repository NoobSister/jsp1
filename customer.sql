create table customer (
	idx int auto_increment primary key,
	name varchar(20) not null,
	password varchar(10) not null,
	email varchar(30) not null,
	addr varchar(30),
	gender varchar(10),
	age tinyint,
	hobby varchar(30)
);
-- ENGINE=InnoDB default CHARSET=utf8mb4;

drop table customer;

-- varchar의 크기는 문자수
insert into customer (name,password,email,gender)
	values ('홍길동', '11111111', 'hong@naver.com', 'female');


select * from customer;
insert into customer (name,password,email, addr, gender, age, hobby)
	values ('홍길동', '11111111', 'hong@naver.com', '', 'female', '', '');

-- 문자수 체크 테스트용
insert into customer (name,password,email,gender)
	values ('홍길동', '11111111', 'hong@naver.com', 'female가나다라');
	
insert into customer (name,password,email,gender)
	values ('홍길동', '11111111', 'hong@naver.com', 'female가나다라f');