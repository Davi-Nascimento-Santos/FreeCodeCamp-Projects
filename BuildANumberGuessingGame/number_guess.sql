--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guessing_game;
--
-- Name: number_guessing_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing_game OWNER TO freecodecamp;

\connect number_guessing_game

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
    player_id integer,
    number_tries integer NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 4);
INSERT INTO public.games VALUES (2, 10, 4);
INSERT INTO public.games VALUES (3, 11, 475);
INSERT INTO public.games VALUES (4, 11, 362);
INSERT INTO public.games VALUES (5, 12, 72);
INSERT INTO public.games VALUES (6, 12, 194);
INSERT INTO public.games VALUES (7, 11, 291);
INSERT INTO public.games VALUES (8, 11, 517);
INSERT INTO public.games VALUES (9, 11, 41);
INSERT INTO public.games VALUES (10, 13, 985);
INSERT INTO public.games VALUES (11, 13, 775);
INSERT INTO public.games VALUES (12, 14, 431);
INSERT INTO public.games VALUES (13, 14, 97);
INSERT INTO public.games VALUES (14, 13, 362);
INSERT INTO public.games VALUES (15, 13, 159);
INSERT INTO public.games VALUES (16, 13, 323);
INSERT INTO public.games VALUES (17, 15, 70);
INSERT INTO public.games VALUES (18, 15, 986);
INSERT INTO public.games VALUES (19, 16, 19);
INSERT INTO public.games VALUES (20, 16, 397);
INSERT INTO public.games VALUES (21, 15, 728);
INSERT INTO public.games VALUES (22, 15, 200);
INSERT INTO public.games VALUES (23, 15, 730);
INSERT INTO public.games VALUES (24, 17, 42);
INSERT INTO public.games VALUES (25, 17, 677);
INSERT INTO public.games VALUES (26, 18, 358);
INSERT INTO public.games VALUES (27, 18, 109);
INSERT INTO public.games VALUES (28, 17, 999);
INSERT INTO public.games VALUES (29, 17, 233);
INSERT INTO public.games VALUES (30, 17, 832);
INSERT INTO public.games VALUES (31, 19, 293);
INSERT INTO public.games VALUES (32, 19, 243);
INSERT INTO public.games VALUES (33, 20, 547);
INSERT INTO public.games VALUES (34, 20, 869);
INSERT INTO public.games VALUES (35, 19, 746);
INSERT INTO public.games VALUES (36, 19, 769);
INSERT INTO public.games VALUES (37, 19, 175);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (10, 'Davi');
INSERT INTO public.players VALUES (11, 'user_1761596698736');
INSERT INTO public.players VALUES (12, 'user_1761596698735');
INSERT INTO public.players VALUES (13, 'user_1761596803843');
INSERT INTO public.players VALUES (14, 'user_1761596803842');
INSERT INTO public.players VALUES (15, 'user_1761596849264');
INSERT INTO public.players VALUES (16, 'user_1761596849263');
INSERT INTO public.players VALUES (17, 'user_1761597069969');
INSERT INTO public.players VALUES (18, 'user_1761597069968');
INSERT INTO public.players VALUES (19, 'user_1761597117719');
INSERT INTO public.players VALUES (20, 'user_1761597117718');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 37, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

