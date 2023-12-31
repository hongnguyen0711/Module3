create database furama_management_system;
use furama_management_system;
create table vi_tri(
	ma_vi_tri int auto_increment primary key,
    ten_vi_tri varchar(45)
);
create table trinh_do(
	ma_trinh_do int auto_increment primary key,
	ten_trinh_do varchar(45)
);
create table bo_phan(
	ma_bo_phan int auto_increment primary key,
	ten_bo_phan varchar(45)
);
create table nhan_vien(
	ma_nhan_vien int auto_increment primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
	ma_vi_tri int,
	ma_trinh_do int,
	ma_bo_phan int,
    foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
	ma_loai_khach int auto_increment primary key,
    ten_loai_khach varchar(45)
);
create table khach_hang(
	ma_khach_hang int auto_increment primary key,
    ho_ten varchar(45),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_loai_khach int,
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);
create table loai_dich_vu(
	ma_loai_dich_vu int auto_increment primary key,
    ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
	ma_kieu_thue int auto_increment primary key,
    ten_kieu_thue varchar(45)
);
create table dich_vu(
	ma_dich_vu int auto_increment primary key,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
create table hop_dong(
	ma_hop_dong int auto_increment primary key,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
	foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
	foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
	foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int auto_increment primary key,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(45),
    trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int auto_increment primary key,
    so_luong int,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);
insert into vi_tri(ten_vi_tri) value ("Quản lý"),("Nhân viên");
insert into trinh_do(ten_trinh_do) value ("Trung cấp"),("Cao đẳng"),("Đại học"),("Sau đại học");
insert into bo_phan(ten_bo_phan) value ("Sale-Marketing"),("Hành chính"),("Phục vụ"),("Quản lý");
insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) value 
	("Nguyễn Văn An","1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
	("Lê Văn Bình","1997-04-09","654231234",7000000,"0934212314","binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
	("Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
	("Võ Công Toản","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4),
	("Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
	("Khúc Nguyễn An Nghi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
	("Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
	("Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghaguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
	("Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
	("Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);
insert into loai_khach(ten_loai_khach) value  ("Diamond"),("Platinium"),("Gold"),("Silver"),("Member"); 
insert into khach_hang( ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach) value 
	('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', '5'),
	('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', '3'),
	('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', '1'),
	('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', '1'),
    ('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '344343432', '0987654321', 'dactam@gmail.com', '224 Lý Thái Tổ, Gia Lai', '4'),
	('Tôn Nữ Mộc Châu', '2005-12-06', 0 , '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', '4'),
	('Nguyễn Mỹ Kim', '1984-04-08',0, '856453123', '0912345698', 'kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh', '1'),
	('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', '3'),
	('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', '1'),
	('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', '2');
insert into kieu_thue(ten_kieu_thue) value ("year"),("month"),("day"),("hour");
insert into loai_dich_vu(ten_loai_dich_vu) value ("Villa"),("House"),("Room");
insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu) value 
	( 'Villa Beach Front', '25000', '1000000', '10', 'vip', 'Có hồ bơi', '500', '4', null, '3', '1'),
	( 'House Princess 01', '14000', '5000000', '7', 'vip', 'Có thêm bếp nướng', null, '3', null, '2', '2'),
	( 'Room Twin 01', '5000', '1000000', '2', 'normal', 'Có tivi', null, null, '1 Xe máy, 1 Xe đạp', '4', '3'),
	( 'Villa No Beach Front', '22000', '9000000', '8', 'normal', 'Có hồ bơi', '300', '3', null, '3', '1'), 
	( 'House Princess 02', '10000', '4000000', '5', 'normal', 'Có thêm bếp nướng', null, '2', null, '3', '2'),
    ( 'Room Twin 02', '3000', '900000', '2', 'normal', 'Có tivi', null, null, '1 Xe máy', '4', '3');
insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value 
	("Karaoke",10000,"giờ","tiện nghi, hiện tại"),
	("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
	("Thuê xe đạp",20000,"chiếc","tốt"),
	("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
	("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
	("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");
insert into  hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) value 
	( '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
	( '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
	( '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
	( '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
	( '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
	( '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
	( '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
	( '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
	( '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
	( '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
	( '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
	( '2021-05-25', '2021-05-27', '0', '7', '10', '1');
insert into hop_dong_chi_tiet (ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem) value 
	('1', '5', '2', '4'),
	('2', '8', '2', '5'),
	('3', '15', '2', '6'),
	('4', '1', '3', '1'),
	('5', '11', '3', '2'),
	('6', '1', '1', '3'),
	('7', '2', '1', '2'),
    ('8', '2', '12', '2');
 
 -- cau 2
select * 
from nhan_vien
where (ho_ten like "K%" or ho_ten like "H%" or ho_ten like "T%") and char_length(ho_ten) <= 15;

select *
from nhan_vien 
where substring_index(ho_ten, ' ', -1) like "H%";

-- cau 3 
select * 
from khach_hang
where (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%") and timestampdiff(year,ngay_sinh,CURDATE()) between 18 and 50 ;

-- cau 4
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

-- cau 5 
select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.chi_phi_thue + ifnull((dich_vu_di_kem.gia*hop_dong_chi_tiet.so_luong),0) as tong_tien
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang =  hop_dong.ma_khach_hang  
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem;

-- cau 6
select  dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where dich_vu.ma_dich_vu not in (
select hop_dong.ma_dich_vu
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) = 2021 and quarter(hop_dong.ngay_lam_hop_dong) = 1 )
group by dich_vu.ma_dich_vu;

-- cau 7

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where dich_vu.ma_dich_vu not in(
select hop_dong.ma_dich_vu
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021)
and year(hop_dong.ngay_lam_hop_dong) = 2020
group by hop_dong.ma_dich_vu;

-- cau 8

select distinct khach_hang.ho_ten 
from khach_hang; 

select  khach_hang.ho_ten 
from khach_hang
group by khach_hang.ho_ten; 

select  khach_hang.ho_ten 
from khach_hang
union
select  khach_hang.ho_ten 
from khach_hang;
    
-- cau 9

select month(hop_dong.ngay_lam_hop_dong) as thang, count(hop_dong.ma_khach_hang) as so_khach_dat_phong
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by thang
order by thang; 
	
-- cau 10

select  hop_dong.ma_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, ifnull(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- cau 11

 select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
 from dich_vu_di_kem
 join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
 where ten_loai_khach = "Diamond" and dia_chi like "%Vinh%" or dia_chi like "%Quảng Ngãi%";
 
-- cau 12
select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dien_thoai, dich_vu.ten_dich_vu, ifnull(sum(hop_dong_chi_tiet.so_luong), 0) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc
from dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where (month(hop_dong.ngay_lam_hop_dong) >= 10 and year(hop_dong.ngay_lam_hop_dong) = 2020) 
and hop_dong.ma_hop_dong not in 
(select  hop_dong.ma_hop_dong
where month(hop_dong.ngay_lam_hop_dong) <=6 and year(hop_dong.ngay_lam_hop_dong) = 2021)
 group by hop_dong.ma_hop_dong;


-- cau 13

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem 
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem in
(select max(hop_dong_chi_tiet.so_luong)
from hop_dong_chi_tiet );

-- cau 14 

select hop_dong.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.ma_dich_vu_di_kem) as so_lan_su_dung
from  dich_vu_di_kem 
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_lan_su_dung = 1 
order by ma_hop_dong;

-- cau 15

select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten,trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi, count(hop_dong.ma_nhan_vien) as so_luong_hop_dong
from nhan_vien
join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where  year(hop_dong.ngay_lam_hop_dong) in (2020 , 2021)
group by hop_dong.ma_nhan_vien
having so_luong_hop_dong > 0 and so_luong_hop_dong < 4 ;

-- cau 16
-- create view v_nhan_vien as select nhan_vien.ma_nhan_vien
-- from nhan_vien
-- left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
-- group by nhan_vien.ma_nhan_vien
-- having nhan_vien.ma_nhan_vien not in
-- (select nhan_vien.ma_nhan_vien
-- from nhan_vien 
-- where count(hop_dong.ma_nhan_vien) >0);
-- set sql_safe_updates = 0;
-- update nhan_vien
-- set is_delete = 1
-- where ma_nhan_vien in (select * from v_nhan_vien);

-- cách 1 
alter table furama_management_system.nhan_vien
add column is_delete bit(1) not null default 0 after ma_bo_phan;

update nhan_vien
set is_delete = 1
where ma_nhan_vien not in 
(select *from (select nhan_vien.ma_nhan_vien
from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where  year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021) as temp);

select * 
from nhan_vien
where is_delete = 1;

-- cách 2 
delete from nhan_vien
where ma_nhan_vien not in 
(select *from (select nhan_vien.ma_nhan_vien
from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where  year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021) as temp);



-- cau 17 
set sql_safe_updates = 0;
update khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in ( 
select*from (
select khach_hang.ma_khach_hang
from khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong) = 2021
and ten_loai_khach = "Platinium" 
and (dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong + dich_vu.chi_phi_thue)  > 1000000) as temp
);


-- cau 18
set sql_safe_updates = 0;
alter table furama_management_system.khach_hang
add column is_delete bit(1) not null default 0 after ma_loai_khach;

update khach_hang 
set is_delete = 1
where ma_khach_hang in
(select *from(select khach_hang.ma_khach_hang
from khach_hang
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) in (2019,2020)) as temp);

select * from khach_hang
where is_delete = 1;

set sql_safe_updates = 1;
--  cau 19

update dich_vu_di_kem 
set gia = gia*2
where ma_dich_vu_di_kem in
(select ma_dich_vu_di_kem
from hop_dong_chi_tiet
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2020
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having  sum(hop_dong_chi_tiet.so_luong) > 10
);

-- cau 20

select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.ngay_sinh, nhan_vien.dia_chi
from nhan_vien
union
select khach_hang.ma_khach_hang, khach_hang.ho_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.ngay_sinh, khach_hang.dia_chi
from khach_hang;