use master 
drop database QL_TRANGTRIDATTIEC;
CREATE DATABASE QL_TRANGTRIDATTIEC



USE QL_TRANGTRIDATTIEC

set dateformat dmy;
go
Create table KHACHHANG 
(
	MAKH Char(5) primary key not null,
	TENKH nvarchar(30),
	GIOITINH float,
	NGAYSINH date,
	SDT varchar (11),
	GMAIL nvarchar(40),
	MALOAIKH char(5),
	MAKV char(5)
)
create table KHUVUC 
(
	MAKV char(5) primary key not null,
	TENDUONG nvarchar(30),
	TENTP nvarchar (50),
	TENMIEN nvarchar(50),
)

Create table LOAIKHACHHANG 
(
	MALOAIKH char(5) primary key not null,
	TENLOAI nvarchar(20),
	GIAMGIA decimal(5,2)
)

Create table DICHVU
(
	MADV char(5) primary key not null,
	TENDV nvarchar(50)
)
create table CUAHANG
(
	MACH char(5) primary  key not null,
	TENCH nvarchar (30), 
	DIACHI nvarchar (50),
	MALOAICH char (5)
)
create table LOAICUAHANG
(
	MALCH char(5) primary  key not null,
	TENLCH nvarchar (30),
)

Create table HOADON
(
	MAHD char(5) primary key not null,
	MACH char(5),
	MAKH char(5),
	MADV char(5),
	NGAYLAPHD datetime,
)
Create table HANGHOA 
(
	MAHH char(5) primary key not null,
	TENHH nvarchar(50),
	SOLUONG int,
	DONGIA money,
	DVT nvarchar(10),
	MALOAIHH char(5)
)
Create table LOAIHANGHOA
(
	MALOAIHH char (5) primary key not null,
	TENLOAI nvarchar(30),
)
Create table CTHOADON
(
	MAHD char (5) not null,
	MAHH char (5) not null,
	SOLUONG int,
	DONGIA money,
	Constraint PK_CTHOADON primary key (MAHD,MAHH)
)

alter table CUAHANG 
add constraint FK_CUAGHANG_LOAICH	foreign key (MALOAICH)  references LOAICUAHANG(MALCH);
Alter table KHACHHANG 
add constraint FK_KHACHH_LOAI_KH foreign key (MALOAIKH) references LOAIKHACHHANG(MALOAIKH); 

Alter table KHACHHANG 
add constraint FK_KHACHH_Khuvuc foreign key (MAKV) references KHUVUC(MAKV); 




Alter table CTHOADON
Add Constraint FK_CTHOADON_HANGHOA foreign key (MAHH) references HANGHOA(MAHH);
Alter table CTHOADON
Add Constraint FK_CTHOADON_HOADON foreign key (MAHD) references HOADON(MAHD);

---------------------------------------------------bang chi tiet hoa don hang hoa -----------------------------------


Alter table HOADON
Add Constraint FK_HOADON_CH foreign key (MACH) references CUAHANG(MACH);

Alter table HOADON
Add Constraint FK_HOADON_KH foreign key (MAKH) references KHACHHANG(MAKH);

Alter table HOADON
Add Constraint FK_HOADON_DV foreign key (MADV) references DICHVU(MADV);

------------------------------------------------bang hang hoa ---------------------------------------------
Alter table HANGHOA
Add constraint FK_HANHHOA_LOAIHH foreign key (MALOAIHH) references LOAIHANGHOA(MALOAIHH);

-------------------------------------------------------Them vao loai khach hang --------------------------------------------------------
Insert into LOAIKHACHHANG
Values ('LK001',N'Thân thiết',0.1);
Insert into LOAIKHACHHANG
Values ('LK002',N'Lâu năm',0.2);
Insert into LOAIKHACHHANG
Values ('LK003',N'Mới đăng ký',0);

-----------------------------------------------------Them vao khu vuc -------------------------------------------------------
Insert into KHUVUC
values ('KV001',N'Thanh thai',N'HCM','NAM');
Insert into KHUVUC
values ('KV002',N'Cau giay',N'HA NOI','BAC');
Insert into KHUVUC
values ('KV003',N'Duong gan vung tau',N'VUNG TAU','NAM');
Insert into KHUVUC
values ('KV004','3 thang 2','HCM','NAM');
Insert into KHUVUC
values ('KV005',N'Nguyen trai','HCM','NAM');


