use quanlikhachhang;

create table SanPham(

 MaSP int primary key ,
 TenSP varchar(50)
);
create table KhachHang(

MaKH int primary key,
TenKH varchar(50)

);
create table HoaDon(

MaHD int primary key,
MaKH int,
NgayTao date,
foreign key (MaKH) references KhachHang(MaKH)

);
create table HoaDonChiTiet(

MaHD int,
MaSP int,
SoLuong int,
DonGia int,
primary key(MaHD,MaSP),
foreign key (MaHD) references HoaDon(MaHD),
 foreign key (MaSP) references SanPham(MaSP)

);
insert into SanPham
values (1,'Tivi'),(2,'Tu lanh'),(3,'May giat');

insert into KhachHang
values (1,'Tuan'),(2,'Linh'),(3,'Huong');

insert into HoaDon
values(1,1,'10/10/2020'),(2,3,now());

insert into HoaDon
values(3,2,'10/10/2020'),(4,1,now());

insert into HoaDonChiTiet
values (1,1,10,1000),(1,2,5,2000),(2,1,20,1000),(2,3,1,5000);

insert into HoaDonChiTiet
values (3,1,4,1000),(3,2,6,2000),(4,1,20,1000),(4,2,1,5000);

select * from SanPham;
select * from KhachHang;
select * from HoaDon;
select * from HoaDonChiTiet;
--
select maHD
from HoaDon join KhachHang on HoaDon.maKH=KhachHang.maKH
where tenKH='linh';

select TenSP
from SanPham join HoaDonChiTiet on SanPham.maSP = HoaDonChiTiet.maSP
where HoaDonChiTiet.maHD = 1;

select sum(SoLuong * DonGia) as TongTien from HoaDonChiTiet;

select sum(SoLuong*DonGia) as TongTienNgay from HoaDonChiTiet
 join HoaDon on HoaDonChiTiet.MaHD=HoaDon.MaHD
where NgayTao = date(now());

select maHD,sum(SoLuong * DonGia) as TongTien
from HoaDonChiTiet
group by maHD
having TongTien > 20000
order by maHD desc;
insert into KhachHang values (4, 'Trung'),
(5, 'Tung');

select TenKH from KhachHang
where MaKH not in (select MaKH from HoaDon);