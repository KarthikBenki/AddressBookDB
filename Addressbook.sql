Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> ^C
mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------------+
| Database                 |
+--------------------------+
| address_book_service     |
| employee_payroll_service |
| information_schema       |
| mysql                    |
| payroll_service          |
| performance_schema       |
| sakila                   |
| sys                      |
| testdb                   |
| world                    |
+--------------------------+
10 rows in set (0.00 sec)

mysql> USE Address_Book_Service;
Database changed
mysql> create table addressBook
    -> (
    -> firstName VARCHAR(32) NOT NULL,
    -> lastName VARCHAR(32) NOT NULL,
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(32) NOT NULL,
    -> state VARCHAR(32) NOT NULL,
    -> zip INT unsigned NOT NULL,
    -> phoneNumber INT unsigned NOT NULL,
    -> email VARCHAR(150) NOT NULL,
    -> PRIMARY KEY (firstName)
    ->  );
Query OK, 0 rows affected (0.04 sec)

mysql> Describe addressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(32)  | NO   | PRI | NULL    |       |
| lastName    | varchar(32)  | NO   |     | NULL    |       |
| address     | varchar(150) | NO   |     | NULL    |       |
| city        | varchar(32)  | NO   |     | NULL    |       |
| state       | varchar(32)  | NO   |     | NULL    |       |
| zip         | int unsigned | NO   |     | NULL    |       |
| phoneNumber | int unsigned | NO   |     | NULL    |       |
| email       | varchar(150) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.02 sec)

mysql> insert into addressBook (firstName, lastName, address, city, state, zip, phoneNumber, email) VALUES
    -> ('Sneha', 'Khan', 'Dighi', 'Pune', 'MH', 570017, 676767, 'SK@gmail.com'),
    -> ('Raj', 'potu', 'Kher', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com'),
    -> ('Sravani', 'Katta', 'Manchiryal', 'Tn', 'Tn', 1230017, 124767, 'Spr@gmail.com');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city  | state | zip     | phoneNumber | email         |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Pune  | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn    | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
3 rows in set (0.00 sec)

mysql> update addressBook set city = 'Mumbai' where firstName = 'Sneha';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar  | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
3 rows in set (0.00 sec)

mysql> delete from addressBook  where firstName = 'Raj';
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
2 rows in set (0.00 sec)

mysql> insert into addressBook (firstName, lastName, address, city, state, zip,phoneNumber, email) VALUES
    -> ('Raj', 'potu', 'Satar', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com');
Query OK, 1 row affected (0.01 sec)

mysql> select * from addressBook where city = 'Satar';
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| firstName | lastName | address | city  | state | zip    | phoneNumber | email        |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| Raj       | potu     | Satar   | Satar | MH    | 879617 |      877767 | Rp@gmail.com |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
1 row in set (0.00 sec)

mysql> select city, Count(firstName) from addressBook group by city;
+--------+------------------+
| city   | Count(firstName) |
+--------+------------------+
| Satar  |                1 |
| Mumbai |                1 |
| Tn     |                1 |
+--------+------------------+
3 rows in set (0.00 sec)

mysql> select * from addressBook where city = 'Mumbai' ORDER BY firstName ASC;
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| firstName | lastName | address | city   | state | zip    | phoneNumber | email        |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| Sneha     | Khan     | Dighi   | Mumbai | MH    | 570017 |      676767 | SK@gmail.com |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
1 row in set (0.00 sec)

mysql>