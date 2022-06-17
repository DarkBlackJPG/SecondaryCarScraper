--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.1

-- Started on 2022-06-17 14:19:40

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

DROP DATABASE polovniautomobili;
--
-- TOC entry 3485 (class 1262 OID 16590)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 16931)
-- Name: automobili; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.automobili (
    index bigint,
    boja_eksterijer integer,
    boja_enterijer integer,
    broj_oglasa bigint,
    broj_sedista text,
    broj_vrata text,
    emisiona_klasa integer,
    fiksna_cena bigint,
    cena_popust double precision,
    cena_regularna double precision,
    godiste double precision,
    gorivo integer,
    grad integer,
    karoserija integer,
    kilometraza integer,
    klima integer,
    kubikaza integer,
    marka integer,
    materijal_enterijera integer,
    menjac integer,
    model integer,
    ostecenje integer,
    pogon integer,
    poreklo_vozila integer,
    registrovan_do text,
    stanje integer,
    strana_volana text,
    vlasnistvo integer,
    zamena text,
    zemlja_uvoza integer,
    snaga_ks integer,
    snaga_kw integer
);


ALTER TABLE public.automobili OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16592)
-- Name: boja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boja (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.boja OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16591)
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
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 209
-- Name: boja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boja_id_seq OWNED BY public.boja.id;


--
-- TOC entry 212 (class 1259 OID 16601)
-- Name: emisiona_klasa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emisiona_klasa (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.emisiona_klasa OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16600)
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
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 211
-- Name: emisiona_klasa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emisiona_klasa_id_seq OWNED BY public.emisiona_klasa.id;


--
-- TOC entry 214 (class 1259 OID 16610)
-- Name: gorivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gorivo (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.gorivo OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16609)
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
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 213
-- Name: gorivo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gorivo_id_seq OWNED BY public.gorivo.id;


--
-- TOC entry 216 (class 1259 OID 16619)
-- Name: grad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grad (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.grad OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16618)
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
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 215
-- Name: grad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grad_id_seq OWNED BY public.grad.id;


--
-- TOC entry 218 (class 1259 OID 16628)
-- Name: karoserija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karoserija (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.karoserija OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16627)
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
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 217
-- Name: karoserija_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.karoserija_id_seq OWNED BY public.karoserija.id;


--
-- TOC entry 220 (class 1259 OID 16637)
-- Name: klima; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klima (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.klima OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16636)
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
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 219
-- Name: klima_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.klima_id_seq OWNED BY public.klima.id;


--
-- TOC entry 222 (class 1259 OID 16646)
-- Name: marka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marka (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.marka OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16645)
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
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 221
-- Name: marka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marka_id_seq OWNED BY public.marka.id;


--
-- TOC entry 226 (class 1259 OID 16668)
-- Name: materijal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materijal (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.materijal OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16667)
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
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 225
-- Name: materijal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materijal_id_seq OWNED BY public.materijal.id;


--
-- TOC entry 228 (class 1259 OID 16677)
-- Name: menjac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menjac (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.menjac OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16676)
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
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 227
-- Name: menjac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menjac_id_seq OWNED BY public.menjac.id;


--
-- TOC entry 224 (class 1259 OID 16655)
-- Name: model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model (
    id bigint NOT NULL,
    marka bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.model OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16654)
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
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 223
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.model_id_seq OWNED BY public.model.id;


--
-- TOC entry 230 (class 1259 OID 16686)
-- Name: ostecenje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ostecenje (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.ostecenje OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16685)
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
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 229
-- Name: ostecenje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ostecenje_id_seq OWNED BY public.ostecenje.id;


--
-- TOC entry 232 (class 1259 OID 16695)
-- Name: pogon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pogon (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.pogon OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16694)
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
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 231
-- Name: pogon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pogon_id_seq OWNED BY public.pogon.id;


--
-- TOC entry 234 (class 1259 OID 16704)
-- Name: poreklo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poreklo (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.poreklo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16703)
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
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 233
-- Name: poreklo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.poreklo_id_seq OWNED BY public.poreklo.id;


--
-- TOC entry 236 (class 1259 OID 16713)
-- Name: stanje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stanje (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.stanje OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16712)
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
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 235
-- Name: stanje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stanje_id_seq OWNED BY public.stanje.id;


--
-- TOC entry 238 (class 1259 OID 16722)
-- Name: vlasnistvo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vlasnistvo (
    id bigint NOT NULL,
    opis character varying(256) NOT NULL
);


