create database BanLapTop2;
go
use BanLapTop2;
go

create table Categories (
	id int identity(1, 1) primary key,
	CategoryName nvarchar(50) not null
);
go

create table Discounts (
	id int identity(1, 1) primary key,
	StartDate Date,
	EndDate Date,
	DiscountPercent int not null
);
go

create table Suppliers (
	id int identity(1, 1) primary key,
	SupplierName nvarchar(50) not null
);
go

create table Products (
	id int identity(1, 1) primary key,
	ProductName nvarchar(100) not null,
	Price int not null,
	Quantity int not null,
	CategoryId int references Categories(id),
	SupplierId int references Suppliers(id),
	Available bit,
	Image varchar(150) not null,
	Details nvarchar(255)
);
go

create table DiscountProduct (
	DiscountId int references Discounts(id),
	ProductId int references Products(id),
	primary key(DiscountId, ProductId)
);
go

create table Roles (
	 id int identity(1, 1) primary key,
	 RoleName nvarchar(50),
);
go

create table Accounts (
	id int identity(1, 1) primary key,
	Username varchar(50) not null,
	Password varchar(50) not null,
	Email nvarchar(100) not null,
	Fullname nvarchar(100) not null,
	RoleId int references Roles(id),
	Photo varchar(100)
);
go

create table Favorites(
	AccountId int references Accounts(id),
	ProductId int references Products(id),
	primary key(AccountId, ProductId)
);
go

create table Orders (
	id int identity(1, 1) primary key,
	OrderDate date,
	Address nvarchar(100),
	Status nvarchar(100),
	AccountId int references Accounts(id)
);
go

create table OrderDetails (
	id int identity(1, 1) primary key,
	OrderId int references Orders(id),
	ProductId int references Products(id),
	UnitPrice int,
	Quantity int
);
go

create table cart(
	id int identity(1, 1) primary key,
	ProductId int references Products(id),
	AccountId int references Accounts(id),
	quantity int,
	total int
);
go

insert into Categories values 
(N'Laptop'),
(N'Điện thoại'),
(N'Máy tính bảng'),
(N'Chuột'),
(N'Bàn phím'),
(N'Tai nghe'),
(N'USB'),
(N'Củ sạc'),
(N'Dây sạc'),
(N'Đồng hồ');
go

insert into Discounts values
('2024-01-12','2024-02-12',3),
('2024-02-13','2024-03-13',10),
('2024-03-14','2024-04-14',7),
('2024-04-15','2024-05-15',4),
('2024-05-16','2024-06-16',2),
('2024-06-17','2024-07-17',15),
('2024-07-18','2024-08-18',14),
('2024-08-19','2024-09-19',12),
('2024-09-20','2024-10-20',10),
('2024-10-21','2024-11-21',15);
go


insert into Suppliers values
(N'MSI'),
(N'DELL'),
(N'LENOVO'),
(N'RAZOR'),
(N'ACER'),
(N'ASUS'),
(N'SAMSUNG'),
(N'APPLE'),
(N'OPPO'),
(N'EDRA');
go


insert into Products values
(N'Samsung A12',3000000,10,2,7,1,'1', N''),
(N'Laptop Msi gf63 thin 11uc',1900000,7,1,1,1,'1', N''),
(N'Apple 15 pro max',20000000,20,2,8,1,'1', N''),
(N'Oppo extra',14000000,11,2,9,1,'1', N''),
(N'Laptop Acer limited',40000000,20,1,5,1,'1', N''),
(N'Laptop Asus gaming FX12',21000000,15,1,6,1,'1', N''),
(N'Laptop Razor 13',22000000,13,1,4,1,'1', N''),
(N'Samsung S21 ultra',24000000,14,2,7,1,'1', N''),
(N'Apple 11',10000000,12,2,8,1,'1', N''),
(N'Laptop Dell giới hạn 3',50000000,13,1,2,1,'1', N''),
(N'Laptop Asus gaming FX16',25000000,20,1,6,1,'1', N''),
(N'Laptop Acer thế hệ 2',90000000,1,1,2,1,'1', N'');
go

insert into Roles values
(N'Admin'),
(N'Quản trị viên'),
(N'Khách hàng');
go


insert into Accounts values 
('PhongNoob','123','phongnpps28519@gmail.com',N'Nguyễn Phước Phong',1,'2'),
('ToaiNoToi','123','toailm@gmail.com',N'Lý Minh Toại',1,'2'),
('Tai','123','Taic@gmail.com',N'Chí Tài',1,'2'),
('HaiHo','123','honh@gmail.com',N'Nguyễn Hải Hồ',2,'2'),
('PhuVo','123','Phuv@gmail.com',N'Võ Phú',2,'2'),
('LongKhongLong','123','longvnb@gmail.com',N'Vũ Nguyễn Bảo Long',2,'2'),
('Duc','123','ducnv@gmail.com',N'Nguyễn Văn Đức',3,'2'),
('Kiet','123','kietdh@gmail.com',N'Đặng Hoàng Kiệt',3,'2'),
('QuaDuong','123','quad@gmail.com',N'Dương Quá',3,'2'),
('LongCo','123','longc@gmail.com',N'Cô Long',3,'2');
go

insert into Favorites values
(1,2),
(2,4),
(3,6),
(4,3),
(5,5),
(6,7),
(7,8),
(8,9),
(9,10),
(10,1);
go


insert into Orders values
('2024-01-15',N'26/5 Trường Chinh tp.Hồ Chí Minh',N'Đã nhận được hàng',1),
('2024-02-20',N'17 Âu Cơ tp.Hồ Chí Minh',N'Đã nhận được hàng',2),
('2024-03-21',N'Phường 6 Bẫy sậy tp.Hồ Chí Minh',N'Chưa nhận được hàng',3),
('2024-04-11',N'2 Cộng Hòa tp.Hồ Chí Minh',N'Đã nhận được hàng',4),
('2024-05-3',N'2/3/5 Thủ Đức',N'Đã nhận được hàng',5),
('2024-06-8',N'7 Phan Văn Quá tp.Hồ Chí Minh',N'Chưa nhận được hàng',6),
('2024-07-19',N'2/5 Song Hành tp.Hồ Chí Minh',N'Đã nhận được hàng',7),
('2024-08-22',N'6/3 Trường Chinh tp.Hồ Chí Minh',N'Chưa nhận được hàng',8),
('2024-11-11',N'6/8 Chợ Lớn tp.Hồ Chí Minh',N'Chưa nhận được hàng',9),
('2024-12-14',N'11/5 HongKong tp.Hồ Chí Minh',N'Đã nhận được hàng',10);
go

insert into OrderDetails values
(1,1,3000000,1),
(2,2,1900000,1),
(3,3,20000000,1),
(4,4,14000000,1),
(5,5,40000000,1),
(6,6,21000000,1),
(7,7,22000000,1),
(8,8,24000000,1),
(9,9,10000000,1),
(10,10,50000000,1);
go

insert into DiscountProduct values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);
go




