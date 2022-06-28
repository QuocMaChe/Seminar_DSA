create database QLDetai_2
go
use QLDetai_2
go
create table KHOA
(
	MAKHOA varchar(5),
	TENKHOA nvarchar(30),
	NAMTL int,
	PHONG varchar(4),
	DIENTHOAI varchar(10),
	TRUONGKHOA varchar(4),
	NGAYNHANCHUC datetime
	Constraint PK_KHOA primary key (MAKHOA)
)
create table BOMON
(
	MABM varchar(5),
	TENBM nvarchar(40),
	PHONG varchar(4),
	DIENTHOAI varchar(10),
	TRUONGBM varchar(4),
	MAKHOA varchar(5),
	NGAYNHANCHUC datetime
	Constraint PK_BOMON primary key (MABM)
)
create table GIAOVIEN
(
	MAGV varchar(4),
	HOTEN nvarchar(40),
	LUONG int,
	PHAI nvarchar(4),
	NGAYSINH datetime,
	DIACHI nvarchar(40),
	GVQLCM varchar(4),
	MABM varchar(5)
	Constraint PK_GIAOVIEN primary key (MAGV)
)
create table DETAI 
(
	MADT varchar(4),
	TENDT nvarchar(40),
	CAPQL nvarchar(10),
	KINHPHI int,
	NGAYBD datetime,
	NGAYKT datetime,
	MACD varchar(10),
	GVCNDT varchar(4),
	constraint PK_DETAI primary key (MADT)
)
CREATE TABLE CONGVIEC 
(
	MADT varchar(4),
	SOTT int,
	TENCV nvarchar(50),
	NGBD datetime,
	NGAYKT datetime,
	constraint PK_CONGVIEC primary key (MADT,SOTT)
)
create table CHUDE 
(
	MACD varchar(10),
	TENCD nvarchar(40),
	constraint PK_CHUDE primary key (MACD)
)
create table NGUOITHAN 
(
	MAGV varchar(4),
	TEN nvarchar(40),
	NGAYSINH datetime,
	PHAI nvarchar(4),
	constraint PK_NGUOITHAN primary key (MAGV,TEN)
)
create table GV_DT 
(
	MAGV varchar(4),
	DIENTHOAI varchar(10)
	constraint PK_GV_DT primary key (MAGV,DIENTHOAI)
)
create table THAMGIADT 
(
	MAGV varchar(4),
	MADT varchar(4),
	STT int,
	PHUCAP int,
	KETQUA nvarchar(10),
	constraint PK_THAMGIADT primary key (MAGV,MADT,STT)
)
--KHOA(TRUONGKHOA)-->GIAOVIEN(MAGV)
alter table KHOA
add constraint FK_KHOA_GiAOVIEN foreign key (TRUONGKHOA) references GIAOVIEN (MAGV)
--BOMON(MAKHOA)-->KHOA(MAKHOA)
alter table BOMON
add constraint FK_BOMON_KHOA foreign key (MAKHOA) references KHOA (MAKHOA)
--BOMON(TRUONGBM)-->GIAOVIEN(MAGV)
alter table BOMON
add constraint FK_BOMON_GIAOVIEN foreign key (TRUONGBM) references GIAOVIEN (MAGV)
--GIAOVIEN(GVQLCM)-->GIAOVIEN(MAGV)
alter table GIAOVIEN
add constraint FK_GVQLCM_GIAOVIEN foreign key (GVQLCM) references GIAOVIEN (MAGV)
--GIAOVIEN(MABM)-->BOMON(MABM)
alter table GIAOVIEN
add constraint FK_GIAOVIEN_BOMON foreign key (MABM) references BOMON (MABM)
--CONGVIEC(MADT)-->DETAI(MADT)
alter table CONGVIEC
add constraint FK_CONGVIEC_DETAI foreign key (MADT) references DETAI (MADT)
--DETAI(MACD)-->CHUDE(MACD)
alter table DETAI
add constraint FK_DETAI_CHUDE foreign key (MACD) references CHUDE (MACD)
--DETAI(GVCNDT)-->GIAOVIEN(MAGV)
alter table DETAI
add constraint FK_DETAI_GIAOVIEN foreign key (GVCNDT) references GIAOVIEN (MAGV)
--THAMGIADT(MADT,STT)-->CONGVIEC(MADT,SOTT)
alter table THAMGIADT
add constraint FK_THAMGIADT_CONGVIEC foreign key (MADT,STT) references CONGVIEC (MADT,SOTT)
--THAMGIADT(MAGV)-->GIAOVIEN(MAGV)
alter table THAMGIADT
add constraint FK_THAMGIADT_GIAOVIEN foreign key (MAGV) references GIAOVIEN (MAGV)
--NGUOITHAN(MAGV)-->GIAOVIEN(MAGV)
alter table NGUOITHAN
add constraint FK_NGUOITHAN_GIAOVIEN foreign key (MAGV) references GIAOVIEN (MAGV)
--GV_DT(MAGV)-->GIAOVIEN(MAGV)
alter table GV_DT
add constraint FK_GV_DT_GIAOVIEN foreign key (MAGV) references GIAOVIEN (MAGV)

