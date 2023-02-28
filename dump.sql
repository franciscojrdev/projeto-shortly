--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessionsUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."sessionsUrls" (
    id integer NOT NULL,
    "sessionId" integer NOT NULL,
    "urlsId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessionsUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."sessionsUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessionsUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."sessionsUrls_id_seq" OWNED BY public."sessionsUrls".id;


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" character varying(100) NOT NULL,
    url text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessionsUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."sessionsUrls" ALTER COLUMN id SET DEFAULT nextval('public."sessionsUrls_id_seq"'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '06f30e9d-6c64-4572-a753-977a9e05f188', 1, '2023-02-27 23:50:05.699069');
INSERT INTO public.sessions VALUES (2, 'b790cb83-7350-42c9-bf2c-de4861f90f91', 2, '2023-02-28 15:56:44.787519');
INSERT INTO public.sessions VALUES (3, 'cd548d4f-6a96-499e-b112-78c8a512db34', 3, '2023-02-28 16:14:29.678829');
INSERT INTO public.sessions VALUES (4, '72a59596-4f91-4be7-8ba2-12a665672878', 4, '2023-02-28 16:54:45.668246');


--
-- Data for Name: sessionsUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."sessionsUrls" VALUES (1, 1, 1, '2023-02-27 23:50:38.27314');
INSERT INTO public."sessionsUrls" VALUES (2, 1, 2, '2023-02-27 23:50:44.263677');
INSERT INTO public."sessionsUrls" VALUES (3, 2, 3, '2023-02-28 15:58:34.231841');
INSERT INTO public."sessionsUrls" VALUES (4, 2, 4, '2023-02-28 15:58:36.440637');
INSERT INTO public."sessionsUrls" VALUES (5, 2, 5, '2023-02-28 15:58:37.182626');
INSERT INTO public."sessionsUrls" VALUES (6, 2, 6, '2023-02-28 15:59:06.072478');
INSERT INTO public."sessionsUrls" VALUES (7, 3, 7, '2023-02-28 16:15:04.712295');
INSERT INTO public."sessionsUrls" VALUES (8, 3, 8, '2023-02-28 16:15:06.667476');
INSERT INTO public."sessionsUrls" VALUES (9, 4, 9, '2023-02-28 16:55:23.652273');
INSERT INTO public."sessionsUrls" VALUES (10, 4, 10, '2023-02-28 16:55:37.062583');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 'J51oS9Wf8f', 'https://g1.globo.com', 0, '2023-02-27 23:50:44.262117');
INSERT INTO public.urls VALUES (1, 'La-a61FrtQ', 'https://g1.globo.com', 1, '2023-02-27 23:50:38.259841');
INSERT INTO public.urls VALUES (3, 'rVNiSsrWrl', 'https://www.youtube.com/watch?v=ZD1QrIe--_Y', 0, '2023-02-28 15:58:34.212526');
INSERT INTO public.urls VALUES (4, '9HIwZuWJCU', 'https://www.youtube.com/watch?v=ZD1QrIe--_Y', 0, '2023-02-28 15:58:36.426435');
INSERT INTO public.urls VALUES (5, 'rXO8JAVBdy', 'https://www.youtube.com/watch?v=ZD1QrIe--_Y', 1, '2023-02-28 15:58:37.169635');
INSERT INTO public.urls VALUES (6, 'lNwWbGSyyz', 'https://www.youtube.com', 1, '2023-02-28 15:59:06.05941');
INSERT INTO public.urls VALUES (7, '3srrQxeweV', 'https://www.youtube.com', 0, '2023-02-28 16:15:04.671161');
INSERT INTO public.urls VALUES (8, '4ueZFBY8YY', 'https://www.youtube.com', 2, '2023-02-28 16:15:06.665272');
INSERT INTO public.urls VALUES (9, 'C8hYU0PAwa', 'https://www.g1.com', 0, '2023-02-28 16:55:23.638497');
INSERT INTO public.urls VALUES (10, 'OUokbmA61K', 'https://www.g1.com', 0, '2023-02-28 16:55:37.05032');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'teste', 'teste@teste.com', '$2b$10$LS52OTiWnSqPKJtfxrH0aOsExEojOQBZfR6/gRW9E7AzTPLRU4zMy', '2023-02-27 23:49:58.624206');
INSERT INTO public.users VALUES (2, 'bruna', 'bruna@teste.com', '$2b$10$O27EY5.HRKCEN1aWbmtbQO8Rhw9ZTrY4z4nuzTMn7kYNUX33KBYaK', '2023-02-28 15:56:34.50829');
INSERT INTO public.users VALUES (3, 'driven', 'driven@teste.com', '$2b$10$w2ekL6fp2m2LdPJIEx2SDuAxxg2xkQoE68AHK2yuKrPxzBRPztZ8S', '2023-02-28 16:14:22.382977');
INSERT INTO public.users VALUES (4, 'junior', 'junior@teste.com', '$2b$10$LoCR7E8qbaVhbLKWbW8iIueN5Oib9xpzOcDljqhOv/McSXMl/Ehza', '2023-02-28 16:54:39.767386');


--
-- Name: sessionsUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."sessionsUrls_id_seq"', 10, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: sessionsUrls sessionsUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."sessionsUrls"
    ADD CONSTRAINT "sessionsUrls_pkey" PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessionsUrls sessionsUrls_sessionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."sessionsUrls"
    ADD CONSTRAINT "sessionsUrls_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES public.sessions(id);


--
-- Name: sessionsUrls sessionsUrls_urlsId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."sessionsUrls"
    ADD CONSTRAINT "sessionsUrls_urlsId_fkey" FOREIGN KEY ("urlsId") REFERENCES public.urls(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

