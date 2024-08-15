--Tao CSDL
USE master
go
create database QlSinhVien_DDL
go
 
 --thiet ke bang khoa
use QlSinhVien_DDL
go 
create table dbo.KKhoa(
		MaKhoa nvarchar(8) not null,
		TenKhoa nvarchar(50) null,
		NgayTHanhLap date null, 
		GhiChu ntext null,
		primary key (MaKhoa)
		)
		go

--Thiet ke bang lop
create table dbo.Lop (
		MaLop nvarchar (8) not null,
		TenLop nvarchar (50) null,
		GVCN nvarchar (100) null,
		MaKhoa nvarchar (8) null,
		GhiChu ntext null,
		primary key (MaLop),
		foreign key (MaKHoa) references dbo.khoa(MaKhoa)
		)
		go



create table dbo.SinhVien (
		MaSV nvarchar (10) not null,
		HoSV nvarchar (50) null,
		TenSV nvarchar (20) null,
		GioiTinh nvarchar (50) null,
		NgaySinh datetime null,
		DiaChi nvarchar (100) null,
		MaLop nvarchar (8) null,
		QueQuan nvarchar (50) null,
		DienThoaiDD nvarchar (12) null,
		GhiChu ntext null,
		primary key (MaSV),
		foreign key (MaLop) references dbo.Lop(MaLop)
		)
		go

create table dbo.MonHoc (
		MaMH int not null,
		TenMH nvarchar(50) null,
		SoTinChi float null,
		MaKhoaPhuTrach nvarchar(8) null,
		GhiChu ntext null,
		primary key (MaMH),
		foreign key (MaKhoaPhuTrach) references dbo.Khoa(MaKhoa)
		)
		go

--thiet ke bang hoc

create table dbo.Hoc (
		MaMH int not null,
		MaSV nvarchar (10) not null,
		NgayDangKyMH date not null,
		DiemTBMH float null,
		GhiChu ntext null,
		primary key (MaMH, MaSV, NgayDangKyMH),
		foreign key (MaMH) references dbo.MonHoc (MaMH),
		foreign key (MaSV) references dbo. SinhVien (MaSV)
		)
		go


use QlSinhVien_DDL
go 

drop table Hoc
go
drop table MonHoc
go
drop table SinhVien
go
drop table Lop
go 
drop table khoa
go