--
alter table GIAOVIEN add constraint C_PHAI check (PHAI in (N'Nam',N'Nữ'))
alter table NGUOITHAN add constraint _PHAI check (PHAI in (N'Nam',N'Nữ'))


--KHOA
--insert into KHOA(MaKhoa,TenKhoa,NamTL,Phong,DienThoai) values('CNTT',N'Công Nghệ Thông Tin',1995,'B11','0838123456')
--insert into KHOA(MaKhoa,TenKhoa,NamTL,Phong,DienThoai) values('HH',N'Hóa Học',1980,'B41','0838456456')
insert into KHOA values ('CNTT',N'Công Nghệ Thông Tin',1995,'B11','0838123456',NULL,NULL)
insert into KHOA values ('HH',N'Hóa Học',1980,'B41','0838456456',NULL,NULL)
insert into KHOA values ('SH',N'Sinh Học',1980,'B31','0838454545',NULL,NULL)
insert into KHOA values ('VL',N'Vật Lý',1976,'B21','0838223223',NULL,NULL)

--BOMON
insert into BOMON values ('CNTT',N'Công Nghệ Tri Thức','B15',NULL,NULL,'CNTT',NULL)
insert into BOMON values ('HHC',N'Hóa Hữu Cơ','B44','0838222222',NULL,'HH',NULL)
insert into BOMON values ('HL',N'Hóa Lý','B42','0838878787',NULL,'HH',NULL)
insert into BOMON values ('HPT',N'Hóa Phân Tích','B43','0838777777',NULL,'HH',NULL)
insert into BOMON values ('HTTT',N'Hệ Thống Thông Tin','B13','0838125125',NULL,'CNTT',NULL)
insert into BOMON values ('MMT',N'Mạng Máy Tính','B16','0838676767',NULL,'CNTT',NULL)
insert into BOMON values ('SH',N'Sinh Hóa','B33','0838898989',NULL,'SH',NULL)
insert into BOMON values ('VLĐT',N'Vật Lý Điện Tử','B23','0838234234',NULL,'VL',NULL)
insert into BOMON values ('VLƯD',N'Vật Lý Ứng Dụng','B24','0838454545',NULL,'VL',NULL)
insert into BOMON values ('VS',N'Vi Sinh','B32','0838909090',NULL,'SH',NULL)

