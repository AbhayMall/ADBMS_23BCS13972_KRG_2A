create table author(
author_id int primary key,
author_name varchar(30));

create table book(
book_id int primary key,
book_title varchar(30),
author_id int,
foreign key (author_id) references author(author_id));



insert into author ( author_id , author_name) values
(1,'William'),
(2,'Robert'),
(3,'Anurag');

insert into book(book_id , book_title , author_id) values
(101, 'DBMS', 1),
(102, 'OS', 2),
(103, 'CN', 3),
(104, 'ADBMS', 1),  
(105, 'Modern OS', 2);


select * from author;
select * from book;

select b.book_id , a.author_name
from book as B
inner join
author as A
on
b.author_id = a.author_id;