-----------------------------------------------------Them vao Khach hang ----------------------------------------------------------
Insert into KHACHHANG
values ('KH001',N'Nguyễn Văn A',1,'20-02-1989','0230xxx','van1@gmail.com','LK003','KV001');
Insert into KHACHHANG
values ('KH002',N'Nguyễn Văn B',1,'20-01-1889','0230xxx','van2@gmail.com','LK001','KV002');
Insert into KHACHHANG
values ('KH003',N'Nguyễn Toàn ',1,'14-03-1989','0230xxx','vantoan@gmail.com','LK002','KV003');
Insert into KHACHHANG
values ('KH004',N'Nguyễn Thị Hồng',0,'05-02-1989','0230xxx','Truvan@gmail.com','LK003','KV004');
Insert into KHACHHANG
values ('KH005',N'Trần Văn Dậu',1,'28-06-1989','0230xxx','vandau@gmail.com','LK001','KV005');
Insert into KHACHHANG
values ('KH006',N'Nguyễn Công Trứ',1,'10-03-1991','0230xxx','vantru@gmail.com','LK002','KV002');
Insert into KHACHHANG
values ('KH007',N'Nguyễn Văn Hậu',1,'13-01-1990','0230xxx','van09@gmail.com','LK003','KV001');
Insert into KHACHHANG
values ('KH008',N'Vũ Văn A',0,'05-09-1989','0230xxx','Vuvan@gmail.com','LK001','KV002');
Insert into KHACHHANG
values ('KH009',N'Phong Hạ Phát',1,'19-12-1979','0230xxx','vanphong@gmail.com','LK002','KV003');
Insert into KHACHHANG
values ('KH010',N'Minh Hữu Thọ',1,'21-02-2000','0230xxx','vantho@gmail.com','LK003','KV004');




---------------------------------------------------Them vao Loai hang hóa ----------------------------------------
insert into LOAIHANGHOA
values ('ML001',N'Thức Ăn');
insert into LOAIHANGHOA
values ('ML002',N'Nước uống');
insert into LOAIHANGHOA
values ('ML003',N'Hàng gia dụng');
insert into LOAIHANGHOA
values ('ML004',N'Vật liệu trang trí');


--------------------------------------------------------------------------------------------------------------
insert into HANGHOA
values ('HH001',N'Bàn',200,20000,N'Cái','ML003');
insert into HANGHOA
values ('HH002',N'Ghế',250,10000,N'Cái','ML003');
insert into HANGHOA
values ('HH003',N'Chén',200,20000,N'Cái','ML003');
insert into HANGHOA
values ('HH004',N'Đĩa',200,20000,N'Cái','ML003');
insert into HANGHOA
values ('HH005',N'Muỗng',200,20000,N'Cái','ML003');
insert into HANGHOA
values ('HH006',N'Ly',200,20000,N'Cái','ML003');
insert into HANGHOA
values ('HH007',N'Ống hút',200,5000,N'Cái','ML003');
insert into HANGHOA
values ('HH008',N'Trái cây',300,15000,N'Trái','ML001');
insert into HANGHOA
values ('HH009',N'Coca',300,15000,N'Chai','ML002');
insert into HANGHOA
values ('HH010',N'Pepsi',300,15000,N'Chai','ML002');
insert into HANGHOA
values ('HH011',N'7 UP',300,15000,N'Chai','ML002');
insert into HANGHOA
values ('HH012',N'hoa các loai',300,15000,N'Bó','ML004');
insert into HANGHOA
values ('HH013',N'Khăn trải bàn',300,15000,N'Cái','ML004');
insert into HANGHOA
values ('HH014',N'Bóng Bay',300,15000,N'Chai','ML002');
insert into HANGHOA
values ('HH015',N'BÁNH',300,15000,N'Cái','ML001');
-------------------------------------------------------Them dich vu ------------------------------------------------------
insert into DICHVU
values ('DV001',N'Trang trí sinh nhật');
insert into DICHVU
values ('DV002',N'Trang trí Tân gia');
insert into DICHVU
values ('DV003',N'Trang trí đám tang');
insert into DICHVU
values ('DV004',N'Trang trí tiệc cưới');

-----------------------------------------------------Thêm Nhan Vien ------------------------------------------------
--Them cua hang --------------------------------------------------------------
insert into LOAICUAHANG
values ('LCH01',N'Cửa hàng chính');
insert into LOAICUAHANG
values ('LCH02',N'Cửa hàng phụ');

Insert into CUAHANG 
values ('CH001',N'Cửa hàng thứ 1',N'Địa chỉ A','LCH01');
Insert into CUAHANG 
values ('CH002',N'Cửa hàng thứ 2',N'Địa chỉ B','LCH02');
-----------------------------------------------Them hoa Don  ----------------------------------------------------------------------
Insert into HOADON
values ('HD001','CH001','KH001','DV001','22/01/2020');
Insert into HOADON
values ('HD002','CH002','KH002','DV002','25/02/2020');
Insert into HOADON
values ('HD003','CH001','KH003','DV003','22/03/2020');
Insert into HOADON
values ('HD004','CH002','KH001','DV004','10/01/2020');
Insert into HOADON
values ('HD005','CH001','KH002','DV001','12/05/2020');
Insert into HOADON
values ('HD006','CH002','KH003','DV002','24/01/2020');
Insert into HOADON
values ('HD007','CH001','KH004','DV003','09/02/2020');
Insert into HOADON
values ('HD008','CH002','KH005','DV004','14/06/2020');
Insert into HOADON
values ('HD009','CH001','KH006','DV001','23/12/2020');
Insert into HOADON
values ('HD010','CH002','KH007','DV002','15/07/2020');

