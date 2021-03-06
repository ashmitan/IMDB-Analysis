-- IMDb Project
-- Staging Tables Expanded
-- Rick Sherman
-- 2020-04-10

-- Drop table

DROP TABLE IF EXISTS STG_box_office_worldwide ;

CREATE TABLE STG_box_office_worldwide (
	box_office_worldwide_sk int NOT NULL IDENTITY(1,1),
	BoxOffice_Rank int,
	tconst varchar(10),
	Title varchar(255),
	Worldwide_LifetimeGross bigint,
	Domestic_LifetimeGross bigint,
	Domestic_Pct real,
	Foreign_LifetimeGross bigint,
	Foreign_Pct real,
    Release_Year  int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (box_office_worldwide_sk)
);


-- Drop table

-- DROP TABLE IF EXISTS stg_imdb_franchises_gross;

CREATE TABLE stg_imdb_franchises_gross (
                   Franchises_Gross_SK int NOT NULL IDENTITY(1,1),
	Franchise varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Gross_SK)
);

-- Drop table

-- DROP TABLE IF EXISTS

CREATE TABLE stg_imdb_franchises_list (
                   Franchises_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Franchise varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Lists_SK)
);

-- Drop table

-- DROP TABLE IF EXISTS stg_imdb_brands_gross;

CREATE TABLE stg_imdb_brands_gross (
                   Brands_Gross_SK int NOT NULL IDENTITY(1,1),
	Brand_Name varchar(80),
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Gross_SK)
);

-- Drop table

-- DROP TABLE IF EXISTS

CREATE TABLE stg_imdb_brands_list (
                   Brands_Lists_SK int NOT NULL IDENTITY(1,1),                   
	Brand_Name varchar(255),
	Realease_Rank int,
	Release_Name varchar(255),
	Lifetime_Gross bigint,
	Max_Theaters int,
	Opening_Gross bigint,
	Open_Theaters int,
	Release_Date datetime,
	Distributor varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Lists_SK)
);


-- Drop table

-- DROP TABLE imdb_project.dbo.iso_country GO

CREATE TABLE stg_iso_country (
                   Country_SK int NOT NULL IDENTITY(1,1),
	country_name varchar(255),
	alpha_2 varchar(2),
	alpha_3 varchar(3),
	country_code int,
	iso_3166_2 varchar(80),
	region varchar(255),
	sub_region varchar(255),
	intermediate_region varchar(255),
	region_code int,
	sub_region_code int,
	intermediate_region_code int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Country_SK)
);
-- Drop table

-- DROP TABLE 

CREATE TABLE stg_iso_language (
    Language_SK int NOT NULL IDENTITY(1,1),
	alpha3_b varchar(3),
	alpha3_t varchar(3),
	alpha2 varchar(2),
	Language_Name varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Language_SK)
);
