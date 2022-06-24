-- Table: public.returns

DROP TABLE IF EXISTS public.returns;

CREATE TABLE IF NOT EXISTS public.returns
(
	"ReturnDate"	TEXT NOT NULL,
	"TerritoryKey"	INTEGER NOT NULL,
	"ProductKey"	INTEGER NOT NULL,
	"ReturnQuantity"	INTEGER NOT NULL,
	CONSTRAINT "fk_returns_ProductKey" FOREIGN KEY ("ProductKey")
        REFERENCES public.products ("ProductKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "fk_returns_TerritoryKey" FOREIGN KEY ("TerritoryKey")
        REFERENCES public.territories ("SalesTerritoryKey") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.returns
    OWNER to postgres;