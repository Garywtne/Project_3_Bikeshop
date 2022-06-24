-- Table: public.calendar

CREATE TABLE IF NOT EXISTS public.calendar
(
    "Date" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_calendar PRIMARY KEY ("Date")
)