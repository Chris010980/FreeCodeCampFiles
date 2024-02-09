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
    player_id integer NOT NULL,
    secret_number integer NOT NULL,
    number_guesses integer NOT NULL
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
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    player_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.player.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: player player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 793, 1);
INSERT INTO public.games VALUES (2, 1, 843, 2);
INSERT INTO public.games VALUES (3, 1, 247, 1);
INSERT INTO public.games VALUES (4, 2, 876, 877);
INSERT INTO public.games VALUES (5, 4, 141, 142);
INSERT INTO public.games VALUES (6, 1, 598, 1);
INSERT INTO public.games VALUES (7, 1, 265, 1);
INSERT INTO public.games VALUES (8, 9, 148, 149);
INSERT INTO public.games VALUES (9, 11, 7, 8);
INSERT INTO public.games VALUES (10, 16, 673, 674);
INSERT INTO public.games VALUES (11, 18, 378, 379);
INSERT INTO public.games VALUES (12, 1, 384, 3);
INSERT INTO public.games VALUES (13, 1, 528, 1);
INSERT INTO public.games VALUES (14, 23, 695, 696);
INSERT INTO public.games VALUES (15, 25, 460, 461);
INSERT INTO public.games VALUES (16, 1, 757, 1);
INSERT INTO public.games VALUES (17, 1, 274, 9);
INSERT INTO public.games VALUES (18, 30, 92, 93);
INSERT INTO public.games VALUES (19, 32, 602, 603);
INSERT INTO public.games VALUES (20, 37, 786, 787);
INSERT INTO public.games VALUES (21, 39, 623, 624);
INSERT INTO public.games VALUES (22, 44, 413, 414);
INSERT INTO public.games VALUES (23, 46, 115, 116);
INSERT INTO public.games VALUES (24, 51, 77, 78);
INSERT INTO public.games VALUES (25, 51, 997, 998);
INSERT INTO public.games VALUES (26, 52, 188, 189);
INSERT INTO public.games VALUES (27, 52, 183, 184);
INSERT INTO public.games VALUES (28, 51, 498, 500);
INSERT INTO public.games VALUES (29, 51, 63, 64);
INSERT INTO public.games VALUES (30, 51, 585, 586);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES (1, 'Christian');
INSERT INTO public.player VALUES (2, 'user_1707497529582');
INSERT INTO public.player VALUES (3, 'user_1707497529582');
INSERT INTO public.player VALUES (4, 'user_1707497529581');
INSERT INTO public.player VALUES (5, 'user_1707497529581');
INSERT INTO public.player VALUES (6, 'user_1707497529582');
INSERT INTO public.player VALUES (7, 'user_1707497529582');
INSERT INTO public.player VALUES (8, 'user_1707497529582');
INSERT INTO public.player VALUES (9, 'user_1707497834938');
INSERT INTO public.player VALUES (10, 'user_1707497834938');
INSERT INTO public.player VALUES (11, 'user_1707497834937');
INSERT INTO public.player VALUES (12, 'user_1707497834937');
INSERT INTO public.player VALUES (13, 'user_1707497834938');
INSERT INTO public.player VALUES (14, 'user_1707497834938');
INSERT INTO public.player VALUES (15, 'user_1707497834938');
INSERT INTO public.player VALUES (16, 'user_1707497882200');
INSERT INTO public.player VALUES (17, 'user_1707497882200');
INSERT INTO public.player VALUES (18, 'user_1707497882199');
INSERT INTO public.player VALUES (19, 'user_1707497882199');
INSERT INTO public.player VALUES (20, 'user_1707497882200');
INSERT INTO public.player VALUES (21, 'user_1707497882200');
INSERT INTO public.player VALUES (22, 'user_1707497882200');
INSERT INTO public.player VALUES (23, 'user_1707498363169');
INSERT INTO public.player VALUES (24, 'user_1707498363169');
INSERT INTO public.player VALUES (25, 'user_1707498363168');
INSERT INTO public.player VALUES (26, 'user_1707498363168');
INSERT INTO public.player VALUES (27, 'user_1707498363169');
INSERT INTO public.player VALUES (28, 'user_1707498363169');
INSERT INTO public.player VALUES (29, 'user_1707498363169');
INSERT INTO public.player VALUES (30, 'user_1707498511641');
INSERT INTO public.player VALUES (31, 'user_1707498511641');
INSERT INTO public.player VALUES (32, 'user_1707498511640');
INSERT INTO public.player VALUES (33, 'user_1707498511640');
INSERT INTO public.player VALUES (34, 'user_1707498511641');
INSERT INTO public.player VALUES (35, 'user_1707498511641');
INSERT INTO public.player VALUES (36, 'user_1707498511641');
INSERT INTO public.player VALUES (37, 'user_1707498618799');
INSERT INTO public.player VALUES (38, 'user_1707498618799');
INSERT INTO public.player VALUES (39, 'user_1707498618798');
INSERT INTO public.player VALUES (40, 'user_1707498618798');
INSERT INTO public.player VALUES (41, 'user_1707498618799');
INSERT INTO public.player VALUES (42, 'user_1707498618799');
INSERT INTO public.player VALUES (43, 'user_1707498618799');
INSERT INTO public.player VALUES (44, 'user_1707498735858');
INSERT INTO public.player VALUES (45, 'user_1707498735858');
INSERT INTO public.player VALUES (46, 'user_1707498735857');
INSERT INTO public.player VALUES (47, 'user_1707498735857');
INSERT INTO public.player VALUES (48, 'user_1707498735858');
INSERT INTO public.player VALUES (49, 'user_1707498735858');
INSERT INTO public.player VALUES (50, 'user_1707498735858');
INSERT INTO public.player VALUES (51, 'user_1707499145426');
INSERT INTO public.player VALUES (52, 'user_1707499145425');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_player_id_seq', 52, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(player_id);


--
-- PostgreSQL database dump complete
--

