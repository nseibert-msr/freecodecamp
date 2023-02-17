--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: being; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.being (
    being_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    population numeric
);


ALTER TABLE public.being OWNER TO freecodecamp;

--
-- Name: being_being_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.being_being_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.being_being_id_seq OWNER TO freecodecamp;

--
-- Name: being_being_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.being_being_id_seq OWNED BY public.being.being_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    constellation character varying(30),
    name character varying(30) NOT NULL,
    galaxy_types text NOT NULL,
    date_disc date,
    dist_in_mly double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    disc_year integer,
    radius_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    dist_from_sun_in_km integer,
    diameter_in_km integer,
    star_id integer NOT NULL,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    surface_temp_in_k integer,
    classification text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: being being_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being ALTER COLUMN being_id SET DEFAULT nextval('public.being_being_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: being; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.being VALUES (1, 'human', 3, 8000000000);
INSERT INTO public.being VALUES (2, 'bird', 3, 50000000000);
INSERT INTO public.being VALUES (3, 'Hutt', 12, 12000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Ursa Major', 'Pinwheel', 'toy', '1781-01-01', 20.9);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 'Centaurus A', 'naked-eye', '1826-04-29', 13.05);
INSERT INTO public.galaxy VALUES (4, 'Ursa Major', 'Bodes', 'naked-eye', '1774-12-31', 13.31);
INSERT INTO public.galaxy VALUES (3, 'Virgo', 'Sombrero', 'dust-band', '1781-05-11', 9.55);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'naked-eye', '0965-01-01', 2.5);
INSERT INTO public.galaxy VALUES (1, 'Sagittarius', 'Milky Way', 'band like', '1900-01-01', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3, 0, 1738);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 11);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1977, 6);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1610, 11822);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1610, 1561);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1610, 2634);
INSERT INTO public.moon VALUES (7, 'Vallisto', 5, 1610, 2410);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 1892, 84);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 1904, 70);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 1905, 43);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 1789, 192);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, 1789, 252);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1684, 533);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1684, 561);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1672, 764);
INSERT INTO public.moon VALUES (16, 'Titan', 6, 1655, 2575);
INSERT INTO public.moon VALUES (17, 'Ariel', 8, 1851, 579);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 1851, 585);
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 1787, 761);
INSERT INTO public.moon VALUES (20, 'Miranda', 8, 1948, 236);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57909227, 4879, 5, false);
INSERT INTO public.planet VALUES (2, 'Venus', 108209475, 12104, 5, false);
INSERT INTO public.planet VALUES (3, 'Earth', 149598262, 12742, 5, true);
INSERT INTO public.planet VALUES (4, 'Mars', 227943824, 6779, 5, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778340821, 139822, 5, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1426666422, 116464, 5, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 449839644, 49244, 5, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 287065818, 50724, 5, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri', 7065818, 50724, 2, false);
INSERT INTO public.planet VALUES (10, 'Lalande', 5646, 10724, 3, false);
INSERT INTO public.planet VALUES (11, 'Tau Ceti', 5646, 10724, 8, false);
INSERT INTO public.planet VALUES (12, 'Tatooine', 464646, 140724, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 13800, 'hot blue star', true);
INSERT INTO public.star VALUES (3, 'Mirach', 2, 13800, 'bright red class', true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 44000, 'scorching', true);
INSERT INTO public.star VALUES (5, 'Sol', 1, 1200, 'our sun', true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 5500, 'Eagle', true);
INSERT INTO public.star VALUES (7, 'Virgo', 3, 1000000, 'Made-up', true);
INSERT INTO public.star VALUES (8, 'Tau', 1, 4510724, 'from_book', true);


--
-- Name: being_being_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.being_being_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: being being_being_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_being_id_key UNIQUE (being_id);


--
-- Name: being being_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT being_pkey PRIMARY KEY (being_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (galaxy_id, name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

