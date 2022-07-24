--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Ubuntu 13.7-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 13.7 (Ubuntu 13.7-0ubuntu0.21.10.1)

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
-- Name: farming; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE farming WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE farming OWNER TO postgres;

\connect farming

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
-- Name: location; Type: TABLE; Schema: public; Owner: farmer
--

CREATE TABLE public.location (
    id integer NOT NULL,
    name character varying NOT NULL,
    coordinates character varying
);


ALTER TABLE public.location OWNER TO farmer;

--
-- Name: COLUMN location.coordinates; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.location.coordinates IS 'for later, gps tracking';


--
-- Name: location_id_seq; Type: SEQUENCE; Schema: public; Owner: farmer
--

CREATE SEQUENCE public.location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_seq OWNER TO farmer;

--
-- Name: location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmer
--

ALTER SEQUENCE public.location_id_seq OWNED BY public.location.id;


--
-- Name: plant; Type: TABLE; Schema: public; Owner: farmer
--

CREATE TABLE public.plant (
    id integer NOT NULL,
    name character varying NOT NULL,
    type integer NOT NULL,
    location integer NOT NULL
);


ALTER TABLE public.plant OWNER TO farmer;

--
-- Name: COLUMN plant.type; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.plant.type IS 'linked to plant_type.id';


--
-- Name: COLUMN plant.location; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.plant.location IS 'linked to location.id';


--
-- Name: plant_id_seq; Type: SEQUENCE; Schema: public; Owner: farmer
--

CREATE SEQUENCE public.plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_id_seq OWNER TO farmer;

--
-- Name: plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmer
--

ALTER SEQUENCE public.plant_id_seq OWNED BY public.plant.id;


--
-- Name: plant_type; Type: TABLE; Schema: public; Owner: farmer
--

CREATE TABLE public.plant_type (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.plant_type OWNER TO farmer;

--
-- Name: TABLE plant_type; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON TABLE public.plant_type IS 'feuilles, racines, fleurs';


--
-- Name: COLUMN plant_type.name; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.plant_type.name IS 'fleurs/racines/feuilles';


--
-- Name: plant_type_id_seq; Type: SEQUENCE; Schema: public; Owner: farmer
--

CREATE SEQUENCE public.plant_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_type_id_seq OWNER TO farmer;

--
-- Name: plant_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmer
--

ALTER SEQUENCE public.plant_type_id_seq OWNED BY public.plant_type.id;


--
-- Name: sensor; Type: TABLE; Schema: public; Owner: farmer
--

CREATE TABLE public.sensor (
    id integer NOT NULL,
    name character varying NOT NULL,
    brand character varying NOT NULL,
    location integer NOT NULL,
    measure character varying NOT NULL
);


ALTER TABLE public.sensor OWNER TO farmer;

--
-- Name: COLUMN sensor.location; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.sensor.location IS 'where it is in the garden, linked to location.id';


--
-- Name: COLUMN sensor.measure; Type: COMMENT; Schema: public; Owner: farmer
--

COMMENT ON COLUMN public.sensor.measure IS 'celsuis, %, etc';


--
-- Name: sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: farmer
--

CREATE SEQUENCE public.sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensor_id_seq OWNER TO farmer;

--
-- Name: sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmer
--

ALTER SEQUENCE public.sensor_id_seq OWNED BY public.sensor.id;


--
-- Name: location id; Type: DEFAULT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.location ALTER COLUMN id SET DEFAULT nextval('public.location_id_seq'::regclass);


--
-- Name: plant id; Type: DEFAULT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant ALTER COLUMN id SET DEFAULT nextval('public.plant_id_seq'::regclass);


--
-- Name: plant_type id; Type: DEFAULT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant_type ALTER COLUMN id SET DEFAULT nextval('public.plant_type_id_seq'::regclass);


--
-- Name: sensor id; Type: DEFAULT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.sensor ALTER COLUMN id SET DEFAULT nextval('public.sensor_id_seq'::regclass);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: farmer
--

COPY public.location (id, name, coordinates) FROM stdin;
\.


--
-- Data for Name: plant; Type: TABLE DATA; Schema: public; Owner: farmer
--

COPY public.plant (id, name, type, location) FROM stdin;
\.


--
-- Data for Name: plant_type; Type: TABLE DATA; Schema: public; Owner: farmer
--

COPY public.plant_type (id, name) FROM stdin;
\.


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: farmer
--

COPY public.sensor (id, name, brand, location, measure) FROM stdin;
\.


--
-- Name: location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmer
--

SELECT pg_catalog.setval('public.location_id_seq', 1, false);


--
-- Name: plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmer
--

SELECT pg_catalog.setval('public.plant_id_seq', 1, false);


--
-- Name: plant_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmer
--

SELECT pg_catalog.setval('public.plant_type_id_seq', 1, false);


--
-- Name: sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmer
--

SELECT pg_catalog.setval('public.sensor_id_seq', 1, false);


--
-- Name: location location_pk; Type: CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pk PRIMARY KEY (id);


--
-- Name: plant plant_pk; Type: CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_pk PRIMARY KEY (id);


--
-- Name: plant_type plant_type_pk; Type: CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant_type
    ADD CONSTRAINT plant_type_pk PRIMARY KEY (id);


--
-- Name: sensor sensor_pk; Type: CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_pk PRIMARY KEY (id);


--
-- Name: location_id_idx; Type: INDEX; Schema: public; Owner: farmer
--

CREATE UNIQUE INDEX location_id_idx ON public.location USING btree (id);


--
-- Name: plant_id_idx; Type: INDEX; Schema: public; Owner: farmer
--

CREATE UNIQUE INDEX plant_id_idx ON public.plant USING btree (id);


--
-- Name: plant_type_id_idx; Type: INDEX; Schema: public; Owner: farmer
--

CREATE UNIQUE INDEX plant_type_id_idx ON public.plant_type USING btree (id);


--
-- Name: sensor_id_idx; Type: INDEX; Schema: public; Owner: farmer
--

CREATE UNIQUE INDEX sensor_id_idx ON public.sensor USING btree (id);


--
-- Name: plant plant_fk; Type: FK CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_fk FOREIGN KEY (id) REFERENCES public.plant_type(id);


--
-- Name: plant plant_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.plant
    ADD CONSTRAINT plant_fk_1 FOREIGN KEY (id) REFERENCES public.location(id);


--
-- Name: sensor sensor_fk; Type: FK CONSTRAINT; Schema: public; Owner: farmer
--

ALTER TABLE ONLY public.sensor
    ADD CONSTRAINT sensor_fk FOREIGN KEY (id) REFERENCES public.location(id);


--
-- Name: DATABASE farming; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE farming TO farmer;


--
-- PostgreSQL database dump complete
--

