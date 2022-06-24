-- Table: public.products

DROP TABLE IF EXISTS public.products;

CREATE TABLE IF NOT EXISTS public.products
(
    "ProductKey" integer NOT NULL,
    "ProductSubcategoryKey" integer NOT NULL UNIQUE,
    "ProductSKU" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ModelName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductDescription" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductColor" character varying COLLATE pg_catalog."default",
    "ProductSize" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductStyle" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductCost" integer NOT NULL,
    "ProductPrice" integer NOT NULL,
    PRIMARY KEY ("ProductKey")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.products
    OWNER to postgres;