--GIAOVIEN
--alter table GIAOVIEN
--alter column Hoten nvarchar(30)
insert into GIAOVIEN values ('001',N'Nguyễn Hoài An',2000,N'Nam','1973-02-15',N'25/3 Lạc Long Quân,Q.10, TP HCM',NULL,'MMT')
insert into GIAOVIEN values ('002',N'Trần Trà Hương',2500,N'Nữ','1960-06-20',N'125 Trần Hưng Đạo, Q.1, TP HCM',NULL,'HTTT')
insert into GIAOVIEN values ('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','1975-05-11',N'12/21 Võ Văn Ngân Thủ Đức, TP HCM',NULL,'HTTT')
insert into GIAOVIEN values ('004',N'Trương Nam Sơn',2300,N'Nam','1959-06-20',N'215 Lý Thường Kiệt, TP Biên Hòa',NULL,'VS')
insert into GIAOVIEN values ('005',N'Lý Hoàng Hà',2500,N'Nam','1954-10-23',N'22/5 Nguyễn Xí,Q.Bình Thạnh, TH HCM',NULL,'VLĐT')
insert into GIAOVIEN values ('006',N'Trần Bạch Tuyết',1500,N'Nữ','1980-05-20',N'127 Hùng Vương, TP Mỹ Tho',NULL,'VS')
insert into GIAOVIEN values ('007',N'Nguyễn An Trung',2100,N'Nam','1976-06-05',N'3/2, TP Biên Hòa',NULL,'HPT')
insert into GIAOVIEN values ('008',N'Trần Trung Hiếu',1800,N'Nam','1977-08-06',N'22/11 Lý Thường Kiệt, TP Mỹ Tho',NULL,'HPT')
insert into GIAOVIEN values ('009',N'Trần Hoàng Nam',2000,N'Nam','1975-11-22',N'234 Trần Não, An Phú, TP HCM',NULL,'MMT')
insert into GIAOVIEN values ('010',N'Phạm Nam Thanh',1500,N'Nam','1980-12-12',N'221 Hùng Vương, Q.5, TP HCM',NULL,'HPT')
--DETAI
insert into DETAI values ('001',N'HTTT quản lý các trường ĐH','ĐHQG',20,'2007-10-20','2008-10-20',NULL,NULL)
insert into DETAI values ('002',N'HTTT Quản lý giáo vụ cho một Khoa',N'Trường',20,'2000-10-12','2001-10-20',NULL,NULL)
insert into DETAI values ('003',N'Nghiên cứu chế tạo sợi Nannô Platin','ĐHQG',300,'2008-05-15','2008-05-15',NULL,NULL)
insert into DETAI values ('004',N'Tạo vật liệu sinh học bằng màng ối người',N'Nhà nước',100,'2007-01-01','2009-12-31',NULL,NULL)
insert into DETAI values ('005',N'Ứng dụng hóa học xanh','Trường',200,'2003-10-10','2004-12-10',NULL,NULL)
insert into DETAI values ('006',N'Nghiên cứu tế bào gốc','Nhà nước',4000,'2006-10-20','2009-10-20',NULL,NULL)
insert into DETAI values ('007',N'HTTT quản lý thư viện ở các trường ĐH',N'Trường',20,'2009-05-10','2010-05-10',NULL,NULL)
--CONGVIEC
insert into CONGVIEC values ('001',1,N'Khởi tạo lập kế hoạch','2007-10-20','2008-12-20')
insert into CONGVIEC values ('001',2,N'Xác định yêu cầu','2008-12-21','2008-3-21')
insert into CONGVIEC values ('001',3,N'Phân tích hệ thống','2008-3-22','2008-5-22')
insert into CONGVIEC values ('001',4,N'Thiết kế hệ thống','2008-5-23','2008-6-23')
insert into CONGVIEC values ('001',5,N'Cài đặt thử nghiệm','2008-06-24','2008-10-20')
insert into CONGVIEC values ('002',1,N'Khởi tạo và lập kế hoạch','2009-05-10','2009-07-10')
insert into CONGVIEC values ('002',2,N'Xác định yêu cầu','2009-07-11','2009-10-11')
insert into CONGVIEC values ('002',3,N'Phân tích hệ thống','2009-10-12','2009-12-20')
insert into CONGVIEC values ('002',4,N'Thiết kế hệ thống','2009-12-21','2010-03-22')
insert into CONGVIEC values ('002',5,N'Cài đặt thử nghiệm','2010-03-23','2010-05-10')
insert into CONGVIEC values ('006',1,N'Lấy mẫu','2006-10-20','2007-02-20')
insert into CONGVIEC values ('006',2,N'Nuôi cấy','2007-02-21','2008-08-21')
--CHUDE
insert into CHUDE values ('NCPT',N'Nghiên cứu phát triển')
insert into CHUDE values ('QLGD',N'Quản lý giáo dục')
insert into CHUDE values ('UDCN',N'Ứng dụng công nghệ')
--NGUOITHAN
insert into NGUOITHAN values ('001',N'Hùng','1990-01-14',N'Nam')
insert into NGUOITHAN values ('001',N'Thùy','1994-12-08',N'Nữ')
insert into NGUOITHAN values ('003',N'Hà','1998-09-03',N'Nữ')
insert into NGUOITHAN values ('003',N'Thu','1998-09-03',N'Nữ')
insert into NGUOITHAN values ('007',N'Mai','2003-03-26',N'Nữ')
insert into NGUOITHAN values ('007',N'Vy','2000-02-14',N'Nữ')
insert into NGUOITHAN values ('008',N'Nam','1991-05-06',N'Nam')
insert into NGUOITHAN values ('009',N'An','1996-08-19',N'Nam')
insert into NGUOITHAN values ('010',N'Nguyệt','2006-01-14',N'Nữ')
--GV_DT
insert into GV_DT VALUES ('001','0838912112')
insert into GV_DT VALUES ('001','0903123123')
INSERT INTO GV_DT VALUES ('002','0913454545')
insert into GV_DT VALUES ('003','0838121212')
insert into GV_DT VALUES ('003','0903656565')
insert into GV_DT VALUES ('003','0937125125')
insert into GV_DT VALUES ('006','0937888888')
insert into GV_DT VALUES ('008','0653717171')
insert into GV_DT VALUES ('008','0913232323')
--THAMGIADT
insert into THAMGIADT values ('001','002',1,0,NULL)
insert into THAMGIADT values ('001','002',2,0,NULL)
insert into THAMGIADT values ('002','001',4,2,N'Đạt')
insert into THAMGIADT values ('003','001',1,1,N'Đạt')
insert into THAMGIADT values ('003','001',2,0,N'Đạt')
insert into THAMGIADT values ('003','001',4,1,N'Đạt')
insert into THAMGIADT values ('003','002',2,0,NULL)
insert into THAMGIADT values ('004','006',1,0,N'Đạt')
insert into THAMGIADT values ('004','006',2,1,N'Đạt')
insert into THAMGIADT values ('006','006',2,1.5,N'Đạt')
insert into THAMGIADT values ('009','002',3,0.5,NULL)
insert into THAMGIADT values ('009','002',4,1.5,NULL)
--CAP NHAP KHOA NGOAI
--KHOA
update KHOA set TRUONGKHOA='002', NGAYNHANCHUC='2005-02-20' where MAKHOA='CNTT'
update KHOA set TRUONGKHOA='007', NGAYNHANCHUC='2001-10-15' where MAKHOA='HH'
update KHOA set TRUONGKHOA='004', NGAYNHANCHUC='2000-10-11' where MAKHOA='SH'
update KHOA set TRUONGKHOA='005', NGAYNHANCHUC='2003-09-18' where MAKHOA='VL'
--BOMON
update BOMON set TRUONGBM='007',NGAYNHANCHUC='2007-10-15' where MABM='HPT'
update BOMON set TRUONGBM='002',NGAYNHANCHUC='2004-09-20' where MABM='HTTT'
update BOMON set TRUONGBM='001',NGAYNHANCHUC='2005-05-15' where MABM='MMT'
update BOMON set TRUONGBM='005',NGAYNHANCHUC='2006-02-18' where MABM='VLUD'
update BOMON set TRUONGBM='004',NGAYNHANCHUC='2007-01-01' where MABM='VS'
--GIAOVIEN
update GIAOVIEN set GVQLCM='002' where MAGV='003'
update GIAOVIEN set GVQLCM='004'where MAGV='006'
update GIAOVIEN set GVQLCM='007'where MAGV='008'
update GIAOVIEN set GVQLCM='001'where MAGV='009'
update GIAOVIEN set GVQLCM='007'where MAGV='010'
--DETAI
update DETAI set MACD='QLGD',GVCNDT='002' where MADT='001'
update DETAI set MACD='QLGD',GVCNDT='002' where MADT='002'
update DETAI set MACD='NCPT',GVCNDT='005' where MADT='003'
update DETAI set MACD='NCPT',GVCNDT='004' where MADT='004'
update DETAI set MACD='UDCN',GVCNDT='007' where MADT='005'
update DETAI set MACD='NCPT',GVCNDT='004' where MADT='006'
update DETAI set MACD='QLGD',GVCNDT='001' where MADT='007'

