--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.2

-- Started on 2022-01-14 11:06:08

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
-- TOC entry 203 (class 1259 OID 16608)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    picture_url text NOT NULL,
    description text NOT NULL,
    contact_info text NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16619)
-- Name: account_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_category (
    id integer NOT NULL,
    account_id integer NOT NULL,
    category_id integer NOT NULL,
    enabled boolean NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.account_category OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16617)
-- Name: account_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 16606)
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 201 (class 1259 OID 16598)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    icon_url text NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16596)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 207 (class 1259 OID 16640)
-- Name: impression; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impression (
    id integer NOT NULL,
    inverse_id integer,
    receiver_id integer NOT NULL,
    subject_id integer NOT NULL,
    accepted boolean
);


ALTER TABLE public.impression OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16638)
-- Name: impression_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.impression ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.impression_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3620 (class 0 OID 16608)
-- Dependencies: 203
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (61, 'Sam', '$argon2id$v=19$m=262144,t=5,p=1$iH6ODRmkOo4pqajhDH3sWw$OzDsKovOvJQi5XaHohpDWoF9Z4bXazQNEfEu51hy73c', 'https://randomuser.me/api/portraits/lego/4.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (68, 'TestUser345', '$argon2id$v=19$m=262144,t=5,p=1$rDxOsYQ51MufPOrhRt+SXw$47BClbxXf6Ax78m9MBh0dxo8Fc4dZHBSziekSFW69ms', 'https://randomuser.me/api/portraits/lego/8.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (70, 'TestAccount245', '', 'https://randomuser.me/api/portraits/lego/2.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (72, 'Nicholas', '$argon2id$v=19$m=262144,t=5,p=1$z49puF61TiNPNYj1A60YKQ$0JdDvcmaqELTP3qcVFXscfUWPNfRjtJLDxTXgi3uHD4', 'https://randomuser.me/api/portraits/lego/6.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (1, 'gregelous0', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/51.jpg', 'test description', '888-888-8888');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (2, 'jcardello1', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/38.jpg', 'Fundamental attitude-oriented moratorium', 'piley1@fema.gov');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (3, 'laxell2', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/48.jpg', 'Versatile 24 hour analyzer', 'lstodart2@wikimedia.org');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (4, 'gschubbert3', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/9.jpg', 'Team-oriented even-keeled instruction set', 'dmacdowall3@usatoday.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (5, 'mclamp4', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/39.jpg', 'User-friendly systematic concept', 'abonhome4@purevolume.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (6, 'iwalczak5', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/20.jpg', 'Adaptive mobile solution', 'bverbrugghen5@ehow.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (7, 'mgwyn6', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/22.jpg', 'Expanded interactive encryption', 'lcharlon6@vimeo.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (8, 'jpomeroy7', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/29.jpg', 'Synergistic mission-critical support', 'bberka7@usnews.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (9, 'ghawtin8', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/27.jpg', 'Adaptive eco-centric local area network', 'emcbride8@barnesandnoble.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (10, 'qhusby9', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/21.jpg', 'Visionary web-enabled infrastructure', 'dausiello9@huffingtonpost.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (11, 'lhammela', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/42.jpg', 'Realigned full-range encryption', 'krentolla@about.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (12, 'apetyankinb', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/7.jpg', 'Seamless secondary synergy', 'fgentyb@indiatimes.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (13, 'jmonceyc', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/6.jpg', 'Decentralized attitude-oriented encryption', 'ajoseffc@4shared.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (14, 'jkennefickd', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/14.jpg', 'Open-architected didactic Graphical User Interface', 'mrandlesond@163.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (15, 'bkubaleke', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/37.jpg', 'Integrated contextually-based superstructure', 'rpulvere@noaa.gov');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (16, 'jmonardf', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/43.jpg', 'Right-sized radical workforce', 'atowardf@google.com.au');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (17, 'hroddickg', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/14.jpg', 'Reduced uniform array', 'lmcguinleyg@creativecommons.org');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (18, 'nbesantieh', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/24.jpg', 'Versatile contextually-based orchestration', 'gbrightieh@hexun.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (19, 'erassmanni', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/1.jpg', 'Reactive responsive solution', 'mhillumi@netscape.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (20, 'bballsdonj', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/2.jpg', 'Decentralized tangible extranet', 'dopdenortj@tinypic.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (21, 'pbogartk', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/46.jpg', 'Upgradable client-server internet solution', 'azolinik@shareasale.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (22, 'heldonl', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/17.jpg', 'Multi-channelled well-modulated infrastructure', 'treardonl@friendfeed.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (23, 'pkingdomm', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/25.jpg', 'Optional system-worthy forecast', 'emazinm@tamu.edu');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (24, 'dcardiffn', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/36.jpg', 'Monitored background local area network', 'rglazzardn@ow.ly');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (25, 'ewaggeo', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/1.jpg', 'Enhanced content-based open architecture', 'vmartinio@blogtalkradio.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (26, 'dredingtonp', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/34.jpg', 'Multi-channelled incremental array', 'mmccraep@ft.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (27, 'epakenhamq', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/14.jpg', 'Seamless clear-thinking hub', 'amcisaacq@gov.uk');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (28, 'qgarritr', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/22.jpg', 'Innovative static pricing structure', 'kburnier@squidoo.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (29, 'cwherrits', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/48.jpg', 'Open-source human-resource artificial intelligence', 'ffalkouss@ameblo.jp');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (30, 'fschwandert', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/10.jpg', 'Cross-platform dynamic contingency', 'alattat@infoseek.co.jp');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (31, 'lmuskettu', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/28.jpg', 'Front-line holistic local area network', 'abuckellu@yahoo.co.jp');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (32, 'ahaleyv', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/4.jpg', 'Open-architected 3rd generation capability', 'kwyvillv@sogou.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (33, 'twalchw', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/45.jpg', 'Pre-emptive holistic info-mediaries', 'rmcallenw@adobe.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (34, 'rlavinx', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/14.jpg', 'Up-sized mission-critical software', 'cdicarlox@google.com.au');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (35, 'friefliny', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/25.jpg', 'De-engineered user-facing neural-net', 'dtansery@yelp.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (36, 'gfarnsworthz', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/50.jpg', 'Organized holistic artificial intelligence', 'toroanz@example.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (37, 'mducrow10', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/22.jpg', 'Polarised holistic infrastructure', 'cmillichap10@joomla.org');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (38, 'sstairs11', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/11.jpg', 'Horizontal logistical algorithm', 'kfalks11@facebook.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (39, 'cstandfield12', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/15.jpg', 'Profit-focused homogeneous moderator', 'ksallter12@mysql.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (40, 'codocherty13', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/30.jpg', 'Customer-focused object-oriented alliance', 'gdaborn13@sciencedirect.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (41, 'scarlsen14', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/27.jpg', 'Multi-tiered motivating array', 'nbeahan14@studiopress.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (42, 'aocorrin15', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/45.jpg', 'Configurable intangible local area network', 'bmangion15@linkedin.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (43, 'cmattys16', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/8.jpg', 'Re-engineered stable circuit', 'eseydlitz16@ft.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (44, 'nenrico17', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/14.jpg', 'Sharable explicit structure', 'csinderson17@apache.org');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (45, 'mstreetley18', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/41.jpg', 'Cross-group regional circuit', 'sbernardo18@sogou.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (46, 'aleonardi19', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/10.jpg', 'Synergistic content-based knowledge user', 'hdigregorio19@newyorker.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (47, 'msaylor1a', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/23.jpg', 'Mandatory context-sensitive archive', 'cstadden1a@ebay.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (48, 'jgary1b', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/41.jpg', 'Expanded multimedia circuit', 'lsucre1b@marketwatch.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (49, 'hkeijser1c', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/48.jpg', 'Multi-lateral scalable firmware', 'crowswell1c@huffingtonpost.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (50, 'djone1d', '$argon2id$v=19$m=262144,t=5,p=1$C+BAnIv9TGL98kMOeQaIaw$fCD6Zvxew28E2CODp1ea4QIoNGdI45AekuX7AfPymfc', 'https://randomuser.me/api/portraits/men/31.jpg', 'Ergonomic content-based architecture', 'mbuckbee1d@hugedomains.com');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (51, 'testuser', '$argon2id$v=19$m=262144,t=5,p=1$VKBKTC/5E+rdzsXcIuP3qQ$CjpAfPWmKmZrF3u/L1OY2omeVapP7lUSNlewXt3pmcM', 'https://randomuser.me/api/portraits/lego/6.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (53, 'testuser2', '$argon2id$v=19$m=262144,t=5,p=1$S/uC4aIbA/Z7wfu9KXHFQQ$1c7sxLakXOSUq6zAZToo7v9tYJ4bjgY47BPnlFRKF1w', 'https://randomuser.me/api/portraits/lego/7.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (55, 'testuser10', '$argon2id$v=19$m=262144,t=5,p=1$HwAbFbcWkwttGtqEwcdHWA$0yPWrDGNyI1+QPg9DjOSFLfRFtxAgQ6HbVF3u0l1pl0', 'https://randomuser.me/api/portraits/lego/6.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (56, 'testuser1', '$argon2id$v=19$m=262144,t=5,p=1$dVOVLvRYzHS+3Afafm1vrw$LaAyCxNAtthJc8KFtLXwSJzL32b1MNH7Y3cgRWeKYoE', 'https://randomuser.me/api/portraits/lego/0.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (59, 'sdafds', '$argon2id$v=19$m=262144,t=5,p=1$iXne/gDWh309tDNxw+xO9g$ImFvTaQWML4pHYz6f3mJymGkQM3B3evo8cbNv/ufNXk', 'https://randomuser.me/api/portraits/lego/0.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (60, 'testt', '$argon2id$v=19$m=262144,t=5,p=1$aUWNYw4+5EE4w/YoS6jxfA$7WuSOx0Mq+WT+GTKyLeaPdOhPABtq8FLdQL0B5MYmeA', 'https://randomuser.me/api/portraits/lego/8.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (62, 'newuser123', '$argon2id$v=19$m=262144,t=5,p=1$NR+m8GqnsVtomUOyVbA7HA$X29HX4wtsVz5/vyAHLASrWg1WaYN/olyG6PWo9J4NiQ', 'https://randomuser.me/api/portraits/lego/7.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (69, 'Test678', '$argon2id$v=19$m=262144,t=5,p=1$Sqcc3AmLxf0HcX6IwwYHuw$i60TmrEEqvT5lPYlTiHG7W8adE7UdAjwZ8ah3hypmqA', 'https://randomuser.me/api/portraits/lego/6.jpg', '', '');
INSERT INTO public.account OVERRIDING SYSTEM VALUE VALUES (71, 'NewAccount', '$argon2id$v=19$m=262144,t=5,p=1$oYED1IkrSBQUz4x7x4y+YQ$hW1RM9//rQ34nPHmV8G/kEXYSU3IrDArMxfvRU2AU5o', 'https://randomuser.me/api/portraits/lego/7.jpg', '', '');


--
-- TOC entry 3622 (class 0 OID 16619)
-- Dependencies: 205
-- Data for Name: account_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (3, 2, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (4, 2, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (5, 2, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (6, 3, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (7, 3, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (8, 3, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (9, 4, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (10, 5, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (11, 5, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (12, 6, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (13, 6, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (14, 6, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (15, 7, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (16, 7, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (17, 8, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (18, 8, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (19, 8, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (20, 9, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (21, 9, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (22, 10, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (23, 11, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (24, 11, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (25, 12, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (26, 12, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (27, 13, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (28, 14, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (29, 14, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (30, 14, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (31, 15, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (32, 15, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (33, 16, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (34, 16, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (35, 17, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (36, 17, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (37, 18, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (38, 19, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (39, 19, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (40, 20, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (41, 20, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (42, 20, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (43, 21, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (44, 21, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (45, 22, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (46, 23, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (47, 23, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (48, 24, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (49, 25, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (50, 25, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (51, 26, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (52, 26, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (53, 27, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (54, 27, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (55, 28, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (56, 29, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (57, 29, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (58, 30, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (59, 31, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (60, 32, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (61, 32, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (62, 32, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (63, 33, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (64, 33, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (65, 33, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (66, 34, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (67, 35, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (68, 35, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (69, 36, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (70, 36, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (71, 37, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (72, 37, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (73, 37, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (74, 38, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (75, 38, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (76, 38, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (77, 39, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (78, 39, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (79, 40, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (80, 40, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (81, 40, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (82, 41, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (83, 41, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (84, 41, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (85, 42, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (86, 42, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (87, 42, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (88, 43, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (89, 43, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (90, 43, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (91, 44, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (92, 44, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (93, 44, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (94, 45, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (95, 45, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (96, 46, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (97, 46, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (98, 47, 4, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (99, 47, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (100, 47, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (101, 48, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (102, 48, 3, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (103, 49, 5, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (104, 49, 6, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (105, 49, 2, true, 'ipsum lorem');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (231, 62, 2, true, 'Lifting');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (2, 1, 6, true, 'I like sleeping.');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (232, 62, 6, true, 'Narcoleptic ');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (106, 1, 3, false, 'I like reading books!');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (233, 62, 4, true, 'Sleeper cars baby');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (234, 61, 2, true, 'I life 12 tons don''t match me if you''re small bro');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (236, 61, 6, true, 'SLEEP IS FOR THE WEAK!');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (235, 61, 4, true, 'I am a train!');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (238, 68, 4, true, 'Railroad');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (239, 68, 5, true, 'Action RPG');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (240, 70, 4, true, 'Test');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (119, 1, 5, true, 'I like video games!');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (122, 1, 4, false, 'I like trains :-)');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (241, 70, 2, true, 'Test');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (242, 71, 4, true, 'Rail workers are cool');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (243, 71, 5, true, 'Action');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (1, 1, 2, true, 'I love u');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (244, 72, 2, true, 'Leg');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (229, 4, 2, true, 'super hot fire');
INSERT INTO public.account_category OVERRIDING SYSTEM VALUE VALUES (245, 72, 4, true, 'Model Trains');


--
-- TOC entry 3618 (class 0 OID 16598)
-- Dependencies: 201
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category OVERRIDING SYSTEM VALUE VALUES (2, 'Gym', 'I like going to the gym!', '');
INSERT INTO public.category OVERRIDING SYSTEM VALUE VALUES (3, 'Reading', 'I like reading books!', '');
INSERT INTO public.category OVERRIDING SYSTEM VALUE VALUES (4, 'Trains', 'I like trains :-)', '');
INSERT INTO public.category OVERRIDING SYSTEM VALUE VALUES (5, 'Video Games', 'I like video games!', '');
INSERT INTO public.category OVERRIDING SYSTEM VALUE VALUES (6, 'Sleeping', 'I like sleeping.', '');


--
-- TOC entry 3624 (class 0 OID 16640)
-- Dependencies: 207
-- Data for Name: impression; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (1, NULL, 1, 5, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (2, NULL, 1, 7, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (4, NULL, 1, 23, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (5, NULL, 1, 28, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (6, NULL, 1, 41, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (7, NULL, 2, 40, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (8, NULL, 2, 48, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (9, NULL, 3, 6, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (10, NULL, 3, 13, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (11, NULL, 3, 18, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (12, NULL, 3, 21, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (13, NULL, 3, 22, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (14, NULL, 3, 27, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (15, NULL, 3, 36, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (16, NULL, 3, 45, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (18, NULL, 4, 9, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (19, NULL, 4, 28, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (20, NULL, 4, 41, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (21, NULL, 5, 4, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (23, NULL, 5, 7, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (24, NULL, 5, 9, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (25, NULL, 5, 23, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (26, NULL, 5, 41, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (28, NULL, 6, 8, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (29, NULL, 6, 13, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (30, NULL, 6, 18, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (31, NULL, 6, 21, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (32, NULL, 7, 4, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (34, NULL, 7, 9, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (35, NULL, 7, 23, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (36, NULL, 7, 28, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (37, NULL, 8, 3, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (38, NULL, 8, 13, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (39, NULL, 8, 18, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (40, NULL, 8, 21, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (41, NULL, 8, 22, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (42, NULL, 8, 27, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (43, NULL, 8, 36, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (45, NULL, 9, 20, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (46, NULL, 9, 28, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (47, NULL, 9, 29, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (48, NULL, 10, 17, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (49, NULL, 10, 26, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (50, NULL, 10, 31, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (51, NULL, 10, 32, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (52, NULL, 10, 43, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (53, NULL, 10, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (54, NULL, 10, 47, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (56, NULL, 11, 14, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (57, NULL, 11, 35, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (58, NULL, 11, 37, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (59, NULL, 11, 38, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (60, NULL, 11, 39, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (61, NULL, 12, 3, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (63, NULL, 12, 18, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (64, NULL, 12, 36, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (65, NULL, 12, 45, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (66, NULL, 13, 22, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (67, NULL, 13, 27, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (68, NULL, 13, 36, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (69, NULL, 14, 24, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (70, NULL, 14, 38, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (72, NULL, 15, 40, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (73, NULL, 15, 42, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (74, NULL, 15, 48, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (75, NULL, 16, 3, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (76, NULL, 16, 8, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (77, NULL, 16, 13, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (78, NULL, 16, 18, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (79, NULL, 16, 36, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (80, NULL, 16, 45, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (82, NULL, 17, 26, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (83, NULL, 17, 31, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (84, NULL, 17, 32, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (85, NULL, 17, 43, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (86, NULL, 17, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (87, NULL, 17, 46, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (88, NULL, 17, 47, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (89, NULL, 18, 21, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (90, NULL, 18, 27, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (91, NULL, 19, 25, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (92, NULL, 19, 31, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (93, NULL, 19, 32, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (94, NULL, 19, 43, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (95, NULL, 19, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (96, NULL, 19, 47, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (97, NULL, 20, 5, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (98, NULL, 20, 7, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (100, NULL, 20, 23, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (101, NULL, 20, 28, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (102, NULL, 21, 13, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (103, NULL, 21, 16, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (104, NULL, 21, 27, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (105, NULL, 21, 36, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (106, NULL, 22, 6, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (107, NULL, 22, 12, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (108, NULL, 22, 21, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (109, NULL, 22, 27, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (110, NULL, 23, 4, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (111, NULL, 23, 9, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (113, NULL, 23, 28, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (114, NULL, 24, 11, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (115, NULL, 24, 33, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (116, NULL, 25, 26, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (117, NULL, 25, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (118, NULL, 25, 46, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (119, NULL, 25, 47, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (120, NULL, 26, 43, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (121, NULL, 26, 46, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (122, NULL, 26, 47, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (123, NULL, 27, 6, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (125, NULL, 27, 36, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (126, NULL, 28, 5, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (128, NULL, 28, 29, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (129, NULL, 29, 4, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (130, NULL, 29, 5, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (131, NULL, 29, 20, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (132, NULL, 29, 23, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (133, NULL, 30, 48, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (134, NULL, 31, 25, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (135, NULL, 31, 32, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (136, NULL, 31, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (137, NULL, 31, 46, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (138, NULL, 31, 47, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (139, NULL, 31, 49, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (140, NULL, 32, 25, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (141, NULL, 32, 43, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (142, NULL, 32, 46, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (143, NULL, 32, 47, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (144, NULL, 32, 49, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (145, NULL, 34, 24, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (146, NULL, 34, 33, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (148, NULL, 34, 37, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (149, NULL, 34, 38, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (150, NULL, 34, 39, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (151, NULL, 35, 14, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (152, NULL, 35, 24, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (153, NULL, 35, 34, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (154, NULL, 35, 37, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (155, NULL, 35, 38, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (156, NULL, 36, 22, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (158, NULL, 37, 14, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (160, NULL, 37, 38, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (161, NULL, 38, 24, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (162, NULL, 38, 33, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (163, NULL, 39, 33, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (164, NULL, 39, 37, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (166, NULL, 41, 7, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (167, NULL, 41, 9, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (168, NULL, 41, 23, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (169, NULL, 41, 29, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (171, NULL, 42, 2, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (172, NULL, 42, 48, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (173, NULL, 43, 31, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (174, NULL, 43, 44, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (175, NULL, 43, 47, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (176, NULL, 44, 26, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (177, NULL, 44, 32, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (179, NULL, 44, 46, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (180, NULL, 45, 6, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (181, NULL, 45, 8, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (182, NULL, 45, 13, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (183, NULL, 45, 18, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (184, NULL, 45, 21, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (185, NULL, 45, 27, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (3, NULL, 1, 20, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (186, NULL, 46, 10, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (187, NULL, 46, 47, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (188, NULL, 47, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (190, NULL, 48, 40, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (191, NULL, 49, 17, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (192, NULL, 49, 19, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (193, NULL, 49, 43, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (194, NULL, 49, 44, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (196, NULL, 13, 3, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (197, NULL, 9, 7, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (198, NULL, 23, 7, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (199, NULL, 28, 7, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (200, NULL, 36, 8, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (201, NULL, 32, 10, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (195, NULL, 7, 1, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (204, NULL, 2, 7, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (206, NULL, 8, 8, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (205, NULL, 8, 7, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (207, NULL, 9, 8, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (208, NULL, 10, 8, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (209, NULL, 11, 8, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (210, NULL, 12, 8, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (211, NULL, 43, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (213, NULL, 49, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (214, NULL, 3, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (215, NULL, 6, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (216, NULL, 8, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (217, NULL, 9, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (218, NULL, 12, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (219, NULL, 16, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (220, NULL, 19, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (221, NULL, 21, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (222, NULL, 25, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (223, NULL, 29, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (224, NULL, 32, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (225, NULL, 33, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (226, NULL, 38, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (227, NULL, 40, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (228, NULL, 44, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (229, NULL, 45, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (230, NULL, 46, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (231, NULL, 2, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (232, NULL, 4, 1, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (233, NULL, 8, 4, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (234, NULL, 19, 4, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (235, NULL, 32, 4, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (236, NULL, 10, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (237, NULL, 11, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (238, NULL, 13, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (239, NULL, 14, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (240, NULL, 15, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (241, NULL, 17, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (242, NULL, 18, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (243, NULL, 22, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (244, NULL, 26, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (245, NULL, 27, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (246, NULL, 31, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (247, NULL, 35, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (248, NULL, 36, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (249, NULL, 37, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (251, NULL, 39, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (252, NULL, 42, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (253, NULL, 47, 1, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (254, NULL, 48, 1, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (256, NULL, 1, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (257, NULL, 4, 62, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (258, NULL, 5, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (259, NULL, 11, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (260, NULL, 17, 62, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (261, NULL, 19, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (262, NULL, 29, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (263, NULL, 32, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (265, NULL, 33, 62, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (266, NULL, 35, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (267, NULL, 38, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (268, NULL, 39, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (269, NULL, 41, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (270, NULL, 42, 62, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (271, NULL, 43, 62, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (264, NULL, 61, 62, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (272, NULL, 1, 61, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (273, NULL, 4, 61, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (274, NULL, 5, 61, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (275, NULL, 11, 61, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (276, NULL, 17, 61, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (277, NULL, 2, 68, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (278, NULL, 14, 68, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (279, NULL, 27, 68, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (280, NULL, 33, 68, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (281, NULL, 11, 72, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (282, NULL, 17, 72, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (283, NULL, 33, 72, true);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (284, NULL, 44, 33, NULL);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (285, NULL, 2, 33, false);
INSERT INTO public.impression OVERRIDING SYSTEM VALUE VALUES (286, NULL, 3, 33, false);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 204
-- Name: account_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_category_id_seq', 245, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 202
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 72, true);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 200
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 6, true);


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 206
-- Name: impression_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.impression_id_seq', 286, true);


--
-- TOC entry 3476 (class 2606 OID 16626)
-- Name: account_category account_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_category
    ADD CONSTRAINT account_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3473 (class 2606 OID 16615)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 16605)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 16644)
-- Name: impression impression_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impression
    ADD CONSTRAINT impression_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 1259 OID 16637)
-- Name: ix_account_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_account_category ON public.account_category USING btree (account_id, category_id);


--
-- TOC entry 3480 (class 1259 OID 16661)
-- Name: ix_impression_receiver_receiver_accepted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_impression_receiver_receiver_accepted ON public.impression USING btree (receiver_id, accepted NULLS FIRST);


--
-- TOC entry 3481 (class 1259 OID 16660)
-- Name: ix_impression_receiver_subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_impression_receiver_subject ON public.impression USING btree (receiver_id, subject_id);


--
-- TOC entry 3474 (class 1259 OID 16616)
-- Name: ix_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_username ON public.account USING btree (username);


--
-- TOC entry 3482 (class 2606 OID 16627)
-- Name: account_category fk_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_category
    ADD CONSTRAINT fk_account FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- TOC entry 3483 (class 2606 OID 16632)
-- Name: account_category fk_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_category
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3484 (class 2606 OID 16645)
-- Name: impression fk_inverse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impression
    ADD CONSTRAINT fk_inverse FOREIGN KEY (inverse_id) REFERENCES public.impression(id);


--
-- TOC entry 3485 (class 2606 OID 16650)
-- Name: impression fk_receiver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impression
    ADD CONSTRAINT fk_receiver FOREIGN KEY (receiver_id) REFERENCES public.account(id);


--
-- TOC entry 3486 (class 2606 OID 16655)
-- Name: impression fk_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impression
    ADD CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES public.account(id);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-01-14 11:06:12

--
-- PostgreSQL database dump complete
--

