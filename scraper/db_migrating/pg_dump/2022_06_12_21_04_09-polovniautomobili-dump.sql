--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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

DROP DATABASE IF EXISTS polovniautomobili;
--
-- Name: polovniautomobili; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE polovniautomobili WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE polovniautomobili OWNER TO postgres;

\connect polovniautomobili

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: boja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boja (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.boja OWNER TO postgres;

--
-- Name: boja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boja_id_seq OWNER TO postgres;

--
-- Name: boja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boja_id_seq OWNED BY public.boja.id;


--
-- Name: emisiona_klasa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emisiona_klasa (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.emisiona_klasa OWNER TO postgres;

--
-- Name: emisiona_klasa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emisiona_klasa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emisiona_klasa_id_seq OWNER TO postgres;

--
-- Name: emisiona_klasa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emisiona_klasa_id_seq OWNED BY public.emisiona_klasa.id;


--
-- Name: gorivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gorivo (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.gorivo OWNER TO postgres;

--
-- Name: gorivo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gorivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gorivo_id_seq OWNER TO postgres;

--
-- Name: gorivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gorivo_id_seq OWNED BY public.gorivo.id;


--
-- Name: grad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grad (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.grad OWNER TO postgres;

--
-- Name: grad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grad_id_seq OWNER TO postgres;

--
-- Name: grad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grad_id_seq OWNED BY public.grad.id;


--
-- Name: karoserija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karoserija (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.karoserija OWNER TO postgres;

--
-- Name: karoserija_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.karoserija_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karoserija_id_seq OWNER TO postgres;

--
-- Name: karoserija_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.karoserija_id_seq OWNED BY public.karoserija.id;


--
-- Name: klima; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klima (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.klima OWNER TO postgres;

--
-- Name: klima_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.klima_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klima_id_seq OWNER TO postgres;

--
-- Name: klima_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klima_id_seq OWNED BY public.klima.id;


--
-- Name: marka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marka (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.marka OWNER TO postgres;

--
-- Name: marka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marka_id_seq OWNER TO postgres;

--
-- Name: marka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marka_id_seq OWNED BY public.marka.id;


--
-- Name: materijal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materijal (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.materijal OWNER TO postgres;

--
-- Name: materijal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materijal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materijal_id_seq OWNER TO postgres;

--
-- Name: materijal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materijal_id_seq OWNED BY public.materijal.id;


--
-- Name: menjac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menjac (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.menjac OWNER TO postgres;

--
-- Name: menjac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menjac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menjac_id_seq OWNER TO postgres;

--
-- Name: menjac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menjac_id_seq OWNED BY public.menjac.id;


--
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id bigint NOT NULL,
    marka bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- Name: model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.model_id_seq OWNER TO postgres;

--
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- Name: ostecenje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ostecenje (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.ostecenje OWNER TO postgres;

--
-- Name: ostecenje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ostecenje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ostecenje_id_seq OWNER TO postgres;

--
-- Name: ostecenje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ostecenje_id_seq OWNED BY public.ostecenje.id;


--
-- Name: pogon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pogon (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.pogon OWNER TO postgres;

--
-- Name: pogon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pogon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pogon_id_seq OWNER TO postgres;

--
-- Name: pogon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pogon_id_seq OWNED BY public.pogon.id;


--
-- Name: poreklo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poreklo (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.poreklo OWNER TO postgres;

--
-- Name: poreklo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.poreklo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poreklo_id_seq OWNER TO postgres;

--
-- Name: poreklo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poreklo_id_seq OWNED BY public.poreklo.id;


--
-- Name: stanje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stanje (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.stanje OWNER TO postgres;

--
-- Name: stanje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stanje_id_seq OWNER TO postgres;

--
-- Name: stanje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stanje_id_seq OWNED BY public.stanje.id;


--
-- Name: vlasnistvo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vlasnistvo (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.vlasnistvo OWNER TO postgres;

--
-- Name: vlasnistvo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vlasnistvo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vlasnistvo_id_seq OWNER TO postgres;

--
-- Name: vlasnistvo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vlasnistvo_id_seq OWNED BY public.vlasnistvo.id;


--
-- Name: zemlja_uvoza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zemlja_uvoza (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.zemlja_uvoza OWNER TO postgres;

--
-- Name: zemlja_uvoza_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zemlja_uvoza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zemlja_uvoza_id_seq OWNER TO postgres;

--
-- Name: zemlja_uvoza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zemlja_uvoza_id_seq OWNED BY public.zemlja_uvoza.id;


--
-- Name: boja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boja ALTER COLUMN id SET DEFAULT nextval('public.boja_id_seq'::regclass);


--
-- Name: emisiona_klasa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisiona_klasa ALTER COLUMN id SET DEFAULT nextval('public.emisiona_klasa_id_seq'::regclass);


--
-- Name: gorivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorivo ALTER COLUMN id SET DEFAULT nextval('public.gorivo_id_seq'::regclass);


--
-- Name: grad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grad ALTER COLUMN id SET DEFAULT nextval('public.grad_id_seq'::regclass);


--
-- Name: karoserija id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karoserija ALTER COLUMN id SET DEFAULT nextval('public.karoserija_id_seq'::regclass);


--
-- Name: klima id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klima ALTER COLUMN id SET DEFAULT nextval('public.klima_id_seq'::regclass);


--
-- Name: marka id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marka ALTER COLUMN id SET DEFAULT nextval('public.marka_id_seq'::regclass);


--
-- Name: materijal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materijal ALTER COLUMN id SET DEFAULT nextval('public.materijal_id_seq'::regclass);


--
-- Name: menjac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menjac ALTER COLUMN id SET DEFAULT nextval('public.menjac_id_seq'::regclass);


--
-- Name: model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- Name: ostecenje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ostecenje ALTER COLUMN id SET DEFAULT nextval('public.ostecenje_id_seq'::regclass);


--
-- Name: pogon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pogon ALTER COLUMN id SET DEFAULT nextval('public.pogon_id_seq'::regclass);


--
-- Name: poreklo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poreklo ALTER COLUMN id SET DEFAULT nextval('public.poreklo_id_seq'::regclass);


--
-- Name: stanje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanje ALTER COLUMN id SET DEFAULT nextval('public.stanje_id_seq'::regclass);


--
-- Name: vlasnistvo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vlasnistvo ALTER COLUMN id SET DEFAULT nextval('public.vlasnistvo_id_seq'::regclass);


--
-- Name: zemlja_uvoza id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zemlja_uvoza ALTER COLUMN id SET DEFAULT nextval('public.zemlja_uvoza_id_seq'::regclass);


--
-- Data for Name: boja; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: emisiona_klasa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: gorivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: grad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: karoserija; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: klima; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: marka; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: materijal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menjac; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ostecenje; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pogon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: poreklo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: stanje; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: vlasnistvo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: zemlja_uvoza; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: boja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boja_id_seq', 1, false);


--
-- Name: emisiona_klasa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emisiona_klasa_id_seq', 1, false);


--
-- Name: gorivo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gorivo_id_seq', 1, false);


--
-- Name: grad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grad_id_seq', 1, false);


--
-- Name: karoserija_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.karoserija_id_seq', 1, false);


--
-- Name: klima_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.klima_id_seq', 1, false);


--
-- Name: marka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marka_id_seq', 1, false);


--
-- Name: materijal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materijal_id_seq', 1, false);


--
-- Name: menjac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menjac_id_seq', 1, false);


--
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.model_id_seq', 1, false);


--
-- Name: ostecenje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ostecenje_id_seq', 1, false);


--
-- Name: pogon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pogon_id_seq', 1, false);


--
-- Name: poreklo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.poreklo_id_seq', 1, false);


--
-- Name: stanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stanje_id_seq', 1, false);


--
-- Name: vlasnistvo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vlasnistvo_id_seq', 1, false);


--
-- Name: zemlja_uvoza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zemlja_uvoza_id_seq', 1, false);


--
-- Name: boja boja_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boja
    ADD CONSTRAINT boja_pk PRIMARY KEY (id);


--
-- Name: emisiona_klasa emisiona_klasa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisiona_klasa
    ADD CONSTRAINT emisiona_klasa_pk PRIMARY KEY (id);


--
-- Name: gorivo gorivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorivo
    ADD CONSTRAINT gorivo_pk PRIMARY KEY (id);


--
-- Name: grad grad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grad
    ADD CONSTRAINT grad_pk PRIMARY KEY (id);


--
-- Name: karoserija karoserija_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karoserija
    ADD CONSTRAINT karoserija_pk PRIMARY KEY (id);


--
-- Name: klima klima_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klima
    ADD CONSTRAINT klima_pk PRIMARY KEY (id);


--
-- Name: marka marka_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marka
    ADD CONSTRAINT marka_pk PRIMARY KEY (id);


--
-- Name: materijal materijal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materijal
    ADD CONSTRAINT materijal_pk PRIMARY KEY (id);


--
-- Name: menjac menjac_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menjac
    ADD CONSTRAINT menjac_pk PRIMARY KEY (id);


--
-- Name: model model_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pk PRIMARY KEY (id);


--
-- Name: ostecenje ostecenje_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ostecenje
    ADD CONSTRAINT ostecenje_pk PRIMARY KEY (id);


--
-- Name: pogon pogon_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pogon
    ADD CONSTRAINT pogon_pk PRIMARY KEY (id);


--
-- Name: poreklo poreklo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poreklo
    ADD CONSTRAINT poreklo_pk PRIMARY KEY (id);


--
-- Name: stanje stanje_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanje
    ADD CONSTRAINT stanje_pk PRIMARY KEY (id);


--
-- Name: vlasnistvo vlasnistvo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vlasnistvo
    ADD CONSTRAINT vlasnistvo_pk PRIMARY KEY (id);


--
-- Name: zemlja_uvoza zemlja_uvoza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zemlja_uvoza
    ADD CONSTRAINT zemlja_uvoza_pk PRIMARY KEY (id);


--
-- Name: boja_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX boja_id_uindex ON public.boja USING btree (id);


--
-- Name: boja_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX boja_naziv_uindex ON public.boja USING btree (naziv);


--
-- Name: emisiona_klasa_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emisiona_klasa_id_uindex ON public.emisiona_klasa USING btree (id);


--
-- Name: emisiona_klasa_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emisiona_klasa_naziv_uindex ON public.emisiona_klasa USING btree (naziv);


--
-- Name: gorivo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gorivo_id_uindex ON public.gorivo USING btree (id);


--
-- Name: gorivo_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gorivo_naziv_uindex ON public.gorivo USING btree (naziv);


--
-- Name: grad_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX grad_id_uindex ON public.grad USING btree (id);


--
-- Name: grad_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX grad_naziv_uindex ON public.grad USING btree (naziv);


--
-- Name: karoserija_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX karoserija_id_uindex ON public.karoserija USING btree (id);


--
-- Name: karoserija_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX karoserija_opis_uindex ON public.karoserija USING btree (opis);


--
-- Name: klima_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX klima_id_uindex ON public.klima USING btree (id);


--
-- Name: klima_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX klima_opis_uindex ON public.klima USING btree (opis);


--
-- Name: marka_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX marka_id_uindex ON public.marka USING btree (id);


--
-- Name: marka_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX marka_naziv_uindex ON public.marka USING btree (naziv);


--
-- Name: materijal_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX materijal_id_uindex ON public.materijal USING btree (id);


--
-- Name: materijal_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX materijal_naziv_uindex ON public.materijal USING btree (naziv);


--
-- Name: menjac_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menjac_id_uindex ON public.menjac USING btree (id);


--
-- Name: menjac_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menjac_opis_uindex ON public.menjac USING btree (opis);


--
-- Name: model_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX model_id_uindex ON public.model USING btree (id);


--
-- Name: ostecenje_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ostecenje_id_uindex ON public.ostecenje USING btree (id);


--
-- Name: ostecenje_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ostecenje_opis_uindex ON public.ostecenje USING btree (opis);


--
-- Name: pogon_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pogon_id_uindex ON public.pogon USING btree (id);


--
-- Name: pogon_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pogon_opis_uindex ON public.pogon USING btree (opis);


--
-- Name: poreklo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX poreklo_id_uindex ON public.poreklo USING btree (id);


--
-- Name: poreklo_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX poreklo_opis_uindex ON public.poreklo USING btree (opis);


--
-- Name: stanje_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stanje_id_uindex ON public.stanje USING btree (id);


--
-- Name: stanje_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stanje_opis_uindex ON public.stanje USING btree (opis);


--
-- Name: vlasnistvo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vlasnistvo_id_uindex ON public.vlasnistvo USING btree (id);


--
-- Name: vlasnistvo_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vlasnistvo_opis_uindex ON public.vlasnistvo USING btree (opis);


--
-- Name: zemlja_uvoza_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX zemlja_uvoza_id_uindex ON public.zemlja_uvoza USING btree (id);


--
-- Name: zemlja_uvoza_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX zemlja_uvoza_naziv_uindex ON public.zemlja_uvoza USING btree (naziv);


--
-- Name: model model_marka_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_marka_id_fk FOREIGN KEY (marka) REFERENCES public.marka(id);


--
-- PostgreSQL database dump complete
--

