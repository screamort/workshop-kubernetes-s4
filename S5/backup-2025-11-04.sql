--
-- PostgreSQL database cluster dump
--

\restrict 9TaEJLGa1lcEjGQZylRxdkjVsBJwcM9hFgVX53XkmaCzkZvLY8ePelajZiqT4CX

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:XbI9uIywcVEgubeTMumeXQ==$I3MnrruPk9DFfBBUztSGGgUBFlsoP/EtXOvIFAVFpd8=:/I4k4QwIbp3L/qtNL/d9akDsdDBWa+RwikAw6En2Cjc=';

--
-- User Configurations
--








\unrestrict 9TaEJLGa1lcEjGQZylRxdkjVsBJwcM9hFgVX53XkmaCzkZvLY8ePelajZiqT4CX

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict wobKqnR2Vm0zsjDcKpwKu8Q55QD4YnpVCvcELA6TJn6x8j6OevSfRgnreEZSKCY

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- PostgreSQL database dump complete
--

\unrestrict wobKqnR2Vm0zsjDcKpwKu8Q55QD4YnpVCvcELA6TJn6x8j6OevSfRgnreEZSKCY

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict 52lJUFZIE9bGWJvPII8AC6LtQdkF8MkimYlex6DKU48FnC3txr1jCQtH1lweRdY

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- Name: t; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t (
    x integer
);


ALTER TABLE public.t OWNER TO postgres;

--
-- Data for Name: t; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t (x) FROM stdin;
42
\.


--
-- PostgreSQL database dump complete
--

\unrestrict 52lJUFZIE9bGWJvPII8AC6LtQdkF8MkimYlex6DKU48FnC3txr1jCQtH1lweRdY

--
-- PostgreSQL database cluster dump complete
--

