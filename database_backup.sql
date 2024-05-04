--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Homebrew)
-- Dumped by pg_dump version 14.11 (Homebrew)

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
-- Name: agents; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.agents (
    name character varying(255),
    phone text,
    email character varying(255),
    id integer NOT NULL
);


ALTER TABLE public.agents OWNER TO michaela;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.agents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO michaela;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: buying; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.buying (
    id integer NOT NULL,
    property_id integer,
    list_price numeric(10,2),
    status character varying(50)
);


ALTER TABLE public.buying OWNER TO michaela;

--
-- Name: buying_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.buying_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buying_id_seq OWNER TO michaela;

--
-- Name: buying_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.buying_id_seq OWNED BY public.buying.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    property_type character varying(100),
    location character varying(255),
    price numeric(10,2),
    description text,
    category character varying(50),
    agent_id integer
);


ALTER TABLE public.properties OWNER TO michaela;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO michaela;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: renting; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.renting (
    id integer NOT NULL,
    property_id integer,
    rental_price numeric(10,2),
    available_date date
);


ALTER TABLE public.renting OWNER TO michaela;

--
-- Name: renting_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.renting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.renting_id_seq OWNER TO michaela;

--
-- Name: renting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.renting_id_seq OWNED BY public.renting.id;


--
-- Name: schedule_tour; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.schedule_tour (
    id integer NOT NULL,
    recipient_name character varying(100),
    recipient_email character varying(100),
    phone_number character varying(20),
    message text,
    scheduled_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.schedule_tour OWNER TO michaela;

--
-- Name: schedule_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.schedule_tour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_tour_id_seq OWNER TO michaela;

--
-- Name: schedule_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.schedule_tour_id_seq OWNED BY public.schedule_tour.id;


--
-- Name: selling; Type: TABLE; Schema: public; Owner: michaela
--

CREATE TABLE public.selling (
    id integer NOT NULL,
    property_id integer,
    list_price numeric(10,2),
    status character varying(50)
);


ALTER TABLE public.selling OWNER TO michaela;

--
-- Name: selling_id_seq; Type: SEQUENCE; Schema: public; Owner: michaela
--

CREATE SEQUENCE public.selling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selling_id_seq OWNER TO michaela;

--
-- Name: selling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: michaela
--

ALTER SEQUENCE public.selling_id_seq OWNED BY public.selling.id;


--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: buying id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.buying ALTER COLUMN id SET DEFAULT nextval('public.buying_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: renting id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.renting ALTER COLUMN id SET DEFAULT nextval('public.renting_id_seq'::regclass);


--
-- Name: schedule_tour id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.schedule_tour ALTER COLUMN id SET DEFAULT nextval('public.schedule_tour_id_seq'::regclass);


--
-- Name: selling id; Type: DEFAULT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.selling ALTER COLUMN id SET DEFAULT nextval('public.selling_id_seq'::regclass);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.agents (name, phone, email, id) FROM stdin;
Jane Doe	(000)000-0000	test@test.com	1
John Doe	(000)000-0001	test1@test.com	2
\.


--
-- Data for Name: buying; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.buying (id, property_id, list_price, status) FROM stdin;
1	1	500000.00	For Sale
2	3	400000.00	For Sale
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.properties (id, property_type, location, price, description, category, agent_id) FROM stdin;
1	House	New York	500000.00	Beautiful house in the heart of the city.	buying	1
3	Condo	Miami	400000.00	Luxurious condo near the beach.	buying	1
2	Apartment	Los Angeles	300000.00	Spacious apartment with a great view.	renting	1
4	Condo	Florida	300000.00	Large Condo in a walk friendly city.	renting	1
5	Townhouse	Texas	257000.00	Near the school district.	renting	1
\.


--
-- Data for Name: renting; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.renting (id, property_id, rental_price, available_date) FROM stdin;
1	2	2000.00	2024-05-01
5	4	1500.00	2024-06-17
6	5	1800.00	2024-06-06
\.


--
-- Data for Name: schedule_tour; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.schedule_tour (id, recipient_name, recipient_email, phone_number, message, scheduled_at) FROM stdin;
1	test	test	test	test	2024-05-03 22:44:33.098109
2	test	test	0000	test	2024-05-03 22:55:13.189902
3	test1	test1	0001	test	2024-05-03 22:55:25.912654
\.


--
-- Data for Name: selling; Type: TABLE DATA; Schema: public; Owner: michaela
--

COPY public.selling (id, property_id, list_price, status) FROM stdin;
\.


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.agents_id_seq', 2, true);


--
-- Name: buying_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.buying_id_seq', 2, true);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.properties_id_seq', 5, true);


--
-- Name: renting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.renting_id_seq', 6, true);


--
-- Name: schedule_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.schedule_tour_id_seq', 3, true);


--
-- Name: selling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: michaela
--

SELECT pg_catalog.setval('public.selling_id_seq', 1, true);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: buying buying_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: renting renting_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (id);


--
-- Name: schedule_tour schedule_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.schedule_tour
    ADD CONSTRAINT schedule_tour_pkey PRIMARY KEY (id);


--
-- Name: selling selling_pkey; Type: CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.selling
    ADD CONSTRAINT selling_pkey PRIMARY KEY (id);


--
-- Name: buying buying_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.buying
    ADD CONSTRAINT buying_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- Name: properties properties_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.agents(id);


--
-- Name: renting renting_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.renting
    ADD CONSTRAINT renting_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- Name: selling selling_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: michaela
--

ALTER TABLE ONLY public.selling
    ADD CONSTRAINT selling_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- PostgreSQL database dump complete
--