--Cho biết họ tên và mức lương của các giáo viên nữ.
select HOTEN,LUONG from GIAOVIEN where PHAI=N'Nữ'
--Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%.
select HOTEN,LUONG,LUONG*1.1 as N'Lương tăng 10%' from GIAOVIEN 
--Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên $2000 hoặc,giáo viên là trưởng bộ môn nhận chức sau năm 1995.
select distinct gv.MAGV from GIAOVIEN gv,BOMON bm where (gv.HOTEN='Nguyễn%' and gv.LUONG>2000) or (gv.MAGV=bm.TRUONGBM and year (bm.NGAYNHANCHUC)>1995) 
--Cho biết tên những giáo viên khoa Công nghệ thông tin.
select distinct gv.HOTEN from GIAOVIEN gv, BOMON bm where bm.MAKHOA='CNTT' and gv.MABM=bm.MABM
--Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó.
select distinct gv.*,bm.* from GIAOVIEN gv, BOMON bm where bm.TRUONGBM=gv.MAGV
--Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc.
select gv.MAGV,gv.HOTEN,bm.* from GIAOVIEN gv,BOMON bm where gv.MABM=bm.MABM
--Cho biết tên đề tài và giáo viên chủ nhiệm đề tài.
select TENDT,GVCNDT from DETAI 
--Với mỗi khoa cho biết thông tin trưởng khoa.
select gv.* from KHOA k,GIAOVIEN gv where k.TruongKhoa=gv.MAGV
--Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006.
select * from GIAOVIEN intersect select * from BOMON where MABM='006'
--Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài, đề tài thuộc về chủđề nào, họ tên người chủ nghiệm đề tài cùng với ngày sinh và địa chỉ của người ấy.
select dt.MADT,dt.TENDT,gv.HOTEN,gv.NGAYSINH,gv.DIACHI from DETAI dt, GIAOVIEN gv where dt.CAPQL='Thành Phố' and dt.GVCNDT=gv.MAGV
--Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên đó.
select * from GIAOVIEN gv, GIAOVIEN gvqlcm where gv.GVQLCM=gvqlcm.MAGV
--Tìm họ tên của những giáo viên được “Nguyễn Thanh Tùng” phụ trách trực tiếp.
select gv.HOTEN from GIAOVIEN gv, GIAOVIEN gv1 
--Cho biết tên giáo viên là trưởng bộ môn “Hệ thống thông tin”.
select gv.HOTEN from GIAOVIEN gv,BOMON bm where gv.MAGV=bm.TRUONGBM
--Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục.
select distinct gv.HOTEN from GIAOVIEN gv,DETAI dt,CHUDE cd,THAMGIADT tgdt where cd.MACD='QLGD' and cd.MACD=dt.MADT and gv.MAGV=tgdt.MADT
--Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH có thời gian bắt đầu trong tháng 3/2008.
select distinct cv.TENCV from DETAI dt,CONGVIEC cv where dt.TENDT='HTTT quản lý các trường ĐH' and dt.MADT=cv.MADT and year(dt.NGAYBD)>3-2008
--Cho biết tên giáo viên và tên người quản lý chuyên môn của giáo viên đó.
select distinct gv.HOTEN,gvqlcm.HOTEN from GIAOVIEN gv,GIAOVIEN gvqlcm where gv.GVQLCM=gvqlcm.MAGV
--Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007.
select cv.* from CONGVIEC cv where cv.NGBD between'01-01-2007'and '01-08-2007'
--Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
select gv2.HOTEN from GIAOVIEN gv1,BOMON bm,GIAOVIEN gv2 where gv1.HOTEN=N'Trần Trà Hương' and gv1.MABM=gv2.MABM
--Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.
select gv.* from GIAOVIEN gv,BOMON bm,DETAI dt where gv.MAGV=bm.TRUONGBM and gv.MAGV=dt.GVCNDT
--Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
select gv.HOTEN from GIAOVIEN gv,KHOA kh,BOMON bm where gv.MAGV=kh.TRUONGKHOA and gv.MAGV=bm.TRUONGBM
--Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài.
select gv.HOTEN from BOMON bm, DETAI dt, GIAOVIEN gv where gv.MAGV=bm.TRUONGBM and gv.MAGV=dt.GVCNDT 
--Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
select kh.TRUONGKHOA from KHOA kh,DETAI dt where kh.TRUONGKHOA=dt.GVCNDT
--Cho biết mã số các giáo viên thuộc bộ môn “HTTT” hoặc có tham gia đề tài mã “001”.
select gv.MAGV from BOMON bm,DETAI dt, GIAOVIEN gv where gv.MABM=N'HTTT' and (dt.MADT='001' and dt.MADT=gv.MAGV) 
--Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.
select distinct gv.* from GIAOVIEN gv,BOMON bm,GIAOVIEN gv1 where gv1.MAGV='002' and gv.MABM=gv1.MABM
--Tìm những giáo viên là trưởng bộ môn.
select gv.* from GIAOVIEN gv,BOMON bm where gv.MAGV=bm.TRUONGBM
--Cho biết họ tên và mức lương của các giáo viên.
select HOTEN,LUONG from GIAOVIEN


