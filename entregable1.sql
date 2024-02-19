--Usuarios

create table users (
	id serial primary key,
	firstname varchar(50),
	lastname varchar(50),
	email varchar(100)
);

insert into users (firstname, lastname, email) values
('Jorge', 'Vera', 'jorge@gmail.com'),
('Alexandra' ,'Mota' ,'alexandra@gmail.com'),
('Carlos', 'Gonzales', 'carlos@gmail.com');

--- Post

create table post (
id serial primary key,
creator_id integer references users(id),
title varchar (100),
texts text 
);

insert into post (creator_id, title, texts) values
(1, 'Post 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(2, 'Post 2', 'Donec molestie arcu justo, vel pellentesque metus maximus in'),
(3, 'Post 3', 'Nulla dignissim nisl dapibus, venenatis augue ac, luctus enim'),
(1, 'Post 4','Nunc nec mauris massa'),
(2, 'Post 5', 'Maecenas eleifend accumsan dapibus');

--- like 

create table likes (
	id serial primary key,
	user_id integer references users(id),
	post_id int references post(id)
);

insert into likes (user_id, post_id) values
(2, 2),
(3, 1),
(1, 5),
(1, 4),
(2, 3);

--- traer informacion

select U.id,U.firstname, U.lastname, P.creator_id, P.texts from users U inner join likes L
on U.id = L.user_id inner join post P 
on L.post_id = P.id;

