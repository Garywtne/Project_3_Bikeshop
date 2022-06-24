-- Table: public.territories

DROP TABLE IF EXISTS public.territories;


CREATE TABLE IF NOT EXISTS public.territories
(
	"SalesTerritoryKey"	INTEGER NOT NULL UNIQUE,
	"Region"	TEXT NOT NULL,
	"Country"	TEXT NOT NULL,
	"Continent"	TEXT NOT NULL,
	 CONSTRAINT pk_territories PRIMARY KEY ("SalesTerritoryKey")
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.territories
    OWNER to postgres;