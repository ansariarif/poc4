CREATE DATABASE POC4;
USE POC4;

create table author (
id int primary key,
name varchar(100)
);

select * from author;

create table post(
id int primary key,
name varchar(100),
authorid int,
foreign key(authorid) references author(id)
,
createdts datetime
);

select * from post;

create table user (
id int primary key,
name varchar(100)
);

create table comment (
id int primary key,
content varchar(1000),
postid int,
foreign key(postid) references post(id)
,
createdts datetime,
userid int, 
foreign key (userid) references user(id)

);

select * from comment;

INSERT INTO USER(id,name) VALUES(1,'JIM'),
(2,'DWIGHT'),
(3,'PAM'),
(4,'KELLY'),
(5,'MICHAEL'),
(6,'MIKE'),
(7,'RAJ'),
(8,'DONNA'),
(9,'SHELDON'),
(10,'JUAN');

select * from user;



INSERT INTO AUTHOR(id,name) VALUES(1,'JAMES BOND');

INSERT INTO POST(id,name,authorid,createdts) VALUES (1,'SPECTRE',1,now());
INSERT INTO POST(id,name,authorid,createdts) VALUES (2,'NO WAY TO DIW',1,now());



INSERT INTO COMMENT(id,content,postid,createdts,userid) VALUES(12,'GREAT POST',2,now(),2),
(13,'NICE POST',2,now(),4),
(14,'AVERAGE',2,now(),6),
(15,'NOT BAD',2,now(),8),
(16,'LOOKS GOOD',2,now(),10),
(17,'NOT MY TYPE',2,now(),1),
(18,'DISAGREE',2,now(),3),
(19,'LMAO',2,now(),5),
(20,'NICE ONE',2,now(),7),
(21,'GGS',2,now(),9);




INSERT INTO COMMENT(id,content,postid,createdts,userid) VALUES(11,'Marvellous',1,now(),1);

INSERT INTO COMMENT(id,content,postid,createdts,userid) VALUES(77,'dc',1,now(),8);

INSERT INTO COMMENT(id,content,postid,createdts,userid) VALUES(88,'football',2,now(),8);

select * from post;




SELECT * 
FROM (
	SELECT *, row_number() OVER (PARTITION BY postid ORDER BY createdts DESC) AS rn
    FROM comment
) c
JOIN post p 
ON p.id = c.postid
WHERE p.authorid = (SELECT id from AUTHOR WHERE NAME='JAMES BOND') AND rn <= 10
ORDER BY c.createdts DESC;