--Q35. Cho biết mức lương cao nhất của các giảng viên.
select distinct gv.LUONG from GIAOVIEN gv where gv.LUONG>=ALL(select LUONG from GIAOVIEN)
--Q36. Cho biết những giáo viên có lương lớn nhất.
SELECT *
FROM GIAOVIEN GV
 WHERE GV.LUONG = (SELECT MAX(LUONG)
       FROM GIAOVIEN)
--Q37. Cho biết lương cao nhất trong bộ môn “HTTT”.
select distinct LUONG from GIAOVIEN where LUONG>=ALL(select gv.LUONG from GIAOVIEN gv where gv.MABM='HTTT')
--Q38. Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin.
SELECT HOTEN
 FROM GIAOVIEN GV, BOMON BM
 WHERE BM.TENBM = N'Hệ thống thông tin' AND GV.MABM = BM.MABM
   AND YEAR(GV.NGAYSINH) = (SELECT MIN(YEAR(GV1.NGAYSINH))
        FROM GIAOVIEN GV1, BOMON BM1
        WHERE BM1.TENBM = N'Hệ thống thông tin' AND GV1.MABM = BM1.MABM
        )
--Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.
select HOTEN from GIAOVIEN gv1,BOMON bm where bm.MAKHOA='CNTT' and gv1.MABM=bm.MABM and NGAYSINH>=ALL(select gv.NGAYSINH from GIAOVIEN gv,BOMON bm1 where bm1.MAKHOA='CNTT' and gv.MABM=bm1.MABM)
--Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
SELECT GV.HOTEN, K.TENKHOA
 FROM GIAOVIEN GV, KHOA K, BOMON BM
 WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA AND (GV.LUONG = (SELECT MAX(LUONG) 
         FROM GIAOVIEN))
--Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.
select GV.HOTEN,BM.TENBM,GV.LUONG from GIAOVIEN GV,BOMON BM where BM.MABM=GV.MABM AND GV.LUONG>=ALL( select MAX(GV.LUONG) AS'LUONG MAX' from GIAOVIEN GV where GV.MABM=BM.MABM group by GV.MABM)
--Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.
SELECT TENDT
 FROM DETAI DT
 WHERE DT.MADT NOT IN (SELECT DT.MADT
      FROM GIAOVIEN GV,THAMGIADT TG
      WHERE GV.HOTEN = N'Nguyễn Hoài An'AND GV.MAGV = TG.MAGV
      )
--Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài, tên người chủ nhiệm đề tài.
select dt.TENDT, dt.GVCNDT from DETAI dt where dt.MADT not in (select dt.MADT from THAMGIADT tgdt,DETAI dt, GIAOVIEN gv where gv.HOTEN=N'Nguyễn Hoài An' and gv.MAGV=tgdt.MAGV and tgdt.MADT=dt.MADT)
--Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.
SELECT HOTEN
 FROM GIAOVIEN GV, DETAI DT, BOMON BM, KHOA K
 WHERE (K.TENKHOA = N'Công nghệ thông tin' AND K.MAKHOA = BM.MAKHOA AND GV.MABM = BM.MABM AND GV.MAGV NOT IN (SELECT MAGV FROM THAMGIADT))
-- Tìm những giáo viên không tham gia bất kỳ đề tài nào
select gv.HOTEN from GIAOVIEN gv where gv.MAGV not in (select tgdt.MAGV from DETAI dt,THAMGIADT tgdt)
--Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”
SELECT GV1.MAGV , GV1.HOTEN
 FROM GIAOVIEN GV1, GIAOVIEN GV2
 WHERE GV1.LUONG > GV2.LUONG AND GV2.HOTEN = N'Nguyễn Hoài An' AND GV1.MAGV != GV2.MAGV 
--Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
select gv.* from GIAOVIEN gv,BOMON bm where gv.MAGV=bm.TRUONGBM and gv.MAGV in (select tgdt.MAGV from DETAI dt,THAMGIADT tgdt)
-- Tìm giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn*
SELECT *
 FROM GIAOVIEN GV1, GIAOVIEN GV2
 WHERE GV1.HOTEN = GV2.HOTEN AND GV2.PHAI = GV1.PHAI  AND GV1.MAGV != GV2.MAGV AND GV1.MABM = GV2.MABM
--Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn “Công nghệ phần mềm”
select gv.* from GIAOVIEN gv where gv.LUONG>(select gv.LUONG from GIAOVIEN gv, BOMON bm where bm.TENBM=N'Công nghệ phần mềm' and gv.MABM=bm.MABM)
--Tìm những giáo viên có lương lớn hơn lương của tất cả giáo viên thuộc bộ môn “Hệ thống thông tin”
SELECT *
 FROM GIAOVIEN GV
 WHERE GV.LUONG >= ALL (SELECT GV1.LUONG
       FROM GIAOVIEN GV1, BOMON BM
       WHERE GV1.MABM = BM.MABM AND BM.TENBM = 'Hệ thống thông tin'
       )
--Cho biết tên khoa có đông giáo viên nhất
select k.TENKHOA,count(gv.MAGV) as SL from GIAOVIEN gv,BOMON bm,KHOA k where k.MAKHOA=bm.MAKHOA and bm.MABM=gv.MABM group by k.TENKHOA having count(gv.MAGV)>=all(select count(gv.MAGV) from GIAOVIEN gv,BOMON bm,KHOA k where k.MAKHOA=bm.MAKHOA and bm.MABM=gv.MABM group by k.TENKHOA)
--Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất
SELECT HOTEN
 FROM GIAOVIEN GV
 WHERE GV.MAGV IN (SELECT MAGV
       FROM GIAOVIEN GV1, DETAI DT1
       WHERE GV1.MAGV = DT1.GVCNDT 
       GROUP BY GV1.MAGV
       HAVING COUNT(*) >= ALL (SELECT GV2.MAGV
             FROM GIAOVIEN GV2, DETAI DT2
             WHERE GV2.MAGV = DT2.GVCNDT 
             GROUP BY GV2.MAGV)
       )
-- Cho biết mã bộ môn có nhiều giáo viên nhất
select MABM from GIAOVIEN group by MABM having count(*)>=all(select count(*) from GIAOVIEN gv group by gv.MABM)
--Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
SELECT HOTEN, TENBM
 FROM GIAOVIEN GV, BOMON BM
 WHERE GV.MABM = BM.MABM AND EXISTS      (SELECT GV2.MAGV
           FROM GIAOVIEN GV2, THAMGIADT TG
           WHERE GV2.MAGV = TG.MAGV  AND GV.MAGV = GV2.MAGV
           GROUP BY GV2.MAGV
           HAVING COUNT(*) >=ALL (SELECT (COUNT(*))
                 FROM GIAOVIEN GV3, THAMGIADT TG3
                 WHERE GV3.MAGV = TG3.MAGV
                 GROUP BY GV3.MAGV)
                )
--Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
select gv.HOTEN from GIAOVIEN gv where gv.MABM='HTTT' and gv.MAGV=(select tgdt.MAGV from THAMGIADT tgdt group by tgdt.MAGV having count(*)>=all(select count(*) from THAMGIADT tgdt group by tgdt.MAGV))
--Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
SELECT HOTEN, TENBM
 FROM GIAOVIEN GV, BOMON BM
 WHERE GV.MABM = BM.MABM AND GV.MAGV IN (SELECT GV.MAGV
           FROM GIAOVIEN GV, NGUOITHAN NT
           WHERE GV.MAGV = NT.MAGV
           GROUP BY GV.MAGV
           HAVING COUNT(*) >=ALL (SELECT COUNT(*)
                 FROM GIAOVIEN GV, NGUOITHAN NT
                 WHERE GV.MAGV = NT.MAGV
                 GROUP BY GV.MAGV)
                 )
--Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất.
select gv.HOTEN,count(*) as N'Số đề tài chủ nhiệm' from DETAI dt,GIAOVIEN gv,BOMON bm where gv.MAGV=dt.GVCNDT and bm.TRUONGBM=gv.MAGV group by gv.HOTEN,dt.GVCNDT having count(*)>=all(select count(dt.GVCNDT) from DETAI dt,GIAOVIEN gv where gv.MAGV=dt.GVCNDT group by dt.GVCNDT)