ALTER TABLE public.vlasnistvo OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16721)
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
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 237
-- Name: vlasnistvo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vlasnistvo_id_seq OWNED BY public.vlasnistvo.id;


--
-- TOC entry 240 (class 1259 OID 16731)
-- Name: zemlja_uvoza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zemlja_uvoza (
    id bigint NOT NULL,
    naziv character varying(256) NOT NULL
);


ALTER TABLE public.zemlja_uvoza OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16730)
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
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 239
-- Name: zemlja_uvoza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zemlja_uvoza_id_seq OWNED BY public.zemlja_uvoza.id;


--
-- TOC entry 3243 (class 2604 OID 16595)
-- Name: boja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boja ALTER COLUMN id SET DEFAULT nextval('public.boja_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16604)
-- Name: emisiona_klasa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisiona_klasa ALTER COLUMN id SET DEFAULT nextval('public.emisiona_klasa_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16613)
-- Name: gorivo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorivo ALTER COLUMN id SET DEFAULT nextval('public.gorivo_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16622)
-- Name: grad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grad ALTER COLUMN id SET DEFAULT nextval('public.grad_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16631)
-- Name: karoserija id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karoserija ALTER COLUMN id SET DEFAULT nextval('public.karoserija_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 16640)
-- Name: klima id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klima ALTER COLUMN id SET DEFAULT nextval('public.klima_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16649)
-- Name: marka id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marka ALTER COLUMN id SET DEFAULT nextval('public.marka_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16671)
-- Name: materijal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materijal ALTER COLUMN id SET DEFAULT nextval('public.materijal_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16680)
-- Name: menjac id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menjac ALTER COLUMN id SET DEFAULT nextval('public.menjac_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16658)
-- Name: model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model ALTER COLUMN id SET DEFAULT nextval('public.model_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16689)
-- Name: ostecenje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ostecenje ALTER COLUMN id SET DEFAULT nextval('public.ostecenje_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16698)
-- Name: pogon id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pogon ALTER COLUMN id SET DEFAULT nextval('public.pogon_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 16707)
-- Name: poreklo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poreklo ALTER COLUMN id SET DEFAULT nextval('public.poreklo_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 16716)
-- Name: stanje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanje ALTER COLUMN id SET DEFAULT nextval('public.stanje_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16725)
-- Name: vlasnistvo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vlasnistvo ALTER COLUMN id SET DEFAULT nextval('public.vlasnistvo_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 16734)
-- Name: zemlja_uvoza id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zemlja_uvoza ALTER COLUMN id SET DEFAULT nextval('public.zemlja_uvoza_id_seq'::regclass);


--
-- TOC entry 3262 (class 2606 OID 16597)
-- Name: boja boja_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boja
    ADD CONSTRAINT boja_pk PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 16606)
-- Name: emisiona_klasa emisiona_klasa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emisiona_klasa
    ADD CONSTRAINT emisiona_klasa_pk PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 16615)
-- Name: gorivo gorivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gorivo
    ADD CONSTRAINT gorivo_pk PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 16624)
-- Name: grad grad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grad
    ADD CONSTRAINT grad_pk PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 16633)
-- Name: karoserija karoserija_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karoserija
    ADD CONSTRAINT karoserija_pk PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 16642)
-- Name: klima klima_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klima
    ADD CONSTRAINT klima_pk PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 16651)
-- Name: marka marka_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marka
    ADD CONSTRAINT marka_pk PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16673)
-- Name: materijal materijal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materijal
    ADD CONSTRAINT materijal_pk PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16682)
-- Name: menjac menjac_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menjac
    ADD CONSTRAINT menjac_pk PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 16660)
-- Name: model model_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pk PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16691)
-- Name: ostecenje ostecenje_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ostecenje
    ADD CONSTRAINT ostecenje_pk PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16700)
-- Name: pogon pogon_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pogon
    ADD CONSTRAINT pogon_pk PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16709)
-- Name: poreklo poreklo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poreklo
    ADD CONSTRAINT poreklo_pk PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 16718)
-- Name: stanje stanje_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanje
    ADD CONSTRAINT stanje_pk PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 16727)
-- Name: vlasnistvo vlasnistvo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vlasnistvo
    ADD CONSTRAINT vlasnistvo_pk PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16736)
-- Name: zemlja_uvoza zemlja_uvoza_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zemlja_uvoza
    ADD CONSTRAINT zemlja_uvoza_pk PRIMARY KEY (id);


--
-- TOC entry 3259 (class 1259 OID 16598)
-- Name: boja_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX boja_id_uindex ON public.boja USING btree (id);


