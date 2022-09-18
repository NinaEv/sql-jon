create table customers
(
    id           serial primary key,
    name         varchar(255) not null,
    surname      varchar(255) not null,
    age          int check ( age > 0 ) check ( age < 110 ),
    phone_number varchar(20)
);

create table orders
(
    id           serial primary key,
    date         datetime default now(),
    customer_id  int references customers (id),
    product_name varchar(255) not null,
    amount       int check ( amount > 0 )
);

insert into customers (name, surname, age, phone_number)
values ('Alina', 'Popova', 30, '+79142229492'),
       ('Nina', 'Ev', 26, '+79143330808'),
       ('Kate', 'Spring', 50, '+41123759'),
       ('John', 'Smith', 30, '+45750'),
       ('Alexey', 'Svetlov', 47, '+7915228000'),
       ('alexey', 'Ivanov', 18, '+79150003000'),
       ('Lidiya', 'Semenova', 25, '+41120000'),
       ('alexey', 'Petrov', 36, '+41125555');

insert into orders (customer_id, product_name, amount)
values (1, 'eyelash', 110),
       (8, 'picture', 350),
       (6, 'telescope', 3000),
       (5, 'bread', 30),
       (4, 't-shirt', 1000),
       (3, 'jeans', 2500),
       (2, 'dress', 3000),
       (7, 'glasses', 5000);

create index c_name on customers (name);

select o.product_name
from orders o
         join customers c
              on o.customer_id = c.id
where c.name = 'alexey';


