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
-- Name: ateroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ateroid (
    ateroid_id integer NOT NULL,
    name character varying(30),
    diameter integer NOT NULL,
    collided boolean NOT NULL
);


ALTER TABLE public.ateroid OWNER TO freecodecamp;

--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ateroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ateroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ateroid_asteroid_id_seq OWNED BY public.ateroid.ateroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    type character varying(30) NOT NULL,
    diameter integer,
    mass numeric(3,2) NOT NULL,
    galaxy_id integer NOT NULL
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
    name character varying(30),
    planet_id integer,
    semi_major_axis integer NOT NULL,
    discovered_by character varying(40) NOT NULL
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
    name character varying(30),
    type character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    surface_temperature integer NOT NULL
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
    name character varying(30),
    type text NOT NULL,
    galaxy_id integer,
    mass numeric(5,3) NOT NULL
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
-- Name: ateroid ateroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ateroid ALTER COLUMN ateroid_id SET DEFAULT nextval('public.ateroid_asteroid_id_seq'::regclass);


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
-- Data for Name: ateroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ateroid VALUES (1, 'Ceres', 939, false);
INSERT INTO public.ateroid VALUES (2, 'Vesta', 525, false);
INSERT INTO public.ateroid VALUES (3, 'Pallas', 512, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Via Lattea', 'Spirale', 100000, 1.50, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spirale', 220000, 1.76, 2);
INSERT INTO public.galaxy VALUES ('sombrero', 'Spirale', 49000, 0.80, 3);
INSERT INTO public.galaxy VALUES ('Galassia Del Triangolo', 'Spirale', 60000, 0.54, 4);
INSERT INTO public.galaxy VALUES ('Centaurus A', 'Ellittica', 60000, 1.20, 5);
INSERT INTO public.galaxy VALUES ('NGC 1300', 'Spirale Barrata', 110000, 0.67, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 384400, 'Antichi Astronomi');
INSERT INTO public.moon VALUES (2, 'Europa', 2, 670900, 'Galielo Galilei');
INSERT INTO public.moon VALUES (3, 'Titano', 2, 1221870, 'Christiaan Huygens');
INSERT INTO public.moon VALUES (4, 'Ganimede', 2, 1070400, 'Galileo Galilei');
INSERT INTO public.moon VALUES (5, 'Tritone', 3, 354800, 'William Lassel');
INSERT INTO public.moon VALUES (6, 'Callisto', 2, 1882700, 'Galileo Galilei');
INSERT INTO public.moon VALUES (7, 'Io', 2, 421700, 'Galileo Galilei');
INSERT INTO public.moon VALUES (8, 'Encelado', 2, 237948, 'William Herschel');
INSERT INTO public.moon VALUES (9, 'Mimas', 2, 185539, 'William Herschel');
INSERT INTO public.moon VALUES (10, 'Rea', 2, 527108, 'Giovanni Cassini');
INSERT INTO public.moon VALUES (11, 'Teti', 2, 294619, 'Giovanni Cassini');
INSERT INTO public.moon VALUES (12, 'Dione', 2, 377415, 'Giovanni Cassini');
INSERT INTO public.moon VALUES (13, 'Miranda', 4, 129390, 'William Herschel');
INSERT INTO public.moon VALUES (14, 'Ariel', 4, 191020, 'William Herschel');
INSERT INTO public.moon VALUES (15, 'Umbriel', 4, 266000, 'William Herschel');
INSERT INTO public.moon VALUES (16, 'Oberon', 4, 583520, 'William Herschel');
INSERT INTO public.moon VALUES (17, 'Titania', 4, 436300, 'William Herschel');
INSERT INTO public.moon VALUES (18, 'Phobos', 3, 9376, 'Asaph Hall');
INSERT INTO public.moon VALUES (19, 'deimos', 3, 23463, 'Asaph Hall');
INSERT INTO public.moon VALUES (20, 'Charon', 5, 19571, 'James Christy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terra', 'Terrestre', 1, true, 288);
INSERT INTO public.planet VALUES (2, 'Giove', 'Gigante Gassoso', 1, false, 165);
INSERT INTO public.planet VALUES (3, 'Marte', 'Terrestre', 1, false, 210);
INSERT INTO public.planet VALUES (4, 'Venere', 'Terrestre', 1, false, 737);
INSERT INTO public.planet VALUES (5, 'Kepler-452b', 'Terrstre', 2, false, 265);
INSERT INTO public.planet VALUES (6, 'Nettuno', 'Gigante Ghiacciato', 1, false, 72);
INSERT INTO public.planet VALUES (7, 'Urano', 'Gigante Ghiacciato', 1, false, 76);
INSERT INTO public.planet VALUES (8, 'Saturno', 'Gigante Gassoso', 1, false, 134);
INSERT INTO public.planet VALUES (9, 'Mercurio', 'Terrestre', 1, false, 440);
INSERT INTO public.planet VALUES (10, 'Gliese-581g', 'Super-Terrestre', 3, false, 218);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Gioviano Caldo', 4, false, 1300);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Super_terrestre', 5, false, 295);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sole', 'Nana Gialla', 1, 1.000);
INSERT INTO public.star VALUES (2, 'Betelguese', 'Supergigante Rossa', 1, 18.000);
INSERT INTO public.star VALUES (3, 'Sirio', 'Nana Bianca', 1, 2.020);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Nana Rossa', 1, 0.122);
INSERT INTO public.star VALUES (5, 'Alfa Centauri A', 'Nana Gialla', 2, 1.100);
INSERT INTO public.star VALUES (6, 'Vega', 'Stella Bianca', 1, 2.100);


--
-- Name: ateroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ateroid_asteroid_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: ateroid asteroide_unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ateroid
    ADD CONSTRAINT asteroide_unico UNIQUE (name);


--
-- Name: ateroid ateroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ateroid
    ADD CONSTRAINT ateroid_pkey PRIMARY KEY (ateroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon luna_unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT luna_unico UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy nome_unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT nome_unico UNIQUE (name);


--
-- Name: planet pianeta_unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pianeta_unico UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unico; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unico UNIQUE (name);


--
-- Name: star id_galassia_esterno; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT id_galassia_esterno FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon id_pianeta_esterno; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT id_pianeta_esterno FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet id_stella_esterno; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT id_stella_esterno FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