--
-- TOC entry 3260 (class 1259 OID 16599)
-- Name: boja_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX boja_naziv_uindex ON public.boja USING btree (naziv);


--
-- TOC entry 3263 (class 1259 OID 16607)
-- Name: emisiona_klasa_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emisiona_klasa_id_uindex ON public.emisiona_klasa USING btree (id);


--
-- TOC entry 3264 (class 1259 OID 16608)
-- Name: emisiona_klasa_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emisiona_klasa_naziv_uindex ON public.emisiona_klasa USING btree (naziv);


--
-- TOC entry 3267 (class 1259 OID 16616)
-- Name: gorivo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gorivo_id_uindex ON public.gorivo USING btree (id);


--
-- TOC entry 3268 (class 1259 OID 16617)
-- Name: gorivo_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX gorivo_naziv_uindex ON public.gorivo USING btree (naziv);


--
-- TOC entry 3271 (class 1259 OID 16625)
-- Name: grad_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX grad_id_uindex ON public.grad USING btree (id);


--
-- TOC entry 3272 (class 1259 OID 16626)
-- Name: grad_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX grad_naziv_uindex ON public.grad USING btree (naziv);


--
-- TOC entry 3322 (class 1259 OID 16936)
-- Name: ix_automobili_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_automobili_index ON public.automobili USING btree (index);


--
-- TOC entry 3275 (class 1259 OID 16634)
-- Name: karoserija_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX karoserija_id_uindex ON public.karoserija USING btree (id);


--
-- TOC entry 3276 (class 1259 OID 16635)
-- Name: karoserija_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX karoserija_opis_uindex ON public.karoserija USING btree (opis);


--
-- TOC entry 3279 (class 1259 OID 16643)
-- Name: klima_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX klima_id_uindex ON public.klima USING btree (id);


--
-- TOC entry 3280 (class 1259 OID 16644)
-- Name: klima_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX klima_opis_uindex ON public.klima USING btree (opis);


--
-- TOC entry 3283 (class 1259 OID 16652)
-- Name: marka_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX marka_id_uindex ON public.marka USING btree (id);


--
-- TOC entry 3284 (class 1259 OID 16653)
-- Name: marka_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX marka_naziv_uindex ON public.marka USING btree (naziv);


--
-- TOC entry 3290 (class 1259 OID 16674)
-- Name: materijal_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX materijal_id_uindex ON public.materijal USING btree (id);


--
-- TOC entry 3291 (class 1259 OID 16675)
-- Name: materijal_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX materijal_naziv_uindex ON public.materijal USING btree (naziv);


--
-- TOC entry 3294 (class 1259 OID 16683)
-- Name: menjac_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menjac_id_uindex ON public.menjac USING btree (id);


--
-- TOC entry 3295 (class 1259 OID 16684)
-- Name: menjac_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menjac_opis_uindex ON public.menjac USING btree (opis);


--
-- TOC entry 3287 (class 1259 OID 16666)
-- Name: model_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX model_id_uindex ON public.model USING btree (id);


--
-- TOC entry 3298 (class 1259 OID 16692)
-- Name: ostecenje_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ostecenje_id_uindex ON public.ostecenje USING btree (id);


--
-- TOC entry 3299 (class 1259 OID 16693)
-- Name: ostecenje_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ostecenje_opis_uindex ON public.ostecenje USING btree (opis);


--
-- TOC entry 3302 (class 1259 OID 16701)
-- Name: pogon_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pogon_id_uindex ON public.pogon USING btree (id);


--
-- TOC entry 3303 (class 1259 OID 16702)
-- Name: pogon_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pogon_opis_uindex ON public.pogon USING btree (opis);


--
-- TOC entry 3306 (class 1259 OID 16710)
-- Name: poreklo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX poreklo_id_uindex ON public.poreklo USING btree (id);


--
-- TOC entry 3307 (class 1259 OID 16711)
-- Name: poreklo_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX poreklo_opis_uindex ON public.poreklo USING btree (opis);


--
-- TOC entry 3310 (class 1259 OID 16719)
-- Name: stanje_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stanje_id_uindex ON public.stanje USING btree (id);


--
-- TOC entry 3311 (class 1259 OID 16720)
-- Name: stanje_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stanje_opis_uindex ON public.stanje USING btree (opis);


--
-- TOC entry 3314 (class 1259 OID 16728)
-- Name: vlasnistvo_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vlasnistvo_id_uindex ON public.vlasnistvo USING btree (id);


