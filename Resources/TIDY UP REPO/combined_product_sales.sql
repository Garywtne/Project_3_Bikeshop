-- Table: public.combined_product_sales

-- DROP TABLE IF EXISTS public.combined_product_sales;

CREATE TABLE IF NOT EXISTS public.combined_product_sales
(
    "ProductSubcategoryKey" integer NOT NULL,
    "SubcategoryName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductCategoryKey" integer NOT NULL,
    "CategoryName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductKey" integer NOT NULL,
    "ProductSKU" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ModelName" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductDescription" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductColor" character varying COLLATE pg_catalog."default",
    "ProductSize" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductStyle" character varying COLLATE pg_catalog."default" NOT NULL,
    "ProductCost" integer NOT NULL,
    "ProductPrice" integer NOT NULL,
    "SalesTerritoryKey" integer NOT NULL,
    "Region" character varying COLLATE pg_catalog."default" NOT NULL,
    "Country" character varying COLLATE pg_catalog."default" NOT NULL,
    "Continent" character varying COLLATE pg_catalog."default" NOT NULL,
    "OrderDate" date NOT NULL,
    "StockDate" date NOT NULL,
    "OrderNumber" character varying COLLATE pg_catalog."default" NOT NULL,
    "CustomerKey" integer NOT NULL,
    "OrderLineItem" integer NOT NULL,
    "OrderQuantity" integer NOT NULL,
    CONSTRAINT "fk_combined_product_sales_CustomerKey" FOREIGN KEY ("CustomerKey")
        REFERENCES public.customers ("CustomerKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_product_sales_OrderDate" FOREIGN KEY ("OrderDate")
        REFERENCES public.calendar ("Date") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_product_sales_ProductKey" FOREIGN KEY ("ProductKey")
        REFERENCES public.products ("ProductKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_product_sales_SalesTerritoryKey" FOREIGN KEY ("SalesTerritoryKey")
        REFERENCES public.territories ("SalesTerritoryKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.combined_product_sales
    OWNER to postgres;