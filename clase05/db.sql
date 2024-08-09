--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-08 23:12:14 -04

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
-- TOC entry 240 (class 1259 OID 16845)
-- Name: chofer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chofer (
    rut character varying(9) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    activo boolean DEFAULT false,
    creacion_registro date,
    patente character varying(6) NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 16808)
-- Name: registro_contabilidad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registro_contabilidad (
    id integer NOT NULL,
    fecha_compra date NOT NULL,
    valor real NOT NULL,
    patente character varying(6) NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 16833)
-- Name: registro_contabilidad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.registro_contabilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 239
-- Name: registro_contabilidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.registro_contabilidad_id_seq OWNED BY public.registro_contabilidad.id;


--
-- TOC entry 237 (class 1259 OID 16803)
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vehiculo (
    patente character varying(6) NOT NULL,
    marca character varying(20) NOT NULL,
    modelo character varying(20) NOT NULL,
    year integer NOT NULL
);


--
-- TOC entry 3494 (class 2604 OID 16834)
-- Name: registro_contabilidad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registro_contabilidad ALTER COLUMN id SET DEFAULT nextval('public.registro_contabilidad_id_seq'::regclass);


--
-- TOC entry 3654 (class 0 OID 16845)
-- Dependencies: 240
-- Data for Name: chofer; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.chofer VALUES ('666', 'Alberto', 'Acosta', true, '2024-08-09', 'UR7070');
INSERT INTO public.chofer VALUES ('1345', 'Nestor', 'Gorosito', false, '2024-08-09', 'AA1750');


--
-- TOC entry 3652 (class 0 OID 16808)
-- Dependencies: 238
-- Data for Name: registro_contabilidad; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3651 (class 0 OID 16803)
-- Dependencies: 237
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vehiculo VALUES ('UR7070', 'Hyundai', 'Pony', 1985);
INSERT INTO public.vehiculo VALUES ('AA1750', 'Renault', '5', 1982);
INSERT INTO public.vehiculo VALUES ('JG8990', 'Citroen', 'CV3', 1979);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 239
-- Name: registro_contabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.registro_contabilidad_id_seq', 1, true);


--
-- TOC entry 3503 (class 2606 OID 16850)
-- Name: chofer chofer_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chofer
    ADD CONSTRAINT chofer_pk PRIMARY KEY (rut);


--
-- TOC entry 3505 (class 2606 OID 16859)
-- Name: chofer chofer_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chofer
    ADD CONSTRAINT chofer_unique UNIQUE (patente);


--
-- TOC entry 3499 (class 2606 OID 16839)
-- Name: registro_contabilidad registro_contabilidad_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registro_contabilidad
    ADD CONSTRAINT registro_contabilidad_pk PRIMARY KEY (id);


--
-- TOC entry 3501 (class 2606 OID 16857)
-- Name: registro_contabilidad registro_contabilidad_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registro_contabilidad
    ADD CONSTRAINT registro_contabilidad_unique UNIQUE (patente);


--
-- TOC entry 3497 (class 2606 OID 16807)
-- Name: vehiculo vehiculo_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pk PRIMARY KEY (patente);


--
-- TOC entry 3507 (class 2606 OID 16851)
-- Name: chofer chofer_vehiculo_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chofer
    ADD CONSTRAINT chofer_vehiculo_fk FOREIGN KEY (patente) REFERENCES public.vehiculo(patente) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3506 (class 2606 OID 16840)
-- Name: registro_contabilidad registro_contabilidad_vehiculo_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registro_contabilidad
    ADD CONSTRAINT registro_contabilidad_vehiculo_fk FOREIGN KEY (patente) REFERENCES public.vehiculo(patente) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-08-08 23:12:14 -04

--
-- PostgreSQL database dump complete
--

