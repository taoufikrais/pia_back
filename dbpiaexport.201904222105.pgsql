--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    reference_to character varying NOT NULL,
    data jsonb DEFAULT '{}'::jsonb,
    pia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.answers OWNER TO useradmin;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO useradmin;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO useradmin;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    attached_file character varying,
    pia_signed boolean DEFAULT false,
    pia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    comment text
);


ALTER TABLE public.attachments OWNER TO useradmin;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO useradmin;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    description text DEFAULT ''::text,
    reference_to character varying NOT NULL,
    for_measure boolean DEFAULT false,
    pia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO useradmin;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO useradmin;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: evaluations; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.evaluations (
    id integer NOT NULL,
    status integer DEFAULT 0,
    reference_to character varying NOT NULL,
    action_plan_comment text DEFAULT ''::text,
    evaluation_comment text DEFAULT ''::text,
    evaluation_date timestamp without time zone,
    gauges jsonb DEFAULT '{}'::jsonb,
    estimated_implementation_date timestamp without time zone,
    person_in_charge character varying DEFAULT ''::character varying,
    pia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    global_status integer DEFAULT 0
);


ALTER TABLE public.evaluations OWNER TO useradmin;

--
-- Name: evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.evaluations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluations_id_seq OWNER TO useradmin;

--
-- Name: evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.evaluations_id_seq OWNED BY public.evaluations.id;


