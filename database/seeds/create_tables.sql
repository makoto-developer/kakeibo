-- Table: public.balance

-- DROP TABLE IF EXISTS public.balance;

CREATE TABLE IF NOT EXISTS public.balance
(
    id bigint NOT NULL DEFAULT nextval('balance_id_seq'::regclass),
    day date,
    title character varying(255) COLLATE pg_catalog."default",
    expense integer,
    income integer,
    method character varying(255) COLLATE pg_catalog."default",
    who character varying(255) COLLATE pg_catalog."default",
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT balance_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.balance
    OWNER to postgres;

-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    age integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
    )

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;
