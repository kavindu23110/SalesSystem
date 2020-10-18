
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2020 23:22:13
-- Generated from EDMX file: E:\SalesSystem\SalesSystem.DAL\DBContext.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SalesSystem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Productdetails_ProductCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Productdetails] DROP CONSTRAINT [FK_Productdetails_ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_Stock_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stock] DROP CONSTRAINT [FK_Stock_user];
GO
IF OBJECT_ID(N'[dbo].[FK_StockProduct_Stock]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StockProduct] DROP CONSTRAINT [FK_StockProduct_Stock];
GO
IF OBJECT_ID(N'[dbo].[FK_user_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[user] DROP CONSTRAINT [FK_user_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_UserDetails_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_user];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[Productdetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productdetails];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Stock]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Stock];
GO
IF OBJECT_ID(N'[dbo].[StockProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StockProduct];
GO
IF OBJECT_ID(N'[dbo].[user]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user];
GO
IF OBJECT_ID(N'[dbo].[UserDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserDetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Productdetails'
CREATE TABLE [dbo].[Productdetails] (
    [Id] int  NOT NULL,
    [ProductCategoryId] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RoleName] nchar(10)  NULL,
    [Isactive] nchar(10)  NULL
);
GO

-- Creating table 'Stocks'
CREATE TABLE [dbo].[Stocks] (
    [Id] int  NOT NULL,
    [UserId] int  NULL
);
GO

-- Creating table 'StockProducts'
CREATE TABLE [dbo].[StockProducts] (
    [Id] int  NOT NULL,
    [StockId] int  NOT NULL
);
GO

-- Creating table 'users'
CREATE TABLE [dbo].[users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [password] varchar(50)  NOT NULL,
    [UserName] varchar(50)  NOT NULL,
    [IsActive] bit  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'UserDetails'
CREATE TABLE [dbo].[UserDetails] (
    [Id] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Brands'
CREATE TABLE [dbo].[Brands] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productdetails'
ALTER TABLE [dbo].[Productdetails]
ADD CONSTRAINT [PK_Productdetails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Stocks'
ALTER TABLE [dbo].[Stocks]
ADD CONSTRAINT [PK_Stocks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StockProducts'
ALTER TABLE [dbo].[StockProducts]
ADD CONSTRAINT [PK_StockProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [PK_users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [PK_UserDetails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Brands'
ALTER TABLE [dbo].[Brands]
ADD CONSTRAINT [PK_Brands]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProductCategoryId] in table 'Productdetails'
ALTER TABLE [dbo].[Productdetails]
ADD CONSTRAINT [FK_Productdetails_ProductCategory]
    FOREIGN KEY ([ProductCategoryId])
    REFERENCES [dbo].[ProductCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Productdetails_ProductCategory'
CREATE INDEX [IX_FK_Productdetails_ProductCategory]
ON [dbo].[Productdetails]
    ([ProductCategoryId]);
GO

-- Creating foreign key on [RoleId] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [FK_user_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_user_Role'
CREATE INDEX [IX_FK_user_Role]
ON [dbo].[users]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'Stocks'
ALTER TABLE [dbo].[Stocks]
ADD CONSTRAINT [FK_Stock_user]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Stock_user'
CREATE INDEX [IX_FK_Stock_user]
ON [dbo].[Stocks]
    ([UserId]);
GO

-- Creating foreign key on [StockId] in table 'StockProducts'
ALTER TABLE [dbo].[StockProducts]
ADD CONSTRAINT [FK_StockProduct_Stock]
    FOREIGN KEY ([StockId])
    REFERENCES [dbo].[Stocks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StockProduct_Stock'
CREATE INDEX [IX_FK_StockProduct_Stock]
ON [dbo].[StockProducts]
    ([StockId]);
GO

-- Creating foreign key on [UserId] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [FK_UserDetails_user]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserDetails_user'
CREATE INDEX [IX_FK_UserDetails_user]
ON [dbo].[UserDetails]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------