--
-- Name: measures; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.measures (
    id integer NOT NULL,
    title character varying DEFAULT ''::character varying,
    content text DEFAULT ''::text,
    placeholder text DEFAULT ''::text,
    pia_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.measures OWNER TO useradmin;

--
-- Name: measures_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.measures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measures_id_seq OWNER TO useradmin;

--
-- Name: measures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.measures_id_seq OWNED BY public.measures.id;


--
-- Name: pias; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.pias (
    id integer NOT NULL,
    status integer DEFAULT 0,
    name character varying NOT NULL,
    author_name character varying DEFAULT ''::character varying,
    evaluator_name character varying DEFAULT ''::character varying,
    validator_name character varying DEFAULT ''::character varying,
    dpo_status integer DEFAULT 0,
    dpo_opinion text DEFAULT ''::text,
    concerned_people_opinion text DEFAULT ''::text,
    concerned_people_status integer DEFAULT 0,
    rejection_reason text DEFAULT ''::text,
    applied_adjustments text DEFAULT ''::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dpos_names character varying DEFAULT ''::character varying,
    people_names character varying DEFAULT ''::character varying,
    is_example integer DEFAULT 0,
    concerned_people_searched_opinion boolean DEFAULT false,
    concerned_people_searched_content character varying,
    structure_id integer,
    structure_name character varying,
    structure_sector_name character varying,
    structure_data jsonb
);


ALTER TABLE public.pias OWNER TO useradmin;

--
-- Name: pias_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.pias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pias_id_seq OWNER TO useradmin;

--
-- Name: pias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.pias_id_seq OWNED BY public.pias.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO useradmin;

--
-- Name: structures; Type: TABLE; Schema: public; Owner: useradmin
--

CREATE TABLE public.structures (
    id integer NOT NULL,
    name character varying NOT NULL,
    sector_name character varying NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.structures OWNER TO useradmin;

--
-- Name: structures_id_seq; Type: SEQUENCE; Schema: public; Owner: useradmin
--

CREATE SEQUENCE public.structures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.structures_id_seq OWNER TO useradmin;

--
-- Name: structures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: useradmin
--

ALTER SEQUENCE public.structures_id_seq OWNED BY public.structures.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: evaluations id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.evaluations ALTER COLUMN id SET DEFAULT nextval('public.evaluations_id_seq'::regclass);


--
-- Name: measures id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.measures ALTER COLUMN id SET DEFAULT nextval('public.measures_id_seq'::regclass);


--
-- Name: pias id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.pias ALTER COLUMN id SET DEFAULT nextval('public.pias_id_seq'::regclass);


--
-- Name: structures id; Type: DEFAULT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.structures ALTER COLUMN id SET DEFAULT nextval('public.structures_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.answers (id, reference_to, data, pia_id, created_at, updated_at) FROM stdin;
1	112	{"text": "Les responsabilit&eacute;s sont les suivantes :&nbsp;<br />\\r\\n<ul>\\r\\n<li><strong>Responsable de traitement</strong> : Dreamland ;&nbsp;</li>\\r\\n<li><strong>Sous-traitant(s)</strong> : BETA ;&nbsp;</li>\\r\\n<li><strong>Destinataires</strong> : partenaires ou affili&eacute;s &agrave; Dreamland.</li>\\r\\n</ul>"}	1	2019-02-05 16:10:23.671458	2019-02-05 16:10:23.671458
2	123	{"text": "Les supports des donn&eacute;es associ&eacute;s &agrave; chaque &eacute;tape du cycle de vie des donn&eacute;es sont les suivants :&nbsp;<br />\\r\\n<ol>\\r\\n<li><strong>Cr&eacute;ation du compte utilisateur :</strong>&nbsp;serveurs Cloud BETA, smartphone, applications tierces, Internet, WIFI, Bluetooth ;<br /><br /></li>\\r\\n<li><strong>Collecte des donn&eacute;es li&eacute;es au sommeil</strong>&nbsp;: smartphone, base Captoo, pastille Captoo, Bluetooth, Internet, WIFI ;&nbsp;<br /><br /></li>\\r\\n<li><strong>Envoie des donn&eacute;es au serveur</strong>&nbsp;: smartphone, pastille Captoo, Bluetooth,&nbsp;Internet, WIFI, serveurs BETA ;<br /><br /></li>\\r\\n<li><strong>Relai des informations vers des applications tierces</strong>&nbsp;: smartphone, Internet, applications r&eacute;seaux sociaux, applications tierces ;<br /><br /></li>\\r\\n<li><strong>Am&eacute;lioration de la qualit&eacute; de service</strong>&nbsp;: serveurs BETA.</li>\\r\\n</ol>"}	1	2019-02-05 16:10:23.682561	2019-02-05 16:10:23.682561
3	113	{"text": "Il n'y a pas de r&eacute;f&eacute;rentiels applicables."}	1	2019-02-05 16:10:23.69542	2019-02-05 16:10:23.69542
4	122	{"text": "Les donn&eacute;es sont trait&eacute;es de la fa&ccedil;on suivante :&nbsp;<br />\\r\\n<ol>\\r\\n<li><strong>Cr&eacute;ation du compte utilisateur</strong>&nbsp;: l&rsquo;utilisateur cr&eacute;e un compte avec ses informations personnelles ;<br />&nbsp;</li>\\r\\n<li><strong>Collecte des donn&eacute;es li&eacute;es au sommeil</strong>&nbsp;: les capteurs Contenus dans la capsule Captoo (accroch&eacute;e au matelas ou &agrave; l&rsquo;oreiller) et la base (pos&eacute;e dans la chambre) rel&egrave;vent les donn&eacute;es qui sont visualis&eacute;es sur le smartphone de l&rsquo;utilisateur via une application d&eacute;di&eacute;e ;<br /><br /></li>\\r\\n<li><strong>Envoie des donn&eacute;es au serveur</strong>&nbsp;: les donn&eacute;es envoy&eacute;es sur un serveur, qui les analyse et produit des donn&eacute;es calcul&eacute;es, qui peuvent &ecirc;tre consult&eacute;es via la m&ecirc;me application&nbsp;;<br /><br /></li>\\r\\n<li><strong>Relai des informations vers des applications tierces</strong>&nbsp;: les informations Captoo peuvent &ecirc;tre relay&eacute;es vers des applications tierces ou post&eacute;es sur les r&eacute;seaux sociaux (ex : publication de son score de sommeil) ;<br /><br /></li>\\r\\n<li><strong>Am&eacute;lioration de la qualit&eacute; de service</strong>&nbsp;: exploitation des donn&eacute;es d&rsquo;identification, relev&eacute;es et calcul&eacute;es des utilisateurs DREAMLAND afin d&rsquo;am&eacute;liorer la qualit&eacute; du service et d&rsquo;effectuer des audits.</li>\\r\\n</ol>"}	1	2019-02-05 16:10:23.709834	2019-02-05 16:10:23.709834
5	121	{"text": "Les donn&eacute;es trait&eacute;es sont les suivantes :&nbsp;<br />\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es fournies par l'utilisateur</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: adresse &eacute;lectronique, num&eacute;ro de t&eacute;l&eacute;phone, date de naissance, genre, taille, poids ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s&nbsp;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong> : Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br />&nbsp;</li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Provenant d&rsquo;applications tierces</strong>&nbsp;(Twitter, Facebook) obtenues par lien avec le compte DREAMLAND :\\r\\n<ul>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es relev&eacute;es</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: temp&eacute;rature, humidit&eacute;, taux de particules, luminosit&eacute;, son/bruit, heure de r&eacute;veil, donn&eacute;es d&rsquo;acc&eacute;l&eacute;rom&egrave;tre&nbsp;;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: R&eacute;seaux sociaux, applications tierces, Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur, &nbsp;les donn&eacute;es audio sont conserv&eacute;es 7 jours au plus dans le buffer de la base.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es calcul&eacute;es</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: Quantification de la qualit&eacute; du sommeil, &eacute;valuation de la qualit&eacute; de l&rsquo;environnement de la chambre &agrave; coucher (niveau de bruit, temp&eacute;rature, humidit&eacute;, air, etc.) ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: R&eacute;seaux sociaux, applications tierces, Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es d&eacute;duites</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: vie sexuelle, donn&eacute;es philosophiques, politiques, syndicales, relatives &agrave; la religion, relatives &agrave; la sant&eacute; ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.</li>\\r\\n</ul>\\r\\n</li>\\r\\n</ul>"}	1	2019-02-05 16:10:23.698885	2019-02-05 16:10:23.698885
6	211	{"text": "<ol>\\r\\n<li>Les donn&eacute;es sont collect&eacute;es pour <strong>fournir le service demand&eacute; par l&rsquo;utilisateur</strong>, &agrave; savoir <strong>observer son sommeil</strong>, l&rsquo;<strong>aider &agrave; identifier les causes de troubles</strong> et le <strong>r&eacute;veiller au meilleur moment de son cycle</strong>.<br /><br /></li>\\r\\n<li>Des informations de connexion collect&eacute;es par divers canaux (cookies, informations de fournisseurs internet, etc.) permettent aussi d&rsquo;<strong>effectuer des statistiques d&rsquo;usage</strong> sur le traitement Captoo.&nbsp;<br /><br /></li>\\r\\n<li>Ces donn&eacute;es sont susceptibles d&rsquo;&ecirc;tre conserv&eacute;es afin <strong>d&rsquo;alimenter des bases de donn&eacute;es</strong> poss&eacute;d&eacute;es et maintenues par DREAMLAND, ses affili&eacute;s et ses fournisseurs de service.</li>\\r\\n</ol>"}	1	2019-02-05 16:10:23.722191	2019-02-05 16:10:23.722191
7	212	{"text": "Pour chaque finalit&eacute; d&eacute;crite ci-dessus :&nbsp;<br />\\r\\n<ol>\\r\\n<li>Le traitement est n&eacute;cessaire &agrave; l&rsquo;<strong>ex&eacute;cution du contrat</strong> auquel l&rsquo;utilisateur est partie ;&nbsp;</li>\\r\\n<li><strong>Int&eacute;r&ecirc;t l&eacute;gitime</strong> de Dreamland ;</li>\\r\\n<li><strong>Int&eacute;r&ecirc;t l&eacute;gitime</strong> de Dreamland.&nbsp;</li>\\r\\n</ol>"}	1	2019-02-05 16:10:23.730839	2019-02-05 16:10:23.730839
8	213	{"text": "<p><strong>Donn&eacute;es relev&eacute;es</strong>&nbsp;<br /><em>Temp&eacute;rature, humidit&eacute;, taux de particules, luminosit&eacute;, son/bruit, heure de r&eacute;veil, donn&eacute;es d&rsquo;acc&eacute;l&eacute;rom&egrave;tre.</em><br />Les donn&eacute;es sont minimis&eacute;es avant leur transmission au serveur cloud de BETA et seules ces donn&eacute;es, n&eacute;cessaires &agrave; la fourniture du service, sont conserv&eacute;es. Les donn&eacute;es de bruit provenant des captations audio ne sont pas enregistr&eacute;es par d&eacute;faut. Celles-ci sont collect&eacute;es par tranches de 5 secondes et trait&eacute;es dans la base Captoo pour d&eacute;tection de bruits caract&eacute;ristiques tels que les ronflements.<br /><br /><strong>Donn&eacute;es calcul&eacute;es &agrave; partir des donn&eacute;es relev&eacute;es</strong><br /><em>Quantification de la qualit&eacute; du sommeil, &eacute;valuation de la qualit&eacute; de l&rsquo;environnement de la chambre &agrave; coucher (niveau de bruit, temp&eacute;rature, humidit&eacute;, air, etc.).</em><br />Ce sont les donn&eacute;es indicatrices de la qualit&eacute; de sommeil du client livrables pr&eacute;vus par le contrat de service. Seules les donn&eacute;es pr&eacute;vues au contrat sont calcul&eacute;es.<br /><br /><strong>Donn&eacute;es courantes pour l'identification du compte</strong><br /> <em>Adresse &eacute;lectronique, num&eacute;ro de t&eacute;l&eacute;phone, date de naissance, genre, taille, poids.</em><br />Donn&eacute;es utilis&eacute;es pour identifier le client et pour param&eacute;trer les calculs de qualit&eacute; de sommeil.</p>"}	1	2019-02-05 16:10:23.757716	2019-02-05 16:10:23.757716
9	214	{"text": "Les utilisateurs peuvent <strong>modifier leurs donn&eacute;es directement identifiantes</strong> &agrave; tous moment (adresse email, taille, poids, date de naissance, etc.). Ils peuvent le faire soit <strong>via l&rsquo;application</strong> soit en contactant Dreamland &agrave; l'adresse <strong>contact@captoo-dreamland.com</strong>."}	1	2019-02-05 16:10:23.761159	2019-02-05 16:10:23.761159
11	222	{"text": "<div><strong>La personne accepte les CGU lors de l&rsquo;installation de l&rsquo;application</strong>. Elle d&eacute;cide &eacute;galement &agrave; ce moment de partager ou non ses donn&eacute;es sur les r&eacute;seaux sociaux.</div>"}	1	2019-02-05 16:10:23.779609	2019-02-05 16:10:23.779609
10	215	{"text": "Les donn&eacute;es sont conserv&eacute;es tant que la personne concern&eacute;e n&rsquo;en demande pas la suppression. Celle-ci peut s'effectuer en contactant Dreamland &agrave; l'adresse<strong> contact@captoo-dreamland.com.</strong>&nbsp;Apr&egrave;s la demande de suppression, <strong>les donn&eacute;es sont rendues illisibles et les zones de stockage qui ont &eacute;t&eacute; utilis&eacute;es sont effac&eacute;es et &eacute;cras&eacute;es</strong>."}	1	2019-02-05 16:10:23.772883	2019-02-05 16:10:23.772883
15	225	{"text": "<div><strong>Les</strong> <strong>param&egrave;tres de vie priv&eacute;e sont accessibles &agrave; l'inscription</strong> et les utilisateurs <strong>peuvent ensuite modifier ou supprimer</strong> leurs donn&eacute;es (en particulier en quittant le service) en &eacute;crivant &agrave; contact@captoo-dreamland.com.</div>"}	1	2019-02-05 16:10:23.817279	2019-02-05 16:10:23.817279
20	323	{"list": ["Employé", "Attaquant", "Entourage"]}	1	2019-02-05 16:10:23.855237	2019-02-05 16:10:23.855237
25	332	{"list": ["Altération des données sur le serveur"]}	1	2019-02-05 16:10:23.917714	2019-02-05 16:10:23.917714
30	341	{"list": ["Nécessité de recréer un compte d'utilisation", "Perte de l'historique et de la personnalisation du service", "Détérioration de la qualité du service"]}	1	2019-02-05 16:10:23.960348	2019-02-05 16:10:23.960348
35	344	{"list": ["Surveillance", "Sécurité des matériels", "Maintenance", "Sauvegardes", "Archivage", "Contrôle des accès logiques", "Organisation", "Traçabilité", "Gestion des postes de travail"]}	1	2019-02-05 16:10:24.013473	2019-02-05 16:10:24.013473
37	122	{"text": "Les donn&eacute;es sont trait&eacute;es de la fa&ccedil;on suivante :&nbsp;<br />\\r\\n<ol>\\r\\n<li><strong>Cr&eacute;ation du compte utilisateur</strong>&nbsp;: l&rsquo;utilisateur cr&eacute;e un compte avec ses informations personnelles ;<br />&nbsp;</li>\\r\\n<li><strong>Collecte des donn&eacute;es li&eacute;es au sommeil</strong>&nbsp;: les capteurs Contenus dans la capsule Captoo (accroch&eacute;e au matelas ou &agrave; l&rsquo;oreiller) et la base (pos&eacute;e dans la chambre) rel&egrave;vent les donn&eacute;es qui sont visualis&eacute;es sur le smartphone de l&rsquo;utilisateur via une application d&eacute;di&eacute;e ;<br /><br /></li>\\r\\n<li><strong>Envoie des donn&eacute;es au serveur</strong>&nbsp;: les donn&eacute;es envoy&eacute;es sur un serveur, qui les analyse et produit des donn&eacute;es calcul&eacute;es, qui peuvent &ecirc;tre consult&eacute;es via la m&ecirc;me application&nbsp;;<br /><br /></li>\\r\\n<li><strong>Relai des informations vers des applications tierces</strong>&nbsp;: les informations Captoo peuvent &ecirc;tre relay&eacute;es vers des applications tierces ou post&eacute;es sur les r&eacute;seaux sociaux (ex : publication de son score de sommeil) ;<br /><br /></li>\\r\\n<li><strong>Am&eacute;lioration de la qualit&eacute; de service</strong>&nbsp;: exploitation des donn&eacute;es d&rsquo;identification, relev&eacute;es et calcul&eacute;es des utilisateurs DREAMLAND afin d&rsquo;am&eacute;liorer la qualit&eacute; du service et d&rsquo;effectuer des audits.</li>\\r\\n</ol>"}	2	2019-02-05 16:10:24.242534	2019-02-05 16:10:24.242534
41	113	{"text": "Il n'y a pas de r&eacute;f&eacute;rentiels applicables."}	2	2019-02-05 16:10:24.282799	2019-02-05 16:10:24.282799
46	215	{"text": "Les donn&eacute;es sont conserv&eacute;es tant que la personne concern&eacute;e n&rsquo;en demande pas la suppression. Celle-ci peut s'effectuer en contactant Dreamland &agrave; l'adresse<strong> contact@captoo-dreamland.com.</strong>&nbsp;Apr&egrave;s la demande de suppression, <strong>les donn&eacute;es sont rendues illisibles et les zones de stockage qui ont &eacute;t&eacute; utilis&eacute;es sont effac&eacute;es et &eacute;cras&eacute;es</strong>."}	2	2019-02-05 16:10:24.326387	2019-02-05 16:10:24.326387
53	226	{"text": "<div>Dreamland <strong>sous-traite &agrave; BETA</strong> une partie de la mise en &oelig;uvre du traitement et de l&rsquo;h&eacute;bergement des donn&eacute;es. Les serveurs de BETA se trouvent aux &Eacute;tats-Unis.</div>"}	2	2019-02-05 16:10:24.38874	2019-02-05 16:10:24.38874
58	325	{"text": "En cas de divulgation de leurs donn&eacute;es, les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>cons&eacute;quences significatives</strong>, qu&rsquo;elles devraient pouvoir <strong>surmonter</strong>, mais avec <strong>des difficult&eacute;s r&eacute;elles et significatives</strong> (perte d'opportunit&eacute;s cibl&eacute;es, sentiment d'atteinte &agrave; la vie priv&eacute;e, etc.).", "gauge": "3"}	2	2019-02-05 16:10:24.449839	2019-02-05 16:10:24.449839
65	336	{"text": "Au vu du niveau de protection, il <strong>semble difficile</strong>, qu'un employ&eacute;, un membre de l'entourage de l'utilisateur ou un attaquant parvienne &agrave; <strong>modifier les donn&eacute;es d'un compte utilisateur</strong>.", "gauge": "2"}	2	2019-02-05 16:10:24.496652	2019-02-05 16:10:24.496652
70	346	{"text": "Il semble <strong>peu probable</strong> que les donn&eacute;es soient durablement indisponibles, au vu de la <strong>politique de s&eacute;curit&eacute; de l'h&eacute;bergeur BETA</strong>.", "gauge": "2"}	2	2019-02-05 16:10:24.537881	2019-02-05 16:10:24.537881
12	221	{"text": "L&rsquo;information de l&rsquo;utilisateur principal de Captoo est <strong>r&eacute;alis&eacute;e via les conditions g&eacute;n&eacute;rales d&rsquo;utilisation</strong> (CGU). Elles sont r&eacute;dig&eacute;es en des termes clairs et compr&eacute;hensibles et d&eacute;crivent notamment :\\r\\n<ul>\\r\\n<li>la finalit&eacute; du traitement (notation de la qualit&eacute; de sommeil de l'utilisateur en vue de l'am&eacute;liorer) ;</li>\\r\\n<li>les donn&eacute;es personnelles collect&eacute;es, aussi pr&eacute;sent&eacute;es lors de la cr&eacute;ation du compte client via l'application ;&nbsp;</li>\\r\\n<li>les droits de la personne concern&eacute;e.</li>\\r\\n</ul>\\r\\n<div>L'utilisateur peut <strong>acc&eacute;der &agrave; tout moment au CGU avec son compte client via l'application</strong>. Il peut &eacute;galement contacter par mail&nbsp;Dreamland pour toute question de confidentialit&eacute; (contact@captoo-dreamland.com).</div>\\r\\n<div><br />Aucune information n&rsquo;est pr&eacute;vue vis-&agrave;-vis des personnes tierces susceptibles d&rsquo;&ecirc;tre concern&eacute;es (compagnon, enfants, autres membres du foyer, etc.).</div>"}	1	2019-02-05 16:10:23.780813	2019-02-05 16:10:23.780813
16	226	{"text": "<div>Dreamland <strong>sous-traite &agrave; BETA</strong> une partie de la mise en &oelig;uvre du traitement et de l&rsquo;h&eacute;bergement des donn&eacute;es. Les serveurs de BETA se trouvent aux &Eacute;tats-Unis.</div>"}	1	2019-02-05 16:10:23.824363	2019-02-05 16:10:23.824363
22	325	{"text": "En cas de divulgation de leurs donn&eacute;es, les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>cons&eacute;quences significatives</strong>, qu&rsquo;elles devraient pouvoir <strong>surmonter</strong>, mais avec <strong>des difficult&eacute;s r&eacute;elles et significatives</strong> (perte d'opportunit&eacute;s cibl&eacute;es, sentiment d'atteinte &agrave; la vie priv&eacute;e, etc.).", "gauge": "3"}	1	2019-02-05 16:10:23.869936	2019-02-05 16:10:23.869936
24	333	{"list": ["Employé", "Entourage", "Attaquant"]}	1	2019-02-05 16:10:23.915999	2019-02-05 16:10:23.915999
29	342	{"list": ["Suppression de données", "Détérioration de serveurs", "Dégradation physique d'un matériel"]}	1	2019-02-05 16:10:23.955466	2019-02-05 16:10:23.955466
36	121	{"text": "Les donn&eacute;es trait&eacute;es sont les suivantes :&nbsp;<br />\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es fournies par l'utilisateur</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: adresse &eacute;lectronique, num&eacute;ro de t&eacute;l&eacute;phone, date de naissance, genre, taille, poids ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s&nbsp;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong> : Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br />&nbsp;</li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Provenant d&rsquo;applications tierces</strong>&nbsp;(Twitter, Facebook) obtenues par lien avec le compte DREAMLAND :\\r\\n<ul>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es relev&eacute;es</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: temp&eacute;rature, humidit&eacute;, taux de particules, luminosit&eacute;, son/bruit, heure de r&eacute;veil, donn&eacute;es d&rsquo;acc&eacute;l&eacute;rom&egrave;tre&nbsp;;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: R&eacute;seaux sociaux, applications tierces, Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur, &nbsp;les donn&eacute;es audio sont conserv&eacute;es 7 jours au plus dans le buffer de la base.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es calcul&eacute;es</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: Quantification de la qualit&eacute; du sommeil, &eacute;valuation de la qualit&eacute; de l&rsquo;environnement de la chambre &agrave; coucher (niveau de bruit, temp&eacute;rature, humidit&eacute;, air, etc.) ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: R&eacute;seaux sociaux, applications tierces, Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.<br /><br /></li>\\r\\n</ul>\\r\\n</li>\\r\\n<li><strong>Donn&eacute;es d&eacute;duites</strong>&nbsp;:\\r\\n<ul>\\r\\n<li><strong>Donn&eacute;es</strong>: vie sexuelle, donn&eacute;es philosophiques, politiques, syndicales, relatives &agrave; la religion, relatives &agrave; la sant&eacute; ;</li>\\r\\n<li><strong>Destinataires</strong>&nbsp;: Dreamland, BETA, partenaires et affili&eacute;s ;</li>\\r\\n<li><strong>Dur&eacute;e de conservation</strong>&nbsp;: Jusqu&rsquo;&agrave; la demande de suppression par l&rsquo;utilisateur.</li>\\r\\n</ul>\\r\\n</li>\\r\\n</ul>"}	2	2019-02-05 16:10:24.227434	2019-02-05 16:10:24.227434
38	111	{"text": "<div>Le PIA porte sur le <strong>moniteur de sommeil Captoo</strong>, produit par la soci&eacute;t&eacute; <strong>Dreamland </strong>qui&nbsp;est &eacute;galement le responsable du traitement r&eacute;sultant de l&rsquo;utilisation de ce moniteur de sommeil. Dreamland <strong>sous-traite une partie des moyens mis en &oelig;uvre &agrave; l&rsquo;h&eacute;bergeur BETA</strong>, bas&eacute; aux &Eacute;tats-Unis.&nbsp;</div>\\r\\n<div>&nbsp;</div>\\r\\n<div>Le traitement de donn&eacute;es permettant de fournir le service est<strong> fond&eacute; sur l&rsquo;ex&eacute;cution d&rsquo;un contrat</strong> auquel l&rsquo;utilisateur est partie. Captoo permet de mesurer diff&eacute;rents &eacute;l&eacute;ments (donn&eacute;es collect&eacute;es pendant la nuit &agrave; l&rsquo;aide de diff&eacute;rents capteurs) pour conna&icirc;tre et comprendre l&rsquo;environnement de l&rsquo;utilisateur.&nbsp;<br /><br /></div>\\r\\n<div>Les principaux enjeux r&eacute;sident dans la cr&eacute;ation d&rsquo;un nouveau service, l&rsquo;identification de causes de trouble du sommeil l&rsquo;am&eacute;lioration de la qualit&eacute; de sommeil de l&rsquo;utilisateur au cours du temps.</div>\\r\\n<div>&nbsp;</div>"}	2	2019-02-05 16:10:24.262046	2019-02-05 16:10:24.262046
44	214	{"text": "Les utilisateurs peuvent <strong>modifier leurs donn&eacute;es directement identifiantes</strong> &agrave; tous moment (adresse email, taille, poids, date de naissance, etc.). Ils peuvent le faire soit <strong>via l&rsquo;application</strong> soit en contactant Dreamland &agrave; l'adresse <strong>contact@captoo-dreamland.com</strong>."}	2	2019-02-05 16:10:24.310513	2019-02-05 16:10:24.310513
50	224	{"text": "<div>Les donn&eacute;es directement identifiantes (adresse email, taille, poids, date de naissance, etc.)&nbsp;peuvent &ecirc;tre<strong> modifi&eacute;es par l&rsquo;utilisateur directement via l'application</strong>, mais la <strong>modification des donn&eacute;es collect&eacute;es ne peut se faire qu&rsquo;en &eacute;crivant &agrave; contact@captoo-dreamland.com</strong>.<br /><br />Les utilisateurs peuvent<strong> effacer leurs donn&eacute;es (en particulier en quittant le service)&nbsp;en &eacute;crivant &agrave; contact@captoo-dreamland.com</strong>.</div>"}	2	2019-02-05 16:10:24.36884	2019-02-05 16:10:24.36884
56	322	{"list": ["Consultation de données", "Vol de données", "Usurpation d'un compte (via un smartphone)"]}	2	2019-02-05 16:10:24.425117	2019-02-05 16:10:24.425117
60	332	{"list": ["Altération des données sur le serveur"]}	2	2019-02-05 16:10:24.46014	2019-02-05 16:10:24.46014
63	341	{"list": ["Nécessité de recréer un compte d'utilisation", "Perte de l'historique et de la personnalisation du service", "Détérioration de la qualité du service"]}	2	2019-02-05 16:10:24.48677	2019-02-05 16:10:24.48677
68	345	{"text": "Les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>d&eacute;sagr&eacute;ments significatifs</strong>, qu&rsquo;elles pourront <strong>surmonter malgr&eacute; quelques difficult&eacute;s</strong> (indisponibilit&eacute; temporaire du service, probl&eacute;me de r&eacute;veil, etc.)", "gauge": "2"}	2	2019-02-05 16:10:24.526006	2019-02-05 16:10:24.526006
13	223	{"text": "Les utilisateurs peuvent r&eacute;aliser les actions suivantes via l'application smartphone :<br />\\r\\n<ul>\\r\\n<li><strong>acc&eacute;der &agrave; l'ensemble de leurs donn&eacute;es personnelles</strong>&nbsp;;</li>\\r\\n<li><strong>acc&eacute;der &agrave; leur historique d'utilisation</strong> ;</li>\\r\\n<li><strong>t&eacute;l&eacute;charger une archive de l&rsquo;ensemble de leurs donn&eacute;es personnelles</strong>&nbsp;;&nbsp;</li>\\r\\n</ul>"}	1	2019-02-05 16:10:23.797259	2019-02-05 16:10:23.797259
19	321	{"list": ["Discrimination", "Menaces", "Agressions", "Perte d'emploi", "Perte d'accès à des services", "Phishing", "Publicité ciblée"]}	1	2019-02-05 16:10:23.852471	2019-02-05 16:10:23.852471
23	326	{"text": "Il semble <strong>extr&ecirc;mement facile</strong> pour un employ&eacute;, une personne de l'entourage de l'utilisateur ou un &eacute;ventuel attaquant <strong>d'avoir acc&egrave;s aux donn&eacute;es</strong>.", "gauge": "4"}	1	2019-02-05 16:10:23.887189	2019-02-05 16:10:23.887189
28	336	{"text": "Au vu du niveau de protection, il <strong>semble difficile</strong>, qu'un employ&eacute;, un membre de l'entourage de l'utilisateur ou un attaquant parvienne &agrave; <strong>modifier les donn&eacute;es d'un compte utilisateur</strong>.", "gauge": "2"}	1	2019-02-05 16:10:23.932672	2019-02-05 16:10:23.932672
32	345	{"text": "Les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>d&eacute;sagr&eacute;ments significatifs</strong>, qu&rsquo;elles pourront <strong>surmonter malgr&eacute; quelques difficult&eacute;s</strong> (indisponibilit&eacute; temporaire du service, probl&eacute;me de r&eacute;veil, etc.)", "gauge": "2"}	1	2019-02-05 16:10:23.970447	2019-02-05 16:10:23.970447
42	211	{"text": "<ol>\\r\\n<li>Les donn&eacute;es sont collect&eacute;es pour <strong>fournir le service demand&eacute; par l&rsquo;utilisateur</strong>, &agrave; savoir <strong>observer son sommeil</strong>, l&rsquo;<strong>aider &agrave; identifier les causes de troubles</strong> et le <strong>r&eacute;veiller au meilleur moment de son cycle</strong>.<br /><br /></li>\\r\\n<li>Des informations de connexion collect&eacute;es par divers canaux (cookies, informations de fournisseurs internet, etc.) permettent aussi d&rsquo;<strong>effectuer des statistiques d&rsquo;usage</strong> sur le traitement Captoo.&nbsp;<br /><br /></li>\\r\\n<li>Ces donn&eacute;es sont susceptibles d&rsquo;&ecirc;tre conserv&eacute;es afin <strong>d&rsquo;alimenter des bases de donn&eacute;es</strong> poss&eacute;d&eacute;es et maintenues par DREAMLAND, ses affili&eacute;s et ses fournisseurs de service.</li>\\r\\n</ol>"}	2	2019-02-05 16:10:24.287469	2019-02-05 16:10:24.287469
47	221	{"text": "L&rsquo;information de l&rsquo;utilisateur principal de Captoo est <strong>r&eacute;alis&eacute;e via les conditions g&eacute;n&eacute;rales d&rsquo;utilisation</strong> (CGU). Elles sont r&eacute;dig&eacute;es en des termes clairs et compr&eacute;hensibles et d&eacute;crivent notamment :\\r\\n<ul>\\r\\n<li>la finalit&eacute; du traitement (notation de la qualit&eacute; de sommeil de l'utilisateur en vue de l'am&eacute;liorer) ;</li>\\r\\n<li>les donn&eacute;es personnelles collect&eacute;es, aussi pr&eacute;sent&eacute;es lors de la cr&eacute;ation du compte client via l'application ;&nbsp;</li>\\r\\n<li>les droits de la personne concern&eacute;e.</li>\\r\\n</ul>\\r\\n<div>L'utilisateur peut <strong>acc&eacute;der &agrave; tout moment au CGU avec son compte client via l'application</strong>. Il peut &eacute;galement contacter par mail&nbsp;Dreamland pour toute question de confidentialit&eacute; (contact@captoo-dreamland.com).</div>\\r\\n<div><br />Aucune information n&rsquo;est pr&eacute;vue vis-&agrave;-vis des personnes tierces susceptibles d&rsquo;&ecirc;tre concern&eacute;es (compagnon, enfants, autres membres du foyer, etc.).</div>"}	2	2019-02-05 16:10:24.329959	2019-02-05 16:10:24.329959
51	227	{"text": "<div>Toutes les donn&eacute;es sont <strong>transf&eacute;r&eacute;es aux &Eacute;tats-Unis d&egrave;s leur collecte</strong>.</div>"}	2	2019-02-05 16:10:24.390086	2019-02-05 16:10:24.390086
57	323	{"list": ["Employé", "Attaquant", "Entourage"]}	2	2019-02-05 16:10:24.433617	2019-02-05 16:10:24.433617
62	333	{"list": ["Employé", "Entourage", "Attaquant"]}	2	2019-02-05 16:10:24.478747	2019-02-05 16:10:24.478747
67	343	{"list": ["Utilisateur", "Entourage", "Employé", "Attaquant", "Sinistre"]}	2	2019-02-05 16:10:24.518429	2019-02-05 16:10:24.518429
14	224	{"text": "<div>Les donn&eacute;es directement identifiantes (adresse email, taille, poids, date de naissance, etc.)&nbsp;peuvent &ecirc;tre<strong> modifi&eacute;es par l&rsquo;utilisateur directement via l'application</strong>, mais la <strong>modification des donn&eacute;es collect&eacute;es ne peut se faire qu&rsquo;en &eacute;crivant &agrave; contact@captoo-dreamland.com</strong>.<br /><br />Les utilisateurs peuvent<strong> effacer leurs donn&eacute;es (en particulier en quittant le service)&nbsp;en &eacute;crivant &agrave; contact@captoo-dreamland.com</strong>.</div>"}	1	2019-02-05 16:10:23.80566	2019-02-05 16:10:23.80566
18	322	{"list": ["Consultation de données", "Vol de données", "Usurpation d'un compte (via un smartphone)"]}	1	2019-02-05 16:10:23.849337	2019-02-05 16:10:23.849337
26	331	{"list": ["Détérioration de la qualité du service"]}	1	2019-02-05 16:10:23.92831	2019-02-05 16:10:23.92831
31	346	{"text": "Il semble <strong>peu probable</strong> que les donn&eacute;es soient durablement indisponibles, au vu de la <strong>politique de s&eacute;curit&eacute; de l'h&eacute;bergeur BETA</strong>.", "gauge": "2"}	1	2019-02-05 16:10:23.968269	2019-02-05 16:10:23.968269
34	334	{"list": ["Sauvegardes", "Chiffrement", "Surveillance", "Contrôle des accès logiques", "Organisation", "Traçabilité", "Supervision", "Sécurité de l'exploitation"]}	1	2019-02-05 16:10:23.996187	2019-02-05 16:10:23.996187
40	123	{"text": "Les supports des donn&eacute;es associ&eacute;s &agrave; chaque &eacute;tape du cycle de vie des donn&eacute;es sont les suivants :&nbsp;<br />\\r\\n<ol>\\r\\n<li><strong>Cr&eacute;ation du compte utilisateur :</strong>&nbsp;serveurs Cloud BETA, smartphone, applications tierces, Internet, WIFI, Bluetooth ;<br /><br /></li>\\r\\n<li><strong>Collecte des donn&eacute;es li&eacute;es au sommeil</strong>&nbsp;: smartphone, base Captoo, pastille Captoo, Bluetooth, Internet, WIFI ;&nbsp;<br /><br /></li>\\r\\n<li><strong>Envoie des donn&eacute;es au serveur</strong>&nbsp;: smartphone, pastille Captoo, Bluetooth,&nbsp;Internet, WIFI, serveurs BETA ;<br /><br /></li>\\r\\n<li><strong>Relai des informations vers des applications tierces</strong>&nbsp;: smartphone, Internet, applications r&eacute;seaux sociaux, applications tierces ;<br /><br /></li>\\r\\n<li><strong>Am&eacute;lioration de la qualit&eacute; de service</strong>&nbsp;: serveurs BETA.</li>\\r\\n</ol>"}	2	2019-02-05 16:10:24.272984	2019-02-05 16:10:24.272984
43	212	{"text": "Pour chaque finalit&eacute; d&eacute;crite ci-dessus :&nbsp;<br />\\r\\n<ol>\\r\\n<li>Le traitement est n&eacute;cessaire &agrave; l&rsquo;<strong>ex&eacute;cution du contrat</strong> auquel l&rsquo;utilisateur est partie ;&nbsp;</li>\\r\\n<li><strong>Int&eacute;r&ecirc;t l&eacute;gitime</strong> de Dreamland ;</li>\\r\\n<li><strong>Int&eacute;r&ecirc;t l&eacute;gitime</strong> de Dreamland.&nbsp;</li>\\r\\n</ol>"}	2	2019-02-05 16:10:24.302339	2019-02-05 16:10:24.302339
49	222	{"text": "<div><strong>La personne accepte les CGU lors de l&rsquo;installation de l&rsquo;application</strong>. Elle d&eacute;cide &eacute;galement &agrave; ce moment de partager ou non ses donn&eacute;es sur les r&eacute;seaux sociaux.</div>"}	2	2019-02-05 16:10:24.361791	2019-02-05 16:10:24.361791
52	225	{"text": "<div><strong>Les</strong> <strong>param&egrave;tres de vie priv&eacute;e sont accessibles &agrave; l'inscription</strong> et les utilisateurs <strong>peuvent ensuite modifier ou supprimer</strong> leurs donn&eacute;es (en particulier en quittant le service) en &eacute;crivant &agrave; contact@captoo-dreamland.com.</div>"}	2	2019-02-05 16:10:24.397841	2019-02-05 16:10:24.397841
55	324	{"list": ["Contrôle des accès logiques", "Chiffrement", "Traçabilité", "Supervision", "Organisation", "Surveillance", "Sécurité de l'exploitation"]}	2	2019-02-05 16:10:24.424011	2019-02-05 16:10:24.424011
61	331	{"list": ["Détérioration de la qualité du service"]}	2	2019-02-05 16:10:24.461855	2019-02-05 16:10:24.461855
64	335	{"text": "Les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>d&eacute;sagr&eacute;ments significatifs</strong>, qu&rsquo;elles <strong>pourront surmonter malgr&eacute; quelques difficult&eacute;s</strong> (n&eacute;cessit&eacute; de refaire certains r&eacute;glages, erreur dans les heures de r&eacute;veil programm&eacute;es, etc.).", "gauge": "2"}	2	2019-02-05 16:10:24.495417	2019-02-05 16:10:24.495417
71	334	{"list": ["Sauvegardes", "Chiffrement", "Surveillance", "Contrôle des accès logiques", "Organisation", "Traçabilité", "Supervision", "Sécurité de l'exploitation"]}	2	2019-02-05 16:10:24.542879	2019-02-05 16:10:24.542879
72	111	{"text": "<div>Le PIA porte sur le <strong>moniteur de sommeil Captoo</strong>, produit par la soci&eacute;t&eacute; <strong>Dreamland </strong>qui&nbsp;est &eacute;galement le responsable du traitement r&eacute;sultant de l&rsquo;utilisation de ce moniteur de sommeil. Dreamland <strong>sous-traite une partie des moyens mis en &oelig;uvre &agrave; l&rsquo;h&eacute;bergeur BETA</strong>, bas&eacute; aux &Eacute;tats-Unis.&nbsp;</div>\\r\\n<div>&nbsp;</div>\\r\\n<div>Le traitement de donn&eacute;es permettant de fournir le service est<strong> fond&eacute; sur l&rsquo;ex&eacute;cution d&rsquo;un contrat</strong> auquel l&rsquo;utilisateur est partie. Captoo permet de mesurer diff&eacute;rents &eacute;l&eacute;ments (donn&eacute;es collect&eacute;es pendant la nuit &agrave; l&rsquo;aide de diff&eacute;rents capteurs) pour conna&icirc;tre et comprendre l&rsquo;environnement de l&rsquo;utilisateur.&nbsp;<br /><br /></div>\\r\\n<div>Les principaux enjeux r&eacute;sident dans la cr&eacute;ation d&rsquo;un nouveau service, l&rsquo;identification de causes de trouble du sommeil l&rsquo;am&eacute;lioration de la qualit&eacute; de sommeil de l&rsquo;utilisateur au cours du temps.</div>\\r\\n<div>&nbsp;</div>"}	1	2019-02-05 16:10:25.744157	2019-02-05 16:10:25.744157
17	227	{"text": "<div>Toutes les donn&eacute;es sont <strong>transf&eacute;r&eacute;es aux &Eacute;tats-Unis d&egrave;s leur collecte</strong>.</div>"}	1	2019-02-05 16:10:23.825521	2019-02-05 16:10:23.825521
21	324	{"list": ["Contrôle des accès logiques", "Chiffrement", "Traçabilité", "Supervision", "Organisation", "Surveillance", "Sécurité de l'exploitation"]}	1	2019-02-05 16:10:23.868257	2019-02-05 16:10:23.868257
27	335	{"text": "Les personnes concern&eacute;es pourraient conna&icirc;tre des <strong>d&eacute;sagr&eacute;ments significatifs</strong>, qu&rsquo;elles <strong>pourront surmonter malgr&eacute; quelques difficult&eacute;s</strong> (n&eacute;cessit&eacute; de refaire certains r&eacute;glages, erreur dans les heures de r&eacute;veil programm&eacute;es, etc.).", "gauge": "2"}	1	2019-02-05 16:10:23.926805	2019-02-05 16:10:23.926805
33	343	{"list": ["Utilisateur", "Entourage", "Employé", "Attaquant", "Sinistre"]}	1	2019-02-05 16:10:23.973981	2019-02-05 16:10:23.973981
39	112	{"text": "Les responsabilit&eacute;s sont les suivantes :&nbsp;<br />\\r\\n<ul>\\r\\n<li><strong>Responsable de traitement</strong> : Dreamland ;&nbsp;</li>\\r\\n<li><strong>Sous-traitant(s)</strong> : BETA ;&nbsp;</li>\\r\\n<li><strong>Destinataires</strong> : partenaires ou affili&eacute;s &agrave; Dreamland.</li>\\r\\n</ul>"}	2	2019-02-05 16:10:24.268452	2019-02-05 16:10:24.268452
45	213	{"text": "<p><strong>Donn&eacute;es relev&eacute;es</strong>&nbsp;<br /><em>Temp&eacute;rature, humidit&eacute;, taux de particules, luminosit&eacute;, son/bruit, heure de r&eacute;veil, donn&eacute;es d&rsquo;acc&eacute;l&eacute;rom&egrave;tre.</em><br />Les donn&eacute;es sont minimis&eacute;es avant leur transmission au serveur cloud de BETA et seules ces donn&eacute;es, n&eacute;cessaires &agrave; la fourniture du service, sont conserv&eacute;es. Les donn&eacute;es de bruit provenant des captations audio ne sont pas enregistr&eacute;es par d&eacute;faut. Celles-ci sont collect&eacute;es par tranches de 5 secondes et trait&eacute;es dans la base Captoo pour d&eacute;tection de bruits caract&eacute;ristiques tels que les ronflements.<br /><br /><strong>Donn&eacute;es calcul&eacute;es &agrave; partir des donn&eacute;es relev&eacute;es</strong><br /><em>Quantification de la qualit&eacute; du sommeil, &eacute;valuation de la qualit&eacute; de l&rsquo;environnement de la chambre &agrave; coucher (niveau de bruit, temp&eacute;rature, humidit&eacute;, air, etc.).</em><br />Ce sont les donn&eacute;es indicatrices de la qualit&eacute; de sommeil du client livrables pr&eacute;vus par le contrat de service. Seules les donn&eacute;es pr&eacute;vues au contrat sont calcul&eacute;es.<br /><br /><strong>Donn&eacute;es courantes pour l'identification du compte</strong><br /> <em>Adresse &eacute;lectronique, num&eacute;ro de t&eacute;l&eacute;phone, date de naissance, genre, taille, poids.</em><br />Donn&eacute;es utilis&eacute;es pour identifier le client et pour param&eacute;trer les calculs de qualit&eacute; de sommeil.</p>"}	2	2019-02-05 16:10:24.317268	2019-02-05 16:10:24.317268
48	223	{"text": "Les utilisateurs peuvent r&eacute;aliser les actions suivantes via l'application smartphone :<br />\\r\\n<ul>\\r\\n<li><strong>acc&eacute;der &agrave; l'ensemble de leurs donn&eacute;es personnelles</strong>&nbsp;;</li>\\r\\n<li><strong>acc&eacute;der &agrave; leur historique d'utilisation</strong> ;</li>\\r\\n<li><strong>t&eacute;l&eacute;charger une archive de l&rsquo;ensemble de leurs donn&eacute;es personnelles</strong>&nbsp;;&nbsp;</li>\\r\\n</ul>"}	2	2019-02-05 16:10:24.355471	2019-02-05 16:10:24.355471
54	321	{"list": ["Discrimination", "Menaces", "Agressions", "Perte d'emploi", "Perte d'accès à des services", "Phishing", "Publicité ciblée"]}	2	2019-02-05 16:10:24.410945	2019-02-05 16:10:24.410945
59	326	{"text": "Il semble <strong>extr&ecirc;mement facile</strong> pour un employ&eacute;, une personne de l'entourage de l'utilisateur ou un &eacute;ventuel attaquant <strong>d'avoir acc&egrave;s aux donn&eacute;es</strong>.", "gauge": "4"}	2	2019-02-05 16:10:24.454458	2019-02-05 16:10:24.454458
66	342	{"list": ["Suppression de données", "Détérioration de serveurs", "Dégradation physique d'un matériel"]}	2	2019-02-05 16:10:24.499024	2019-02-05 16:10:24.499024
69	344	{"list": ["Surveillance", "Sécurité des matériels", "Maintenance", "Sauvegardes", "Archivage", "Contrôle des accès logiques", "Organisation", "Traçabilité", "Gestion des postes de travail"]}	2	2019-02-05 16:10:24.536125	2019-02-05 16:10:24.536125
76	121	{"text": "Donnees :<br />\\r\\n<ol>\\r\\n<li><span style=\\"font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">G&eacute;olocalisation des t&eacute;l&eacute;phones des techniciens (relev&eacute;es)</span></li>\\r\\n<li>G&eacute;olocalisation des v&eacute;hicules des techniciens (relev&eacute;es)</li>\\r\\n</ol>\\r\\nDestinataire:<br />\\r\\n<ol>\\r\\n<li>Le CRC et le management via une application appel&eacute;e Optimap</li>\\r\\n<li>Le CRC et le management via une application appel&eacute;e Optimap</li>\\r\\n</ol>\\r\\nDur&eacute;e de conservation:<br />\\r\\n<ol>\\r\\n<li>Pas d'historique, affichage de la derni&egrave;re position connue</li>\\r\\n<li>Conservation 2 mois</li>\\r\\n</ol>"}	7	2019-03-21 10:33:13.703502	2019-03-21 10:36:50.219074
73	111	{"text": "<span style=\\"font-family: 'docs-Arial Narrow'; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">Le traitement des donn&eacute;es utilis&eacute;es lors des interventions de nos techniciens en STI (Situation de Travailleur Isol&eacute;).<br />Le STI est un syst&egrave;me de protection de nos salari&eacute;s, notamment lorsqu'ils interviennent seuls en astreinte (la nuit).</span>"}	7	2019-03-21 10:24:57.655571	2019-03-21 10:25:15.087106
77	122	{"text": "Processus:<br />\\r\\n<ol>\\r\\n<li>Collecte des donn&eacute;es v&eacute;hicule</li>\\r\\n<li>Envoi des donn&eacute;es chez Dalkia</li>\\r\\n</ol>\\r\\nDescription d&eacute;taill&eacute;e<br />\\r\\n<ol>\\r\\n<li>Un boitier contenu dans le v&eacute;hicule envoie via le r&eacute;seau t&eacute;lp&eacute;honique la position GPS du v&eacute;hicule</li>\\r\\n<li><em><strong>Les donn&eacute;es sont mises &agrave; disposition / envoy&eacute;es ? vers le SI de Dalkia</strong></em></li>\\r\\n</ol>\\r\\nSupport des donn&eacute;es concern&eacute;es<br /><br />\\r\\n<ol>\\r\\n<li>Les donn&eacute;es sont conserv&eacute;es chez nos fournisseurs qui les mettent &agrave; disposition en mode SaaS</li>\\r\\n<li>Conservation 2 mois sur nos serveurs</li>\\r\\n</ol>"}	7	2019-03-21 10:40:13.49321	2019-03-21 10:44:51.62598
74	112	{"text": "Le RT est la direction des op&eacute;rations<br />le ST&nbsp;<span style=\\"color: #0a0a0a; font-family: Roboto, sans-serif; font-size: 12px; background-color: #ffffff;\\">Masternaute et KUANTIC</span>"}	7	2019-03-21 10:25:43.895734	2019-03-21 10:26:15.716156
75	113	{"text": "<span style=\\"font-family: 'docs-Arial Narrow'; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">Aucun r&eacute;f&eacute;rentiel sp&eacute;cifique</span>"}	7	2019-03-21 10:32:07.693495	2019-03-21 10:32:07.693495
78	123	{"text": "<span style=\\"font-family: Inconsolata, monospace, arial, sans, sans-serif; white-space: pre-wrap; background-color: #ffffff;\\">Cf point pr&eacute;c&eacute;dent</span>"}	7	2019-03-21 10:45:47.856444	2019-03-21 10:45:47.856444
79	211	{"text": "<span style=\\"font-family: 'docs-Arial Narrow'; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">La finalit&eacute; du traitement est la protection des salari&eacute;s, elle est explicite et l&eacute;gitime</span>"}	7	2019-03-21 10:46:01.375944	2019-03-21 10:46:01.375944
86	223	{"text": "Les personnes peuvent contacter la DRH et envoyer la demande sur l'adresse d&eacute;di&eacute;e: dpo@dalkia.fr"}	7	2019-03-21 10:59:55.3144	2019-03-21 11:01:38.490034
80	212	{"text": "<p class=\\"MsoNormal\\">le traitement est :<br />- n&eacute;cessaire &agrave; la sauvegarde des int&eacute;r&ecirc;ts vitaux de la personne concern&eacute;e ou d'une autre personne physique et,<br />-&nbsp; n&eacute;cessaire aux fins des int&eacute;r&ecirc;ts l&eacute;gitimes du RT<br /><span style=\\"font-family: 'docs-Arial Narrow'; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">Etant entendu qu'en tant qu'employeur Dalkia a une responsabilit&eacute; sur la s&eacute;curit&eacute; de ses salari&eacute;s</span></p>"}	7	2019-03-21 10:47:51.326998	2019-03-21 10:50:42.72824
82	214	{"text": "<span style=\\"font-family: Inconsolata, monospace, arial, sans, sans-serif; white-space: pre-wrap; background-color: #ffffff;\\">Il n'y a pas de processus de traitement de la donn&eacute;e susceptible de l'alt&eacute;rer, ce sont les donn&eacute;es brute qui sont affich&eacute;es. Cette partie est donc sans objet.</span>"}	7	2019-03-21 10:52:56.437613	2019-03-21 10:52:56.437613
83	215	{"text": "<span style=\\"font-family: Inconsolata, monospace, arial, sans, sans-serif; white-space: pre-wrap; background-color: #ffffff;\\">Il n'y a pas de processus de traitement de la donn&eacute;e susceptible de l'alt&eacute;rer, ce sont les donn&eacute;es brute qui sont affich&eacute;es. Cette partie est donc sans objet.</span>"}	7	2019-03-21 10:53:51.800856	2019-03-21 10:53:51.800856
84	221	{"text": "<p class=\\"MsoNormal\\">Les informations ont &eacute;t&eacute; partag&eacute;es avec les IRP, une charte (d&eacute;cembre 2012) a &eacute;t&eacute; r&eacute;dig&eacute;e et un courier a &eacute;t&eacute; envoy&eacute; &agrave; chaque collaborateur</p>"}	7	2019-03-21 10:54:23.880981	2019-03-21 10:55:44.699746
90	227	{"text": "NA pas de transfert hors UE<br />\\r\\n<p class=\\"MsoNormal\\">Les donn&eacute;es de notre SI sont stock&eacute;es sur des serveurs h&eacute;berg&eacute;s en France. Dalkia exige syst&eacute;matiquement de ses sous-traitants concern&eacute;s que les donn&eacute;es qui nous concernent et qu'ils h&eacute;bergent soient stock&eacute;es en EU.</p>"}	7	2019-03-21 11:02:30.811604	2019-03-21 11:03:13.614636
81	213	{"text": "<span style=\\"font-family: 'docs-Arial Narrow'; font-size: 13px; white-space: pre-wrap; background-color: #ffffff;\\">Les donn&eacute;es li&eacute;es au t&eacute;l&eacute;phone ne sont pas conserv&eacute;es, seule la derni&egrave;re position connue est affich&eacute;e dans l'application.Quant aux v&eacute;hicules, seules les 4 derni&egrave;res heures du trajet sont affich&eacute;es. Ceci garantit qu'en cas de probl&egrave;me, Dalkia peut retracer ce qu'il s'est pass&eacute; sur un pas de temps suffisamment long pour permettre l'analyse et suffisamment court pour pr&eacute;server la vie priv&eacute;e de son technicien. </span>"}	7	2019-03-21 10:52:39.832927	2019-03-21 10:52:39.832927
85	222	{"text": "SO"}	7	2019-03-21 10:56:32.861881	2019-03-21 10:56:32.861881
87	224	{"text": "Les personnes peuvent contacter la DRH et envoyer la demande sur l'adresse d&eacute;di&eacute;e: dpo@dalkia.fr"}	7	2019-03-21 11:00:23.936559	2019-03-21 11:01:41.779909
88	225	{"text": "Les personnes peuvent contacter la DRH et envoyer la demande sur l'adresse d&eacute;di&eacute;e: dpo@dalkia.fr"}	7	2019-03-21 11:01:17.411531	2019-03-21 11:01:45.203706
89	226	{"text": "<em><strong>Voir avec la DSIN</strong></em>"}	7	2019-03-21 11:02:01.276253	2019-03-21 11:02:01.276253
92	322	{"list": ["Consultation d'un serveur", "Vol d'un ordinateur portable / smartphone", "Usurpation d'identité pour accéder à une application"]}	7	2019-03-21 11:10:39.049219	2019-03-21 11:11:49.300309
91	321	{"list": ["Accès à l'historique des positions de nos salariés dans les 2 derniers mois", "Destruction de ses habitudes de vie ou la localisation de leur domicile"]}	7	2019-03-21 11:09:53.42649	2019-03-21 11:12:20.075547
93	323	{"list": ["Employé / Attaquant"]}	7	2019-03-21 11:14:23.694722	2019-03-21 11:14:23.694722
94	324	{"list": ["Sécurisation des matériels", "Protection des sites web", "Sécurisation des canaux informatiques"]}	7	2019-03-21 11:15:21.348472	2019-03-21 11:15:48.25561
95	325	{"gauge": "2"}	7	2019-03-21 11:16:01.131864	2019-03-21 11:16:01.131864
96	326	{"gauge": "2"}	7	2019-03-21 11:16:09.567144	2019-03-21 11:16:09.567144
97	331	{"list": ["SO"]}	7	2019-03-21 11:16:53.403394	2019-03-21 11:17:25.373264
98	332	{"list": ["SO"]}	7	2019-03-21 11:17:32.76359	2019-03-21 11:17:38.791585
99	333	{"list": ["SO"]}	7	2019-03-21 11:17:44.07633	2019-03-21 11:17:44.07633
100	341	{"list": ["Difficulté à faire organiser les équipes ou à gérer la flotte", "Difficultés à protéger nos salariés (STI)"]}	7	2019-03-21 11:18:21.982309	2019-03-21 11:18:29.310154
101	342	{"list": ["Suppression des données", "Dégradation physique des matériels (serveurs, ordinateurs, téléphones...)"]}	7	2019-03-21 11:18:45.042059	2019-03-21 11:18:51.279134
102	343	{"list": ["Employé", "Attaquant", "Sinistre"]}	7	2019-03-21 11:19:11.494599	2019-03-21 11:19:20.555799
103	344	{"list": ["Contrôle des accès logiques", "Chiffrement", "Sauvegarde des données", "Minimisation des données"]}	7	2019-03-21 11:22:14.934082	2019-03-21 11:22:40.931044
104	345	{"gauge": "2"}	7	2019-03-21 11:22:46.324144	2019-03-21 11:22:46.324144
105	346	{"gauge": "2"}	7	2019-03-21 11:22:49.371388	2019-03-21 11:22:49.371388
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2019-02-05 16:05:53.474425	2019-02-05 16:05:53.474425
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.attachments (id, attached_file, pia_signed, pia_id, created_at, updated_at, comment) FROM stdin;
1	shema_description_fonctionnelle.pdf	f	7	2019-03-21 10:39:54.726327	2019-03-21 10:39:54.726327	
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.comments (id, description, reference_to, for_measure, pia_id, created_at, updated_at) FROM stdin;
1	Le fondement juridique correspondant à l’exécution du contrat ne sera valable que pour la fourniture du service demandé par l’utilisateur et non pour le calculer des statistiques ou alimenter les bases de données des affiliés et fournisseurs de service de Dreamland. \r\n\r\nPour chacune des finalités, calcul de statistiques et alimentation des bases des affiliés et fournisseurs, correspondant chacune à la notion de « traitement », il conviendra de refaire un PIA et d’évaluer la possibilité de recourir à l’intérêt légitime en fonction des mesures de protection mises en place.\r\n	212	f	1	2019-02-05 16:10:24.235867	2019-02-05 16:10:24.235867
2	Le fondement juridique correspondant à l’exécution du contrat ne sera valable que pour la fourniture du service demandé par l’utilisateur et non pour le calculer des statistiques ou alimenter les bases de données des affiliés et fournisseurs de service de Dreamland. \r\n\r\nPour chacune des finalités, calcul de statistiques et alimentation des bases des affiliés et fournisseurs, correspondant chacune à la notion de « traitement », il conviendra de refaire un PIA et d’évaluer la possibilité de recourir à l’intérêt légitime en fonction des mesures de protection mises en place.\r\n	212	f	2	2019-02-05 16:10:24.743432	2019-02-05 16:10:24.743432
3	Le shéma descriptif figure en PJ	122	f	7	2019-03-21 10:45:18.997712	2019-03-21 10:45:18.997712
4	Insérer en PJ la PSSI du groupe	67	t	7	2019-03-21 11:05:47.673851	2019-03-21 11:05:47.673851
\.


--
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.evaluations (id, status, reference_to, action_plan_comment, evaluation_comment, evaluation_date, gauges, estimated_implementation_date, person_in_charge, pia_id, created_at, updated_at, global_status) FROM stdin;
1	3	1.1		Aucun commentaire.	\N	{}	\N		1	2019-02-05 16:10:24.756146	2019-02-05 16:10:24.756146	2
2	3	1.2		Aucun commentaire.	\N	{}	\N		1	2019-02-05 16:10:24.769329	2019-02-05 16:10:24.769329	2
3	2	2.1.211	Afin d&rsquo;&eacute;viter un usage incompatible ou un d&eacute;tournement de finalit&eacute;, il conviendrait d&rsquo;expliciter les autres finalit&eacute;s dans les documents port&eacute;s &agrave; la connaissance des clients et de r&eacute;it&eacute;rer le PIA pour ces traitements. L&rsquo;enjeu pour la vie priv&eacute;e des personnes diff&egrave;re en fonction des finalit&eacute;s.	Cette finalit&eacute; doit &ecirc;tre distingu&eacute;e de celle des transmissions de donn&eacute;es aux affili&eacute;s ou de tout autre traitement &agrave; des fins de recherche ou d&rsquo;&eacute;ventuel profilage mis en &oelig;uvre par BETA et ses affili&eacute;s. Ces autres finalit&eacute;s sont rapidement &eacute;voqu&eacute;es, sans pour autant &ecirc;tre explicite.	\N	{}	\N		1	2019-02-05 16:10:24.778686	2019-02-05 16:10:24.778686	2
4	2	2.1.212	Distinguer le service lui-m&ecirc;me des autres finalit&eacute;s, au besoin faire un PIA pour chacune.	Ce fondement n&rsquo;est valable que pour le traitement de donn&eacute;es strictement n&eacute;cessaire &agrave; la fourniture du service. Il ne sera pas valable pour la transmission de donn&eacute;es &agrave; des tiers ou toute autre finalit&eacute; de traitement accessoire, non n&eacute;cessaire pour fournir le service.	\N	{}	\N		1	2019-02-05 16:10:24.78521	2019-02-05 16:10:24.78521	2
5	2	2.1.213	<div>Une distinction entre les donn&eacute;es absolument n&eacute;cessaires au fonctionnement du moniteur et de l&rsquo;application et celles non n&eacute;cessaires doit &ecirc;tre faite.</div>\r\n<div>&nbsp;</div>\r\n<div>La captation du son doit &ecirc;tre supprim&eacute;e et remplac&eacute;e par le suivi du niveau sonore (en dB) au cours de la nuit.</div>\r\n<div>&nbsp;</div>	<div>La n&eacute;cessit&eacute; de la collecte de certaines donn&eacute;es (informations personnelles comme la localisation, la date de naissance, l&rsquo;&acirc;ge, le poids, etc.) pour l&rsquo;&eacute;valuation de la qualit&eacute; du sommeil de l&rsquo;utilisateur semble questionnable. Pour la localisation, il s&rsquo;agirait de pouvoir int&eacute;grer les heures de lever et coucher du soleil ainsi que des informations d&rsquo;ordre m&eacute;t&eacute;orologique.&nbsp;<br /><br /></div>\r\n<div>Il n&rsquo;y a aucune garantie que les donn&eacute;es agr&eacute;g&eacute;es pour partage avec des applications tierces soient effectivement anonymes (cf. remarques ci-dessus sur les finalit&eacute;s autres que le bon fonctionnement du service).</div>\r\n<div>&nbsp;</div>	\N	{}	\N		1	2019-02-05 16:10:24.789318	2019-02-05 16:10:24.789318	2
6	3	2.1.214			\N	{}	\N		1	2019-02-05 16:10:24.804353	2019-02-05 16:10:24.804353	2
7	2	2.2.221	<div>Afin d&rsquo;assurer la transparence et la pleine connaissance des cons&eacute;quences de l&rsquo;usage de l&rsquo;application, Dreamland pourrait informer ses utilisateurs sous forme de &laquo; pop up &raquo; lors de l&rsquo;activation de l&rsquo;application, de mani&egrave;re concise, en des termes simples et clairs, et par l&rsquo;utilisation d&rsquo;ic&ocirc;nes, de l&rsquo;identit&eacute; et des coordonn&eacute;es du responsable de traitement, des finalit&eacute;s de chaque traitement et de tout traitement ult&eacute;rieur, de leur base juridique respective, des destinataires des donn&eacute;es (la mention de partenaires et affili&eacute;s est trop large), de la dur&eacute;e de conservation, de la mani&egrave;re d&rsquo;exercer les droits d&rsquo;acc&egrave;s, de rectification, d&rsquo;opposition, d&rsquo;effacement, le droit &agrave; la portabilit&eacute;, le droit &agrave; la limitation du traitement, les coordonn&eacute;es du d&eacute;l&eacute;gu&eacute; &agrave; la protection des donn&eacute;es (s&rsquo;il a &eacute;t&eacute; nomm&eacute;).<br /><br /></div>\r\n<div>Une information sur le transfert de donn&eacute;es hors UE est requise.</div>\r\n<div>&nbsp;</div>	Placer l&rsquo;information dans les CGU risque de la noyer parmi d&rsquo;autres aspects. L&rsquo;information n&rsquo;est pas compl&egrave;te s&rsquo;agissant des aspects d&eacute;crits dans les mesures correctives ci-dessous.	\N	{}	\N		1	2019-02-05 16:10:24.812614	2019-02-05 16:10:24.812614	2
8	2	2.1.215	Une dur&eacute;e de conservation pour chaque cat&eacute;gorie de donn&eacute;e doit &ecirc;tre fix&eacute;e en tenant compte de ce qui est strictement n&eacute;cessaire au bon fonctionnement du service. Pour que la proc&eacute;dure d&rsquo;effacement soit efficace, BETA doit distinguer entre les donn&eacute;es pr&eacute;sentes dans ses serveurs, celles pr&eacute;sentes dans les serveurs de son sous-traitant et celles trait&eacute;es en local dans le moniteur et le t&eacute;l&eacute;phone de l&rsquo;utilisateur.	Aucune dur&eacute;e de conservation n&rsquo;est fix&eacute;e, les donn&eacute;es peuvent donc &ecirc;tre stock&eacute;es ind&eacute;finiment dans les serveurs, &agrave; d&eacute;faut de demande de suppression de l&rsquo;utilisateur.	\N	{}	\N		1	2019-02-05 16:10:24.817495	2019-02-05 16:10:24.817495	2
9	2	2.2.222	Afin d&rsquo;&eacute;viter un usage incompatible ou un d&eacute;tournement de finalit&eacute;, il conviendrait d&rsquo;expliciter les autres finalit&eacute;s dans les documents port&eacute;s &agrave; la connaissance des clients et de r&eacute;it&eacute;rer le PIA pour ces traitements. L&rsquo;enjeu pour la vie priv&eacute;e des personnes diff&egrave;re en fonction des finalit&eacute;s.	Le traitement est bas&eacute; sur un contrat, mais il est n&eacute;cessaire d&rsquo;expliciter les sous finalit&eacute;s.&nbsp;	\N	{}	\N		1	2019-02-05 16:10:24.821607	2019-02-05 16:10:24.821607	2
10	2	2.2.223	<div>Identifier les donn&eacute;es soumises &agrave; portabilit&eacute; et d&eacute;finir le format &laquo; structur&eacute; couramment utilis&eacute; et lisible par une machine &raquo; permettant d&rsquo;automatiser leur transmission.&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>S&rsquo;assurer de la compl&eacute;tude des informations fournies depuis les diff&eacute;rents supports de donn&eacute;es, lors de la r&eacute;ponse &agrave; une demande d'exercice du droit d'acc&egrave;s.</div>\r\n<div>&nbsp;</div>	<div>Les donn&eacute;es accessibles depuis l&rsquo;application ne sont pas les seules donn&eacute;es d&eacute;tenues par Dreamland.&nbsp;Celles-ci peuvent comprendre les donn&eacute;es de connexion (IP, horodatage des connexions au service et.) collect&eacute;es dans le cadre du fonctionnement du service, un &eacute;ventuel profil restitu&eacute; de mani&egrave;re incompl&egrave;te par l&rsquo;appli, etc.&nbsp;L&rsquo;utilisateur doit &ecirc;tre en mesure de les r&eacute;cup&eacute;rer que ce soit, dans leur int&eacute;gralit&eacute;, par son droit d&rsquo;acc&egrave;s, ou partiellement en demandant une portabilit&eacute; (le service &eacute;tant fourni sur la base d&rsquo;un contrat).</div>\r\n<div>&nbsp;</div>	\N	{}	\N		1	2019-02-05 16:10:24.84371	2019-02-05 16:10:24.84371	2
13	2	2.2.227	<div>Dreamland doit s&rsquo;assurer d&rsquo;encadrer le transfert par des &laquo; garanties appropri&eacute;es &raquo; (cf. liste d&rsquo;instrument art. 46). Il sera &eacute;galement n&eacute;cessaire de signer un contrat avec ce sous-traitant aux US. &nbsp;</div>	Aucun encadrement du transfert des donn&eacute;es collect&eacute;es depuis les moniteurs vers les serveurs de l&rsquo;h&eacute;bergeur aux &Eacute;tats-Unis ne semble &ecirc;tre pr&eacute;vu.	\N	{}	\N		1	2019-02-05 16:10:24.864949	2019-02-05 16:10:24.864949	2
11	2	2.2.225	Les suites &agrave; donner &agrave; l&rsquo;identification d&rsquo;un probl&egrave;me de lic&eacute;it&eacute;, d&rsquo;exactitude des donn&eacute;es, de pertinence, etc. doivent &ecirc;tre document&eacute;es et permettre de r&eacute;pondre &agrave; chaque demande de limitation du traitement.	<div>Attention, dans le cas pr&eacute;sent, la seule finalit&eacute; &eacute;tudi&eacute;e est celle de la fourniture du service bas&eacute; sur l&rsquo;ex&eacute;cution du contrat ; les donn&eacute;es collect&eacute;es sur la base de ce fondement ne font pas l&rsquo;objet du droit d&rsquo;opposition pr&eacute;vu &agrave; l&rsquo;article 21 du RGPD.&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>Le droit &agrave; la limitation du traitement permettra en revanche &agrave; la personne concern&eacute;e de signaler un probl&egrave;me au niveau du traitement de ses donn&eacute;es et &agrave; Dreamland de suspendre leur traitement le temps de v&eacute;rifier le bien-fond&eacute; de la demande (par exemple).</div>	\N	{}	\N		1	2019-02-05 16:10:24.849616	2019-02-05 16:10:24.849616	2
16	3	3.4		<div>Un utilisateur voit les donn&eacute;es relatives &agrave; son sommeil supprim&eacute;es par maladresse par un employ&eacute; de Dreamland et perd ainsi tout l&rsquo;historique d&rsquo;utilisation et de personnalisation du service. Le risque semble acceptable au regard de la gravit&eacute; (limit&eacute;e) et de la vraisemblance (limit&eacute;e) r&eacute;siduelles, compte tenu des mesures existantes ou pr&eacute;vues.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		1	2019-02-05 16:10:24.896905	2019-02-05 16:10:24.896905	2
20	2	3.1.2	Il conviendrait de pr&eacute;ciser la politique de gestion des mots de passe.	Il incombe toutefois &agrave; Dreamland de garantir la bonne gestion de ces informations.	\N	{}	\N		1	2019-02-05 16:10:24.941618	2019-02-05 16:10:24.941618	2
24	3	3.1.9			\N	{}	\N		1	2019-02-05 16:10:24.994337	2019-02-05 16:10:24.994337	2
28	2	3.1.16	Pr&eacute;ciser la politique de sauvegarde de BETA.	Manque de pr&eacute;cision.	\N	{}	\N		1	2019-02-05 16:10:25.03583	2019-02-05 16:10:25.03583	2
33	3	3.1.15			\N	{}	\N		1	2019-02-05 16:10:25.097129	2019-02-05 16:10:25.097129	2
38	2	3.1.20	<strong>Une nouvelle mesure compl&eacute;mentaire &laquo; gestion des risques&raquo; doit &ecirc;tre ajout&eacute;e au traitement&nbsp;</strong>pour mettre en place une proc&eacute;dure de gestion de projet int&eacute;grant l&rsquo;&eacute;tude syst&eacute;matique des risques que font peser le traitement sur la vie priv&eacute;e des personnes concern&eacute;es.		\N	{}	\N		1	2019-02-05 16:10:25.144197	2019-02-05 16:10:25.144197	2
41	3	1.2		Aucun commentaire.	\N	{}	\N		2	2019-02-05 16:10:25.181664	2019-02-05 16:10:25.181664	2
45	2	2.1.213	<div>Une distinction entre les donn&eacute;es absolument n&eacute;cessaires au fonctionnement du moniteur et de l&rsquo;application et celles non n&eacute;cessaires doit &ecirc;tre faite.</div>\r\n<div>&nbsp;</div>\r\n<div>La captation du son doit &ecirc;tre supprim&eacute;e et remplac&eacute;e par le suivi du niveau sonore (en dB) au cours de la nuit.</div>\r\n<div>&nbsp;</div>	<div>La n&eacute;cessit&eacute; de la collecte de certaines donn&eacute;es (informations personnelles comme la localisation, la date de naissance, l&rsquo;&acirc;ge, le poids, etc.) pour l&rsquo;&eacute;valuation de la qualit&eacute; du sommeil de l&rsquo;utilisateur semble questionnable. Pour la localisation, il s&rsquo;agirait de pouvoir int&eacute;grer les heures de lever et coucher du soleil ainsi que des informations d&rsquo;ordre m&eacute;t&eacute;orologique.&nbsp;<br /><br /></div>\r\n<div>Il n&rsquo;y a aucune garantie que les donn&eacute;es agr&eacute;g&eacute;es pour partage avec des applications tierces soient effectivement anonymes (cf. remarques ci-dessus sur les finalit&eacute;s autres que le bon fonctionnement du service).</div>\r\n<div>&nbsp;</div>	\N	{}	\N		2	2019-02-05 16:10:25.226508	2019-02-05 16:10:25.226508	2
51	2	2.2.224	<div>A chaque &eacute;volution du service et de ses sous-finalit&eacute;s, Dreamland devrait initier une proc&eacute;dure de r&eacute;vision de la pertinence des donn&eacute;es collect&eacute;es pour signaler, au moyen d&rsquo;une ic&ocirc;ne, les donn&eacute;es qui ne sont plus absolument n&eacute;cessaires &agrave; l&rsquo;ex&eacute;cution du service et dont la personne peut demander l&rsquo;effacement, si Dreamland ne l&rsquo;a pas d&eacute;j&agrave; fait.&nbsp;<br /><br /></div>\r\n<div>Un accus&eacute; de r&eacute;ception devrait &ecirc;tre adress&eacute; pour confirmer la prise en compte des demandes. Un message de sensibilisation pourrait &eacute;galement &ecirc;tre envoy&eacute; &agrave; l&rsquo;utilisateur pour l&rsquo;inviter &agrave; avertir son entourage de l&rsquo;activation de l&rsquo;application.</div>\r\n<div>&nbsp;</div>	<div>Les utilisateurs peuvent rectifier leurs donn&eacute;es (informations sur l&rsquo;utilisateur, mais pas les donn&eacute;es collect&eacute;es &agrave; l&rsquo;aide de capteurs) et demander la suppression des informations, mais sans savoir sur quelles donn&eacute;es portent pr&eacute;cis&eacute;ment ce droit. De plus l&rsquo;entourage de l&rsquo;utilisateur susceptible d&rsquo;&ecirc;tre concern&eacute; par les donn&eacute;es collect&eacute;es ne peut s&rsquo;opposer au syst&egrave;me.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		2	2019-02-05 16:10:25.271742	2019-02-05 16:10:25.271742	2
56	3	3.3		<div>Un utilisateur peut voir ses donn&eacute;es de sommeil fauss&eacute;es suite &agrave; l&rsquo;h&eacute;bergement d&rsquo;une personne dans sa chambre &agrave; coucher et observer une d&eacute;t&eacute;rioration de la qualit&eacute; du service.&nbsp;Le risque semble acceptable au regard de la gravit&eacute; (limit&eacute;e) et de la vraisemblance (limit&eacute;e) r&eacute;siduelles, compte tenu des mesures existantes ou pr&eacute;vues.<br /><br />En bonne pratique, il serait important d'ajouter la mesure <strong>&laquo; gestion des incidents et des violations de donn&eacute;es &raquo; </strong>aidant &agrave; traiter le risque.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		2	2019-02-05 16:10:25.331594	2019-02-05 16:10:25.331594	2
60	2	3.1.28	Il conviendrait de pr&eacute;ciser les informations journalis&eacute;es, leurs dur&eacute;es de conservation, l&rsquo;architecture de journalisation, la fr&eacute;quence et la proc&eacute;dure d&rsquo;audit des journaux, et si des proc&eacute;dures de d&eacute;tection des acc&egrave;s frauduleux et/ou suspects sont mises en &oelig;uvre.&nbsp;<strong>Une nouvelle mesure &laquo; gestion des incidents et des violations de donn&eacute;es&nbsp;&raquo; doit &ecirc;tre ajout&eacute;e au traitement </strong>pour mettre en place une proc&eacute;dure de gestion des violations des donn&eacute;es personnelles.	Manque de pr&eacute;cision.	\N	{}	\N		2	2019-02-05 16:10:25.369352	2019-02-05 16:10:25.369352	2
65	3	3.1.31			\N	{}	\N		2	2019-02-05 16:10:25.411978	2019-02-05 16:10:25.411978	2
71	2	3.1.35	Rappeler les bonnes pratiques concernant les r&eacute;seaux domestiques dans la documentation produit.	Le r&eacute;seau priv&eacute; du client est &agrave; sa charge, toutefois un rappel des bonnes pratiques de s&eacute;curit&eacute; pourrait &ecirc;tre fait.	\N	{}	\N		2	2019-02-05 16:10:25.447823	2019-02-05 16:10:25.447823	2
74	3	3.1.42			\N	{}	\N		2	2019-02-05 16:10:25.493207	2019-02-05 16:10:25.493207	2
80	2	3.1.45	Il conviendrait de pr&eacute;ciser les conditions de r&eacute;alisation des audits internes.	Manque de pr&eacute;cision.	\N	{}	\N		2	2019-02-05 16:10:25.54122	2019-02-05 16:10:25.54122	2
12	2	2.2.224	<div>A chaque &eacute;volution du service et de ses sous-finalit&eacute;s, Dreamland devrait initier une proc&eacute;dure de r&eacute;vision de la pertinence des donn&eacute;es collect&eacute;es pour signaler, au moyen d&rsquo;une ic&ocirc;ne, les donn&eacute;es qui ne sont plus absolument n&eacute;cessaires &agrave; l&rsquo;ex&eacute;cution du service et dont la personne peut demander l&rsquo;effacement, si Dreamland ne l&rsquo;a pas d&eacute;j&agrave; fait.&nbsp;<br /><br /></div>\r\n<div>Un accus&eacute; de r&eacute;ception devrait &ecirc;tre adress&eacute; pour confirmer la prise en compte des demandes. Un message de sensibilisation pourrait &eacute;galement &ecirc;tre envoy&eacute; &agrave; l&rsquo;utilisateur pour l&rsquo;inviter &agrave; avertir son entourage de l&rsquo;activation de l&rsquo;application.</div>\r\n<div>&nbsp;</div>	<div>Les utilisateurs peuvent rectifier leurs donn&eacute;es (informations sur l&rsquo;utilisateur, mais pas les donn&eacute;es collect&eacute;es &agrave; l&rsquo;aide de capteurs) et demander la suppression des informations, mais sans savoir sur quelles donn&eacute;es portent pr&eacute;cis&eacute;ment ce droit. De plus l&rsquo;entourage de l&rsquo;utilisateur susceptible d&rsquo;&ecirc;tre concern&eacute; par les donn&eacute;es collect&eacute;es ne peut s&rsquo;opposer au syst&egrave;me.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		1	2019-02-05 16:10:24.855185	2019-02-05 16:10:24.855185	2
19	2	3.1.3	TLS devrait &ecirc;tre employ&eacute; pour l&rsquo;utilisation du protocole https.	Il est recommand&eacute; d&rsquo;utiliser la version de TLS la plus &agrave; jour possible et non SSL.	\N	{}	\N		1	2019-02-05 16:10:24.933383	2019-02-05 16:10:24.933383	2
25	3	3.1.7			\N	{}	\N		1	2019-02-05 16:10:24.998206	2019-02-05 16:10:24.998206	2
30	3	3.1.12			\N	{}	\N		1	2019-02-05 16:10:25.047019	2019-02-05 16:10:25.047019	2
35	2	3.1.21	Dreamland devrait en r&eacute;diger une &eacute;galement.		\N	{}	\N		1	2019-02-05 16:10:25.117308	2019-02-05 16:10:25.117308	2
39	3	3.1.22			\N	{}	\N		1	2019-02-05 16:10:25.163142	2019-02-05 16:10:25.163142	2
42	3	1.1		Aucun commentaire.	\N	{}	\N		2	2019-02-05 16:10:25.201958	2019-02-05 16:10:25.201958	2
48	2	2.1.215	Une dur&eacute;e de conservation pour chaque cat&eacute;gorie de donn&eacute;e doit &ecirc;tre fix&eacute;e en tenant compte de ce qui est strictement n&eacute;cessaire au bon fonctionnement du service. Pour que la proc&eacute;dure d&rsquo;effacement soit efficace, BETA doit distinguer entre les donn&eacute;es pr&eacute;sentes dans ses serveurs, celles pr&eacute;sentes dans les serveurs de son sous-traitant et celles trait&eacute;es en local dans le moniteur et le t&eacute;l&eacute;phone de l&rsquo;utilisateur.	Aucune dur&eacute;e de conservation n&rsquo;est fix&eacute;e, les donn&eacute;es peuvent donc &ecirc;tre stock&eacute;es ind&eacute;finiment dans les serveurs, &agrave; d&eacute;faut de demande de suppression de l&rsquo;utilisateur.	\N	{}	\N		2	2019-02-05 16:10:25.244593	2019-02-05 16:10:25.244593	2
53	2	2.2.226	Un contrat de sous-traitance doit &ecirc;tre conclu entre les 2 soci&eacute;t&eacute;s pr&eacute;cisant l&rsquo;ensemble des &eacute;l&eacute;ments pr&eacute;vus &agrave; l&rsquo;art. 28 (dur&eacute;e, p&eacute;rim&egrave;tre, finalit&eacute;, des instructions de traitement document&eacute;es, l&rsquo;autorisation pr&eacute;alable en cas de recours &agrave; un sous-traitant, mise &agrave; disposition de toute documentation apportant la preuve du respect du r&egrave;glement, notification imm&eacute;diate de toute violation de donn&eacute;es, etc.).	BETA agissant en tant que sous-traitant, elle ne peut traiter les donn&eacute;es que selon les instructions et pour le compte de Dreamland, dans un cadre &eacute;tabli par &eacute;crit.	\N	{}	\N		2	2019-02-05 16:10:25.303266	2019-02-05 16:10:25.303266	2
57	2	3.2	Les mesures correctives suivantes doivent &ecirc;tre mises en&nbsp;&oelig;uvre :<br />\r\n<ul>\r\n<li>Pr&eacute;ciser, et le cas &eacute;ch&eacute;ant adapter, la mani&egrave;re dont les enregistrements audio sont r&eacute;alis&eacute;s, sauvegard&eacute;s et restitu&eacute;s aux utilisateurs ;</li>\r\n<li>mettre en &oelig;uvre des mesures de chiffrement des donn&eacute;es stock&eacute;es en base ;</li>\r\n<li>pr&eacute;ciser &agrave; l&rsquo;utilisateur les bonnes pratiques &agrave; suivre lors de la mise au rebut des mat&eacute;riels ;</li>\r\n<li>mettre en place une charte d&rsquo;utilisation des moyens informatiques et un engagement de confidentialit&eacute; pour les employ&eacute;s de Dreamland.</li>\r\n</ul>\r\n<div>Ajouter la mesure &laquo;&nbsp;<strong>gestion des incidents et des violations de donn&eacute;es</strong>&nbsp;&raquo;.</div>	Des donn&eacute;es pourraient encore &ecirc;tre vol&eacute;es par un employ&eacute; de Dreamland, ou consult&eacute;es par l&rsquo;entourage usurpant le compte via le smartphone dans le but de caract&eacute;riser une situation relevant de la vie priv&eacute;e des personnes (par exemple un adult&egrave;re).	\N	{"x": "3", "y": "1"}	\N		2	2019-02-05 16:10:25.34439	2019-02-05 16:10:25.34439	2
63	2	3.1.29	Une dur&eacute;e de conservation pour chaque cat&eacute;gorie de donn&eacute;e doit &ecirc;tre fix&eacute;e en tenant compte de ce qui est strictement n&eacute;cessaire au bon fonctionnement du service. Pour que la proc&eacute;dure d&rsquo;effacement soit efficace, Dreamland doit distinguer entre les donn&eacute;es pr&eacute;sentes dans ses serveurs, celles pr&eacute;sentes dans les serveurs de son sous-traitant et celles trait&eacute;es en local dans le moniteur et le t&eacute;l&eacute;phone de l&rsquo;utilisateur.	Aucune dur&eacute;e de conservation n&rsquo;est fix&eacute;e, les donn&eacute;es peuvent donc &ecirc;tre stock&eacute;es ind&eacute;finiment dans les serveurs, &agrave; d&eacute;faut de demande de suppression de l&rsquo;utilisateur.	\N	{}	\N		2	2019-02-05 16:10:25.38919	2019-02-05 16:10:25.38919	2
67	3	3.1.33			\N	{}	\N		2	2019-02-05 16:10:25.417799	2019-02-05 16:10:25.417799	2
72	3	3.1.39			\N	{}	\N		2	2019-02-05 16:10:25.463275	2019-02-05 16:10:25.463275	2
77	2	3.1.44	Dreamland devrait en r&eacute;diger une &eacute;galement.		\N	{}	\N		2	2019-02-05 16:10:25.517404	2019-02-05 16:10:25.517404	2
14	2	2.2.226	Un contrat de sous-traitance doit &ecirc;tre conclu entre les 2 soci&eacute;t&eacute;s pr&eacute;cisant l&rsquo;ensemble des &eacute;l&eacute;ments pr&eacute;vus &agrave; l&rsquo;art. 28 (dur&eacute;e, p&eacute;rim&egrave;tre, finalit&eacute;, des instructions de traitement document&eacute;es, l&rsquo;autorisation pr&eacute;alable en cas de recours &agrave; un sous-traitant, mise &agrave; disposition de toute documentation apportant la preuve du respect du r&egrave;glement, notification imm&eacute;diate de toute violation de donn&eacute;es, etc.).	BETA agissant en tant que sous-traitant, elle ne peut traiter les donn&eacute;es que selon les instructions et pour le compte de Dreamland, dans un cadre &eacute;tabli par &eacute;crit.	\N	{}	\N		1	2019-02-05 16:10:24.870434	2019-02-05 16:10:24.870434	2
18	2	3.2	Les mesures correctives suivantes doivent &ecirc;tre mises en&nbsp;&oelig;uvre :<br />\r\n<ul>\r\n<li>Pr&eacute;ciser, et le cas &eacute;ch&eacute;ant adapter, la mani&egrave;re dont les enregistrements audio sont r&eacute;alis&eacute;s, sauvegard&eacute;s et restitu&eacute;s aux utilisateurs ;</li>\r\n<li>mettre en &oelig;uvre des mesures de chiffrement des donn&eacute;es stock&eacute;es en base ;</li>\r\n<li>pr&eacute;ciser &agrave; l&rsquo;utilisateur les bonnes pratiques &agrave; suivre lors de la mise au rebut des mat&eacute;riels ;</li>\r\n<li>mettre en place une charte d&rsquo;utilisation des moyens informatiques et un engagement de confidentialit&eacute; pour les employ&eacute;s de Dreamland.</li>\r\n</ul>\r\n<div>Ajouter la mesure &laquo;&nbsp;<strong>gestion des incidents et des violations de donn&eacute;es</strong>&nbsp;&raquo;.</div>	Des donn&eacute;es pourraient encore &ecirc;tre vol&eacute;es par un employ&eacute; de Dreamland, ou consult&eacute;es par l&rsquo;entourage usurpant le compte via le smartphone dans le but de caract&eacute;riser une situation relevant de la vie priv&eacute;e des personnes (par exemple un adult&egrave;re).	\N	{"x": "3", "y": "1"}	\N		1	2019-02-05 16:10:24.931235	2019-02-05 16:10:24.931235	2
23	2	3.1.8	Une dur&eacute;e de conservation pour chaque cat&eacute;gorie de donn&eacute;e doit &ecirc;tre fix&eacute;e en tenant compte de ce qui est strictement n&eacute;cessaire au bon fonctionnement du service. Pour que la proc&eacute;dure d&rsquo;effacement soit efficace, Dreamland doit distinguer entre les donn&eacute;es pr&eacute;sentes dans ses serveurs, celles pr&eacute;sentes dans les serveurs de son sous-traitant et celles trait&eacute;es en local dans le moniteur et le t&eacute;l&eacute;phone de l&rsquo;utilisateur.	Aucune dur&eacute;e de conservation n&rsquo;est fix&eacute;e, les donn&eacute;es peuvent donc &ecirc;tre stock&eacute;es ind&eacute;finiment dans les serveurs, &agrave; d&eacute;faut de demande de suppression de l&rsquo;utilisateur.	\N	{}	\N		1	2019-02-05 16:10:24.973264	2019-02-05 16:10:24.973264	2
29	3	3.1.11			\N	{}	\N		1	2019-02-05 16:10:25.037481	2019-02-05 16:10:25.037481	2
37	3	3.1.17			\N	{}	\N		1	2019-02-05 16:10:25.121183	2019-02-05 16:10:25.121183	2
46	3	2.1.214			\N	{}	\N		2	2019-02-05 16:10:25.228784	2019-02-05 16:10:25.228784	2
50	2	2.2.223	<div>Identifier les donn&eacute;es soumises &agrave; portabilit&eacute; et d&eacute;finir le format &laquo; structur&eacute; couramment utilis&eacute; et lisible par une machine &raquo; permettant d&rsquo;automatiser leur transmission.&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>S&rsquo;assurer de la compl&eacute;tude des informations fournies depuis les diff&eacute;rents supports de donn&eacute;es, lors de la r&eacute;ponse &agrave; une demande d'exercice du droit d'acc&egrave;s.</div>\r\n<div>&nbsp;</div>	<div>Les donn&eacute;es accessibles depuis l&rsquo;application ne sont pas les seules donn&eacute;es d&eacute;tenues par Dreamland.&nbsp;Celles-ci peuvent comprendre les donn&eacute;es de connexion (IP, horodatage des connexions au service et.) collect&eacute;es dans le cadre du fonctionnement du service, un &eacute;ventuel profil restitu&eacute; de mani&egrave;re incompl&egrave;te par l&rsquo;appli, etc.&nbsp;L&rsquo;utilisateur doit &ecirc;tre en mesure de les r&eacute;cup&eacute;rer que ce soit, dans leur int&eacute;gralit&eacute;, par son droit d&rsquo;acc&egrave;s, ou partiellement en demandant une portabilit&eacute; (le service &eacute;tant fourni sur la base d&rsquo;un contrat).</div>\r\n<div>&nbsp;</div>	\N	{}	\N		2	2019-02-05 16:10:25.262755	2019-02-05 16:10:25.262755	2
55	3	3.4		<div>Un utilisateur voit les donn&eacute;es relatives &agrave; son sommeil supprim&eacute;es par maladresse par un employ&eacute; de Dreamland et perd ainsi tout l&rsquo;historique d&rsquo;utilisation et de personnalisation du service. Le risque semble acceptable au regard de la gravit&eacute; (limit&eacute;e) et de la vraisemblance (limit&eacute;e) r&eacute;siduelles, compte tenu des mesures existantes ou pr&eacute;vues.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		2	2019-02-05 16:10:25.324388	2019-02-05 16:10:25.324388	2
61	2	3.1.26	Il conviendrait de pr&eacute;ciser la politique de gestion des mots de passe.	Il incombe toutefois &agrave; Dreamland de garantir la bonne gestion de ces informations.	\N	{}	\N		2	2019-02-05 16:10:25.377506	2019-02-05 16:10:25.377506	2
66	3	3.1.30			\N	{}	\N		2	2019-02-05 16:10:25.415642	2019-02-05 16:10:25.415642	2
69	3	3.1.37			\N	{}	\N		2	2019-02-05 16:10:25.456687	2019-02-05 16:10:25.456687	2
75	2	3.1.43	Il conviendrait de pr&eacute;ciser la mani&egrave;re dont les habilitations sont g&eacute;r&eacute;es.&nbsp;<strong>Une nouvelle mesure &laquo; gestion des personnels &raquo; doit &ecirc;tre ajout&eacute;e au traitement </strong>afin de pr&eacute;voir des sessions de sensibilisation du personnel et de pr&eacute;ciser les mesures prises en cas de d&eacute;part d&rsquo;un salari&eacute; dans la proc&eacute;dure de gestion du personnel.&nbsp;\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>	Manque de pr&eacute;cision.	\N	{}	\N		2	2019-02-05 16:10:25.494887	2019-02-05 16:10:25.494887	2
78	3	3.1.46			\N	{}	\N		2	2019-02-05 16:10:25.521997	2019-02-05 16:10:25.521997	2
15	3	3.3		<div>Un utilisateur peut voir ses donn&eacute;es de sommeil fauss&eacute;es suite &agrave; l&rsquo;h&eacute;bergement d&rsquo;une personne dans sa chambre &agrave; coucher et observer une d&eacute;t&eacute;rioration de la qualit&eacute; du service.&nbsp;Le risque semble acceptable au regard de la gravit&eacute; (limit&eacute;e) et de la vraisemblance (limit&eacute;e) r&eacute;siduelles, compte tenu des mesures existantes ou pr&eacute;vues.<br /><br />En bonne pratique, il serait important d'ajouter la mesure <strong>&laquo; gestion des incidents et des violations de donn&eacute;es &raquo; </strong>aidant &agrave; traiter le risque.</div>\r\n<div>&nbsp;</div>	\N	{}	\N		1	2019-02-05 16:10:24.883701	2019-02-05 16:10:24.883701	2
22	2	3.1.5	Il conviendrait de pr&eacute;ciser les informations journalis&eacute;es, leurs dur&eacute;es de conservation, l&rsquo;architecture de journalisation, la fr&eacute;quence et la proc&eacute;dure d&rsquo;audit des journaux, et si des proc&eacute;dures de d&eacute;tection des acc&egrave;s frauduleux et/ou suspects sont mises en &oelig;uvre.&nbsp;<strong>Une nouvelle mesure &laquo; gestion des incidents et des violations de donn&eacute;es&nbsp;&raquo; doit &ecirc;tre ajout&eacute;e au traitement </strong>pour mettre en place une proc&eacute;dure de gestion des violations des donn&eacute;es personnelles.	Manque de pr&eacute;cision.	\N	{}	\N		1	2019-02-05 16:10:24.953865	2019-02-05 16:10:24.953865	2
26	3	3.1.10			\N	{}	\N		1	2019-02-05 16:10:25.007865	2019-02-05 16:10:25.007865	2
32	3	3.1.13			\N	{}	\N		1	2019-02-05 16:10:25.068887	2019-02-05 16:10:25.068887	2
34	3	3.1.18			\N	{}	\N		1	2019-02-05 16:10:25.114566	2019-02-05 16:10:25.114566	2
43	2	2.1.211	Afin d&rsquo;&eacute;viter un usage incompatible ou un d&eacute;tournement de finalit&eacute;, il conviendrait d&rsquo;expliciter les autres finalit&eacute;s dans les documents port&eacute;s &agrave; la connaissance des clients et de r&eacute;it&eacute;rer le PIA pour ces traitements. L&rsquo;enjeu pour la vie priv&eacute;e des personnes diff&egrave;re en fonction des finalit&eacute;s.	Cette finalit&eacute; doit &ecirc;tre distingu&eacute;e de celle des transmissions de donn&eacute;es aux affili&eacute;s ou de tout autre traitement &agrave; des fins de recherche ou d&rsquo;&eacute;ventuel profilage mis en &oelig;uvre par BETA et ses affili&eacute;s. Ces autres finalit&eacute;s sont rapidement &eacute;voqu&eacute;es, sans pour autant &ecirc;tre explicite.	\N	{}	\N		2	2019-02-05 16:10:25.204537	2019-02-05 16:10:25.204537	2
47	2	2.2.221	<div>Afin d&rsquo;assurer la transparence et la pleine connaissance des cons&eacute;quences de l&rsquo;usage de l&rsquo;application, Dreamland pourrait informer ses utilisateurs sous forme de &laquo; pop up &raquo; lors de l&rsquo;activation de l&rsquo;application, de mani&egrave;re concise, en des termes simples et clairs, et par l&rsquo;utilisation d&rsquo;ic&ocirc;nes, de l&rsquo;identit&eacute; et des coordonn&eacute;es du responsable de traitement, des finalit&eacute;s de chaque traitement et de tout traitement ult&eacute;rieur, de leur base juridique respective, des destinataires des donn&eacute;es (la mention de partenaires et affili&eacute;s est trop large), de la dur&eacute;e de conservation, de la mani&egrave;re d&rsquo;exercer les droits d&rsquo;acc&egrave;s, de rectification, d&rsquo;opposition, d&rsquo;effacement, le droit &agrave; la portabilit&eacute;, le droit &agrave; la limitation du traitement, les coordonn&eacute;es du d&eacute;l&eacute;gu&eacute; &agrave; la protection des donn&eacute;es (s&rsquo;il a &eacute;t&eacute; nomm&eacute;).<br /><br /></div>\r\n<div>Une information sur le transfert de donn&eacute;es hors UE est requise.</div>\r\n<div>&nbsp;</div>	Placer l&rsquo;information dans les CGU risque de la noyer parmi d&rsquo;autres aspects. L&rsquo;information n&rsquo;est pas compl&egrave;te s&rsquo;agissant des aspects d&eacute;crits dans les mesures correctives ci-dessous.	\N	{}	\N		2	2019-02-05 16:10:25.236973	2019-02-05 16:10:25.236973	2
52	2	2.2.225	Les suites &agrave; donner &agrave; l&rsquo;identification d&rsquo;un probl&egrave;me de lic&eacute;it&eacute;, d&rsquo;exactitude des donn&eacute;es, de pertinence, etc. doivent &ecirc;tre document&eacute;es et permettre de r&eacute;pondre &agrave; chaque demande de limitation du traitement.	<div>Attention, dans le cas pr&eacute;sent, la seule finalit&eacute; &eacute;tudi&eacute;e est celle de la fourniture du service bas&eacute; sur l&rsquo;ex&eacute;cution du contrat ; les donn&eacute;es collect&eacute;es sur la base de ce fondement ne font pas l&rsquo;objet du droit d&rsquo;opposition pr&eacute;vu &agrave; l&rsquo;article 21 du RGPD.&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>Le droit &agrave; la limitation du traitement permettra en revanche &agrave; la personne concern&eacute;e de signaler un probl&egrave;me au niveau du traitement de ses donn&eacute;es et &agrave; Dreamland de suspendre leur traitement le temps de v&eacute;rifier le bien-fond&eacute; de la demande (par exemple).</div>	\N	{}	\N		2	2019-02-05 16:10:25.301105	2019-02-05 16:10:25.301105	2
58	2	3.1.24	TLS devrait &ecirc;tre employ&eacute; pour l&rsquo;utilisation du protocole https.	Il est recommand&eacute; d&rsquo;utiliser la version de TLS la plus &agrave; jour possible et non SSL.	\N	{}	\N		2	2019-02-05 16:10:25.348926	2019-02-05 16:10:25.348926	2
62	2	3.1.27	Chaque modification pourrait &ecirc;tre horodat&eacute;e et la date de derni&egrave;re modification conserv&eacute;e dans l&rsquo;application pour &ecirc;tre v&eacute;rifi&eacute;e &agrave; la reconnexion. En cas de diff&eacute;rence l&rsquo;utilisateur recevrait une alerte.	Les donn&eacute;es pourraient &ecirc;tre alt&eacute;r&eacute;es apr&egrave;s leur transfert.	\N	{}	\N		2	2019-02-05 16:10:25.387251	2019-02-05 16:10:25.387251	2
68	2	3.1.34	Pr&eacute;ciser la politique de sauvegarde de BETA.	Manque de pr&eacute;cision.	\N	{}	\N		2	2019-02-05 16:10:25.426388	2019-02-05 16:10:25.426388	2
73	3	3.1.38			\N	{}	\N		2	2019-02-05 16:10:25.469297	2019-02-05 16:10:25.469297	2
79	2	3.1.41	<strong>Une nouvelle mesure compl&eacute;mentaire &laquo; gestion des risques&raquo; doit &ecirc;tre ajout&eacute;e au traitement&nbsp;</strong>pour mettre en place une proc&eacute;dure de gestion de projet int&eacute;grant l&rsquo;&eacute;tude syst&eacute;matique des risques que font peser le traitement sur la vie priv&eacute;e des personnes concern&eacute;es.		\N	{}	\N		2	2019-02-05 16:10:25.534562	2019-02-05 16:10:25.534562	2
17	2	3.1.1	Il conviendrait de pr&eacute;ciser la mani&egrave;re dont les donn&eacute;es sont cloisonn&eacute;es.	Il n&rsquo;est pas indiqu&eacute; si les donn&eacute;es des utilisateurs sont isol&eacute;es entre elles dans les serveurs utilis&eacute;s par Captoo. Par ailleurs, il n&rsquo;est pas pr&eacute;cis&eacute; si les instances sur lesquels les serveurs s&rsquo;ex&eacute;cutent sont d&eacute;di&eacute;s (ce qui est vraisemblable) ou si ces instances sont susceptibles d&rsquo;&ecirc;tre r&eacute;utilis&eacute;es par des tiers.	\N	{}	\N		1	2019-02-05 16:10:24.908267	2019-02-05 16:10:24.908267	2
21	2	3.1.4	Chaque modification pourrait &ecirc;tre horodat&eacute;e et la date de derni&egrave;re modification conserv&eacute;e dans l&rsquo;application pour &ecirc;tre v&eacute;rifi&eacute;e &agrave; la reconnexion. En cas de diff&eacute;rence l&rsquo;utilisateur recevrait une alerte.	Les donn&eacute;es pourraient &ecirc;tre alt&eacute;r&eacute;es apr&egrave;s leur transfert.	\N	{}	\N		1	2019-02-05 16:10:24.948669	2019-02-05 16:10:24.948669	2
27	3	3.1.6			\N	{}	\N		1	2019-02-05 16:10:24.996404	2019-02-05 16:10:24.996404	2
31	2	3.1.14	Rappeler les bonnes pratiques concernant les r&eacute;seaux domestiques dans la documentation produit.	Le r&eacute;seau priv&eacute; du client est &agrave; sa charge, toutefois un rappel des bonnes pratiques de s&eacute;curit&eacute; pourrait &ecirc;tre fait.	\N	{}	\N		1	2019-02-05 16:10:25.048893	2019-02-05 16:10:25.048893	2
36	2	3.1.19	Il conviendrait de pr&eacute;ciser la mani&egrave;re dont les habilitations sont g&eacute;r&eacute;es.&nbsp;<strong>Une nouvelle mesure &laquo; gestion des personnels &raquo; doit &ecirc;tre ajout&eacute;e au traitement </strong>afin de pr&eacute;voir des sessions de sensibilisation du personnel et de pr&eacute;ciser les mesures prises en cas de d&eacute;part d&rsquo;un salari&eacute; dans la proc&eacute;dure de gestion du personnel.&nbsp;\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>	Manque de pr&eacute;cision.	\N	{}	\N		1	2019-02-05 16:10:25.119878	2019-02-05 16:10:25.119878	2
40	2	3.1.23	Il conviendrait de pr&eacute;ciser les conditions de r&eacute;alisation des audits internes.	Manque de pr&eacute;cision.	\N	{}	\N		1	2019-02-05 16:10:25.173944	2019-02-05 16:10:25.173944	2
44	2	2.1.212	Distinguer le service lui-m&ecirc;me des autres finalit&eacute;s, au besoin faire un PIA pour chacune.	Ce fondement n&rsquo;est valable que pour le traitement de donn&eacute;es strictement n&eacute;cessaire &agrave; la fourniture du service. Il ne sera pas valable pour la transmission de donn&eacute;es &agrave; des tiers ou toute autre finalit&eacute; de traitement accessoire, non n&eacute;cessaire pour fournir le service.	\N	{}	\N		2	2019-02-05 16:10:25.206086	2019-02-05 16:10:25.206086	2
49	2	2.2.222	Afin d&rsquo;&eacute;viter un usage incompatible ou un d&eacute;tournement de finalit&eacute;, il conviendrait d&rsquo;expliciter les autres finalit&eacute;s dans les documents port&eacute;s &agrave; la connaissance des clients et de r&eacute;it&eacute;rer le PIA pour ces traitements. L&rsquo;enjeu pour la vie priv&eacute;e des personnes diff&egrave;re en fonction des finalit&eacute;s.	Le traitement est bas&eacute; sur un contrat, mais il est n&eacute;cessaire d&rsquo;expliciter les sous finalit&eacute;s.&nbsp;	\N	{}	\N		2	2019-02-05 16:10:25.252763	2019-02-05 16:10:25.252763	2
54	2	2.2.227	<div>Dreamland doit s&rsquo;assurer d&rsquo;encadrer le transfert par des &laquo; garanties appropri&eacute;es &raquo; (cf. liste d&rsquo;instrument art. 46). Il sera &eacute;galement n&eacute;cessaire de signer un contrat avec ce sous-traitant aux US. &nbsp;</div>	Aucun encadrement du transfert des donn&eacute;es collect&eacute;es depuis les moniteurs vers les serveurs de l&rsquo;h&eacute;bergeur aux &Eacute;tats-Unis ne semble &ecirc;tre pr&eacute;vu.	\N	{}	\N		2	2019-02-05 16:10:25.306473	2019-02-05 16:10:25.306473	2
59	2	3.1.25	Il conviendrait de pr&eacute;ciser la mani&egrave;re dont les donn&eacute;es sont cloisonn&eacute;es.	Il n&rsquo;est pas indiqu&eacute; si les donn&eacute;es des utilisateurs sont isol&eacute;es entre elles dans les serveurs utilis&eacute;s par Captoo. Par ailleurs, il n&rsquo;est pas pr&eacute;cis&eacute; si les instances sur lesquels les serveurs s&rsquo;ex&eacute;cutent sont d&eacute;di&eacute;s (ce qui est vraisemblable) ou si ces instances sont susceptibles d&rsquo;&ecirc;tre r&eacute;utilis&eacute;es par des tiers.	\N	{}	\N		2	2019-02-05 16:10:25.355309	2019-02-05 16:10:25.355309	2
64	3	3.1.32			\N	{}	\N		2	2019-02-05 16:10:25.409087	2019-02-05 16:10:25.409087	2
70	3	3.1.36			\N	{}	\N		2	2019-02-05 16:10:25.454137	2019-02-05 16:10:25.454137	2
76	3	3.1.40			\N	{}	\N		2	2019-02-05 16:10:25.50716	2019-02-05 16:10:25.50716	2
\.


--
-- Data for Name: measures; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.measures (id, title, content, placeholder, pia_id, created_at, updated_at) FROM stdin;
1	Cloisonnement des données	La solution cloud de BETA choisie par Dreamland offre un cloisonnement vis-&agrave;-vis des donn&eacute;es des autres clients du service	knowledge_base.slugs.PIA_TEC_CLO.placeholder	1	2019-02-05 16:10:24.020681	2019-02-05 16:10:24.020681
2	Contrôle des accès logiques	Par identifiant et mot de passe. Il est de la responsabilit&eacute; de l&rsquo;utilisateur de maintenir la confidentialit&eacute; de ses informations de connexion.&nbsp;	knowledge_base.slugs.PIA_TEC_CTLA.placeholder	1	2019-02-05 16:10:24.028542	2019-02-05 16:10:24.028542
3	Chiffrement	Toutes les connexions, entre la base Captoo, la pastille Captoo, le serveur cloud de BETA et le smartphone de l&rsquo;utilisateur, se font en SSL via le protocole https.	knowledge_base.slugs.PIA_TEC_CHIF.placeholder	1	2019-02-05 16:10:24.035385	2019-02-05 16:10:24.035385
4	Contrôle d'intégrité	Toutes les connexions, entre la base Captoo, la pastille Captoo, le serveur cloud de BETA et le smartphone de l&rsquo;utilisateur, se font en SSL via le protocole https.	measures.default_placeholder	1	2019-02-05 16:10:24.036451	2019-02-05 16:10:24.036451
5	Traçabilité	Tous les acc&egrave;s aux donn&eacute;es &agrave; caract&egrave;re personnel font l&rsquo;objet d&rsquo;une journalisation et les journaux sont audit&eacute;s	knowledge_base.slugs.PIA_SEC_LOG.placeholder	1	2019-02-05 16:10:24.040411	2019-02-05 16:10:24.040411
6	Gestion des postes de travail	La s&eacute;curit&eacute; des postes de travail est garantie par la politique de s&eacute;curit&eacute; de Dreamland.	measures.default_placeholder	1	2019-02-05 16:10:24.069957	2019-02-05 16:10:24.069957
7	Lutte contre les logiciels malveillants	La s&eacute;curit&eacute; des serveurs est couverte par le contrat avec BETA.	measures.default_placeholder	1	2019-02-05 16:10:24.071407	2019-02-05 16:10:24.071407
8	Archivage	Les donn&eacute;es sont conserv&eacute;es tant que la personne concern&eacute;e n&rsquo;en demande pas la suppression. Sur demande, les donn&eacute;es sont rendues illisibles et les zones de stockage qui ont &eacute;t&eacute; utilis&eacute;es sont effac&eacute;es et &eacute;cras&eacute;es. Les donn&eacute;es audio enregistr&eacute;es (des tranches de signal de 5s) devraient &agrave; terme &ecirc;tre conserv&eacute;es dans le buffer de la base Captoo, pour au plus 7 jours, afin que l&rsquo;utilisateur puisse les rejouer.	knowledge_base.slugs.PIA_TEC_ARCH.placeholder	1	2019-02-05 16:10:24.061652	2019-02-05 16:10:24.061652
9	Sécurité de l'exploitation	La maintenance des serveurs est couverte par le contrat avec BETA. La maintenance des logiciels et des terminaux est r&eacute;alis&eacute;e par Dreamland.	measures.default_placeholder	1	2019-02-05 16:10:24.073212	2019-02-05 16:10:24.073212
10	Sécurité des sites web	Les mesures de s&eacute;curit&eacute; mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	1	2019-02-05 16:10:24.074375	2019-02-05 16:10:24.074375
11	Maintenance	La maintenance des serveurs est couverte par le contrat avec BETA. La maintenance des logiciels et des terminaux est r&eacute;alis&eacute;e par Dreamland. La base Captoo et la pastille Captoo font l&rsquo;objet d&rsquo;une garantie d&rsquo;un an.	measures.default_placeholder	1	2019-02-05 16:10:24.099987	2019-02-05 16:10:24.099987
12	Surveillance	Les mesures de s&eacute;curit&eacute; mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	1	2019-02-05 16:10:24.101371	2019-02-05 16:10:24.101371
13	Contrôle d’accès physique	Les mesures de contr&ocirc;le d&rsquo;acc&egrave;s mises en &oelig;uvre par BETA pour l&rsquo;acc&egrave;s &agrave; leurs infrastructures sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	1	2019-02-05 16:10:24.113138	2019-02-05 16:10:24.113138
14	Sécurité des canaux informatiques (réseaux)	<div>Les r&eacute;seaux suivants sont mis en &oelig;uvre :&nbsp;</div>\r\n<ul>\r\n<li>r&eacute;seau priv&eacute; du client ;</li>\r\n<li>Internet ;</li>\r\n<li>r&eacute;seau priv&eacute; BETA.</li>\r\n</ul>\r\n<div>&nbsp;</div>	measures.default_placeholder	1	2019-02-05 16:10:24.121504	2019-02-05 16:10:24.121504
15	Sécurité des matériels	Les mesures de s&eacute;curit&eacute; physique mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.&nbsp;	measures.default_placeholder	1	2019-02-05 16:10:24.128235	2019-02-05 16:10:24.128235
16	Sauvegardes	Effectu&eacute;e dans le serveur de BETA.	measures.default_placeholder	1	2019-02-05 16:10:24.125303	2019-02-05 16:10:24.125303
17	Éloignement des sources de risques	La politique de s&eacute;curit&eacute; de BETA mentionne l&rsquo;attention port&eacute;e aux risques naturels dans le choix de l&rsquo;implantation de leurs datacenters.	measures.default_placeholder	1	2019-02-05 16:10:24.15088	2019-02-05 16:10:24.15088
18	Protection contre les sources de risques non humaines	Les mesures de s&eacute;curit&eacute; physique mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute; (d&eacute;tection d&rsquo;incendies, alimentation &eacute;lectrique, surveillance de la temp&eacute;rature, maintenance pr&eacute;ventive, d&eacute;stockage mat&eacute;riel, etc.).	measures.default_placeholder	1	2019-02-05 16:10:24.15785	2019-02-05 16:10:24.15785
19	Organisation	L&rsquo;acc&egrave;s des employ&eacute;s de Dreamland aux donn&eacute;es &agrave; caract&egrave;re personnel n&eacute;cessite une autorisation.	measures.default_placeholder	1	2019-02-05 16:10:24.161248	2019-02-05 16:10:24.161248
20	Gestion des projets	Les tests sont effectu&eacute;s sur des donn&eacute;es anonymes.	measures.default_placeholder	1	2019-02-05 16:10:24.173032	2019-02-05 16:10:24.173032
21	Politique (gestion des règles)	BETA dispose d&rsquo;une charte informatique.	measures.default_placeholder	1	2019-02-05 16:10:24.180881	2019-02-05 16:10:24.180881
22	Relations avec les tiers	Les modalit&eacute;s d&rsquo;acc&egrave;s aux donn&eacute;es sont pr&eacute;cis&eacute;es dans le contrat de sous-traitance avec BETA.	measures.default_placeholder	1	2019-02-05 16:10:24.185874	2019-02-05 16:10:24.185874
23	Supervision	Des audits sont r&eacute;alis&eacute;s.	measures.default_placeholder	1	2019-02-05 16:10:24.206112	2019-02-05 16:10:24.206112
24	Chiffrement	Toutes les connexions, entre la base Captoo, la pastille Captoo, le serveur cloud de BETA et le smartphone de l&rsquo;utilisateur, se font en SSL via le protocole https.	knowledge_base.slugs.PIA_TEC_CHIF.placeholder	2	2019-02-05 16:10:24.560826	2019-02-05 16:10:24.560826
25	Cloisonnement des données	La solution cloud de BETA choisie par Dreamland offre un cloisonnement vis-&agrave;-vis des donn&eacute;es des autres clients du service	knowledge_base.slugs.PIA_TEC_CLO.placeholder	2	2019-02-05 16:10:24.564877	2019-02-05 16:10:24.564877
26	Contrôle des accès logiques	Par identifiant et mot de passe. Il est de la responsabilit&eacute; de l&rsquo;utilisateur de maintenir la confidentialit&eacute; de ses informations de connexion.&nbsp;	knowledge_base.slugs.PIA_TEC_CTLA.placeholder	2	2019-02-05 16:10:24.569796	2019-02-05 16:10:24.569796
27	Contrôle d'intégrité	Toutes les connexions, entre la base Captoo, la pastille Captoo, le serveur cloud de BETA et le smartphone de l&rsquo;utilisateur, se font en SSL via le protocole https.	measures.default_placeholder	2	2019-02-05 16:10:24.575429	2019-02-05 16:10:24.575429
28	Traçabilité	Tous les acc&egrave;s aux donn&eacute;es &agrave; caract&egrave;re personnel font l&rsquo;objet d&rsquo;une journalisation et les journaux sont audit&eacute;s	knowledge_base.slugs.PIA_SEC_LOG.placeholder	2	2019-02-05 16:10:24.586291	2019-02-05 16:10:24.586291
29	Archivage	Les donn&eacute;es sont conserv&eacute;es tant que la personne concern&eacute;e n&rsquo;en demande pas la suppression. Sur demande, les donn&eacute;es sont rendues illisibles et les zones de stockage qui ont &eacute;t&eacute; utilis&eacute;es sont effac&eacute;es et &eacute;cras&eacute;es. Les donn&eacute;es audio enregistr&eacute;es (des tranches de signal de 5s) devraient &agrave; terme &ecirc;tre conserv&eacute;es dans le buffer de la base Captoo, pour au plus 7 jours, afin que l&rsquo;utilisateur puisse les rejouer.	knowledge_base.slugs.PIA_TEC_ARCH.placeholder	2	2019-02-05 16:10:24.587477	2019-02-05 16:10:24.587477
33	Sécurité des sites web	Les mesures de s&eacute;curit&eacute; mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	2	2019-02-05 16:10:24.623638	2019-02-05 16:10:24.623638
39	Contrôle d’accès physique	Les mesures de contr&ocirc;le d&rsquo;acc&egrave;s mises en &oelig;uvre par BETA pour l&rsquo;acc&egrave;s &agrave; leurs infrastructures sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	2	2019-02-05 16:10:24.657287	2019-02-05 16:10:24.657287
44	Politique (gestion des règles)	BETA dispose d&rsquo;une charte informatique.	measures.default_placeholder	2	2019-02-05 16:10:24.677706	2019-02-05 16:10:24.677706
30	Gestion des postes de travail	La s&eacute;curit&eacute; des postes de travail est garantie par la politique de s&eacute;curit&eacute; de Dreamland.	measures.default_placeholder	2	2019-02-05 16:10:24.602378	2019-02-05 16:10:24.602378
37	Surveillance	Les mesures de s&eacute;curit&eacute; mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.	measures.default_placeholder	2	2019-02-05 16:10:24.639593	2019-02-05 16:10:24.639593
42	Éloignement des sources de risques	La politique de s&eacute;curit&eacute; de BETA mentionne l&rsquo;attention port&eacute;e aux risques naturels dans le choix de l&rsquo;implantation de leurs datacenters.	measures.default_placeholder	2	2019-02-05 16:10:24.673598	2019-02-05 16:10:24.673598
31	Lutte contre les logiciels malveillants	La s&eacute;curit&eacute; des serveurs est couverte par le contrat avec BETA.	measures.default_placeholder	2	2019-02-05 16:10:24.597685	2019-02-05 16:10:24.597685
36	Maintenance	La maintenance des serveurs est couverte par le contrat avec BETA. La maintenance des logiciels et des terminaux est r&eacute;alis&eacute;e par Dreamland. La base Captoo et la pastille Captoo font l&rsquo;objet d&rsquo;une garantie d&rsquo;un an.	measures.default_placeholder	2	2019-02-05 16:10:24.633054	2019-02-05 16:10:24.633054
43	Organisation	L&rsquo;acc&egrave;s des employ&eacute;s de Dreamland aux donn&eacute;es &agrave; caract&egrave;re personnel n&eacute;cessite une autorisation.	measures.default_placeholder	2	2019-02-05 16:10:24.676461	2019-02-05 16:10:24.676461
46	Relations avec les tiers	Les modalit&eacute;s d&rsquo;acc&egrave;s aux donn&eacute;es sont pr&eacute;cis&eacute;es dans le contrat de sous-traitance avec BETA.	measures.default_placeholder	2	2019-02-05 16:10:24.70741	2019-02-05 16:10:24.70741
32	Sécurité de l'exploitation	La maintenance des serveurs est couverte par le contrat avec BETA. La maintenance des logiciels et des terminaux est r&eacute;alis&eacute;e par Dreamland.	measures.default_placeholder	2	2019-02-05 16:10:24.60581	2019-02-05 16:10:24.60581
35	Sécurité des canaux informatiques (réseaux)	<div>Les r&eacute;seaux suivants sont mis en &oelig;uvre :&nbsp;</div>\r\n<ul>\r\n<li>r&eacute;seau priv&eacute; du client ;</li>\r\n<li>Internet ;</li>\r\n<li>r&eacute;seau priv&eacute; BETA.</li>\r\n</ul>\r\n<div>&nbsp;</div>	measures.default_placeholder	2	2019-02-05 16:10:24.628017	2019-02-05 16:10:24.628017
40	Protection contre les sources de risques non humaines	Les mesures de s&eacute;curit&eacute; physique mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute; (d&eacute;tection d&rsquo;incendies, alimentation &eacute;lectrique, surveillance de la temp&eacute;rature, maintenance pr&eacute;ventive, d&eacute;stockage mat&eacute;riel, etc.).	measures.default_placeholder	2	2019-02-05 16:10:24.663374	2019-02-05 16:10:24.663374
45	Supervision	Des audits sont r&eacute;alis&eacute;s.	measures.default_placeholder	2	2019-02-05 16:10:24.702436	2019-02-05 16:10:24.702436
34	Sauvegardes	Effectu&eacute;e dans le serveur de BETA.	measures.default_placeholder	2	2019-02-05 16:10:24.621098	2019-02-05 16:10:24.621098
38	Sécurité des matériels	Les mesures de s&eacute;curit&eacute; physique mises en &oelig;uvre lors de l&rsquo;utilisation d&rsquo;un serveur cloud de BETA sont d&eacute;crites dans sa politique de s&eacute;curit&eacute;.&nbsp;	measures.default_placeholder	2	2019-02-05 16:10:24.653615	2019-02-05 16:10:24.653615
41	Gestion des projets	Les tests sont effectu&eacute;s sur des donn&eacute;es anonymes.	measures.default_placeholder	2	2019-02-05 16:10:24.67077	2019-02-05 16:10:24.67077
47	Chiffrement		knowledge_base.slugs.PIA_TEC_CHIF.placeholder	7	2019-03-21 11:03:54.418012	2019-03-21 11:03:54.418012
48	Anonymisation		knowledge_base.slugs.PIA_TEC_ANO.placeholder	7	2019-03-21 11:03:56.745084	2019-03-21 11:03:56.745084
49	Cloisonnement		knowledge_base.slugs.PIA_TEC_CLO.placeholder	7	2019-03-21 11:03:58.945082	2019-03-21 11:03:58.945082
50	Contrôle des accès logiques		knowledge_base.slugs.PIA_TEC_CTLA.placeholder	7	2019-03-21 11:04:00.288659	2019-03-21 11:04:00.288659
51	Journalisation		knowledge_base.slugs.PIA_TEC_LOG.placeholder	7	2019-03-21 11:04:03.417088	2019-03-21 11:04:03.417088
52	Archivage		knowledge_base.slugs.PIA_TEC_ARCH.placeholder	7	2019-03-21 11:04:04.77647	2019-03-21 11:04:04.77647
53	Sécurisation des documents papier		knowledge_base.slugs.PIA_TEC_PAP.placeholder	7	2019-03-21 11:04:05.575753	2019-03-21 11:04:05.575753
54	Minimisation des données		knowledge_base.slugs.PIA_TEC_MINI.placeholder	7	2019-03-21 11:04:14.84427	2019-03-21 11:04:14.84427
55	Protection des sites web		knowledge_base.slugs.PIA_SEC_WEB.placeholder	7	2019-03-21 11:04:19.505553	2019-03-21 11:04:19.505553
56	Sauvegarde des données		knowledge_base.slugs.PIA_SEC_BKP.placeholder	7	2019-03-21 11:04:20.440702	2019-03-21 11:04:20.440702
57	Sécurisation des canaux informatiques		knowledge_base.slugs.PIA_SEC_NET.placeholder	7	2019-03-21 11:04:22.353842	2019-03-21 11:04:22.353842
58	Sécurisation des matériels		knowledge_base.slugs.PIA_SEC_MAT.placeholder	7	2019-03-21 11:04:25.344639	2019-03-21 11:04:25.344639
59	Superviser la protection de la vie privée		knowledge_base.slugs.PIA_ORG_AUD.placeholder	7	2019-03-21 11:04:34.833471	2019-03-21 11:04:34.833471
60	Gestion des tiers accédant aux données.		knowledge_base.slugs.PIA_ORG_EXT.placeholder	7	2019-03-21 11:04:42.527686	2019-03-21 11:04:42.527686
61	Gérer la politique de protection de la vie privée		knowledge_base.slugs.PIA_ORG_POL.placeholder	7	2019-03-21 11:04:51.218879	2019-03-21 11:04:51.218879
62	Traçabilité		knowledge_base.slugs.PIA_SEC_LOG.placeholder	7	2019-03-21 11:04:59.168551	2019-03-21 11:04:59.168551
63	Sécurité physique		knowledge_base.slugs.PIA_SEC_PHY.placeholder	7	2019-03-21 11:05:00.255759	2019-03-21 11:05:00.255759
64	Contrat de sous-traitance		knowledge_base.slugs.PIA_SEC_CTR.placeholder	7	2019-03-21 11:05:02.816594	2019-03-21 11:05:02.816594
65	Maintenance		knowledge_base.slugs.PIA_SEC_MAIN.placeholder	7	2019-03-21 11:05:03.576634	2019-03-21 11:05:03.576634
66	Lutte contre les logiciels malveillants		knowledge_base.slugs.PIA_SEC_MAL.placeholder	7	2019-03-21 11:05:08.996179	2019-03-21 11:05:08.996179
67	Sécurisation de l'exploitation		knowledge_base.slugs.PIA_SEC_EXP.placeholder	7	2019-03-21 11:05:09.592996	2019-03-21 11:05:09.592996
\.


--
-- Data for Name: pias; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.pias (id, status, name, author_name, evaluator_name, validator_name, dpo_status, dpo_opinion, concerned_people_opinion, concerned_people_status, rejection_reason, applied_adjustments, created_at, updated_at, dpos_names, people_names, is_example, concerned_people_searched_opinion, concerned_people_searched_content, structure_id, structure_name, structure_sector_name, structure_data) FROM stdin;
1	3	(EXAMPLE) Captoo	Elisabeth York	Eric Vincent	Mary Smith	1	L’analyse menée montre qu’avec la mise en place des plans d’actions préconisés, la protection de la vie privée des personnes est garantie de manière acceptable.	Le panel de clients interrogé lors de l'étude de marché est majoritairement intéressé par le produit et accepte ses modalités d'utilisation.	1			2019-02-05 16:10:23.596193	2019-02-05 16:10:23.596193	Michael Thomas (DPO)	Les clients potentiels	1	t	undefined	\N	undefined	undefined	""
2	3	(EXAMPLE) Captoo	Elisabeth York	Eric Vincent	Mary Smith	1	L’analyse menée montre qu’avec la mise en place des plans d’actions préconisés, la protection de la vie privée des personnes est garantie de manière acceptable.	Le panel de clients interrogé lors de l'étude de marché est majoritairement intéressé par le produit et accepte ses modalités d'utilisation.	1			2019-02-05 16:10:23.592565	2019-02-05 16:10:23.592565	Michael Thomas (DPO)	Les clients potentiels	1	t	undefined	\N	undefined	undefined	""
5	0	test pia 1	ilena	ILENA PINTO	Damien	0	undefined	undefined	0			2019-03-05 14:08:14.636427	2019-03-05 14:08:14.636427	undefined	undefined	0	t	undefined	\N	undefined	undefined	""
7	0	STI	ilena PINTO	Clotilde Perraudin	Damien Bonte	0	undefined	undefined	0			2019-03-21 10:06:58.800717	2019-03-21 10:06:58.800717	undefined	undefined	0	t	undefined	\N	undefined	undefined	""
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.schema_migrations (version) FROM stdin;
20170731082629
20170731083917
20170731085509
20170731085931
20170731091122
20170731152348
20170801073152
20171005214002
20180223064141
20180403152239
20180525222420
20181008150745
20181008150920
\.


--
-- Data for Name: structures; Type: TABLE DATA; Schema: public; Owner: useradmin
--

COPY public.structures (id, name, sector_name, data, created_at, updated_at) FROM stdin;
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.answers_id_seq', 105, true);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.comments_id_seq', 4, true);


--
-- Name: evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.evaluations_id_seq', 80, true);


--
-- Name: measures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.measures_id_seq', 67, true);


--
-- Name: pias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.pias_id_seq', 7, true);


--
-- Name: structures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: useradmin
--

SELECT pg_catalog.setval('public.structures_id_seq', 1, false);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: evaluations evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);


--
-- Name: measures measures_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.measures
    ADD CONSTRAINT measures_pkey PRIMARY KEY (id);


--
-- Name: pias pias_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.pias
    ADD CONSTRAINT pias_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: structures structures_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.structures
    ADD CONSTRAINT structures_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_pia_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_answers_on_pia_id ON public.answers USING btree (pia_id);


--
-- Name: index_attachments_on_pia_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_attachments_on_pia_id ON public.attachments USING btree (pia_id);


--
-- Name: index_comments_on_pia_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_comments_on_pia_id ON public.comments USING btree (pia_id);


--
-- Name: index_evaluations_on_pia_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_evaluations_on_pia_id ON public.evaluations USING btree (pia_id);


--
-- Name: index_measures_on_pia_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_measures_on_pia_id ON public.measures USING btree (pia_id);


--
-- Name: index_pias_on_structure_id; Type: INDEX; Schema: public; Owner: useradmin
--

CREATE INDEX index_pias_on_structure_id ON public.pias USING btree (structure_id);


--
-- Name: measures fk_rails_12d667ca81; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.measures
    ADD CONSTRAINT fk_rails_12d667ca81 FOREIGN KEY (pia_id) REFERENCES public.pias(id);


--
-- Name: evaluations fk_rails_206e2f3eb2; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT fk_rails_206e2f3eb2 FOREIGN KEY (pia_id) REFERENCES public.pias(id);


--
-- Name: pias fk_rails_33167b236d; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.pias
    ADD CONSTRAINT fk_rails_33167b236d FOREIGN KEY (structure_id) REFERENCES public.structures(id);


--
-- Name: answers fk_rails_8c494b980d; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_8c494b980d FOREIGN KEY (pia_id) REFERENCES public.pias(id);


--
-- Name: attachments fk_rails_ed286546a8; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT fk_rails_ed286546a8 FOREIGN KEY (pia_id) REFERENCES public.pias(id);


--
-- Name: comments fk_rails_fb13959eb9; Type: FK CONSTRAINT; Schema: public; Owner: useradmin
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_fb13959eb9 FOREIGN KEY (pia_id) REFERENCES public.pias(id);


--
-- PostgreSQL database dump complete
--

