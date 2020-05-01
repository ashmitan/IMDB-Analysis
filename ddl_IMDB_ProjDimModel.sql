-- use IMDB;
--- IMDb Movie Project
--  Rick Sherman
-- Modified: 2020-04-19 10:40am  added directors


--use imdb_project
--go

-- Drop table
DROP TABLE IF EXISTS dim_imdb_name_basics ;

-- people involved in the titles
CREATE TABLE dim_imdb_name_basics (
    name_sk int NOT NULL IDENTITY(1,1),
	nconst varchar(10) NOT NULL,

	primaryName varchar(255),
	birthYear int,
	deathYear int,

	name_imdb_url varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY NONCLUSTERED  (name_sk)
);
CREATE CLUSTERED INDEX CIX_dim_imdb_name_basics ON dim_imdb_name_basics (nconst);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_titleType;

CREATE TABLE dim_imdb_titleType  (
	titleType_sk int NOT NULL IDENTITY(1,1),

	titleType varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (titleType_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_basics;

CREATE TABLE dim_imdb_title_basics (
    title_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(10) NOT NULL,

	titleType_sk int,    -- new FK

	movieId int null,           -- MovieLens ID
	imdbId varchar(20) null,    -- imdbId from MovieLens ID
	tmdbId int null,                     -- tmdbId from MovieLens ID

	primaryTitle varchar(1024),
	originalTitle varchar(1024),
	ml_title varchar(255),  	  -- MovieLens Title
	isAdult bit,
	startYear int,
	endYear int,
	runtimeMinutes int,

	title_imdb_url varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY NONCLUSTERED  (title_sk)
);
CREATE CLUSTERED INDEX CIX_dim_imdb_title_basics  ON dim_imdb_title_basics (tconst);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_brand;

CREATE TABLE dim_imdb_brand  (
	Brand_sk int NOT NULL IDENTITY(1,1),
	Brand_Name varchar(80),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brand_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_Franchise;

CREATE TABLE dim_imdb_Franchise  (
	Franchise_sk int NOT NULL IDENTITY(1,1),
	Franchise_Name varchar(80),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchise_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_primaryProfession;

CREATE TABLE dim_imdb_primaryProfession   (
	primaryProfession_sk int NOT NULL IDENTITY(1,1),
    primaryProfession varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (primaryProfession_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_name_basics_knownForTitles;

CREATE TABLE dim_imdb_name_basics_knownForTitles (
	knownForTitles_sk int NOT NULL IDENTITY(1,1),

    name_sk int not null, 
	title_sk int not null, -- knownForTitles varchar(1024),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (knownForTitles_sk)
);
CREATE INDEX IDX_dim_imdb_name_basics_knownForTitles   ON dim_imdb_name_basics_knownForTitles  (name_sk, title_sk);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_name_basics_primaryProfession;

CREATE TABLE dim_imdb_name_basics_primaryProfession (
	name_basics_primaryProfession_sk int NOT NULL IDENTITY(1,1),

    name_sk int, 
	primaryProfession_sk int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (name_basics_primaryProfession_sk)
);
CREATE INDEX IDX_dim_imdb_name_basics_primaryProfession    ON dim_imdb_name_basics_primaryProfession   (name_sk,primaryProfession_sk);

-- Drop table
DROP TABLE IF EXISTS dim_iso_country;

CREATE TABLE dim_iso_country (
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
DROP TABLE IF EXISTS dim_iso_language;

CREATE TABLE dim_iso_language (
	Language_SK int NOT NULL IDENTITY(1,1),
	alpha3_b varchar(3),
	alpha3_t varchar(3),
	alpha2 varchar(2),
	Language_Name varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Language_SK)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_akas ;

CREATE TABLE dim_imdb_title_akas (
	title_akas_SK int NOT NULL IDENTITY(1,1),

    title_sk int, 
	title_ordering int NOT NULL,

	title_akas varchar(1024),
    country_SK int null,
	region varchar(255),     -- fk
    language_SK int null,
	movie_language varchar(255),  -- fk
	title_akas_types varchar(255),
	title_akas_attributes varchar(1024),
	isOriginalTitle varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_akas_SK)
);
CREATE INDEX IDX_dim_imdb_title_akas    ON dim_imdb_title_akas (title_sk);


-- Drop table
DROP TABLE IF EXISTS dim_imdb_genres;

CREATE TABLE dim_imdb_genres   (
	genres_sk int NOT NULL IDENTITY(1,1),

	genres varchar(255),
    genre_source varchar(80),              -- imdb or MovieLens               
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (genres_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_basics_genres ;

CREATE TABLE dim_imdb_title_basics_genres (
	titles_genres_sk int NOT NULL IDENTITY(1,1),

    title_sk int,
	genres_sk int,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (titles_genres_sk)
);
CREATE INDEX IDX_SK_dim_imdb_title_basics_genres    ON dim_imdb_title_basics_genres (title_sk,genres_sk);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_crew_directors;

CREATE TABLE dim_imdb_title_crew_directors (
	directors_sk int NOT NULL IDENTITY(1,1),
    title_sk int,
    name_sk int,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (directors_sk)
);
CREATE INDEX IDX_SK_dim_imdb_title_crew_directors     ON dim_imdb_title_crew_directors (title_sk,name_sk);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_crew_writers ;

CREATE TABLE dim_imdb_title_crew_writers (
	writers_sk int NOT NULL IDENTITY(1,1),
    title_sk int,
    name_sk int,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (writers_sk)
);
CREATE INDEX IDX_SK_dim_imdb_title_crew_writers     ON dim_imdb_title_crew_writers (title_sk,name_sk);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_episode ;

CREATE TABLE dim_imdb_title_episode (
	title_episode_sk int NOT NULL IDENTITY(1,1),

    title_sk int,
    parent_title_sk int,
	seasonNumber int,
	episodeNumber int,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_episode_sk)
);
CREATE INDEX IDX_SK_dim_imdb_title_episode     ON dim_imdb_title_episode (title_sk,parent_title_sk);


-- Drop table
DROP TABLE IF EXISTS dim_imdb_job_category;

CREATE TABLE dim_imdb_job_category   (
	job_category_sk int NOT NULL IDENTITY(1,1),
	job_category varchar(255),        
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (job_category_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_principals 

CREATE TABLE dim_imdb_title_principals (
	title_principals_sk int NOT NULL IDENTITY(1,1),

    title_sk int not null,
    name_sk int not null,
	title_ordering int NOT NULL,

	job_category_sk int,
	job_title varchar(1024),
	character_name varchar(1024),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_principals_sk) -- (tconst,[ordering])
);
CREATE UNIQUE INDEX UDX_SK_dim_imdb_title_principals      ON dim_imdb_title_principals (title_sk,name_sk,title_ordering);

-- Drop table
DROP TABLE IF EXISTS fct_imdb_title_ratings ;

CREATE TABLE fct_imdb_title_ratings (
	title_ratings_sk int NOT NULL IDENTITY(1,1),

    title_sk int not null,
	averageRating real,
	numVotes int,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_ratings_sk)
);
CREATE INDEX IDX_SK_fct_imdb_title_ratings     ON fct_imdb_title_ratings (title_sk);

-- Drop table
DROP TABLE IF EXISTS fct_ml_genome_scores;

CREATE TABLE fct_ml_genome_scores (
	genome_scores_sk int NOT NULL IDENTITY(1,1),

    title_sk int not null,
	tagId int NOT NULL,
	relevance decimal (10,3),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (title_sk,tagId)
);

-- Drop tab
DROP TABLE IF EXISTS fct_ml_genome_tags ;

CREATE TABLE fct_ml_genome_tags (
	tagId int NOT NULL,   -- NK
	tag varchar(255),

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tagId)
);

-- Drop table
DROP TABLE IF EXISTS fct_ml_ratings ;

CREATE TABLE fct_ml_ratings (
	title_sk int NOT NULL,
	userId int NOT NULL,

	rating decimal(10,3),
	ratings_datetime datetime,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY CLUSTERED (title_sk,userId)
);

-- Drop table
DROP TABLE IF EXISTS fct_ml_tags ;

CREATE TABLE fct_ml_tags (
	ml_tags_sk int NOT NULL IDENTITY(1,1),

	title_sk int NOT NULL,
	userId int NOT NULL,
	tag varchar(255),
	ratings_datetime datetime,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (ml_tags_sk)
);

-- Drop table
DROP TABLE IF EXISTS fct_numbers_daily_box_office ;

CREATE TABLE fct_numbers_daily_box_office (
	daily_box_office_sk int NOT NULL IDENTITY(1,1),

	title_sk int NOT NULL,
	Show_Date datetime NOT NULL,
	Daily_Rank int,
	Daily_Gross bigint,
	Daily_Change_Pct decimal(10,3),
	Weekly_Change_Pct decimal(10,3),
	Number_of_Theaters int,
	Gross_Per_Theater bigint,
	Total_Gross bigint,
	Number_of_Days int,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (daily_box_office_sk)
);

-- Drop table
DROP TABLE IF EXISTS fct_numbers_franchise_all_box_office;

CREATE TABLE fct_numbers_franchise_all_box_office (
	franchise_all_sk int NOT NULL IDENTITY(1,1),

	franchise_sk int NOT NULL,

	No_of_Movies int NOT NULL,
	Domestic_Box_Office bigint NOT NULL,
	Infl_Adj_Dom_Box_Office bigint NOT NULL,
	Worldwide_Box_Office bigint NOT NULL,
	First_Year int NOT NULL,
	Last_Year int NOT NULL,
	No_of_Years int NOT NULL,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (franchise_all_sk)
);

-- Drop table
DROP TABLE IF EXISTS fct_numbers_franchise_movies_box_office ;

CREATE TABLE fct_numbers_franchise_movies_box_office (
	frachise_movies_box_office_sk int NOT NULL IDENTITY(1,1),
                   
    franchise_sk int NOT NULL,
	Release_Date datetime NOT NULL,
	title_sk int NOT NULL,
	Production_Budget bigint,
	Opening_Weekend bigint,
	Domestic_Box_Office bigint,
	Worldwide_Box_Office bigint,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (frachise_movies_box_office_sk)
);

-- Drop table
DROP TABLE IF EXISTS fct_imdb_brands_gross ;

CREATE TABLE fct_imdb_brands_gross (
	Brands_Gross_SK int NOT NULL IDENTITY(1,1),

	brand_sk int NOT NULL,
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Brands_Gross_SK)
);

-- Drop table
DROP TABLE IF EXISTS fct_imdb_brands_list;

CREATE TABLE fct_imdb_brands_list (
	Brands_Lists_SK int NOT NULL IDENTITY(1,1),

	brand_sk int NOT NULL,
	release_Rank int,
	title_sk int NOT NULL,
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
DROP TABLE IF EXISTS fct_imdb_franchises_gross;

CREATE TABLE fct_imdb_franchises_gross (
	Franchises_Gross_SK int NOT NULL IDENTITY(1,1),

    franchise_sk int NOT NULL,
	Total_Revenue bigint,
	Number_of_Releases int,
	Top_Release varchar(255),
	Lifetime_Gross bigint,

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (Franchises_Gross_SK)
);

-- Drop table
DROP TABLE IF EXISTS fct_imdb_franchises_list;

CREATE TABLE fct_imdb_franchises_list (
	Franchises_Lists_SK int NOT NULL IDENTITY(1,1),

    franchise_sk int NOT NULL,
	Release_Rank int,
    title_sk int NOT NULL,
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
DROP TABLE IF EXISTS fct_movies_box_office_worldwide; 

-- top 100 movies by lifetime gross from IMDb
CREATE TABLE fct_movies_box_office_worldwide (
	movies_box_office_worldwide_sk int NOT NULL IDENTITY(1,1),

    title_sk int NOT NULL,
    BoxOffice_Rank int,
	Worldwide_LifetimeGross bigint,
	Domestic_LifetimeGross bigint,
	Domestic_Pct decimal(10,3), -- drop?
	Foreign_LifetimeGross bigint,
	Foreign_Pct  decimal(10,3),  -- drop?
	Release_Year int,        -- drop?

	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movies_box_office_worldwide_sk)
);



---------------------------------
---- Reject Tables
---------------------------------------------

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_principals_rejects;

CREATE TABLE dim_imdb_title_principals_rejects  (
	title_principals_sk int NOT NULL IDENTITY(1,1),

    title_sk int  null,
	tconst varchar(10) null,
    name_sk int  null,
	nconst varchar(10) null,
	title_ordering int  NULL,

	job_category_sk int null,
	job_category varchar(255),       
	job_title varchar(1024),
	character_name varchar(1024),

	reject_reason varchar(80),   
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_principals_sk) -- (tconst,[ordering])
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_crew_directors_rejects;

CREATE TABLE dim_imdb_title_crew_directors_rejects (
	directors_sk int NOT NULL IDENTITY(1,1),
    title_sk int  null,
	tconst varchar(10) null,
    name_sk int  null,
	nconst varchar(10) null,

	reject_reason varchar(80),  
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (directors_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_crew_writers_rejects ;

CREATE TABLE dim_imdb_title_crew_writers_rejects (
	writers_sk int NOT NULL IDENTITY(1,1),
    title_sk int  null,
	tconst varchar(10) null,
    name_sk int  null,
	nconst varchar(10) null,

	reject_reason varchar(80),  
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (writers_sk)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_name_basics_knownForTitles_rejects;

CREATE TABLE dim_imdb_name_basics_knownForTitles_rejects (
	knownForTitles_sk int NOT NULL IDENTITY(1,1),

    title_sk int  null,
	tconst varchar(10) null,
    name_sk int  null,
	nconst varchar(10) null,

	reject_reason varchar(80),  
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (knownForTitles_sk)
);
-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_akas_rejects ;

CREATE TABLE dim_imdb_title_akas_rejects (
	title_akas_SK int NOT NULL IDENTITY(1,1),

    title_sk int null, 
	tconst varchar(10) null,
	title_ordering int NOT NULL,

	title_akas varchar(1024),
    country_SK int null,
	region varchar(255),     -- fk
    language_SK int null,
	movie_language varchar(255),  -- fk
	title_akas_types varchar(255),
	title_akas_attributes varchar(1024),
	isOriginalTitle varchar(255),

	reject_reason varchar(80),  
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_akas_SK)
);

-- Drop table
DROP TABLE IF EXISTS dim_imdb_title_episode_rejects ; ;

CREATE TABLE dim_imdb_title_episode_rejects (
	title_episode_sk int NOT NULL IDENTITY(1,1),

    title_sk int,
    parent_title_sk int,
	tconst varchar(10) null ,
	parentTconst varchar(10),
	seasonNumber int,
	episodeNumber int,

	reject_reason varchar(80),  
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_episode_sk)
);