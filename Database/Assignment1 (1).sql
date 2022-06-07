Create database prj301_assignment;

USE prj301_assignment
DROP DATABASE prj301_assignment

CREATE Table Categories (
	id int primary key IDENTITY(1,1),
	name nvarchar(30) NOT NULL,
)

Create table Foods (
	id int primary key IDENTITY(1,1),
	name	 nvarchar(30) NOT NULL,
	img_link varchar(200) NOT NULL,
	description nvarchar(200) NOT NULL,
	sold_quantity int DEFAULT 0,
	idCategory  int FOREIGN KEY REFERENCES Categories(id),
	original_price int NOT NULL,
	discount int DEFAULT 0,
	final_price int NOT NULL
) 
Create table VipAccounts (
	id int primary key IDENTITY(1,1),
	name nvarchar(30) NOT NULL,
	duration int NOT NULL,
	voucher_value int NOT NULL,
	voucher_quantity int NOT NULL
)
Create table Customers (
	id int primary key IDENTITY(1,1),
	username varchar(50) UNIQUE NOT NULL,
	email varchar(50) UNIQUE,
	phone varchar(50) UNIQUE NOT NULL,
	password varchar(50) NOT NULL,
	registration_date date DEFAULT GETDATE(),
	access_right varchar(10) DEFAULT 'user',
	idVipAccount int FOREIGN KEY REFERENCES VipAccounts(ID),
	voucher_left int,
	vip_registration_date date,
)

CREATE Table FoodsOnSale(
	id int primary key IDENTITY(1,1),
	idFood int UNIQUE FOREIGN KEY REFERENCES Foods(id),
	discount_percent int NOT NULL,
)

CREATE Table Comments(
	id int primary key IDENTITY(1,1),
	idCustomer int FOREIGN KEY REFERENCES Customers(id),
	idFood int FOREIGN KEY REFERENCES Foods(id),
	content nvarchar(200) NOT NULL,
	date DATETIME DEFAULT GETDATE()
)


CREATE Table Orders(
	id int primary key IDENTITY(1,1),
	idCustomer int FOREIGN KEY REFERENCES Customers(id),
	address nvarchar(200) NOT NULL,
	date date DEFAULT GETDATE(),
	phone varchar(20) NOT NULL,
	note nvarchar(100),
	original_price int NOT NULL,
	discount int DEFAULT 0,
	final_price int NOT NULL
)

CREATE Table Items (
	id int primary key IDENTITY(1,1),
	idOrder int FOREIGN KEY REFERENCES Orders(id),
	idFood int FOREIGN KEY REFERENCES Foods(id),
	quantity int NOT NULL,
	price int NOT NULL
)





use prj301_assignment
go

insert into dbo.VipAccounts (name, duration, voucher_value, voucher_quantity)
values 
			(N'Gói Vip Bạc',30, 69000, 5),
			(N'Gói Vip Vàng',90, 199000, 15),
			(N'Gói Vip Bạch Kim',180, 369000, 30),
			(N'Gói Vip Kim Cương',365, 699000, 60)

insert into dbo.Customers (username,email,phone,[password],registration_date,access_right,voucher_left,vip_registration_date)
values ('anhtai','anhtai@gmail.com',0365474353,'anhtai',GETDATE(),'admin',null,0,null)

insert into dbo.Customers (username,email,phone,[password],registration_date,idVipAccount,voucher_left,vip_registration_date)
values
			('viethoang2810','viethoang2810@gmail.com',0335349368,'viethoang','2022-03-05',null,0,null),
			('anhtai46','anhtaibp46@gmail.com',0799919368,'anhtai','2022-02-05',null,0,null),
			('xuandai37','dailx0307@gmail.com',0337891233,'xuandai','2021-03-25',null,0,null),
			('trieuvy2812','vynt2812@gmail.com',090834454,'trieuvy',getdate(),null,0,null),
			('trunghieu77','trunghieu@gmail.com',0332229393,'trunghieu','2020-12-05',null,0,null),
			('phatdat2001','datnp2001@gmail.com',0953453544,'phatdat','2021-01-05',null,0,null),
			('hoanghoa112','hoanghoa112@gmail.com',0956457456,'hoanghoa','2022-01-24',null,0,null),
			('yvyle1012','vyle2001@gmail.com',0365756344,'vyle2001','2020-09-05',null,0,null),
			('kimoanh2001','oanhlun@gmail.com',0334565463,'oanhlun','2022-03-05',null,0,null),
			('thuyan','thuyan2001@gmail.com',0346542352,'thuyan2001',getdate(),null,0,null),
			('toalnk','toanlk@gmail.com',0587456982,'toanlnk','2022-03-07',null,0,null),
			('tuanngo','tuanngo2001@gmail.com',0336479583,'tuannn','2022-03-07',null,0,null),
			('hieunht','hieudeptrai2001@gmail.com',0856471254,'hieu123',getdate(),null,0,null),
			('quangnv','quang1998@gmail.com',0936325489,'quang12345',getdate(),null,0,null),
			('trangntt','trang321@gmail.com',0336475896,'trangtt','2022-03-07',null,0,null),
			('hienpt7201','hiepham@gmail.com',0756398541,'hienpt',getdate(),null,0,null),
			('tamlt','tamlt2001@gmail.com',0745236598,'tamlt',getdate(),null,0,null),
			('khangth83','khangtran2001@gmail.com',0335289483,'khang4321','2022-03-07',null,0,null)


