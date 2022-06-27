BEGIN;


CREATE TABLE IF NOT EXISTS public.calendar
(
    "dateId" integer NOT NULL,
    "Date" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_calendar PRIMARY KEY ("Date")
);

CREATE TABLE IF NOT EXISTS public.categories
(
    "ProductSubcategoryKey" integer NOT NULL,
    "SubcategoryName" text COLLATE pg_catalog."default" NOT NULL,
    "ProductCategoryKey" integer NOT NULL,
    "CategoryName" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_categories PRIMARY KEY ("ProductSubcategoryKey")
);

CREATE TABLE IF NOT EXISTS public.combined_sales
(
    "saleId" integer NOT NULL,
    "OrderDate" text COLLATE pg_catalog."default" NOT NULL,
    "StockDate" text COLLATE pg_catalog."default" NOT NULL,
    "OrderNumber" text COLLATE pg_catalog."default" NOT NULL,
    "CustomerKey" integer NOT NULL,
    "ProductKey" integer NOT NULL,
    "SalesTerritoryKey" integer NOT NULL,
    "OrderLineItem" integer NOT NULL,
    "OrderQuantity" integer NOT NULL,
    CONSTRAINT pk_combined_sales PRIMARY KEY ("saleId")
);

CREATE TABLE IF NOT EXISTS public.customers
(
    "CustomerKey" integer NOT NULL,
    "Prefix" character varying COLLATE pg_catalog."default",
    "FirstName" character varying COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying COLLATE pg_catalog."default" NOT NULL,
    "BirthDate" character varying COLLATE pg_catalog."default" NOT NULL,
    "MaritalStatus" character varying COLLATE pg_catalog."default" NOT NULL,
    "Gender" character varying COLLATE pg_catalog."default",
    "EmailAddress" character varying COLLATE pg_catalog."default" NOT NULL,
    "AnnualIncome" integer NOT NULL,
    "TotalChildren" integer NOT NULL,
    "EducationLevel" character varying COLLATE pg_catalog."default" NOT NULL,
    "Occupation" character varying COLLATE pg_catalog."default" NOT NULL,
    "HomeOwner" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY ("CustomerKey")
);

CREATE TABLE IF NOT EXISTS public.products
(
    "ProductKey" integer NOT NULL,
    "ProductSubcategoryKey" integer NOT NULL,
    "ProductSKU" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ModelName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductDescription" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductColor" character varying COLLATE pg_catalog."default",
    "ProductSize" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductStyle" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductCost" integer NOT NULL,
    "ProductPrice" integer NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY ("ProductKey")
);

CREATE TABLE IF NOT EXISTS public.returns
(
    "returnId" integer NOT NULL,
    "ReturnDate" text COLLATE pg_catalog."default" NOT NULL,
    "TerritoryKey" integer NOT NULL,
    "ProductKey" integer NOT NULL,
    "ReturnQuantity" integer NOT NULL,
    CONSTRAINT returns_pkey PRIMARY KEY ("returnId")
);

CREATE TABLE IF NOT EXISTS public.territories
(
    "SalesTerritoryKey" integer NOT NULL,
    "Region" text COLLATE pg_catalog."default" NOT NULL,
    "Country" text COLLATE pg_catalog."default" NOT NULL,
    "Continent" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_territories PRIMARY KEY ("SalesTerritoryKey")
);

ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_CustomerKey" FOREIGN KEY ("CustomerKey")
    REFERENCES public.customers ("CustomerKey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_OrderDate" FOREIGN KEY ("OrderDate")
    REFERENCES public.calendar ("Date") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_ProductKey" FOREIGN KEY ("ProductKey")
    REFERENCES public.products ("ProductKey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT "fk_products_ProductSubcategoryKey" FOREIGN KEY ("ProductSubcategoryKey")
    REFERENCES public.categories ("ProductSubcategoryKey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS "products_ProductSubcategoryKey_key"
    ON public.products("ProductSubcategoryKey");


ALTER TABLE IF EXISTS public.returns
    ADD CONSTRAINT "fk_returns_ProductKey" FOREIGN KEY ("ProductKey")
    REFERENCES public.products ("ProductKey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.returns
    ADD CONSTRAINT "fk_returns_TerritoryKey" FOREIGN KEY ("TerritoryKey")
    REFERENCES public.territories ("SalesTerritoryKey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;