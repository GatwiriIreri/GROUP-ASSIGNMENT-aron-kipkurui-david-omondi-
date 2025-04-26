CREATE DATABASE eccomerce;
USE eccomerce;

CREATE TABLE brand(
brandId INT PRIMARY KEY AUTO_INCREMENT,
brandName VARCHAR(100) NOT NULL
);


CREATE TABLE productCategory(
categoryId INT PRIMARY KEY AUTO_INCREMENT,
categoryName VARCHAR(100) NOT NULL,
categoryDescription TEXT
);

CREATE TABLE color (
    colorId INT PRIMARY KEY AUTO_INCREMENT,
    colorName VARCHAR(50) NOT NULL
);

CREATE TABLE sizeCategory (
    sizeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE attributeCategory (
    attributeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(100) NOT NULL,
    categoryDescription TEXT
);

CREATE TABLE attributeType (
    attributeTypeId INT PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE product (
    productId INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    brandId INT,
    categoryId INT,
    FOREIGN KEY (brandId) REFERENCES Brand(brandId) ON DELETE SET NULL,
    FOREIGN KEY (categoryId) REFERENCES productCategory(categoryId) ON DELETE SET NULL
);

CREATE TABLE sizeOption (
    sizeOptionId INT PRIMARY KEY AUTO_INCREMENT,
    sizeCategoryId INT NOT NULL,
    sizeName VARCHAR(20) NOT NULL,
    FOREIGN KEY (sizeCategoryId) REFERENCES sizeCategory(sizeCategoryId) ON DELETE CASCADE
);

CREATE TABLE productImage (
    imageId INT PRIMARY KEY AUTO_INCREMENT,
    imageUrl VARCHAR(255) NOT NULL,
    productId INT NOT NULL,
    imageType VARCHAR(50),
    FOREIGN KEY (productId) REFERENCES product(productId) ON DELETE CASCADE
);

CREATE TABLE productVariation (
    variationId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT NOT NULL,
    colorId INT,
    sizeOptionId INT,
    FOREIGN KEY (productId) REFERENCES product(productId) ON DELETE CASCADE,
    FOREIGN KEY (colorId) REFERENCES Color(colorId) ON DELETE SET NULL,
    FOREIGN KEY (sizeOptionId) REFERENCES sizeOption(sizeOptionId) ON DELETE SET NULL
);

CREATE TABLE productItem (
    itemId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    sizeCategoryId INT,
    FOREIGN KEY (productId) REFERENCES product(productId) ON DELETE CASCADE,
    FOREIGN KEY (sizeCategoryId) REFERENCES sizeCategory(sizeCategoryId) ON DELETE SET NULL
);

CREATE TABLE productAttribute (
    attributeId INT PRIMARY KEY AUTO_INCREMENT,
    productId INT NOT NULL,
    material VARCHAR(100),
    weight DECIMAL(10,2),
    attributeCategoryId INT,
    attributeTypeId INT,
    FOREIGN KEY (productId) REFERENCES product(productId) ON DELETE CASCADE,
    FOREIGN KEY (attributeCategoryId) REFERENCES attributeCategory(attributeCategoryId) ON DELETE SET NULL,
    FOREIGN KEY (attributeTypeId) REFERENCES attributeType(attributeTypeId) ON DELETE SET NULL
);