--Q58. Cho biết tên giáo viên nào mà tham gia đề tài đủ tất cả các chủ đề.
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV,THAMGIADT TG1
WHERE TG1.MAGV=GV.MAGV AND NOT EXISTS (
SELECT CD.MACD
FROM CHUDE CD
EXCEPT
SELECT DT.MACD
FROM DETAI DT, THAMGIADT TG
WHERE TG1.MAGV=TG.MAGV AND DT.MADT=TG.MADT 
)
--
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV,THAMGIADT TG,DETAI DT
WHERE GV.MAGV=TG.MAGV AND TG.MADT=DT.MADT 
GROUP BY GV.HOTEN
HAVING COUNT(DT.MACD)=(SELECT COUNT(MACD) FROM CHUDE )
--
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV,THAMGIADT TG1
WHERE TG1.MAGV=GV.MAGV AND NOT EXISTS (
SELECT CD.MACD
FROM CHUDE CD
WHERE NOT EXISTS(
SELECT DT.MACD
FROM DETAI DT, THAMGIADT TG
WHERE TG1.MAGV=TG.MAGV AND DT.MADT=TG.MADT AND DT.MACD=CD.MACD
))

--Q59. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn HTTT tham gia.
SELECT TENDT
FROM DETAI DT
WHERE DT.MADT IN(SELECT DT.MADT
FROM DETAI DT
WHERE NOT EXISTS (SELECT GV.MAGV
FROM GIAOVIEN GV
WHERE GV.MABM = 'HTTT'
EXCEPT
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE DT.MADT = TG.MADT 
))
--
SELECT DT.TENDT
FROM DETAI DT,GIAOVIEN GV,THAMGIADT TG
WHERE GV.MABM='HTTT' AND GV.MAGV=TG.MAGV AND DT.MADT=TG.MADT
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT GV.MAGV)=(SELECT COUNT(*) FROM GIAOVIEN GV WHERE GV.MABM='HTTT')
--
SELECT DT.TENDT
FROM DETAI DT
WHERE  NOT EXISTS(
SELECT GV.MAGV
FROM GIAOVIEN GV
WHERE GV.MABM='HTTT' AND NOT EXISTS(
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE TG.MADT=DT.MADT AND GV.MAGV=TG.MAGV
)
)
--Q60. Cho biết tên đề tài có tất cả giảng viên bộ môn “Hệ thống thông tin” tham gia
SELECT DT.TENDT
FROM DETAI DT
WHERE DT.MADT IN(SELECT MADT FROM DETAI WHERE
NOT EXISTS (
SELECT GV.MAGV
FROM GIAOVIEN GV,BOMON BM
WHERE BM.TENBM=N'HỆ THỐNG THÔNG TIN' AND GV.MABM=BM.MABM
EXCEPT
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE TG.MADT=DT.MADT
))
--
SELECT DT.TENDT
FROM DETAI DT,THAMGIADT TG, BOMON BM,GIAOVIEN GV
WHERE BM.TENBM=N'HỆ THỐNG THÔNG TIN' AND GV.MABM=BM.MABM AND TG.MAGV=GV.MAGV AND DT.MADT=TG.MADT
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT TG.MAGV)=(SELECT COUNT(GV.MAGV) FROM GIAOVIEN GV,BOMON BM WHERE BM.TENBM=N'HỆ THỐNG THÔNG TIN' AND GV.MABM=BM.MABM)
--
SELECT DT.TENDT
FROM DETAI DT
WHERE NOT EXISTS(
SELECT GV.MAGV
FROM GIAOVIEN GV, BOMON BM
WHERE BM.TENBM=N'HỆ THỐNG THÔNG TIN' AND GV.MABM=BM.MABM AND NOT EXISTS(
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE TG.MADT=DT.MADT AND TG.MAGV=GV.MAGV
)
)
--Q61. Cho biết giáo viên nào đã tham gia tất cả các đề tài có mã chủ đề là QLGD.
SELECT *
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT DT.MADT
FROM DETAI DT
WHERE DT.MACD = 'QLGD'
EXCEPT 
SELECT TG.MADT
FROM THAMGIADT TG
WHERE GV.MAGV = TG.MAGV)
--
SELECT GV.MAGV
FROM GIAOVIEN GV,THAMGIADT TG,DETAI DT
WHERE DT.MACD='QLGD' AND DT.MADT=TG.MADT AND GV.MAGV=TG.MAGV
GROUP BY GV.MAGV
HAVING COUNT(TG.MADT)=(SELECT COUNT(DT.MADT) FROM DETAI DT WHERE DT.MACD='QLGD')
--
SELECT GV.*
FROM GIAOVIEN GV
WHERE NOT EXISTS (
SELECT DT.MADT
FROM DETAI DT
WHERE DT.MACD='QLGD'AND NOT EXISTS(
SELECT TG.MADT
FROM THAMGIADT TG
WHERE TG.MADT=DT.MADT AND TG.MAGV=GV.MAGV
))
--Q62. Cho biết tên giáo viên nào tham gia tất cả các đề tài mà giáo viên Trần Trà Hương đã tham gia.
SELECT DISTINCT TG1.MAGV,GV.HOTEN
FROM THAMGIADT TG1,GIAOVIEN GV
WHERE TG1.MAGV=GV.MAGV AND GV.HOTEN=N'Trần Trà Hương'
AND NOT EXISTS 
((SELECT MADT  FROM DETAI )
EXCEPT
(SELECT MADT
FROM THAMGIADT TG2
WHERE TG2.MAGV=TG1.MAGV ))