INSERT INTO dbo.Categories (name) VALUES
				(N'Hamburger'),
				(N'Gà'),
				(N'Bánh Mì'),
				(N'Cà Phê'),
				(N'Trà'),
				(N'Trà sữa')
INSERT INTO dbo.Foods (name,img_link,description,idCategory,original_price,discount,final_price)
VALUES
	  (N'Gà rán','https://gachaybo.com/wp-content/uploads/2021/06/ga-ran.png',N'Thịt gà săn chắc',2,30000,0,30000),
	  (N'Trà sữa trân châu đường đen','http://cdn.tgdd.vn/Files/2021/08/10/1374160/hoc-cach-pha-tra-sua-o-long-dai-loan-thom-ngon-chuan-vi-ai-cung-me-202108100039248020.jpg',N'Dung lượng 500ml',6,35000,0,35000),
	  (N'Trà xanh','https://media-cdn.laodong.vn/storage/newsportal/2021/1/21/872971/4-7204-1448170689.jpg',N'Thư giãn và kích thích sự tỉnh táo cho ngày dài năng động',5,15000,0,15000),
	  (N'Tôm chiên giòn','https://cdn.daynauan.info.vn/wp-content/uploads/2016/11/tom-tam-bot-chien-xu.jpg',N'Thịt tôm săn chắc ',2,20000,0,20000),
	  (N'Bánh mì thịt chả','https://cuongthinhfood.com/wp-content/uploads/2019/04/banh-mi-thit.jpg ',N'Bánh mì được hòa quyện cùng thịt và chả',3,20000,0,20000),
	  (N'Cà phê đen đá,nóng','https://cokhitrongtuyet.com/wp-content/uploads/2019/08/cach-pha-ca-phe-den-da-ngon-nhu-nao-bi-quyet-pha-ca-phe-nhanh-2.jpg',N'Cà phê',4,15000,0,15000),
	  (N'Trà sữa matcha','https://afamilycdn.com/150157425591193600/2020/7/19/photo-1595145994109-1595145994452541611443.jpg',N'Trà sữa matcha đậm chất nhật bản',6,30000,0,30000),
	  (N'Sụn gà rang bơ tỏi','http://cdn.tgdd.vn/Files/2021/07/22/1369955/huong-dan-cach-lam-mon-sun-ga-rang-bo-toi-an-la-ghien-202107220850546273.jpg',N'Giòn-Ngon-Thích',2,20000,0,20000),
	  (N'Gà chiên nước mắm','https://mrngon.com/wp-content/uploads/sites/20/2021/06/ga-chien-mam.jpg',N'Thơm-Ngon',2,30000,0,30000),
	  (N'Bánh mì ốp la cá mồi','https://ajimayo.com.vn/uploads/07-2021/IMG_0297%20banh%20mi%20op%20la%20ca%20moi.jpg',N'Thơm-Ngon',3,30000,0,30000),
	  (N'Bánh mì ốp la 2 trứng','https://cdn.beptruong.edu.vn/wp-content/uploads/2013/01/banh-mi-kep-trung.jpg',N'Thơm-Ngon',3,15000,0,15000),
	  (N'Capuchino','https://tamlong.com.vn/wp-content/uploads/cach-pha-ca-phe-capuchino.jpg',N'Loại cafe có nguồn gốc từ Italia',4,23000,0,23000),
	  (N'Trà đào','https://nghekhachsan.com/upload/Ni-Anh-NKS/Nam-2019/Thang-11/cong-thuc-pha-tra-dao-01.jpg',N'Thơm-Ngon-Mát mẻ',5,28000,0,28000),
	  (N'Combo gà rán ','https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/o/combo-6mieng-flamin_2.jpg',N'Khuyến mãi free 2 phần nước ngọt',1,55000,0,55000),
	  (N'Combo Hamburger+Gà rán','https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/o/combo-6mieng-flamin_2.jpg',N'Khuyến mãi free 2 phần nước ngọt',1,70000,0,70000),
	  (N'Combo Trà sữa','https://burgerking.vn/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/c/o/combo-6mieng-flamin_2.jpg',N'Chọn loại tùy ý',5,55000,0,55000),
	  (N'Hamburger truyền thống','https://haduxi.com/wp-content/uploads/2020/12/hamburger-1.jpg',N'Hamburger bò',1,65000,0,65000)

