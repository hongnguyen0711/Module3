create database booking_management;

use booking_management;

create table nha_cc(
ma_nha_cc int auto_increment primary key,
ten_nha_cc varchar(100),
dia_chi varchar(100)
);
create table sdt(
sdt varchar(10),
ma_nha_cc int,
primary key(sdt),
foreign key(ma_nha_cc) references nha_cc(ma_nha_cc)
);
create table don_dh(
so_dh int auto_increment primary key,
ngay_dh date,
ma_nha_cc int,
foreign key (ma_nha_cc) references nha_cc(ma_nha_cc)
);
create table vat_tu(
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(100)
);

create table don_dh_dat_vat_tu(
so_dh int,
ma_vat_tu int,
primary key(so_dh, ma_vat_tu),
foreign key(so_dh) references don_dh(so_dh),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_phieu_nhap int auto_increment primary key,
ngay_nhap date
);

create table phieu_nhap_vat_tu(
dg_nhap double,
sl_nhap int,
so_phieu_nhap int,
ma_vat_tu int,
primary key(so_phieu_nhap,ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_xuat(
so_phieu_xuat int auto_increment primary key,
ngay_xuat date
);

create table phieu_xuat_vat_tu(
dg_xuat double,
sl_xuat int,
so_phieu_xuat int,
ma_vat_tu int,
primary key(so_phieu_xuat, ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
