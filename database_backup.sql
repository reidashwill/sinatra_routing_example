--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: albums; Type: TABLE; Schema: public; Owner: Dan
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.albums OWNER TO "Dan";

--
-- Name: albums_artists; Type: TABLE; Schema: public; Owner: Dan
--

CREATE TABLE public.albums_artists (
    id integer NOT NULL,
    artist_id integer,
    album_id integer
);


ALTER TABLE public.albums_artists OWNER TO "Dan";

--
-- Name: albums_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: Dan
--

CREATE SEQUENCE public.albums_artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_artists_id_seq OWNER TO "Dan";

--
-- Name: albums_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dan
--

ALTER SEQUENCE public.albums_artists_id_seq OWNED BY public.albums_artists.id;


--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: Dan
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO "Dan";

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dan
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: Dan
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.artists OWNER TO "Dan";

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: Dan
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO "Dan";

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dan
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: Dan
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying,
    album_id integer
);


ALTER TABLE public.songs OWNER TO "Dan";

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: Dan
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO "Dan";

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Dan
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: albums_artists id; Type: DEFAULT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.albums_artists ALTER COLUMN id SET DEFAULT nextval('public.albums_artists_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: Dan
--

COPY public.albums (id, name) FROM stdin;
2	dgsfgsd
1	...And Justice For All
3	Justice League
4	test
5	And out come the wolves
6	test
7	test
8	test
9	And out come the wolves
10	test
11	Blue
12	test
13	test
14	Blue
15	Blue
16	test
17	Blue
18	test
19	Blue
20	test
21	Blue
22	Blue
23	Abbey Road
24	Supernatural
\.


--
-- Data for Name: albums_artists; Type: TABLE DATA; Schema: public; Owner: Dan
--

COPY public.albums_artists (id, artist_id, album_id) FROM stdin;
1	1	4
2	6	11
3	1	4
4	6	11
5	6	11
6	1	4
7	3	11
8	1	4
9	3	11
10	6	11
11	8	23
12	9	24
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: Dan
--

COPY public.artists (id, name) FROM stdin;
1	Panopticon
2	Bobby McFerrin
3	Bobby McFerrin
4	Bobby McFerrin
5	Bobby McFerrin
6	Bobby McFerrin
7	Panopticon
8	Beatles
9	Carlos Santana
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: Dan
--

COPY public.songs (id, name, album_id) FROM stdin;
1	Come Together	23
\.


--
-- Name: albums_artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dan
--

SELECT pg_catalog.setval('public.albums_artists_id_seq', 12, true);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dan
--

SELECT pg_catalog.setval('public.albums_id_seq', 24, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dan
--

SELECT pg_catalog.setval('public.artists_id_seq', 9, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Dan
--

SELECT pg_catalog.setval('public.songs_id_seq', 1, true);


--
-- Name: albums_artists albums_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.albums_artists
    ADD CONSTRAINT albums_artists_pkey PRIMARY KEY (id);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: Dan
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

