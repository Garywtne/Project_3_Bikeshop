BEGIN;


CREATE TABLE IF NOT EXISTS public.calendar
(
    "dateid" integer NOT NULL,
    "date" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_calendar PRIMARY KEY ("date")
);

CREATE TABLE IF NOT EXISTS public.categories
(
    "productsubcategorykey" integer NOT NULL,
    "subcategoryname" text COLLATE pg_catalog."default" NOT NULL,
    "productcategorykey" integer NOT NULL,
    "categoryname" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_categories PRIMARY KEY ("productsubcategorykey")
);

CREATE TABLE IF NOT EXISTS public.combined_sales
(
    "saleid" integer NOT NULL,
    "orderdate" text COLLATE pg_catalog."default" NOT NULL,
    "stockdate" text COLLATE pg_catalog."default" NOT NULL,
    "ordernumber" text COLLATE pg_catalog."default" NOT NULL,
    "customerkey" integer NOT NULL,
    "productkey" integer NOT NULL,
    "salesterritorykey" integer NOT NULL,
    "orderlineitem" integer NOT NULL,
    "orderquantity" integer NOT NULL,
    CONSTRAINT pk_combined_sales PRIMARY KEY ("saleid")
);

CREATE TABLE IF NOT EXISTS public.customers
(
    "customerkey" integer NOT NULL,
    "prefix" character varying COLLATE pg_catalog."default",
    "firstname" character varying COLLATE pg_catalog."default" NOT NULL,
    "lastname" character varying COLLATE pg_catalog."default" NOT NULL,
    "birthdate" character varying COLLATE pg_catalog."default" NOT NULL,
    "maritalstatus" character varying COLLATE pg_catalog."default" NOT NULL,
    "gender" character varying COLLATE pg_catalog."default",
    "emailaddress" character varying COLLATE pg_catalog."default" NOT NULL,
    "annualincome" integer NOT NULL,
    "totalchildren" integer NOT NULL,
    "educationlevel" character varying COLLATE pg_catalog."default" NOT NULL,
    "occupation" character varying COLLATE pg_catalog."default" NOT NULL,
    "homeowner" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY ("customerkey")
);

CREATE TABLE IF NOT EXISTS public.products
(
    "productkey" integer NOT NULL,
    "productsubcategorykey" integer NOT NULL,
    "productsku" character varying COLLATE pg_catalog."default" NOT NULL,
    "productname" character varying COLLATE pg_catalog."default" NOT NULL,
    "modelname" character varying COLLATE pg_catalog."default" NOT NULL,
    "productdescription" character varying COLLATE pg_catalog."default" NOT NULL,
    "productcolor" character varying COLLATE pg_catalog."default",
    "productsize" character varying COLLATE pg_catalog."default" NOT NULL,
    "productstyle" character varying COLLATE pg_catalog."default" NOT NULL,
    "productcost" integer NOT NULL,
    "productprice" integer NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY ("productkey")
);

CREATE TABLE IF NOT EXISTS public.returns
(
    "returnid" integer NOT NULL,
    "returndate" text COLLATE pg_catalog."default" NOT NULL,
    "territorykey" integer NOT NULL,
    "productkey" integer NOT NULL,
    "returnquantity" integer NOT NULL,
    CONSTRAINT returns_pkey PRIMARY KEY ("returnid")
);

CREATE TABLE IF NOT EXISTS public.territories
(
    "salesterritorykey" integer NOT NULL,
    "region" text COLLATE pg_catalog."default" NOT NULL,
    "country" text COLLATE pg_catalog."default" NOT NULL,
    "continent" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_territories PRIMARY KEY ("salesterritorykey")
);

ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_customerkey" FOREIGN KEY ("customerkey")
    REFERENCES public.customers ("customerkey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_orderdate" FOREIGN KEY ("orderdate")
    REFERENCES public.calendar ("date") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.combined_sales
    ADD CONSTRAINT "fk_combined_sales_productkey" FOREIGN KEY ("productkey")
    REFERENCES public.products ("productkey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.products
    ADD CONSTRAINT "fk_products_productsubcategorykey" FOREIGN KEY ("productsubcategorykey")
    REFERENCES public.categories ("productsubcategorykey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS "products_productsubcategorykey_key"
    ON public.products("productsubcategorykey");


ALTER TABLE IF EXISTS public.returns
    ADD CONSTRAINT "fk_returns_ProductKey" FOREIGN KEY ("productkey")
    REFERENCES public.products ("productkey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.returns
    ADD CONSTRAINT "fk_returns_territorykey" FOREIGN KEY ("territorykey")
    REFERENCES public.territories ("salesterritorykey") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;