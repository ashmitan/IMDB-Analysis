-- IMDb Project
-- Staging Tables Expanded -- Movie Lens 
-- Rick Sherman
-- 2020-04-13	


-- Drop table
-- DROP TABLE IF EXISTS stg_ml_movies ;

CREATE TABLE  stg_ml_movies (
	movieId int,
	title varchar(255),
	genres varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId)
) ;

-- Drop table
-- DROP TABLE IF EXISTS stg_ml_links ;

CREATE TABLE  stg_ml_links (
	movieId int,
	imdbId varchar(20),
	tmdbId int,
	tconst varchar(20),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId)
) ;


-- Drop table
-- DROP TABLE IF EXISTS stg_ml_ratings ;

CREATE TABLE  stg_ml_ratings (
	userId int,
	movieId int,
	rating real,
	ratings_timestamp int,
                   ratings_datetime datetime,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (userId,movieId)
) ;


-- Drop table
-- DROP TABLE IF EXISTS stg_ml_tags ;

CREATE TABLE  stg_ml_tags (	
                   ml_tags_sk int NOT NULL IDENTITY(1,1),
	userId int,
	movieId int,
	tag varchar(255),
	ratings_timestamp int,
                   ratings_datetime datetime,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (ml_tags_sk )
) ;

-- Drop table

-- DROP TABLE IF EXISTS stg_ml_genome_scores ;

CREATE TABLE  stg_ml_genome_scores (
	movieId int,
	tagId int,
	relevance real,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (movieId,tagId)
) ;


-- Drop table
-- DROP TABLE IF EXISTS stg_ml_genome_tags ;

CREATE TABLE  stg_ml_genome_tags (
	tagId int,
	tag varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (tagid)
) ;

