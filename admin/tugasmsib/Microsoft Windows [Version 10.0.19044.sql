Microsoft Windows [Version 10.0.19044.2846]
(c) Microsoft Corporation. All rights reserved.

C:\Users\DELL>D:

D:\>E:

E:\>cd \MSIB\xampp\mysql\bin

E:\MSIB\xampp\mysql\bin>mysql -u root -p
Enter password:
ERROR 2002 (HY000): Can't connect to MySQL server on 'localhost' (10061)

E:\MSIB\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko1tugas;
Database changed
MariaDB [dbtoko1tugas]> SELECT * FROM pesanan;
+----+------------+---------+--------------+-----+
| id | tanggal    | total   | pelanggan_id | ket |
+----+------------+---------+--------------+-----+
|  1 | 2023-03-03 | 9720000 |            1 |   0 |
|  2 | 2015-11-04 |   17500 |            3 |   0 |
|  3 | 2015-11-04 |       0 |            6 |   0 |
|  4 | 2015-11-04 |       0 |            7 |   0 |
|  5 | 2015-11-04 |       0 |           10 |   0 |
|  6 | 2015-11-04 |       0 |            2 |   0 |
|  7 | 2015-11-04 |       0 |            5 |   0 |
|  8 | 2015-11-04 |       0 |            4 |   0 |
|  9 | 2015-11-04 |       0 |            8 |   0 |
| 10 | 2015-11-04 |       0 |            9 |   0 |
| 13 | 2023-03-03 |  200000 |            1 |   0 |
| 14 | 2022-02-02 |   30000 |            1 |   0 |
+----+------------+---------+--------------+-----+
12 rows in set (0.001 sec)

MariaDB [dbtoko1tugas]> SELECT * FROM pembayaran;
Empty set (0.000 sec)

MariaDB [dbtoko1tugas]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    1 | 5040000 |
|  2 |         3 |          1 |    1 | 4680000 |
|  3 |         5 |          2 |    3 |    3500 |
|  6 |         5 |          3 |   10 |    3500 |
|  7 |         1 |          3 |    1 | 5040000 |
|  9 |         5 |          5 |   10 |    3500 |
| 10 |         5 |          6 |   20 |    3500 |
| 11 |         3 |          2 |    3 | 5000000 |
+----+-----------+------------+------+---------+
8 rows in set (0.000 sec)

MariaDB [dbtoko1tugas]> INSERT INTO pesanan_items (produk_id,pesanan_id,qty,harga) values
    -> (5,1,1,5000);
Query OK, 1 row affected (0.401 sec)

MariaDB [dbtoko1tugas]> SELECT * FROM pesanan_items;
+----+-----------+------------+------+---------+
| id | produk_id | pesanan_id | qty  | harga   |
+----+-----------+------------+------+---------+
|  1 |         1 |          1 |    1 | 5040000 |
|  2 |         3 |          1 |    1 | 4680000 |
|  3 |         5 |          2 |    3 |    3500 |
|  6 |         5 |          3 |   10 |    3500 |
|  7 |         1 |          3 |    1 | 5040000 |
|  9 |         5 |          5 |   10 |    3500 |
| 10 |         5 |          6 |   20 |    3500 |
| 11 |         3 |          2 |    3 | 5000000 |
| 12 |         5 |          1 |    1 |    5000 |
+----+-----------+------------+------+---------+
9 rows in set (0.000 sec)

MariaDB [dbtoko1tugas]> CREATE TRIGGER kranjang_items BEFORE INSERT ON pesanan_items
    -> FOR EACH ROW
    -> BEGIN
    -> SET @stok = (SELECT stok FROM produk WHERE id = NEW.produk_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [dbtoko1tugas]> SELECT * FROM produk;
+----+------+------------------+------------+------------+------+----------+-----------------+
| id | kode | nama             | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | Televisi 21 inch |    3500000 |    5040000 |    5 |        2 |               1 |
|  2 | TV02 | Televisi 40 inch |    5500000 |    7440000 |    4 |        2 |               1 |
|  3 | K001 | Kulkas 2 pintu   |    3500000 |    4680000 |    3 |        2 |               1 |
|  4 | M001 | Meja Makan       |     500000 |     600000 |    4 |        3 |               2 |
|  5 | TK01 | Teh Kotak        |       3000 |       3500 |    5 |       10 |               4 |
|  6 | PC01 | PC Desktop HP    |    7000000 |    9600000 |    9 |        2 |               5 |
|  7 | TB01 | Teh Botol        |       2000 |       2500 |   53 |       10 |               4 |
|  8 | AC01 | Notebook Acer    |    8000000 |   10800000 |    7 |        2 |               5 |
|  9 | LN01 | Notebook Lenovo  |    9000000 |   12000000 |    9 |        2 |               5 |
| 10 | L004 | Laptop HP        |   12000000 |   13000000 |   20 |        5 |               5 |
+----+------+------------------+------------+------------+------+----------+-----------------+
10 rows in set (0.001 sec)

MariaDB [dbtoko1tugas]> show triggers
    -> $$
    -> \c
MariaDB [dbtoko1tugas]> show triggers;
+-------------------------+--------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                 | Event  | Table         | Statement                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Timing | Created                | sql_mode              | Definer        | character_set_client | collation_connection | Database Collation |
+-------------------------+--------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------+----------------+----------------------+----------------------+--------------------+
| kranjang_items          | INSERT | pesanan_items | BEGIN
SET @stok = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa = @stok - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | BEFORE | 2023-05-04 11:39:46.50 | NO_AUTO_VALUE_ON_ZERO | root@localhost | utf8mb4              | utf8mb4_general_ci   | utf8mb4_general_ci |
| transaksi_update_before | UPDATE | pesanan_items | BEGIN
IF OLD.id = NEW.produk_id THEN
SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa = (@stok + OLD.qty) = NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
ELSE
SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa_lama = (@stok_lama + OLD.qty);
UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa_baru = @stok_baru - NEW.qty;
IF @sia_baru < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak tersedia';
END IF;
UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
END IF;
END | BEFORE | 2023-05-04 11:39:46.58 | NO_AUTO_VALUE_ON_ZERO | root@localhost | utf8mb4              | utf8mb4_general_ci   | utf8mb4_general_ci |
+-------------------------+--------+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------+----------------+----------------------+----------------------+--------------------+
2 rows in set (0.016 sec)

MariaDB [dbtoko1tugas]> delimiter $$
MariaDB [dbtoko1tugas]> create trigger kranjang_items
    -> before update on produk
    -> for each row
    -> begin
    -> insert into log_harga_produk
    -> set id = old.kode_produk,
    -> stok_baru=new.harga,
    -> stok_lama=old.harga,
    -> waktu_perubahan = now();
    -> end$$
ERROR 1054 (42S22): Unknown column 'kode_produk' in 'OLD'
MariaDB [dbtoko1tugas]> create trigger kranjang_items
    -> before update on produk
    -> for each row
    -> begin
    -> insert into log_harga_produk
    -> set id = old.id,
    -> stok_baru=new.harga,
    -> stok_lama=old.harga,
    -> waktu_perubahan = now();
    -> end$$
ERROR 1054 (42S22): Unknown column 'harga' in 'NEW'
MariaDB [dbtoko1tugas]> create trigger kranjang_items
    -> before update on produk
    -> for each row
    -> begin
    -> insert into log_harga_produk
    -> set id = old.id,
    -> stok_baru=new.stok,
    -> stok_lama=old.stok,
    -> waktu_perubahan = now();
    -> end$$
ERROR 1359 (HY000): Trigger 'dbtoko1tugas.kranjang_items' already exists
MariaDB [dbtoko1tugas]> create trigger before_produk_update
    -> before update on produk
    -> for each row
    -> begin
    -> insert into log_harga_produk
    -> set id = old.id,
    -> stok_baru=new.stok,
    -> stok_lama=old.stok,
    -> waktu_perubahan = now();
    -> end$$
Query OK, 0 rows affected (0.380 sec)

MariaDB [dbtoko1tugas]> delimiter ;
MariaDB [dbtoko1tugas]> insert into 'pesanan_items pelanggan memesan didalam table pesanan' values ('9','5','5','20',3500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''pesanan_items pelanggan memesan didalam table pesanan' values ('9','5','5','...' at line 1
MariaDB [dbtoko1tugas]> insert into 'pesanan_items' values ('9','5','5','20',3500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''pesanan_items' values ('9','5','5','20',3500)' at line 1
MariaDB [dbtoko1tugas]> insert into 'pesanan_items' values ('9','5','5','10',3500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''pesanan_items' values ('9','5','5','10',3500)' at line 1
MariaDB [dbtoko1tugas]> insert into 'pesanan_items' values ('9','5','5','10',3500);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''pesanan_items' values ('9','5','5','10',3500)' at line 1
MariaDB [dbtoko1tugas]> select * from pembayaran;
Empty set (0.001 sec)

MariaDB [dbtoko1tugas]> create table pembayaran(
    -> id varchar (50) not null,
    -> nama varchar (200) not null,
    -> password varchar (200) not null,
    -> created_at datetime not null,
    -> updated_at timestamp,
    -> \c
MariaDB [dbtoko1tugas]> create table pembayaran(
    -> id varchar (50) not null,
    -> nama varchar (200) not null,
    -> qty varchar (200) not null,
    -> harga int not null,
    -> updated_at timestamp,
    -> primary key (id)
    -> );
ERROR 1050 (42S01): Table 'pembayaran' already exists
MariaDB [dbtoko1tugas]> create table pembayaran1(
    -> id varchar (50) not null,
    -> nama varchar (200) not null,
    -> qty varchar (200) not null,
    -> harga int not null,
    -> updated_at timestamp,
    -> primary key (id)
    -> );
Query OK, 0 rows affected (0.569 sec)

MariaDB [dbtoko1tugas]> select * from pembayaran1;
Empty set (0.001 sec)

MariaDB [dbtoko1tugas]> show tables;
+------------------------+
| Tables_in_dbtoko1tugas |
+------------------------+
| detail_produk_vw       |
| jenis_produk           |
| kartu                  |
| pelanggan              |
| pembayaran             |
| pembayaran1            |
| pembelian              |
| pesanan                |
| pesanan_items          |
| produk                 |
| vendor                 |
+------------------------+
11 rows in set (0.001 sec)

MariaDB [dbtoko1tugas]> desc pembayaran1;
+------------+--------------+------+-----+---------------------+-------------------------------+
| Field      | Type         | Null | Key | Default             | Extra                         |
+------------+--------------+------+-----+---------------------+-------------------------------+
| id         | varchar(50)  | NO   | PRI | NULL                |                               |
| nama       | varchar(200) | NO   |     | NULL                |                               |
| qty        | varchar(200) | NO   |     | NULL                |                               |
| harga      | int(11)      | NO   |     | NULL                |                               |
| updated_at | timestamp    | NO   |     | current_timestamp() | on update current_timestamp() |
+------------+--------------+------+-----+---------------------+-------------------------------+
5 rows in set (0.014 sec)

MariaDB [dbtoko1tugas]> insert into pembayaran1 values ("01","Teh Kotak","2",3500);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [dbtoko1tugas]> insert into pembayaran1 values ("01","Teh Kotak","2","3500");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [dbtoko1tugas]> insert into pembayaran1 values ("01","Teh Kotak","2","3500","03:00");
Query OK, 1 row affected, 1 warning (0.472 sec)

MariaDB [dbtoko1tugas]> select * from pembayaran1;
+----+-----------+-----+-------+---------------------+
| id | nama      | qty | harga | updated_at          |
+----+-----------+-----+-------+---------------------+
| 01 | Teh Kotak | 2   |  3500 | 0000-00-00 00:00:00 |
+----+-----------+-----+-------+---------------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1tugas]> create table pembayaran1(
    -> id varchar (50) not null,
    -> nama varchar (200) not null,
    -> qty varchar (200) not null,
    -> harga int not null,
    -> status_pembayaran varchar (200) not null,
    -> updated_at timestamp,
    -> primary key (id)
    -> );
ERROR 1050 (42S01): Table 'pembayaran1' already exists
MariaDB [dbtoko1tugas]> update table pembayaran1(
    -> id varchar (50) not null,
    -> nama varchar (200) not null,
    -> qty varchar (200) not null,
    -> harga int not null,
    -> status_pembayaran varchar (200) not null,
    -> updated_at timestamp,
    -> primary key (id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'table pembayaran1(
id varchar (50) not null,
nama varchar (200) not null,
qty...' at line 1
MariaDB [dbtoko1tugas]> drop pembayaran;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'pembayaran' at line 1
MariaDB [dbtoko1tugas]> select * from pembayaran1;
+----+-----------+-----+-------+---------------------+-------------------+
| id | nama      | qty | harga | updated_at          | status_pembayaran |
+----+-----------+-----+-------+---------------------+-------------------+
| 01 | Teh Kotak | 2   |  3500 | 0000-00-00 00:00:00 |                   |
+----+-----------+-----+-------+---------------------+-------------------+
1 row in set (0.000 sec)

MariaDB [dbtoko1tugas]> desc pembayaran1;
+-------------------+--------------+------+-----+---------------------+-------------------------------+
| Field             | Type         | Null | Key | Default             | Extra                         |
+-------------------+--------------+------+-----+---------------------+-------------------------------+
| id                | varchar(50)  | NO   | PRI | NULL                |                               |
| nama              | varchar(200) | NO   |     | NULL                |                               |
| qty               | varchar(200) | NO   |     | NULL                |                               |
| harga             | int(11)      | NO   |     | NULL                |                               |
| updated_at        | timestamp    | NO   |     | current_timestamp() | on update current_timestamp() |
| status_pembayaran | varchar(200) | NO   |     | NULL                |                               |
+-------------------+--------------+------+-----+---------------------+-------------------------------+
6 rows in set (0.014 sec)

MariaDB [dbtoko1tugas]> insert into pembayaran1 values ("01","Teh Kotak","2","3500","03:00","lunas");
ERROR 1062 (23000): Duplicate entry '01' for key 'PRIMARY'
MariaDB [dbtoko1tugas]> update into pembayaran1 values ("01","Teh Kotak","2","3500","03:00","lunas");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'into pembayaran1 values ("01","Teh Kotak","2","3500","03:00","lunas")' at line 1
MariaDB [dbtoko1tugas]> insert into set status_pembayaran='lunas';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'set status_pembayaran='lunas'' at line 1
MariaDB [dbtoko1tugas]> insert into pembayaran1 values ("02","Teh Kotak","2","3500","03:00","lunas");
Query OK, 1 row affected, 1 warning (0.372 sec)

MariaDB [dbtoko1tugas]> select * from pembayaran1;
+----+-----------+-----+-------+---------------------+-------------------+
| id | nama      | qty | harga | updated_at          | status_pembayaran |
+----+-----------+-----+-------+---------------------+-------------------+
| 01 | Teh Kotak | 2   |  3500 | 0000-00-00 00:00:00 |                   |
| 02 | Teh Kotak | 2   |  3500 | 0000-00-00 00:00:00 | lunas             |
+----+-----------+-----+-------+---------------------+-------------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko1tugas]>


