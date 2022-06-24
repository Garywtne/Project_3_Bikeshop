-- Table: public.categories
CREATE TABLE IF NOT EXISTS public.categories
(
    "ProductSubcategoryKey" integer NOT NULL,
    "SubcategoryName" text COLLATE pg_catalog."default" NOT NULL,
    "ProductCategoryKey" integer NOT NULL,
    "CategoryName" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_categories PRIMARY KEY ("ProductSubcategoryKey")
)