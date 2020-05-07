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