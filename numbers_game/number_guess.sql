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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    rand_no integer NOT NULL,
    guess_num integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (11, 726, 19, 1);
INSERT INTO public.games VALUES (12, 721, 8, 1);
INSERT INTO public.games VALUES (13, 754, 12, 1);
INSERT INTO public.games VALUES (14, 976, 10, 1);
INSERT INTO public.games VALUES (43, 896, 11, 1);
INSERT INTO public.games VALUES (51, 986, 11, 22);
INSERT INTO public.games VALUES (52, 688, 13, 23);
INSERT INTO public.games VALUES (53, 978, 979, 24);
INSERT INTO public.games VALUES (54, 537, 538, 24);
INSERT INTO public.games VALUES (55, 649, 650, 25);
INSERT INTO public.games VALUES (56, 353, 354, 25);
INSERT INTO public.games VALUES (57, 70, 73, 24);
INSERT INTO public.games VALUES (58, 611, 612, 24);
INSERT INTO public.games VALUES (59, 425, 426, 24);
INSERT INTO public.games VALUES (60, 730, 731, 26);
INSERT INTO public.games VALUES (61, 39, 40, 26);
INSERT INTO public.games VALUES (62, 14, 15, 27);
INSERT INTO public.games VALUES (63, 531, 532, 27);
INSERT INTO public.games VALUES (64, 274, 277, 26);
INSERT INTO public.games VALUES (65, 799, 800, 26);
INSERT INTO public.games VALUES (66, 762, 763, 26);
INSERT INTO public.games VALUES (67, 499, 500, 28);
INSERT INTO public.games VALUES (68, 278, 279, 28);
INSERT INTO public.games VALUES (69, 236, 237, 29);
INSERT INTO public.games VALUES (70, 122, 123, 29);
INSERT INTO public.games VALUES (71, 245, 248, 28);
INSERT INTO public.games VALUES (72, 324, 325, 28);
INSERT INTO public.games VALUES (73, 11, 12, 28);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Nick');
INSERT INTO public.users VALUES (22, 'Jim');
INSERT INTO public.users VALUES (23, 'Michael');
INSERT INTO public.users VALUES (24, 'user_1679010700734');
INSERT INTO public.users VALUES (25, 'user_1679010700733');
INSERT INTO public.users VALUES (26, 'user_1679010729873');
INSERT INTO public.users VALUES (27, 'user_1679010729872');
INSERT INTO public.users VALUES (28, 'user_1679010763551');
INSERT INTO public.users VALUES (29, 'user_1679010763550');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 73, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users uq_username; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_username UNIQUE (username);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

