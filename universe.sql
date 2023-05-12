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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    meaning character varying(60),
    location character varying(60)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_type character varying(60) NOT NULL,
    size numeric(10,2),
    stars integer,
    age integer,
    year_of_discovery integer
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
    name character varying(60) NOT NULL,
    size numeric(10,2),
    discoverer character varying(60),
    atmosphere boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    planet_type character varying(60),
    mass numeric(10,2),
    has_life boolean NOT NULL,
    age integer,
    star_id integer NOT NULL
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
    name character varying(60) NOT NULL,
    mass numeric(10,2),
    distance_from_earth numeric(10,2),
    age integer,
    galaxy_id integer,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Hunter', 'Northern Hemisphere');
INSERT INTO public.constellation VALUES (2, 'Ursa Mayor', 'Great Bear', 'Northern Hemisphere');
INSERT INTO public.constellation VALUES (3, 'Cygnus', 'Swan', 'Northern Hemisphere');
INSERT INTO public.constellation VALUES (4, 'Pegasus', 'Winged Horse', 'Northern Hemisphere');
INSERT INTO public.constellation VALUES (5, 'Scorpius', 'Scorpion', 'Southern Hemisphere');
INSERT INTO public.constellation VALUES (6, 'Canis Major', 'Great dog', 'Southern Hemisphere');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home', 'Spiral', 100.00, 200, 13000, 1920);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Largest neighbor', 'Elliptical', 150.00, 250, 10000, 1855);
INSERT INTO public.galaxy VALUES (5, 'Whirpool', 'Spiral arms', 'Spiral', 90.00, 170, 15000, 1950);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Resembles a sombrero', 'Spiral', 110.00, 190, 12000, 1935);
INSERT INTO public.galaxy VALUES (3, 'Centaurus', 'Irregular shape', 'Irregular', 120.00, 180, 20000, 1980);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Third largest locally', 'Spiral', 80.00, 150, 5000, 2010);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3475.00, 'Humans', false, 3);
INSERT INTO public.moon VALUES (2, 'Europa', 3121.00, 'Galileo', false, 5);
INSERT INTO public.moon VALUES (3, 'Titan', 5150.00, 'Huygens', false, 6);
INSERT INTO public.moon VALUES (4, 'Ganimedes', 5262.00, 'Galileo', false, 5);
INSERT INTO public.moon VALUES (5, 'Io', 3643.00, 'Galileo', false, 5);
INSERT INTO public.moon VALUES (6, 'Encelado', 504.00, 'Herschel', false, 6);
INSERT INTO public.moon VALUES (7, 'Triton', 2706.00, 'Lassell', false, 8);
INSERT INTO public.moon VALUES (8, 'Calisto', 4821.00, 'Galileo', false, 5);
INSERT INTO public.moon VALUES (9, 'Rea', 1529.00, 'Cassini', false, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 471.00, 'Kuiper', false, 7);
INSERT INTO public.moon VALUES (11, 'Tethys', 1060.00, 'Cassini', false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1122.00, 'Cassini', false, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 396.00, 'Herschel', false, 6);
INSERT INTO public.moon VALUES (14, 'Phobos', 11.10, 'Hall', false, 4);
INSERT INTO public.moon VALUES (15, 'Deimos', 6.20, 'Hall', false, 4);
INSERT INTO public.moon VALUES (16, 'Charon', 1207.00, 'Christy', false, 9);
INSERT INTO public.moon VALUES (17, 'Nereid', 340.00, 'Kuiper', false, 8);
INSERT INTO public.moon VALUES (18, 'Amaltea', 250.00, 'Barnard', false, 5);
INSERT INTO public.moon VALUES (19, 'Himalia', 186.00, 'Perrine', false, 5);
INSERT INTO public.moon VALUES (20, 'Elara', 86.40, 'Perrine', false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Terrestre', 0.33, false, 4, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestre', 4.87, false, 4, 1);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Terrestre', 5.97, true, 4, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 'Terrestre', 0.64, false, 4, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gigante Gaseoso', 1898.00, false, 4, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Gigante Gaseoso', 568.00, false, 4, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 'Gigante Gaseoso', 86.80, false, 4, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Gigante Gaseoso', 102.00, false, 4, 1);
INSERT INTO public.planet VALUES (9, 'Pluton', 'Enano', 0.00, false, 4, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Enano', 0.00, false, 4, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 'Enano', 0.00, false, 4, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Enano', 0.00, false, 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 0.00, 4600, 1, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 20.00, 643.00, 8, 1, 1);
INSERT INTO public.star VALUES (3, 'Deneb', 19.00, 1500.00, 5, 1, 3);
INSERT INTO public.star VALUES (4, 'Sirius', 2.00, 8.00, 200, 1, 5);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.12, 4.00, 4, 1, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 1.10, 4.37, 6, 1, NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star fk_constellation_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_constellation_id FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

