--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    tries integer NOT NULL,
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 12, 1);
INSERT INTO public.games VALUES (2, 13, 1);
INSERT INTO public.games VALUES (3, 12, 1);
INSERT INTO public.games VALUES (4, 9, 1);
INSERT INTO public.games VALUES (5, 10, 1);
INSERT INTO public.games VALUES (6, 488, 13);
INSERT INTO public.games VALUES (7, 675, 13);
INSERT INTO public.games VALUES (8, 221, 14);
INSERT INTO public.games VALUES (9, 963, 14);
INSERT INTO public.games VALUES (10, 15, 13);
INSERT INTO public.games VALUES (11, 21, 13);
INSERT INTO public.games VALUES (12, 367, 13);
INSERT INTO public.games VALUES (13, 441, 15);
INSERT INTO public.games VALUES (14, 43, 15);
INSERT INTO public.games VALUES (15, 469, 16);
INSERT INTO public.games VALUES (16, 364, 16);
INSERT INTO public.games VALUES (17, 652, 15);
INSERT INTO public.games VALUES (18, 946, 15);
INSERT INTO public.games VALUES (19, 240, 15);
INSERT INTO public.games VALUES (20, 437, 17);
INSERT INTO public.games VALUES (21, 67, 17);
INSERT INTO public.games VALUES (22, 545, 18);
INSERT INTO public.games VALUES (23, 3, 18);
INSERT INTO public.games VALUES (24, 917, 17);
INSERT INTO public.games VALUES (25, 407, 17);
INSERT INTO public.games VALUES (26, 767, 17);
INSERT INTO public.games VALUES (27, 44, 19);
INSERT INTO public.games VALUES (28, 286, 19);
INSERT INTO public.games VALUES (29, 659, 20);
INSERT INTO public.games VALUES (30, 61, 20);
INSERT INTO public.games VALUES (31, 724, 19);
INSERT INTO public.games VALUES (32, 431, 19);
INSERT INTO public.games VALUES (33, 653, 19);
INSERT INTO public.games VALUES (34, 920, 21);
INSERT INTO public.games VALUES (35, 391, 21);
INSERT INTO public.games VALUES (36, 759, 22);
INSERT INTO public.games VALUES (37, 12, 22);
INSERT INTO public.games VALUES (38, 624, 21);
INSERT INTO public.games VALUES (39, 154, 21);
INSERT INTO public.games VALUES (40, 888, 21);
INSERT INTO public.games VALUES (41, 405, 23);
INSERT INTO public.games VALUES (42, 231, 23);
INSERT INTO public.games VALUES (43, 748, 24);
INSERT INTO public.games VALUES (44, 1001, 24);
INSERT INTO public.games VALUES (45, 864, 23);
INSERT INTO public.games VALUES (46, 874, 23);
INSERT INTO public.games VALUES (47, 998, 23);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Eric');
INSERT INTO public.users VALUES (2, 'user_1735106718400');
INSERT INTO public.users VALUES (3, 'user_1735106718399');
INSERT INTO public.users VALUES (4, 'EriErci');
INSERT INTO public.users VALUES (5, 'user_1735108760993');
INSERT INTO public.users VALUES (6, 'user_1735108760992');
INSERT INTO public.users VALUES (7, 'user_1735108784275');
INSERT INTO public.users VALUES (8, 'user_1735108784274');
INSERT INTO public.users VALUES (9, 'user_1735108819362');
INSERT INTO public.users VALUES (10, 'user_1735108819361');
INSERT INTO public.users VALUES (11, 'user_1735110437158');
INSERT INTO public.users VALUES (12, 'user_1735110437157');
INSERT INTO public.users VALUES (13, 'user_1735111700777');
INSERT INTO public.users VALUES (14, 'user_1735111700776');
INSERT INTO public.users VALUES (15, 'user_1735111789264');
INSERT INTO public.users VALUES (16, 'user_1735111789263');
INSERT INTO public.users VALUES (17, 'user_1735111836939');
INSERT INTO public.users VALUES (18, 'user_1735111836938');
INSERT INTO public.users VALUES (19, 'user_1735111868705');
INSERT INTO public.users VALUES (20, 'user_1735111868704');
INSERT INTO public.users VALUES (21, 'user_1735111913465');
INSERT INTO public.users VALUES (22, 'user_1735111913464');
INSERT INTO public.users VALUES (23, 'user_1735111975164');
INSERT INTO public.users VALUES (24, 'user_1735111975163');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 47, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