Select GV.MAGV, GV.HOTEN From GIAOVIEN GV
INNER JOIN THAMGIADT TG on GV.MAGV = TG.MAGV
group by GV.MAGV, GV.HOTEN
having Count(DISTINCT TG.MADT) >= (
Select count(DISTINCT TG1.MADT) From GIAOVIEN GV1
Inner Join THAMGIADT TG1 on GV1.MaGV = TG1.MaGV
Where HOTEN = 'Trần Trà Hương'
)

--Q63. Cho biết tên đề tài nào mà được tất cả các giáo viên của bộ môn Hóa Hữu Cơ tham gia.
SELECT TENDT
FROM DETAI DT
WHERE DT.MADT IN(SELECT DT.MADT
FROM DETAI DT
WHERE NOT EXISTS (SELECT GV.MAGV
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM = BM.MABM AND BM.TENBM = N'Hóa hữu cơ'
EXCEPT
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE DT.MADT = TG.MADT
))
--Q64. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài 006.
SELECT DISTINCT GV.HOTEN
FROM THAMGIADT TG1,GIAOVIEN GV
WHERE TG1.MAGV=GV.MAGV AND TG1.MADT='006'
AND NOT EXISTS 
((SELECT STT  FROM DETAI )
EXCEPT
(SELECT TG2.STT
FROM THAMGIADT TG2
WHERE TG2.MAGV=TG1.MAGV ))
--Q65. Cho biết giáo viên nào đã tham gia tất cả các đề tài của chủ đề Ứng dụng công nghệ.
SELECT *
FROM GIAOVIEN GV
WHERE NOT EXISTS ((SELECT DT.MADT
FROM DETAI DT, CHUDE CD
WHERE DT.MACD = CD.MACD AND CD.TENCD = N'Ứng dụng công nghệ')
EXCEPT 
(SELECT TG.MADT
FROM THAMGIADT TG
WHERE GV.MAGV = TG.MAGV ))
--Q66. Cho biết tên giáo viên nào đã tham gia tất cả các đề tài của do Trần Trà Hương làm chủ nhiệm.
SELECT DISTINCT GV.HOTEN,GV.MAGV
FROM THAMGIADT TG, GIAOVIEN GV
WHERE GV.MAGV=TG.MAGV AND EXISTS
((SELECT DT.MADT
FROM DETAI DT, GIAOVIEN GV1
WHERE DT.GVCNDT=GV1.MAGV AND GV1.HOTEN=N'Trần Trà Hương')
EXCEPT
(SELECT TG1.MADT
FROM THAMGIADT TG1 , GIAOVIEN GV1
WHERE TG1.MAGV=TG.MAGV))
--Q67. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa CNTT tham gia.
SELECT DT.TENDT
FROM THAMGIADT TG1,GIAOVIEN GV, BOMON BM, DETAI DT
WHERE TG1.MAGV=GV.MAGV AND BM.MABM=GV.MABM AND BM.MAKHOA='HTTT' AND DT.MADT=TG1.MADT AND NOT EXISTS
((SELECT MADT
FROM DETAI DT)
EXCEPT
(SELECT TG.MADT
FROM THAMGIADT TG
WHERE TG.MAGV=TG1.MAGV))
--Q68. Cho biết tên giáo viên nào mà tham gia tất cả các công việc của đề tài Nghiên cứu tế bào gốc.
SELECT TENDT
FROM DETAI DT
WHERE DT.MADT IN(SELECT DT.MADT
FROM DETAI DT
WHERE NOT EXISTS (SELECT GV.MAGV
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = 'CNTT'
EXCEPT
SELECT TG.MAGV
FROM THAMGIADT TG
WHERE DT.MADT = TG.MADT))
--Q69. Tìm tên các giáo viên được phân công làm tất cả các đề tài có kinh phí trên 100 triệu?
SELECT GV.HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV IN (SELECT GV.MAGV
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT DT.MADT
FROM DETAI DT
WHERE DT.KINHPHI >100000000
EXCEPT
SELECT TG.MADT
FROM THAMGIADT TG
WHERE GV.MAGV = TG.MAGV
))
--Q70. Cho biết tên đề tài nào mà được tất cả các giáo viên của khoa Sinh Học tham gia.

--Q71. Cho biết mã số, họ tên, ngày sinh của giáo viên tham gia tất cả các công việc của đề tài “Ứng dụng hóa học xanh”.
SELECT GV.HOTEN, GV.MAGV, GV.NGAYSINH
FROM GIAOVIEN GV
WHERE GV.MAGV IN (SELECT GV.MAGV
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT DT.MADT, CV.SOTT
FROM DETAI DT, CONGVIEC CV
WHERE DT.MADT = CV.MADT AND DT.TENDT = N'Ứng dụng xanh'
EXCEPT
SELECT TG.MADT
FROM THAMGIADT TG
WHERE GV.MAGV = TG.MAGV))
--Q72. Cho biết mã số, họ tên, tên bộ môn và tên người quản lý chuyên môn của giáo viên tham gia tất cả các đề tài thuộc chủ đề “Nghiên cứu phát triển”.


