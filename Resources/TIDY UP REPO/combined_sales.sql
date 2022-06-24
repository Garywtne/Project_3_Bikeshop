DROP TABLE IF EXISTS public.combined_sales;

CREATE TABLE IF NOT EXISTS public.combined_sales
(
	"SaleId" INTEGER NOT NULL,
	"OrderDate"	TEXT NOT NULL,
	"StockDate"	TEXT NOT NULL,
	"OrderNumber"	TEXT NOT NULL,
	"CustomerKey"	INTEGER NOT NULL,
	"ProductKey"	INTEGER NOT NULL,
	"SalesTerritoryKey"	INTEGER NOT NULL,
	"OrderLineItem"	INTEGER NOT NULL,
	"OrderQuantity"	INTEGER NOT NULL,
	PRIMARY KEY ("SaleId"),
	CONSTRAINT "fk_combined_sales_ProductKey" FOREIGN KEY ("ProductKey")
        REFERENCES public.products ("ProductKey")
        ON UPDATE NO ACTION
        ON DELETE NO ACTION    
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.combined_sales
    OWNER to postgres;