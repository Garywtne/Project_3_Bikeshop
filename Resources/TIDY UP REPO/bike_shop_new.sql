CREATE TABLE IF NOT EXISTS public.combined_sales
(
    "OrderDate" text COLLATE pg_catalog."default",
    "StockDate" text COLLATE pg_catalog."default",
    "OrderNumber" text COLLATE pg_catalog."default",
    "ProductKey" bigint,
    "CustomerKey" bigint,
    "SalesTerritoryKey" bigint,
    "OrderLineItem" bigint,
    "OrderQuantity" bigint,
    CONSTRAINT "fk_combined_sales_CustomerKey" FOREIGN KEY ("CustomerKey")
        REFERENCES public.customers ("CustomerKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_sales_OrderDate" FOREIGN KEY ("OrderDate")
        REFERENCES public.calendar ("Date") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_sales_ProductKey" FOREIGN KEY ("ProductKey")
        REFERENCES public.products ("ProductKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_combined_sales_SalesTerritoryKey" FOREIGN KEY ("SalesTerritoryKey")
        REFERENCES public.territories ("SalesTerritoryKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.combined_sales
    OWNER to postgres;