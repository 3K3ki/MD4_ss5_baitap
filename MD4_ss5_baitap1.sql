create database demo;
create table Products(
id int primary key auto_increment,
productCode int,
productName varchar(255),
productPrice float,
productAmount int,
productDescription varchar(255),
productStatus tinyint
);
-- thêm dữ liệu
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus) values 
(1,"Rau",10000,12,"ngon lắm",0),
(2,"trứng",20000,10,"ngon lắm",0),
(3,"bánh mì",30000,13,"ngon lắm",0),
(4,"xúc xích",5000,15,"ngon lắm",1),
(5,"thịt",1000011,12,"ngon lắm",1);
-- •	Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table Products add index idx_productCode(productCode);
-- •	Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table Products add index idx_product(productName,productPrice);
-- •	Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products;

-- •	Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as 
select productCode, productName, productPrice, productStatus
from Products; 

-- •	Tiến hành sửa đổi view
update product_view set productStatus = 1 where productCode=1;

-- •	Tiến hành xoá view
drop view product_view;

-- •	Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE findAllProducts()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;

-- •	Tạo store procedure thêm một sản phẩm mới


