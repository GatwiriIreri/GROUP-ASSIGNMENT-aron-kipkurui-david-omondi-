# GROUP-ASSIGNMENT-aron-kipkurui-david-omondi-

Ecommerce Database Group Assignment

# Database: eccomerce

This database is designed to support an e-commerce platform, enabling structured data management for brands, product categories, attributes, images, variations, and inventory.

# Tables Overview

# brand

# Stores information about product brands.

Column Type Description
brandId INT, PK, AI Unique ID for the brand
brandName VARCHAR(100) Name of the brand (required)

# productCategory

# Holds various product categories.

Column Type Description
categoryId INT, PK, AI Unique ID for the category
categoryName VARCHAR(100) Name of the category (required)
categoryDescription TEXT Description of the category

# color

# Defines available colors for product variations.

Column Type Description
colorId INT, PK, AI Unique ID for the color
colorName VARCHAR(50) Color name (required)

# sizeCategory

# Defines categories of sizing (e.g., clothing sizes, shoe sizes).

Column Type Description
sizeCategoryId INT, PK, AI Unique ID for size category
categoryName VARCHAR(50) Name of the size category
description VARCHAR(255) Description of the category

# attributeCategory

# Defines categories of product attributes (e.g., material, durability).

Column Type Description
attributeCategoryId INT, PK, AI Unique ID for the attribute category
categoryName VARCHAR(100) Name of the category
categoryDescription TEXT Description of the attribute group

# attributeType

# Holds the types of attributes used for product descriptions.

Column Type Description
attributeTypeId INT, PK, AI Unique ID for the attribute type
typeName VARCHAR(50) Name of the attribute type
description TEXT Description of the type

# product

# Core product table holding basic details.

Column Type Description
productId INT, PK, AI Unique ID for the product
productName VARCHAR(255) Product name (required)
price DECIMAL(10,2) Base price
brandId INT, FK Refers to brand(brandId)
categoryId INT, FK Refers to productCategory(categoryId)

# sizeOption

# Lists available sizes within each size category.

Column Type Description
sizeOptionId INT, PK, AI Unique ID for the size option
sizeCategoryId INT, FK Refers to sizeCategory(sizeCategoryId)
sizeName VARCHAR(20) Name of the size (e.g., S, M, L)

# productImage

# Stores images associated with each product.

Column Type Description
imageId INT, PK, AI Unique ID for the image
imageUrl VARCHAR(255) URL of the image (required)
productId INT, FK Refers to product(productId)
imageType VARCHAR(50) Type of image (e.g., thumbnail, gallery)

# productVariation

# Captures product variations by color and size.

Column Type Description
variationId INT, PK, AI Unique ID for the variation
productId INT, FK Refers to product(productId)
colorId INT, FK Refers to color(colorId)
sizeOptionId INT, FK Refers to sizeOption(sizeOptionId)

# productItem

# Represents actual inventory items with quantity and pricing.

Column Type Description
itemId INT, PK, AI Unique ID for the product item
productId INT, FK Refers to product(productId)
price DECIMAL(10,2) Item-specific price
quantity INT Number of items in stock (default: 0)
sizeCategoryId INT, FK Refers to sizeCategory(sizeCategoryId)

# productAttribute

# Contains additional metadata or attributes per product.

Column Type Description
attributeId INT, PK, AI Unique ID for the attribute
productId INT, FK Refers to product(productId)
material VARCHAR(100) Material of the product
weight DECIMAL(10,2) Weight of the product
attributeCategoryId INT, FK Refers to attributeCategory(attributeCategoryId)
attributeTypeId INT, FK Refers to attributeType(attributeTypeId)