--------------------------------------------- THÊM CHI TIẾT DỊCH VỤ -------------------------------------------------------------
insert into CTHOADON
values ('HD001','HH001',20,10000);
insert into CTHOADON
values ('HD001','HH002',10,20000);
insert into CTHOADON
values ('HD001','HH003',30,10000);
insert into CTHOADON
values ('HD001','HH004',50,15000);
insert into CTHOADON
values ('HD001','HH005',20,20000);
insert into CTHOADON
values ('HD002','HH001',10,20000);
insert into CTHOADON
values ('HD002','HH002',25,20000);
insert into CTHOADON
values ('HD002','HH005',15,20000);
insert into CTHOADON
values ('HD002','HH007',23,20000);
insert into CTHOADON
values ('HD003','HH007',21,20000);
insert into CTHOADON
values ('HD003','HH008',12,20000);
insert into CTHOADON
values ('HD003','HH002',13,20000);
insert into CTHOADON
values ('HD003','HH001',19,20000);
insert into CTHOADON
values ('HD004','HH002',50,20000);
insert into CTHOADON
values ('HD004','HH004',14,20000);
insert into CTHOADON
values ('HD004','HH003',15,20000);
insert into CTHOADON
values ('HD004','HH005',10,20000);
insert into CTHOADON
values ('HD005','HH008',16,20000);
insert into CTHOADON
values ('HD005','HH009',20,20000);
insert into CTHOADON
values ('HD005','HH010',15,20000);
insert into CTHOADON
values ('HD005','HH002',28,20000);
insert into CTHOADON
values ('HD006','HH001',30,20000);
insert into CTHOADON
values ('HD006','HH004',32,20000);
insert into CTHOADON
values ('HD006','HH002',39,20000);
insert into CTHOADON
values ('HD006','HH003',40,20000);
insert into CTHOADON
values ('HD007','HH001',21,20000);
insert into CTHOADON
values ('HD007','HH002',10,20000);
insert into CTHOADON
values ('HD007','HH003',5,20000);
insert into CTHOADON
values ('HD007','HH005',2,20000);
insert into CTHOADON
values ('HD008','HH002',15,20000);
insert into CTHOADON
values ('HD008','HH001',20,20000);
insert into CTHOADON
values ('HD008','HH004',30,20000);
insert into CTHOADON
values ('HD008','HH003',10,20000);
insert into CTHOADON
values ('HD009','HH005',25,20000);
insert into CTHOADON
values ('HD009','HH006',21,20000);
insert into CTHOADON
values ('HD009','HH007',10,20000);
insert into CTHOADON
values ('HD009','HH008',30,20000);
insert into CTHOADON
values ('HD010','HH009',40,20000);
insert into CTHOADON
values ('HD010','HH010',50,20000);
insert into CTHOADON
values ('HD010','HH001',60,20000);
insert into CTHOADON
values ('HD010','HH002',70,20000);

--------------------------------------------- THÊM CHI TIẾT DỊCH VỤ hàng hóa  -------------------------------------------------------------



go
alter view fact_view 
as
select NGAYLAPHD,MACH,MAKH,MADV,MAHH,SOLUONG,DONGIA*SOLUONG as DOANHTHU,id_date
from HOADON hd, CTHOADON ct
where hd.MAHD=ct.MAHD;
go
select * from KHACHHANG
select * from fact_view
go
create view DIM_DATE_FACT as
select NGAYLAPHD,DAY(NGAYLAPHD)as day,MONTH(NGAYLAPHD) as month,YEAR(NGAYLAPHD) as year,
DATEPART("dw",NGAYLAPHD) as 'date of week',DATEPART("QQ",NGAYLAPHD) as 'quarter'
from HOADON
go
create view DIM_DATE_KH as
select NGAYSINH,DAY(NGAYSINH)as day,MONTH(NGAYSINH) as month,YEAR(NGAYSINH) as year,Year(GETDATE())-YEAR(NGAYSINH) as TUOI,
DATEPART("dw",NGAYSINH) as 'date of week',DATEPART("QQ",NGAYSINH) as 'quarter'
from KHACHHANG
go

GO
ALTER TABLE HOADON ADD id_date INT IDENTITY(1,1) 
GO 




create procedure [dbo].[spthemCH_check_constraint] (@MACH char(5),@TENCH nvarchar(50),@DIACHI nvarchar(50),@MALOAICH char (5))
as 
begin 
	if not exists (select MACH from CUAHANG where MACH=@MACH)
		Begin 
			Insert into CUAHANG(MACH,TENCH,DIACHI,MALOAICH) values (@MACH,@TENCH,@DIACHI,@MALOAICH)
		end
end
GO

set dateformat dmy
Insert into HOADON
values ('HD011','CH002','KH010','DV001','15/07/2021');

insert into CTHOADON
values ('HD011','HH009',40,20000);
insert into CTHOADON
values ('HD011','HH010',50,20000);
insert into CTHOADON
values ('HD011','HH001',60,20000);
insert into CTHOADON
values ('HD011','HH002',70,20000);