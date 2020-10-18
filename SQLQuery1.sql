use LTWebCoBan

create table comments
( 
   commentID int IDENTITY(1,1),
   userID_pk int not null,
   chiTietDHid_pk int not null,
  createDate datetime not null,
  content ntext not null,
  active bit not null,
  idCommentReplied int null,
  constraint khoa_chinh_comment primary key (commentID,userID_pk,chiTietDHid_pk)
)

--drop table comments
create table userLikeComment
( 
   userID_pk int not null,
   commentID_pk int not null,
  constraint pk_userLikeComment primary key (userID_pk,commentID_pk)
)

create table adminLikeComment
( 
   adminID_pk int not null,
   commentID_pk int not null,
  constraint pk_adminLikeComment primary key (adminID_pk,commentID_pk)
)

---get 4 dong hồ is sale
select top 4 ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture,(ctdt.price - ctdt.price*ctdt.sale/100) as priceSale
from ChiTietDongHo ctdt, LoaiDongHo ldh
where ctdt.typeDHid_pk=ldh.typeDHid and sale>0 and ctdt.active=1
---get 6 dong hồ theo mã loại
select top 6 ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
from ChiTietDongHo ctdt, LoaiDongHo ldh
where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.typeDHid_pk=5 --and sale=0 

--lấy các đồng hồ theo code
select top 20 ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
from ChiTietDongHo ctdt, LoaiDongHo ldh
where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.code like '%at%'
-------
create table DonDatHang(
	id int identity primary key,
	ngayLap datetime default getdate(),
	ghiChu nvarchar(100),
	tinhTrang int default 1,--0 là chưa xác nhận, 1 là xác nhận(chưa giao), 2 là đang giao ,3 là đã thanh toán
	kieuThanhToan int, --1 là thanh toán khi nhận hàng COD, 2 là thành toán online
	hoTen nvarchar(50),
	sdt nvarchar(11),
	email nvarchar(50),
	diaChi nvarchar(50)
)
create table ChiTietDonDat(
	idDDH int references DonDatHang(id),
	idDH int references chiTietDongHo(chiTietDHid),
	soLuong int,
	constraint PK_CTDD primary key(idDDH,idDH),
)

create proc insertDonDatHang(@ghiChu nvarchar(100),@kieuThanhToan int,
							@hoTen nvarchar(50),@sdt nvarchar(11),
							@email nvarchar(50),@diaChi nvarchar(50))
as begin
	insert into DonDatHang(ghiChu,kieuThanhToan,hoTen,sdt,email,diaChi)
	values(@ghiChu,@kieuThanhToan,@hoTen,@sdt,@email,@diachi)
end

create proc insertChiTietDonDat(@idDH int,@soLuong int)
as begin
	declare @idDDH int
	select @idDDH=max(id) from DonDatHang --lấy id hóa đơn vừa thêm
	insert into ChiTietDonDat
	values(@idDDH,@idDH,@soLuong)
end

create procedure GetDonHang
as
begin
	SELECT id,tinhTrang as intTinhTrang,ngayLap,
		   CASE tinhTrang
				WHEN 0 THEN N'Chưa xác nhận'
				when 1 then N'Đã xác nhận'
				when 2 then N'Đang giao'
				when 3 then N'Đã thanh toán'
				else N'error'
		   END as tinhTrang,
		   case kieuThanhToan
				when 1 then N'COD'
				when 2 then N'Online'
				else N'error'
		   end as kieuThanhToan,
		   hoTen,sdt,email,diaChi,ghiChu
	FROM DonDatHang
end

exec GetDonHang

alter procedure GetDetailDonHangByID(@id int=0)
as
begin
	select ldh.nameTypeDH +N' '+ dh.code as ten,dh.price,ldh.xuatXu as xuatXu, ct.soLuong
	from ChiTietDonDat as ct, ChiTietDongHo as dh, LoaiDongHo ldh
	where ct.idDDH=@id and ct.idDH=dh.chiTietDHid and ldh.typeDHid=dh.typeDHid_pk
end

exec GetDetailDonHangByID 5

create procedure editDonHang(@id int=-1,@tinhTrang int=0)
as
begin
	update DonDatHang
	set tinhTrang=@tinhTrang
	where id=@id
end