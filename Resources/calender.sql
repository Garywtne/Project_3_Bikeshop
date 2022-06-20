-- Table: public.calendar

-- DROP TABLE IF EXISTS public.calendar;

CREATE TABLE IF NOT EXISTS public.calendar
(
    "Date" date NOT NULL,
    CONSTRAINT pk_calendar PRIMARY KEY ("Date")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.calendar
    OWNER to postgres;