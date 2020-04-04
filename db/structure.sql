SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    last_update timestamp without time zone,
    lat double precision,
    long double precision,
    confirmed integer DEFAULT 0,
    deaths integer DEFAULT 0,
    recovered integer DEFAULT 0,
    active integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: globe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.globe (
    id bigint NOT NULL,
    last_update timestamp without time zone,
    confirmed integer DEFAULT 0,
    deaths integer DEFAULT 0,
    recovered integer DEFAULT 0,
    active integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: globe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.globe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: globe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.globe_id_seq OWNED BY public.globe.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    fips character varying,
    country_id uuid,
    name character varying,
    last_update timestamp without time zone,
    lat double precision,
    long double precision,
    confirmed integer DEFAULT 0,
    deaths integer DEFAULT 0,
    recovered integer DEFAULT 0,
    active integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: globe id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.globe ALTER COLUMN id SET DEFAULT nextval('public.globe_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: globe globe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.globe
    ADD CONSTRAINT globe_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: index_countries_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_countries_on_name ON public.countries USING btree (name);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_states_on_country_id ON public.states USING btree (country_id);


--
-- Name: index_states_on_fips; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_states_on_fips ON public.states USING btree (fips);


--
-- Name: index_states_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_states_on_name ON public.states USING btree (name);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200404004817'),
('20200404111351'),
('20200404112019');


