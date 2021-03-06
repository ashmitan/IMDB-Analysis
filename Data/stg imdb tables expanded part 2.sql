-- IMDb Project
-- Staging Tables Expanded
-- Rick Sherman
-- 2020-04-10


-- Drop table

DROP TABLE IF EXISTS stg_imdb_name_basics_knownForTitles ;

CREATE TABLE stg_imdb_name_basics_knownForTitles (
	knownForTitles_sk int NOT NULL IDENTITY(1,1),
	nconst varchar(255),
	knownForTitles varchar(1024),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT (getdate()) NOT NULL,
	PRIMARY KEY (knownForTitles_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_name_basics_primaryProfession ;

CREATE TABLE stg_imdb_name_basics_primaryProfession (
	primaryProfession_sk int NOT NULL IDENTITY(1,1),
	nconst varchar(255) NOT NULL,
	primaryProfession varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (primaryProfession_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_basics_genres 

CREATE TABLE stg_imdb_title_basics_genres (
	title_basics_genres_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(255),
	genres varchar(255),
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_basics_genres_sk)
) ;

-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_directors ;

CREATE TABLE stg_imdb_title_crew_directors (
	title_crew_directors_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(10) NOT NULL,
	nconst varchar(10) NOT NULL,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (title_crew_directors_sk)
) ;


-- Drop table

DROP TABLE IF EXISTS stg_imdb_title_crew_writers ;

CREATE TABLE stg_imdb_title_crew_writers (
	stg_imdb_title_crew_writers_sk int NOT NULL IDENTITY(1,1),
	tconst varchar(10) NOT NULL,
	nconst varchar(10) NOT NULL,
	DI_JobID varchar(20) NOT NULL,
	DI_Create_DT datetime DEFAULT getdate() NOT NULL,
	PRIMARY KEY (stg_imdb_title_crew_writers_sk)
) ;

