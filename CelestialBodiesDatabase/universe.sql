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
    age_in_million_of_years integer NOT NULL,
    description text NOT NULL,
    distance_from_earth integer NOT NULL,
    name character varying(40) NOT NULL
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    name character varying(40) NOT NULL,
    meteor_id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    age_in_million_of_years integer NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    planet_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    name character varying(40) NOT NULL
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
    age_in_million_of_years integer NOT NULL,
    gravity numeric(4,2) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    star_id integer NOT NULL,
    name character varying(40) NOT NULL
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
    age_in_million_of_years integer NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth integer NOT NULL,
    name character varying(40) NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 13600, 'The Milky Way is the barred spiral galaxy that contains our Solar System and hundreds of billions of stars.', 0, 'Milk Way');
INSERT INTO public.galaxy VALUES (3, 10000, 'Andromeda Galaxy is the nearest spiral galaxy to the Milky Way and is on a collision course with it in about 4 billion years.', 2537000, 'Andromeda');
INSERT INTO public.galaxy VALUES (4, 12000, 'The Triangulum Galaxy is a member of the Local Group and the third-largest galaxy in it, featuring a well-defined spiral structure.', 3000000, 'Triangulum');
INSERT INTO public.galaxy VALUES (5, 13000, 'Messier 87 is a giant elliptical galaxy in the Virgo Cluster, famous for its supermassive black hole imaged by the Event Horizon Telescope.', 53000000, 'Messier 87');
INSERT INTO public.galaxy VALUES (6, 13000, 'The Large Magellanic Cloud is a satellite galaxy of the Milky Way and one of its closest neighbors, notable for active star formation regions such as the Tarantula Nebula.', 163000, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (7, 13000, 'The Sombrero Galaxy, designated Messier 104, is a bright unbarred spiral galaxy in the constellation Virgo, known for its prominent dust lane and large central bulge that gives it the appearance of a sombrero.', 29000000, 'Sombrero Galaxy');


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES ('Halley''s Meteor', 1, 'Famous meteor associated with Halley''s Comet, visible from Earth approximately every 76 years.');
INSERT INTO public.meteor VALUES ('Chelyabinsk Meteor', 2, 'A meteor that exploded over Chelyabinsk, Russia, in 2013, causing damage and injuries.');
INSERT INTO public.meteor VALUES ('Tunguska Meteor', 3, 'Meteor that caused the massive Tunguska explosion in Siberia in 1908, flattening a large forest area.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4500, 'Natural satellite of Earth, responsible for tides and stabilizing Earth''s axial tilt.', true, 3, 0, 'Moon');
INSERT INTO public.moon VALUES (2, 4500, 'Larger and closer of Mars’ two moons, irregularly shaped and slowly spiraling inward.', false, 4, 0, 'Phobos');
INSERT INTO public.moon VALUES (3, 4500, 'Smaller, outer moon of Mars with a smooth, dusty surface.', false, 4, 0, 'Deimos');
INSERT INTO public.moon VALUES (4, 4500, 'Most volcanically active body in the Solar System.', true, 5, 0, 'Io');
INSERT INTO public.moon VALUES (5, 4500, 'Icy moon thought to harbor a subsurface ocean beneath its frozen crust.', true, 5, 0, 'Europa');
INSERT INTO public.moon VALUES (6, 4500, 'Largest moon in the Solar System, even bigger than Mercury.', true, 5, 0, 'Ganymede');
INSERT INTO public.moon VALUES (7, 4500, 'Heavily cratered Galilean moon with an ancient surface.', true, 5, 0, 'Callisto');
INSERT INTO public.moon VALUES (8, 4500, 'Largest moon of Saturn, has a dense nitrogen-rich atmosphere.', true, 6, 0, 'Titan');
INSERT INTO public.moon VALUES (9, 4500, 'Icy moon with geysers ejecting water vapor, hinting at a subsurface ocean.', true, 6, 0, 'Enceladus');
INSERT INTO public.moon VALUES (10, 4500, 'Second-largest moon of Saturn, composed mainly of water ice.', true, 6, 0, 'Rhea');
INSERT INTO public.moon VALUES (11, 4500, 'Known for its striking two-tone coloration.', true, 6, 0, 'Iapetus');
INSERT INTO public.moon VALUES (12, 4500, 'Features bright ice cliffs and evidence of geological activity.', true, 6, 0, 'Dione');
INSERT INTO public.moon VALUES (13, 4500, 'Contains a massive impact crater called Odysseus.', true, 6, 0, 'Tethys');
INSERT INTO public.moon VALUES (14, 4500, 'Has giant canyons and varied surface features.', true, 8, 0, 'Miranda');
INSERT INTO public.moon VALUES (15, 4500, 'Brightest of Uranus’s moons, showing signs of past geological activity.', true, 8, 0, 'Ariel');
INSERT INTO public.moon VALUES (16, 4500, 'Dark moon with a large bright ring-shaped feature called Wunda.', true, 9, 0, 'Umbriel');
INSERT INTO public.moon VALUES (17, 4500, 'Largest of the Uranian moons, with many large impact craters.', true, 9, 0, 'Titania');
INSERT INTO public.moon VALUES (18, 4500, 'Second-largest of the Uranian moons, heavily cratered surface.', true, 10, 0, 'Oberon');
INSERT INTO public.moon VALUES (19, 4500, 'Largest moon of Neptune, has geysers and a retrograde orbit.', true, 11, 0, 'Triton');
INSERT INTO public.moon VALUES (20, 4500, 'Irregular moon of Neptune with a highly eccentric orbit.', false, 12, 0, 'Nereid');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4500, 3.70, 'Smallest planet in the Solar System and closest to the Sun, with a heavily cratered surface.', true, 1, 'Mercury');
INSERT INTO public.planet VALUES (2, 4500, 8.87, 'Second planet from the Sun, known for its dense CO2 atmosphere and extreme greenhouse effect.', true, 1, 'Venus');
INSERT INTO public.planet VALUES (3, 4500, 9.81, 'Our home planet, the only known world with life and liquid water on the surface.', true, 1, 'Earth');
INSERT INTO public.planet VALUES (4, 4500, 3.71, 'The Red Planet, famous for its iron oxide surface and potential for past microbial life.', true, 1, 'Mars');
INSERT INTO public.planet VALUES (5, 4500, 24.79, 'The largest planet in the Solar System, a gas giant with a powerful magnetic field.', true, 1, 'Jupiter');
INSERT INTO public.planet VALUES (6, 4500, 10.44, 'Gas giant well known for its spectacular ring system.', true, 1, 'Saturn');
INSERT INTO public.planet VALUES (8, 4000, 19.00, 'A super-Earth in the habitable zone of its star, discovered by the Kepler spacecraft.', true, 1, 'Kepler-22b');
INSERT INTO public.planet VALUES (9, 4500, 11.00, 'An Earth-size exoplanet in the habitable zone of the nearest star to the Sun.', true, 5, 'Proxima Centauri b');
INSERT INTO public.planet VALUES (10, 8, 15.00, 'Hypothetical giant gas planet orbiting Betelgeuse.', true, 2, 'Betelgeuse b');
INSERT INTO public.planet VALUES (11, 60, 20.00, 'Hypothetical hot-Jupiter-type planet around Alpha Andromedae.', true, 6, 'Alpha Andromedae b');
INSERT INTO public.planet VALUES (12, 20, 25.00, 'Hypothetical massive planet discovered in the Triangulum Galaxy.', true, 7, 'Var83 b');
INSERT INTO public.planet VALUES (13, 10000, 30.00, 'Hypothetical exoplanet orbiting a blue giant in M87’s halo.', true, 8, 'M87 Halo Blue Giant b');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 4600, 'The Sun is the star at the center of the Solar System, a G-type main-sequence star (G2V).', true, 2, 0, 'Sun');
INSERT INTO public.star VALUES (2, 8, 'Betelgeuse is a red supergiant in the constellation Orion, nearing the end of its life and expected to explode as a supernova.', true, 2, 642, 'Betelgeuse');
INSERT INTO public.star VALUES (5, 4500, 'Proxima Centauri is the closest known star to the Sun, a red dwarf of spectral type M5.5.', true, 2, 4, 'Proxima Centauri');
INSERT INTO public.star VALUES (6, 60, 'Alpha Andromedae is the brightest star in the Andromeda constellation, a binary system of type B8IVpMnHg.', true, 3, 97, 'Alpha Andromedae');
INSERT INTO public.star VALUES (7, 60, 'Var83 is a luminous blue variable star located in the Triangulum Galaxy (M33), known for its dramatic brightness changes.', true, 4, 3000000, 'Triangulum’s Var83');
INSERT INTO public.star VALUES (8, 10000, 'A bright blue giant star observed in the halo of the elliptical galaxy M87, contributing to the ultraviolet emission of the galaxy.', true, 5, 53000000, 'Messier 87* Jet Star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


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

