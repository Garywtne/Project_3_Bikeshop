-- Table: public.customers

DROP TABLE IF EXISTS public.customers;

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
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;