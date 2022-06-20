-- Table: public.categories

-- DROP TABLE IF EXISTS public.categories;

CREATE TABLE IF NOT EXISTS public.categories
(
    "ProductSubcategoryKey" integer NOT NULL,
    "SubcategoryName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductCategoryKey" integer NOT NULL,
    "CategoryName" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_categories PRIMARY KEY ("ProductSubcategoryKey")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.categories
    OWNER to postgres;