--
-- TOC entry 3315 (class 1259 OID 16729)
-- Name: vlasnistvo_opis_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vlasnistvo_opis_uindex ON public.vlasnistvo USING btree (opis);


--
-- TOC entry 3318 (class 1259 OID 16737)
-- Name: zemlja_uvoza_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX zemlja_uvoza_id_uindex ON public.zemlja_uvoza USING btree (id);


--
-- TOC entry 3319 (class 1259 OID 16738)
-- Name: zemlja_uvoza_naziv_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX zemlja_uvoza_naziv_uindex ON public.zemlja_uvoza USING btree (naziv);


--
-- TOC entry 3325 (class 2606 OID 17308)
-- Name: automobili automobili_boja__fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_boja__fk2 FOREIGN KEY (boja_enterijer) REFERENCES public.boja(id);


--
-- TOC entry 3324 (class 2606 OID 17303)
-- Name: automobili automobili_boja_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_boja_id_fk FOREIGN KEY (boja_eksterijer) REFERENCES public.boja(id);


--
-- TOC entry 3326 (class 2606 OID 17313)
-- Name: automobili automobili_emisiona_klasa_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_emisiona_klasa_id_fk FOREIGN KEY (emisiona_klasa) REFERENCES public.emisiona_klasa(id);


--
-- TOC entry 3327 (class 2606 OID 17318)
-- Name: automobili automobili_gorivo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_gorivo_id_fk FOREIGN KEY (gorivo) REFERENCES public.gorivo(id);


--
-- TOC entry 3328 (class 2606 OID 17323)
-- Name: automobili automobili_grad_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_grad_id_fk FOREIGN KEY (grad) REFERENCES public.grad(id);


--
-- TOC entry 3329 (class 2606 OID 17328)
-- Name: automobili automobili_karoserija_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_karoserija_id_fk FOREIGN KEY (karoserija) REFERENCES public.karoserija(id);


--
-- TOC entry 3330 (class 2606 OID 17333)
-- Name: automobili automobili_klima_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_klima_id_fk FOREIGN KEY (klima) REFERENCES public.klima(id);


--
-- TOC entry 3331 (class 2606 OID 17338)
-- Name: automobili automobili_marka_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_marka_id_fk FOREIGN KEY (marka) REFERENCES public.marka(id);


--
-- TOC entry 3332 (class 2606 OID 17343)
-- Name: automobili automobili_materijal_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_materijal_id_fk FOREIGN KEY (materijal_enterijera) REFERENCES public.materijal(id);


--
-- TOC entry 3333 (class 2606 OID 17348)
-- Name: automobili automobili_menjac_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_menjac_id_fk FOREIGN KEY (menjac) REFERENCES public.menjac(id);


--
-- TOC entry 3334 (class 2606 OID 17353)
-- Name: automobili automobili_model_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_model_id_fk FOREIGN KEY (model) REFERENCES public.model(id);


--
-- TOC entry 3335 (class 2606 OID 17358)
-- Name: automobili automobili_ostecenje_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_ostecenje_id_fk FOREIGN KEY (ostecenje) REFERENCES public.ostecenje(id);


--
-- TOC entry 3336 (class 2606 OID 17363)
-- Name: automobili automobili_pogon_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_pogon_id_fk FOREIGN KEY (pogon) REFERENCES public.pogon(id);


--
-- TOC entry 3337 (class 2606 OID 17368)
-- Name: automobili automobili_poreklo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_poreklo_id_fk FOREIGN KEY (poreklo_vozila) REFERENCES public.poreklo(id);


--
-- TOC entry 3338 (class 2606 OID 17373)
-- Name: automobili automobili_stanje_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_stanje_id_fk FOREIGN KEY (stanje) REFERENCES public.stanje(id);


--
-- TOC entry 3339 (class 2606 OID 17378)
-- Name: automobili automobili_vlasnistvo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_vlasnistvo_id_fk FOREIGN KEY (vlasnistvo) REFERENCES public.vlasnistvo(id);


--
-- TOC entry 3340 (class 2606 OID 17383)
-- Name: automobili automobili_zemlja_uvoza_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.automobili
    ADD CONSTRAINT automobili_zemlja_uvoza_id_fk FOREIGN KEY (zemlja_uvoza) REFERENCES public.zemlja_uvoza(id);


--
-- TOC entry 3323 (class 2606 OID 16661)
-- Name: model model_marka_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_marka_id_fk FOREIGN KEY (marka) REFERENCES public.marka(id);


-- Completed on 2022-06-17 14:19:40

--
-- PostgreSQL database dump complete
--

