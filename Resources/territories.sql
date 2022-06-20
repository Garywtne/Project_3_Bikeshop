-- Table: public.territories

-- DROP TABLE IF EXISTS public.territories;

CREATE TABLE IF NOT EXISTS public.territories
(
    "SalesTerritoryKey" integer NOT NULL,
    "Region" character varying COLLATE pg_catalog."default" NOT NULL,
    "Country" character varying COLLATE pg_catalog."default" NOT NULL,
    "Continent" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_territories PRIMARY KEY ("SalesTerritoryKey")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.territories
    OWNER to postgres;