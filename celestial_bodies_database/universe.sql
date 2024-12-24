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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    distance_from_earth_km numeric NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer NOT NULL,
    is_active boolean NOT NULL,
    notes text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer NOT NULL,
    has_life boolean NOT NULL,
    atmosphere_composition text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_solar_units numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    spectral_type character varying NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_billion_years integer NOT NULL,
    has_dark_energy boolean NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Miky Way', 'Spiral', 0, 'Our own galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 25370000000000000000, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 27230000000000000000, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 131800000000000000000, 'Brightest galaxy in the constellation Centaurus');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 234000000000000000000, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 277000000000000000000, 'Galaxy with a bright nucleus and large central bulge');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, false, 'Earth''s only natural satellite', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, 'Inner and larger of Mars'' two moons', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 13, false, 'Outer and smaller of Mars'' two moons', 4);
INSERT INTO public.moon VALUES (4, 'Io', 3642, true, 'Most volcanically active body in the Solar System', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, true, 'Smooth ice surface, potential subsurface ocean', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, false, 'Largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, false, 'Third-largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, true, 'Largest moon of Saturn, thick atmosphere', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, true, 'Ice geysers at south pole', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, false, 'Large impact crater gives "Death Star" appearance', 6);
INSERT INTO public.moon VALUES (11, 'Miranda', 472, false, 'Smallest of Uranus'' five major moons', 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 1158, false, 'Brightest moon of Uranus', 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1169, false, 'Darkest of Uranus'' five major moons', 7);
INSERT INTO public.moon VALUES (14, 'Triton', 2707, true, 'Largest moon of Neptune, retrograde orbit', 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 340, false, 'Third-largest moon of Neptune', 8);
INSERT INTO public.moon VALUES (16, 'Charon', 1212, false, 'Largest moon of Pluto (dwarf planet)', 3);
INSERT INTO public.moon VALUES (17, 'Proxima b Moon 1', 1000, false, 'Hypothetical moon of Proxima Centauri b', 9);
INSERT INTO public.moon VALUES (18, 'Betelgeuse b Moon 1', 5000, true, 'Hypothetical large moon of Betelgeuse b', 10);
INSERT INTO public.moon VALUES (19, 'Alpheratz b Moon 1', 2000, false, 'Hypothetical moon of Alpheratz b', 11);
INSERT INTO public.moon VALUES (20, 'Mirach c Moon 1', 1500, false, 'Hypothetical moon of Mirach c', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, false, 'Minimal - Exosphere', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, false, 'CO2, Nitrogen', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, true, 'Nitrogen, Oxygen', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, false, 'CO2, Nitrogen, Argon', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, false, 'Hydrogen, Helium', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, false, 'Hydrogen, Helium', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, false, 'Hydrogen, Helium, Methane', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, false, 'Hydrogen, Helium, Methane', 7);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 12742, false, 'Unknown', 8);
INSERT INTO public.planet VALUES (10, 'Betelgeuse b', 200000, false, 'Hydrogen, Helium', 9);
INSERT INTO public.planet VALUES (11, 'Alpheratz b', 150000, false, 'Unknown', 10);
INSERT INTO public.planet VALUES (12, 'Mirach c', 100000, false, 'Unknown', 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 1.0, true, 'G2V', 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 0.12, true, 'M5.5Ve', 1);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 11.6, false, 'M1-2Ia-Iab', 1);
INSERT INTO public.star VALUES (10, 'Alpheratz', 3.8, true, 'B8IVpMnHg', 2);
INSERT INTO public.star VALUES (11, 'Mirach', 2.49, false, 'M0III', 2);
INSERT INTO public.star VALUES (12, 'Triangulum A', 20, true, 'O3V', 3);
INSERT INTO public.star VALUES (13, 'Triangulum B', 12, true, 'B2V', 3);
INSERT INTO public.star VALUES (14, 'Centaurus X-1', 10, false, 'WO', 4);
INSERT INTO public.star VALUES (15, 'Centaurus X-2', 15, false, 'LBV', 4);
INSERT INTO public.star VALUES (16, 'Whirlpool X-1', 25, false, 'WN', 5);
INSERT INTO public.star VALUES (17, 'Whirlpool X-2', 18, true, 'O7V', 5);
INSERT INTO public.star VALUES (18, 'Sombrero X-1', 30, false, 'WC', 6);
INSERT INTO public.star VALUES (19, 'Sombrero X-2', 22, true, 'O5V', 6);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Observable Universe', 13, true);
INSERT INTO public.universe VALUES (2, 'Multiverse Alpha', 18, false);
INSERT INTO public.universe VALUES (3, 'Bubble Universe Beta', 9, true);
INSERT INTO public.universe VALUES (4, 'String Theory Universe Gamma', 15, true);
INSERT INTO public.universe VALUES (5, 'Holographic Universe Delta', 11, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

