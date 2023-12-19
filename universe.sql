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
-- Name: celestialbody; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestialbody (
    celestialbody_id integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(1) NOT NULL
);


ALTER TABLE public.celestialbody OWNER TO freecodecamp;

--
-- Name: celestialbody_celestialbody_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestialbody_celestialbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestialbody_celestialbody_id_seq OWNER TO freecodecamp;

--
-- Name: celestialbody_celestialbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestialbody_celestialbody_id_seq OWNED BY public.celestialbody.celestialbody_id;


--
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    description_text text,
    name character varying(50) NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_ae integer,
    type character varying(30),
    age_in_million_years integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    distance_from_planet numeric(8,2),
    description_id integer
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
    name character varying(50) NOT NULL,
    star_id integer,
    gravity numeric(5,2),
    has_water boolean,
    has_solid_surface boolean,
    has_satellite boolean,
    number_satellites integer,
    distance integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    age_in_million_years integer,
    number_of_sun_masses numeric(11,2)
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
-- Name: celestialbody celestialbody_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestialbody ALTER COLUMN celestialbody_id SET DEFAULT nextval('public.celestialbody_celestialbody_id_seq'::regclass);


--
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Data for Name: celestialbody; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestialbody VALUES (1, 'planet', 'p');
INSERT INTO public.celestialbody VALUES (2, 'star', 's');
INSERT INTO public.celestialbody VALUES (3, 'moon', 'm');
INSERT INTO public.celestialbody VALUES (4, 'galaxy', 'g');


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'Our satellite', 'Mond');
INSERT INTO public.description VALUES (2, 'orbits mars', 'Phobos');
INSERT INTO public.description VALUES (3, 'orbits mars', 'Deimos');
INSERT INTO public.description VALUES (4, 'orbits jupyter', 'Io');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstrasse', 0, 'Spiralgalaxy', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromedagalaxy', 2560, 'Spiralgalaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Dreiecksnebel', 2735, 'Spiralgalaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 'Grosse Magelansche Wolke', 160, 'Zwerggalaxy', NULL);
INSERT INTO public.galaxy VALUES (5, 'Andromeda VIII', 2700, 'Zwerggalaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 3109', 4075, 'Zwerggalaxy', NULL);
INSERT INTO public.galaxy VALUES (7, 'Kleine Magelansche Wolke', 195, 'Zwerggalaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mond', 1, 384000.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 9000.00, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 23400.00, 3);
INSERT INTO public.moon VALUES (4, 'Io', 5, 420000.00, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 670000.00, 5);
INSERT INTO public.moon VALUES (6, 'Ganymed', 5, 900000.00, NULL);
INSERT INTO public.moon VALUES (7, 'Titron', 9, 354000.00, NULL);
INSERT INTO public.moon VALUES (8, 'Titania', 8, 436000.00, NULL);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 527000.00, NULL);
INSERT INTO public.moon VALUES (10, 'Oberon', 8, 583000.00, NULL);
INSERT INTO public.moon VALUES (11, 'Charon', 10, 20000.00, NULL);
INSERT INTO public.moon VALUES (12, 'Umbriel', 8, 266000.00, NULL);
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 190000.00, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 380000.00, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 290000.00, NULL);
INSERT INTO public.moon VALUES (16, 'Enceladus', 6, 238000.00, NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', 8, 130000.00, NULL);
INSERT INTO public.moon VALUES (18, 'Proteus', 9, 117000.00, NULL);
INSERT INTO public.moon VALUES (19, 'Mimas', 6, 285000.00, NULL);
INSERT INTO public.moon VALUES (20, 'Larissa', 9, 73500.00, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', 4, 9.81, true, true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Merkur', 4, 3.70, false, true, false, 0, 0);
INSERT INTO public.planet VALUES (3, 'Venus', 4, 8.87, false, true, false, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4, 3.69, false, true, true, 2, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4, 24.80, false, false, true, 95, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 4, 10.44, false, false, true, 146, 10);
INSERT INTO public.planet VALUES (7, 'Ceres', 4, 0.30, false, true, false, 0, 3);
INSERT INTO public.planet VALUES (8, 'Uranus', 4, 8.90, true, true, true, 27, 19);
INSERT INTO public.planet VALUES (9, 'Neptun', 4, 11.15, true, true, true, 14, 31);
INSERT INTO public.planet VALUES (10, 'Pluto', 4, 0.60, false, true, true, 5, 39);
INSERT INTO public.planet VALUES (11, 'Haumea', 4, 0.40, false, true, true, 2, 43);
INSERT INTO public.planet VALUES (12, 'Makemake', 4, NULL, true, true, true, 14, 45);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Sonne', 1, 3500, 1.00);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 6500, 1.10);
INSERT INTO public.star VALUES (6, 'Bernards Pfeilstern', 1, 12000, 0.16);
INSERT INTO public.star VALUES (7, 'Sirius', 1, 250, 2.10);
INSERT INTO public.star VALUES (8, 'Wolf359', 1, 400, 0.10);
INSERT INTO public.star VALUES (9, 'Altair', 1, 1200, 1.80);


--
-- Name: celestialbody_celestialbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestialbody_celestialbody_id_seq', 4, true);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: celestialbody celestialbody_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestialbody
    ADD CONSTRAINT celestialbody_abbreviation_key UNIQUE (abbreviation);


--
-- Name: celestialbody celestialbody_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestialbody
    ADD CONSTRAINT celestialbody_pkey PRIMARY KEY (celestialbody_id);


--
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


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