INSERT INTO dbo.Orders(idCustomer,address,date,phone,note,original_price,discount,final_price)
VALUES 
		(1,N'159/49/9 Bạch Đằng, P. 2,  Quận Tân Bình, TP. HCM','2022-03-07',0335349368,N'không có gì',30000,0,30000),
		(9,N'451/34/30 Phạm Thế Hiển, P. 3,  Quận 8, TP. HCM','2022-03-06',0799919368,N'nhiều trân châu',35000,0,35000),
		(8,N'118/48/43/35 Liên Khu 5 - 6, P. Bình Hưng Hòa B,  Quận Bình Tân, TP. HCM','2022-03-08',0337891233,N'nhiều matcha-ít đường',15000,0,15000),
		(10,N'124/22 Nguyễn Văn Cừ, P. Nguyễn Cư Trinh,  Quận 1, TP. HCM','2022-02-28',090834454,N'thêm tương ớt-ít bột chiên',20000,0,20000),
		(12,N'71/2/107/33 Nguyễn Bặc, P. 3,  Quận Tân Bình, TP. HCM',GETDATE(),0332229393,N'nhiều tương ớt',20000,0,20000),
		(13,N'67 An Dương Vương, P. 8,  Quận 5, TP. HCM','2022-03-10',0953453544,N'khong có gì',15000,0,15000),
		(11,N'156/74 Phú Thọ Hòa, P. Phú Thọ Hòa,  Quận Tân Phú, TP. HCM','2022-03-03',0956457456,N'thêm trân châu đen',30000,0,30000),
		(5,N'8 Trần Phú, P. 4,  Quận 5, TP. HCM','2022-03-12',0365756344,N'nhiều bột chiên giòn',20000,0,20000),
		(4,N'52 Đường 35, P. Linh Đông,  Tp. Thủ Đức, TP. HCM',getdate(),0334565463,N'nhiều ớt',30000,0,30000),
		(7,N'186 Đường Số 1, P. 11,  Quận Gò Vấp, TP. HCM','2022-03-15',0346542352,N'ốp la vừa chín tới',30000,0,30000),
		(14,N'160 Đường A4, P. 12,  Quận Tân Bình, TP. HCM','2022-03-10',0587456982,N'nhiều nước tương',15000,0,15000),
		(15,N'66/16A Phan Sào Nam,  Quận Tân Bình, TP. HCM','2022-03-18',0336479583,N'không',23000,0,23000),
		(6,N'85/29 Lò Siêu, P. 16,  Quận 11, TP. HCM','2022-03-15',0856471254,N'thêm đào',28000,0,28000),
		(17,N'70 Đường 109, P. Phước Long B,  Quận 9, TP. HCM',getdate(),0936325489,N'không có gì',55000,0,55000),
		(2,N'1061 Huỳnh Tấn Phát, P. Phú Thuận,  Quận 7, TP. HCM','2022-03-16',0336475896,N'hamburger cho thêm ớt',70000,0,70000),
		(3,N'16 Lê Quý Đôn, P. 6,  Quận 3, TP. HCM','2022-03-21',0756398541,N'thêm bánh plan',55000,0,55000),
		(4,N'85/29 Lò Siêu, P. 16,  Quận 11, TP. HCM','2022-03-22',0745236598,N'không có gì',55000,0,55000),
		(5,N'70 Đường 109, P. Phước Long B,  Quận 9, TP. HCM','2022-03-20',0335289483,N'thêm tiêu',65000,0,65000)

			

insert into [dbo].[Items] (idOrder, idFood,quantity,price)
values
		
		(2,3,1,35000),
		(3,4,1,15000),
		(4,5,1,20000),
		(5,6,1,20000),
		(6,7,1,15000),
		(7,8,1,30000),
		(8,9,1,20000),
		(9,10,1,30000),
		(10,11,1,30000),
		(11,12,1,15000),
		(12,13,1,23000),
		(13,14,1,28000),
		(14,15,1,55000),
		(15,16,1,70000),
		(16,17,1,55000),
		(17,2,1,55000),
		(18,1,1,65000)
	
insert into [dbo].[FoodsOnSale] (idFood, discount_percent)
values
			(2, 3),
			(3, 10),
			(8, 15),
			(10, 20),
			(11, 25)

select fol.id, f.id, f.name, f.img_link, f.original_price, fol.discount_percent, f.discount, f.final_price from  Foods f INNER JOIN FoodsOnSale fol ON f.id = fol.idFood
INSERT INTO [dbo].[Comments] (idCustomer, idFood, content, date)
VALUES(2, 5, N'Dữ dội và dịu êm, Ồn ào và lặng lẽ, Sông không hiểu nổi mình, Sóng tìm ra tận bể', '2022-01-02'),
(5, 10, N'Ôi con sóng ngày xưa, Và ngày sau vẫn thế, Nỗi khát vọng tình yêu, Bồi hồi trong ngực trẻ', '2022-01-30'),
(7, 12, N'Trước muôn trùng sóng bể, Em nghĩ về anh, em, Em nghĩ về biển lớn, Từ nơi nào sóng lên?', '2022-01-31'),
(8, 16, N'Sóng bắt đầu từ gió, Gió bắt đầu từ đâu?, Em cũng không biết nữa, Khi nào ta yêu nhau', '2022-02-01')