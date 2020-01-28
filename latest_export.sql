--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: api_article; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.api_article (
    id integer NOT NULL,
    name text NOT NULL,
    detail text NOT NULL,
    type character varying(10) NOT NULL,
    brand character varying(50) NOT NULL,
    size character varying(50) NOT NULL,
    price double precision,
    color character varying(50) NOT NULL,
    url character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.api_article OWNER TO admin;

--
-- Name: api_article_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.api_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_article_id_seq OWNER TO admin;

--
-- Name: api_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.api_article_id_seq OWNED BY public.api_article.id;


--
-- Name: api_outfitpost; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.api_outfitpost (
    id integer NOT NULL,
    image_url character varying(200) NOT NULL,
    username character varying(50) NOT NULL,
    title text NOT NULL,
    descr text NOT NULL,
    date_posted timestamp with time zone NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL
);


ALTER TABLE public.api_outfitpost OWNER TO admin;

--
-- Name: api_outfitpost_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.api_outfitpost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_outfitpost_id_seq OWNER TO admin;

--
-- Name: api_outfitpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.api_outfitpost_id_seq OWNED BY public.api_outfitpost.id;


--
-- Name: api_postarticles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.api_postarticles (
    id integer NOT NULL,
    xpos integer NOT NULL,
    ypos integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_modified timestamp with time zone NOT NULL,
    article_id integer NOT NULL,
    post_id integer NOT NULL,
    CONSTRAINT api_postarticles_height_check CHECK ((height >= 0)),
    CONSTRAINT api_postarticles_width_check CHECK ((width >= 0)),
    CONSTRAINT api_postarticles_xpos_check CHECK ((xpos >= 0)),
    CONSTRAINT api_postarticles_ypos_check CHECK ((ypos >= 0))
);


ALTER TABLE public.api_postarticles OWNER TO admin;

--
-- Name: api_postarticles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.api_postarticles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_postarticles_id_seq OWNER TO admin;

--
-- Name: api_postarticles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.api_postarticles_id_seq OWNED BY public.api_postarticles.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: api_article id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_article ALTER COLUMN id SET DEFAULT nextval('public.api_article_id_seq'::regclass);


--
-- Name: api_outfitpost id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_outfitpost ALTER COLUMN id SET DEFAULT nextval('public.api_outfitpost_id_seq'::regclass);


--
-- Name: api_postarticles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_postarticles ALTER COLUMN id SET DEFAULT nextval('public.api_postarticles_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_article; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.api_article (id, name, detail, type, brand, size, price, color, url, date_created, date_modified) FROM stdin;
\.


--
-- Data for Name: api_outfitpost; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.api_outfitpost (id, image_url, username, title, descr, date_posted, date_created, date_modified) FROM stdin;
1	https://i.imgur.com/znIHfVL.jpg	Ptubs	nautical	[nautical](https://imgur.com/znIHfVL)\n\n* Coat: Kapital\n* Shirt: Lady White\n* Sweater: Thrift\n* Pants: Uniqlo\n* Shoes: Dr. Martins	2019-11-22 09:13:39-08	2019-11-22 21:59:55.921075-08	2019-11-22 21:59:55.921092-08
2	https://i.imgur.com/f77jmwz.jpg	Chilljin	been a while	#yo dudes\n\n[been a while](https://i.imgur.com/f77jmwz.jpg)\n\nCoat - Cos\n\nJacket - HM\n\nTurtleneck - Pull & Bear\n\nPants - IDK\n\nShoes - MIE Dr Martens (I finally got a new pair after my mono's i got when I was 18 and first started posting here died) \n\n-\n\ncatch me on the [gram](https://www.instagram.com/charliebirdo/), i'm occasionally fashionable there	2019-11-22 09:06:43-08	2019-11-22 21:59:56.134005-08	2019-11-22 21:59:56.134022-08
3	https://i.imgur.com/By3KiKq.jpg	Vegatheist	My comfy sherpa turtleneck vibes	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 21:59:56.339588-08	2019-11-22 21:59:56.339605-08
4	https://i.imgur.com/rarL10n.jpg	Vegatheist	Detail	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 21:59:56.541938-08	2019-11-22 21:59:56.541956-08
5	https://i.imgur.com/adPP8Ga.jpg	Vegatheist	Twinning with my dad	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 21:59:56.786484-08	2019-11-22 21:59:56.786502-08
6	https://i.imgur.com/MObpei4.jpg	alexanderburgh	join me on a tour	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 21:59:57.031946-08	2019-11-22 21:59:57.031964-08
7	https://i.imgur.com/X7gS3L8.jpg	alexanderburgh	of the academic building	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 21:59:57.233743-08	2019-11-22 21:59:57.233758-08
8	https://i.imgur.com/4ZvfcPP.jpg	alexanderburgh	in which I spend all my waking hours	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 21:59:57.438986-08	2019-11-22 21:59:57.439004-08
9	https://i.imgur.com/M0JkHO7.jpg	shmoomentality	me and the dog practicing our holiday card pose	[me and the dog practicing our holiday card pose](https://i.imgur.com/M0JkHO7.jpg)\n\nSunsea felted wool sportcoat/Stephan Schneider colorblocked shirt/Iron Heart overdyed jeans/Buttero boots/Australian Shepherd	2019-11-22 09:06:42-08	2019-11-22 21:59:57.669414-08	2019-11-22 21:59:57.66943-08
10	https://i.imgur.com/YJ4PEq5.jpg	JerichoKilo	Scarf weather again	[Scarf weather again](https://imgur.com/a/Ym9JXhk)\n\nHughes & Hatcher vintage cashmere coat/The Posh'Mina scarf, SNS Herning sweater, Hammer Made shirt, Banana Republic wool trousers/vintage Hanover shell longwings\n\nEdit- guess I'll add the link.	2019-11-22 09:07:25-08	2019-11-22 21:59:57.823726-08	2019-11-22 21:59:57.823743-08
11	https://i.imgur.com/84un0q0.jpg	bond__jamesbond	Good day for stripes.	[Good day for stripes.](https://i.imgur.com/84un0q0.jpg)\n\n* Shirt: Saint James\n* Trousers: Jean-Paul Gaultier\n* Boots: Balenciaga\n\n[Instagram](https://www.instagram.com/ericmcotecson/)	2019-11-22 09:09:40-08	2019-11-22 21:59:58.105927-08	2019-11-22 21:59:58.10595-08
12	https://i.imgur.com/znIHfVL.jpg	Ptubs	nautical	[nautical](https://imgur.com/znIHfVL)\n\n* Coat: Kapital\n* Shirt: Lady White\n* Sweater: Thrift\n* Pants: Uniqlo\n* Shoes: Dr. Martins	2019-11-22 09:13:39-08	2019-11-22 22:02:10.981665-08	2019-11-22 22:02:10.981679-08
13	https://i.imgur.com/f77jmwz.jpg	Chilljin	been a while	#yo dudes\n\n[been a while](https://i.imgur.com/f77jmwz.jpg)\n\nCoat - Cos\n\nJacket - HM\n\nTurtleneck - Pull & Bear\n\nPants - IDK\n\nShoes - MIE Dr Martens (I finally got a new pair after my mono's i got when I was 18 and first started posting here died) \n\n-\n\ncatch me on the [gram](https://www.instagram.com/charliebirdo/), i'm occasionally fashionable there	2019-11-22 09:06:43-08	2019-11-22 22:02:11.185304-08	2019-11-22 22:02:11.185322-08
14	https://i.imgur.com/By3KiKq.jpg	Vegatheist	My comfy sherpa turtleneck vibes	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 22:02:11.376487-08	2019-11-22 22:02:11.376507-08
15	https://i.imgur.com/rarL10n.jpg	Vegatheist	Detail	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 22:02:11.765099-08	2019-11-22 22:02:11.765114-08
16	https://i.imgur.com/adPP8Ga.jpg	Vegatheist	Twinning with my dad	[My comfy sherpa turtleneck vibes](https://i.imgur.com/By3KiKq.jpg)\n\nUniqlo | Thrift | Kika NY | 3Sixteen | Thrift\n\n[Detail](https://i.imgur.com/rarL10n.jpg)\n\n[Twinning with my dad](https://i.imgur.com/adPP8Ga.jpg)	2019-11-22 09:31:33-08	2019-11-22 22:02:11.957672-08	2019-11-22 22:02:11.95769-08
17	https://i.imgur.com/MObpei4.jpg	alexanderburgh	join me on a tour	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 22:02:12.148052-08	2019-11-22 22:02:12.148069-08
18	https://i.imgur.com/X7gS3L8.jpg	alexanderburgh	of the academic building	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 22:02:12.339562-08	2019-11-22 22:02:12.33958-08
19	https://i.imgur.com/4ZvfcPP.jpg	alexanderburgh	in which I spend all my waking hours	28 // Pittsburgh // law student\n\n[join me on a tour](https://i.imgur.com/MObpei4.jpg)\n\n[of the academic building](https://i.imgur.com/X7gS3L8.jpg)\n\n[in which I spend all my waking hours](https://i.imgur.com/4ZvfcPP.jpg)\n\n[instagram!](https://www.instagram.com/alexanderburgh/)	2019-11-22 10:12:02-08	2019-11-22 22:02:12.552891-08	2019-11-22 22:02:12.55291-08
20	https://i.imgur.com/M0JkHO7.jpg	shmoomentality	me and the dog practicing our holiday card pose	[me and the dog practicing our holiday card pose](https://i.imgur.com/M0JkHO7.jpg)\n\nSunsea felted wool sportcoat/Stephan Schneider colorblocked shirt/Iron Heart overdyed jeans/Buttero boots/Australian Shepherd	2019-11-22 09:06:42-08	2019-11-22 22:02:12.732616-08	2019-11-22 22:02:12.732633-08
21	https://i.imgur.com/YJ4PEq5.jpg	JerichoKilo	Scarf weather again	[Scarf weather again](https://imgur.com/a/Ym9JXhk)\n\nHughes & Hatcher vintage cashmere coat/The Posh'Mina scarf, SNS Herning sweater, Hammer Made shirt, Banana Republic wool trousers/vintage Hanover shell longwings\n\nEdit- guess I'll add the link.	2019-11-22 09:07:25-08	2019-11-22 22:02:12.863897-08	2019-11-22 22:02:12.863915-08
22	https://i.imgur.com/84un0q0.jpg	bond__jamesbond	Good day for stripes.	[Good day for stripes.](https://i.imgur.com/84un0q0.jpg)\n\n* Shirt: Saint James\n* Trousers: Jean-Paul Gaultier\n* Boots: Balenciaga\n\n[Instagram](https://www.instagram.com/ericmcotecson/)	2019-11-22 09:09:40-08	2019-11-22 22:02:12.987461-08	2019-11-22 22:02:12.987478-08
23	https://i.imgur.com/aJWpXex.jpg	fluxknot	Simple fit today	[Simple fit today](http://imgur.com/a/oYMCLP0)\n\n* Shirt: Paige \n* Jeans: Chapter \n* Belt: Zam Barrett \n* Shoes: Rag and Bone	2019-11-22 09:24:01-08	2019-11-22 22:02:13.143029-08	2019-11-22 22:02:13.143047-08
24	https://i.imgur.com/7l65UO2.jpg	8888plasma	Big polo boy	[Big polo boy](https://i.imgur.com/7l65UO2_d.jpg?maxwidth=1920&shape=thumb&fidelity=medium)\n\nJacket - vintage Polo Ralph Lauren (thrift), wool w/ a patch\n\nScarf - vintage Polo Ralph Lauren (thrift), cashmere, Made in England\n\nTurtleneck - vintage Polo Ralph Lauren (thrift, cashmere)\n\nPants - vintage Polo Ralph Lauren (thrift, wool/silk, side straps)\n\nBoots - Ralph Lauren Black Label\n\n[Deets](https://i.imgur.com/J9gRdLG_d.jpg?maxwidth=1920&shape=thumb&fidelity=medium) Forgot my black corduroy Polo Bear hat today, couldn't get set bonus :(	2019-11-22 09:05:01-08	2019-11-22 22:02:13.275665-08	2019-11-22 22:02:13.275682-08
25	https://i.imgur.com/J9gRdLG.jpg	8888plasma	Deets	[Big polo boy](https://i.imgur.com/7l65UO2_d.jpg?maxwidth=1920&shape=thumb&fidelity=medium)\n\nJacket - vintage Polo Ralph Lauren (thrift), wool w/ a patch\n\nScarf - vintage Polo Ralph Lauren (thrift), cashmere, Made in England\n\nTurtleneck - vintage Polo Ralph Lauren (thrift, cashmere)\n\nPants - vintage Polo Ralph Lauren (thrift, wool/silk, side straps)\n\nBoots - Ralph Lauren Black Label\n\n[Deets](https://i.imgur.com/J9gRdLG_d.jpg?maxwidth=1920&shape=thumb&fidelity=medium) Forgot my black corduroy Polo Bear hat today, couldn't get set bonus :(	2019-11-22 09:05:01-08	2019-11-22 22:02:13.399728-08	2019-11-22 22:02:13.399745-08
26	https://i.imgur.com/FEE4EjP.jpg	wuzpoppin	something easy	stressful week so just a rehash of [something easy](https://imgur.com/a/qUeXZ4K)\n\n* robert geller\n* uniqlo u\n* sftm \n* docs	2019-11-22 09:06:34-08	2019-11-22 22:02:13.475267-08	2019-11-22 22:02:13.475285-08
27	https://i.imgur.com/ORQdFv1.jpg	Chashew	belted coats >>>>>>>>>> all other coats	[belted coats >>>>>>>>>> all other coats](https://i.imgur.com/ORQdFv1.jpg)\n\n[deets](https://i.imgur.com/J9pP6JO.jpg)\n\n27 / print and design / Toronto \n\n* Uniqlo toque\n* Vintage belted top coat\n* Brooks Brothers fun shirt\n* Dickies painter jeans\n* Paraboots	2019-11-22 09:07:09-08	2019-11-22 22:02:13.601087-08	2019-11-22 22:02:13.601104-08
28	https://i.imgur.com/J9pP6JO.jpg	Chashew	deets	[belted coats >>>>>>>>>> all other coats](https://i.imgur.com/ORQdFv1.jpg)\n\n[deets](https://i.imgur.com/J9pP6JO.jpg)\n\n27 / print and design / Toronto \n\n* Uniqlo toque\n* Vintage belted top coat\n* Brooks Brothers fun shirt\n* Dickies painter jeans\n* Paraboots	2019-11-22 09:07:09-08	2019-11-22 22:02:13.723209-08	2019-11-22 22:02:13.723228-08
29	https://i.imgur.com/ZrTPGXn.jpg	Chefsupreme	recent fit	[recent fit](https://imgur.com/a/hGvsCxn)\n\nSage de Cret heavy military shirt\n\nLL Bean flannel\n\nMomotaro denim\n\nVisvim Skagway\n\nEvan kinori beanie \n\n[Instagram ](https://www.instagram.com/harrisongering/)	2019-11-22 09:10:29-08	2019-11-22 22:02:13.811775-08	2019-11-22 22:02:13.811792-08
30	https://i.imgur.com/12DsVJ3.jpg	arctic92	First time, pls be gentle	[First time, pls be gentle](https://i.imgur.com/12DsVJ3.jpg)\n\nFitting in this look as much as I can, before winter hits and the parka comes out.\n\n26 / NYC	2019-11-22 10:40:22-08	2019-11-22 22:02:13.946814-08	2019-11-22 22:02:13.946831-08
31	https://i.imgur.com/r0DSKqM.jpg	Schraiber	Really felt like this one came together well	[Really felt like this one came together well](http://imgur.com/a/Xh71qLb)\n\n32/SF/Scientist\n\nBen Sherman\n\nJ Crew\n\nBanana Republic\n\nAllen Edmonds	2019-11-22 09:07:32-08	2019-11-22 22:02:14.014233-08	2019-11-22 22:02:14.01425-08
32	https://i.imgur.com/DIP5hYo.jpg	Honourably-Disagree	thrift - UU - redwing x orthotics	[thrift - UU - redwing x orthotics](https://i.imgur.com/DIP5hYo.jpg)	2019-11-22 09:35:10-08	2019-11-22 22:02:14.138677-08	2019-11-22 22:02:14.138695-08
33	https://i.imgur.com/XBCVFLx.jpg	KrakenASmile	One from Tuesday	[One from Tuesday](https://i.imgur.com/XBCVFLx_d.jpg?maxwidth=640&shape=thumb&fidelity=medium).\n\nBlazer - TM Lewin\n\nShirt - TM Lewin\n\nChinos - Banana Republic\n\nShoes - Loake 1880\n\nPocket Square - Polo Ralph Lauren\n\nFragrance - Versace Dylan Blue	2019-11-22 09:47:35-08	2019-11-22 22:02:14.305916-08	2019-11-22 22:02:14.305934-08
34	https://i.imgur.com/gsS8NVy.jpg	theteenagegentleman	worn to an atlantis themed escape room	[worn to an atlantis themed escape room](https://i.imgur.com/gsS8NVy.jpg)\n\n- 1930's chambray popover\n- P43 Army pants\n- Alden tanker/indy boot in shell cordovan	2019-11-22 09:23:31-08	2019-11-22 22:02:14.425274-08	2019-11-22 22:02:14.425292-08
35	https://i.imgur.com/RBUmWj9.jpg	Airquoting		[Feeling real cozy today] (http://imgur.com/a/G0XqfjZ)\n\nDo you think it's too much gray?	2019-11-22 10:00:31-08	2019-11-22 22:02:14.496262-08	2019-11-22 22:02:14.496278-08
36	https://i.imgur.com/Z5xcdwd.jpg	Stepchild219	Fit	A loafers-with-socks kinda day, with earth tones. Wish I had a pair of oxblood dress boots for this outfit instead, but gotta do what you gotta do. \n\n[Fit](https://imgur.com/Z5xcdwd)\n\n[Details](https://imgur.com/jPRtKmv)\n\n///Coat - William Hunt\n///Sweater -  J Crew\n///Pants and socks - Uniqlo\n///Shoes - J&M\n///Hat - Wigwam\n\nHappy Friday.	2019-11-22 12:41:05-08	2019-11-22 22:02:14.617667-08	2019-11-22 22:02:14.617685-08
37	https://i.imgur.com/jPRtKmv.jpg	Stepchild219	Details	A loafers-with-socks kinda day, with earth tones. Wish I had a pair of oxblood dress boots for this outfit instead, but gotta do what you gotta do. \n\n[Fit](https://imgur.com/Z5xcdwd)\n\n[Details](https://imgur.com/jPRtKmv)\n\n///Coat - William Hunt\n///Sweater -  J Crew\n///Pants and socks - Uniqlo\n///Shoes - J&M\n///Hat - Wigwam\n\nHappy Friday.	2019-11-22 12:41:05-08	2019-11-22 22:02:14.926917-08	2019-11-22 22:02:14.926936-08
38	https://i.imgur.com/WghAaat.png	upflupchuckfck	Work this week	[Work this week](https://imgur.com/WghAaat)\n\n * SuitSupply\n * Uniqlo\n * Gitman Vintage\n * Luxire\n * Alden\n\n[Today, running some errands, going for some sort of neo-prep look](https://imgur.com/ZrKyqeS)\n\n * Eidos\n * Eidos\n * LVC 1955\n * Brooks Brothers	2019-11-22 09:18:02-08	2019-11-22 22:02:15.212663-08	2019-11-22 22:02:15.212682-08
39	https://i.imgur.com/ZrKyqeS.jpg	upflupchuckfck	Today, running some errands, going for some sort of neo-prep look	[Work this week](https://imgur.com/WghAaat)\n\n * SuitSupply\n * Uniqlo\n * Gitman Vintage\n * Luxire\n * Alden\n\n[Today, running some errands, going for some sort of neo-prep look](https://imgur.com/ZrKyqeS)\n\n * Eidos\n * Eidos\n * LVC 1955\n * Brooks Brothers	2019-11-22 09:18:02-08	2019-11-22 22:02:15.50626-08	2019-11-22 22:02:15.506278-08
40	https://i.imgur.com/hw3Ps6H.jpg	OutbackBrah		https://imgur.com/gallery/WUNh8Cl\n\nTrying out some new overalls	2019-11-22 10:37:15-08	2019-11-22 22:02:15.69301-08	2019-11-22 22:02:15.693028-08
41	https://i.imgur.com/twfne9S.jpg	pklogue5		High School Student\n\nhttps://imgur.com/gallery/NWKmTuR\n\n\nThrifted Flannel (Orvis)\n\n\nRandom Gray T-Shirt\n\n\nGap Jeans\n\n\nAllen Edmonds Higgins Mill\n\n\nH&M Bracelets	2019-11-22 09:11:27-08	2019-11-22 22:02:15.854153-08	2019-11-22 22:02:15.854171-08
42	https://i.imgur.com/3hpI7SL.jpg	tominated	Got a new (to me) kapital coat	[Got a new (to me) kapital coat](https://i.imgur.com/3hpI7SL.jpg)\n\n- Kapital Wool Ring Coat\n- (hidden) Corridor shirt\n- Oni khaki jeans\n- Shoes Like Pottery High-tops	2019-11-22 15:50:26-08	2019-11-22 22:02:16.147219-08	2019-11-22 22:02:16.147237-08
43	https://i.imgur.com/n5FQIDI.jpg	fareastern_falsafah	Yesterday — Overcast day spent on exam revision and paper-writing	I was inspired by u/theteenagegentleman, but I did a variation. Instead of a striped t-shirt, I went with a grey one and instead of a button-down, I tucked in my chore coat into my jeans.\n\n\n24 / University student / Singapore \n\n\n[Yesterday — Overcast day spent on exam revision and paper-writing](https://imgur.com/a/s1WyifS) \n\n\n- Wolf Vintage/Etsy chore coat\n\n\n- Uniqlo Supima cotton t-shirt \n\n\n- Levi’s 511s straight-leg jeans\n\n\n- Weinbrenner boat shoes	2019-11-22 09:24:23-08	2019-11-22 22:02:16.346608-08	2019-11-22 22:02:16.346626-08
44	https://i.imgur.com/Y5c1CSo.jpg	sludgedungeon	Blue Boy and Orange Boy	[Blue Boy and Orange Boy](https://imgur.com/a/tHV00Ce)\n\n* Raleigh Denim Chore Coat\n* JCrew Mock Neck\n* Gap \n* JCrew	2019-11-22 11:55:40-08	2019-11-22 22:02:16.888142-08	2019-11-22 22:02:16.888161-08
96	https://i.imgur.com/H2eEFHh.jpg	figurine89	Yesterday	[Yesterday](http://i.imgur.com/H2eEFHh.jpg)\n\n* Barbour\n* Folk\n* OrSlow\n* Nonnative\n* CPs	2019-11-18 09:05:49-08	2019-11-22 22:02:32.964996-08	2019-11-22 22:02:32.965014-08
45	https://i.imgur.com/cPdnKTJ.jpg	eddiefiguer	My go to outfit lately.	[My go to outfit lately.](https://imgur.com/a/3dVs356)\n \n\n-\t Rogue Territory Desert Wash Supply Jacket\n-\t 3Sixteen Flannel\n-\t J.Crew Pocket Tee\n-\t 3Sixteen ST-222x\n-\t Viberg MTO Nigel Calbourn inspired service boots patina’d by a friend\n\n[Insta](https://www.instagram.com/thread.and.steel/)	2019-11-20 09:13:21-08	2019-11-22 22:02:18.24033-08	2019-11-22 22:02:18.240347-08
46	https://i.imgur.com/TC3WLkW.jpg	KrakenASmile	Back at it	[Back at it](https://i.imgur.com/TC3WLkW.jpg) after missing out on fit pics for last week.\n\nBlazer - Alexandre of London\n\nTurtleneck - Uniqlo\n\nCorduroys - Marks & Spencer\n\nShoes - Meermin\n\nWatch - Timex Marlin Hand Wound\n\nFragrance - Tom Ford Grey Vetiver\n\n*Trying out wider cut trousers than I am accustomed to. Feedback is appreciated.*	2019-11-20 10:02:41-08	2019-11-22 22:02:18.519969-08	2019-11-22 22:02:18.519988-08
47	https://i.imgur.com/bKGfCg4.jpg	ddaann97	It was cold	[It was cold](https://imgur.com/a/dnt56ZW)\n\nJacket - Blake Hedley\n\nJumper - John Lewis\n\nChinos - Next\n\nBoots - Doc Martens\n\nP.S. Excuse the mess, my brother is the only one with a full length mirror	2019-11-20 11:32:15-08	2019-11-22 22:02:18.703666-08	2019-11-22 22:02:18.703683-08
48	https://i.imgur.com/gf7WyQ9.jpg	manliftingbanner	stepped in dog shit 5 mins after this was taken	[stepped in dog shit 5 mins after this was taken](https://i.imgur.com/gf7WyQ9.jpg)\n \nFilson / Norse Projects / Nudie / Red Wing \n\n[top down](https://i.imgur.com/63y6yYb.jpg)	2019-11-20 09:15:41-08	2019-11-22 22:02:19.020984-08	2019-11-22 22:02:19.021002-08
49	https://i.imgur.com/63y6yYb.jpg	manliftingbanner	top down	[stepped in dog shit 5 mins after this was taken](https://i.imgur.com/gf7WyQ9.jpg)\n \nFilson / Norse Projects / Nudie / Red Wing \n\n[top down](https://i.imgur.com/63y6yYb.jpg)	2019-11-20 09:15:41-08	2019-11-22 22:02:19.613867-08	2019-11-22 22:02:19.613886-08
50	https://i.imgur.com/blP6TKg.jpg	cpt0bvi0u5		https://i.imgur.com/blP6TKg.jpg\n\nJacket - Bomber Jacket from Gap\n\nsweater - 90s Ralph Lauren Wool Sweater\n\nShirt - Blue Oxford cloth Button Down from Gap\n\nJeans - Momotaro G015-mz\n\nShoes - Adidas Continental 80	2019-11-20 18:59:07-08	2019-11-22 22:02:19.911122-08	2019-11-22 22:02:19.91114-08
51	https://i.imgur.com/iHkaVrK.jpg	Chefsupreme	recent fit	[recent fit](https://imgur.com/a/akedZup)\n\nEvan Kinori bellow shirt\n\nSage de Cret flannel \n\nVisvim corduroys \n\nVisvim grizzly mid\n\nEvan kinori beanie \n\n[Instagram ](https://www.instagram.com/harrisongering/)	2019-11-20 09:05:30-08	2019-11-22 22:02:20.069837-08	2019-11-22 22:02:20.069855-08
52	https://i.imgur.com/bP8IjJY.jpg	JerichoKilo	48/Detroit/Food brokerage	[48/Detroit/Food brokerage](https://i.imgur.com/bP8IjJY.jpg)\n\nBR/Inverallan/Brooks Bro/Nudie/Chippewa\n\nI'm a basic bitch, where's my cappuccino?	2019-11-20 09:18:07-08	2019-11-22 22:02:20.379459-08	2019-11-22 22:02:20.379477-08
53	https://i.imgur.com/ydvxEvJ.jpg	meefjones	Yesterday	Never posted in a WAYWT, lets goooooo\n\n[Yesterday](https://imgur.com/a/vpwMfUO)\n\nLevi's Jacket/Goodfellow corduroy shirt/Dockers/Adidas\n\n[And Today](https://imgur.com/a/Tywwsfm)\n\nThrifted Cardigan/Topman shirt/the same Dockers as yesterday/Adidas	2019-11-20 10:38:59-08	2019-11-22 22:02:20.549539-08	2019-11-22 22:02:20.549557-08
54	https://i.imgur.com/Bqtt3pB.jpg	meefjones	And Today	Never posted in a WAYWT, lets goooooo\n\n[Yesterday](https://imgur.com/a/vpwMfUO)\n\nLevi's Jacket/Goodfellow corduroy shirt/Dockers/Adidas\n\n[And Today](https://imgur.com/a/Tywwsfm)\n\nThrifted Cardigan/Topman shirt/the same Dockers as yesterday/Adidas	2019-11-20 10:38:59-08	2019-11-22 22:02:20.732232-08	2019-11-22 22:02:20.73225-08
55	https://i.imgur.com/x0PJNdY.jpg	wrknthegats	M e l a n c h o l y	[**M e l a n c h o l y**](https://imgur.com/a/hUCXLrS)\nfrankandoak,uniqlo,greats\n\n[*BrownBear*](https://imgur.com/a/VVuoj19)\nuniqlox3,greats\n\nI swear I shop at other stores too.	2019-11-20 09:34:06-08	2019-11-22 22:02:20.949815-08	2019-11-22 22:02:20.949833-08
56	https://i.imgur.com/ovUiJ3O.jpg	wrknthegats	BrownBear	[**M e l a n c h o l y**](https://imgur.com/a/hUCXLrS)\nfrankandoak,uniqlo,greats\n\n[*BrownBear*](https://imgur.com/a/VVuoj19)\nuniqlox3,greats\n\nI swear I shop at other stores too.	2019-11-20 09:34:06-08	2019-11-22 22:02:21.123514-08	2019-11-22 22:02:21.123531-08
57	https://i.imgur.com/ThDbeHD.jpg	Mattgoof		First time post, first time wearing a sweater (normally a khakis and button down guy).\n\nhttps://imgur.com/a/uJGgVZQ	2019-11-20 14:48:08-08	2019-11-22 22:02:21.290682-08	2019-11-22 22:02:21.2907-08
58	https://i.imgur.com/WlQFHAP.jpg	sludgedungeon	Trying my hand at the camel coat	[Trying my hand at the camel coat](https://imgur.com/a/OZbilwi)\n\n* JCrew everything	2019-11-20 11:53:02-08	2019-11-22 22:02:21.450406-08	2019-11-22 22:02:21.450425-08
59	https://i.imgur.com/EpziKnx.jpg	FamousLastName	Went to an Apple orchard this pst weekend	[Went to an Apple orchard this pst weekend ](https://imgur.com/a/uSpomic) \n\nZito Hat Co. \n\nKnickerbocker \n\nLevis 501\n\nAbilene \n\nThis is my fucking uniform, bury me in it.	2019-11-20 09:52:25-08	2019-11-22 22:02:21.610772-08	2019-11-22 22:02:21.61079-08
60	https://i.imgur.com/sfHCMUL.jpg	lingesh	basics	24/SG/Student\n\nGetting some [basics](https://imgur.com/a/ju7xuZt)\n\nUniqlo/Uniqlo/Levi's/Converse	2019-11-20 21:17:11-08	2019-11-22 22:02:21.773571-08	2019-11-22 22:02:21.773588-08
61	https://i.imgur.com/4YjyZy8.jpg	southwestwarlock	So happy I got these boots	[So happy I got these boots](https://imgur.com/a/66p7ECH)\n\n* Pointer chore coat\n* Uniqlo shirt\n* Orslow fatigue pants\n* Guidi 995 boots	2019-11-20 09:42:03-08	2019-11-22 22:02:21.958511-08	2019-11-22 22:02:21.95853-08
62	https://i.imgur.com/pRDX8FM.jpg	afcanonymous	Wedding attire	[Wedding attire](https://i.imgur.com/pRDX8FM.jpg)\n\n* Bonobos velvet blazer\n\n* Lorenzo uomo shirt\n\n* Engineered garments\n\n* The kooples\n\n* Donkey carrying beer\n\n[standing up](https://i.imgur.com/lIDevd1.jpg)\n\nHere's some male fashion advice if you're single. Buy a velvet blazer and wear it to all the weddings and holiday parties	2019-11-20 09:19:30-08	2019-11-22 22:02:22.435481-08	2019-11-22 22:02:22.435499-08
63	https://i.imgur.com/lIDevd1.jpg	afcanonymous	standing up	[Wedding attire](https://i.imgur.com/pRDX8FM.jpg)\n\n* Bonobos velvet blazer\n\n* Lorenzo uomo shirt\n\n* Engineered garments\n\n* The kooples\n\n* Donkey carrying beer\n\n[standing up](https://i.imgur.com/lIDevd1.jpg)\n\nHere's some male fashion advice if you're single. Buy a velvet blazer and wear it to all the weddings and holiday parties	2019-11-20 09:19:30-08	2019-11-22 22:02:22.723254-08	2019-11-22 22:02:22.723272-08
64	https://i.imgur.com/ZFbfiWE.jpg	Chashew	now that’s what I call	[now that’s what I call](https://i.imgur.com/ZFbfiWE.jpg)\n\n[tire changing clothes](https://i.imgur.com/FEaabFl.jpg)\n\n27 / print and design  / Toronto \n\n* ll bean duffle\n* polo cashmere sweater\n* brooks bros ocbd\n* RRL jeans\n* Paraboots \n* 2004 Toyota Matrix	2019-11-20 09:11:54-08	2019-11-22 22:02:23.009389-08	2019-11-22 22:02:23.009407-08
65	https://i.imgur.com/FEaabFl.jpg	Chashew	tire changing clothes	[now that’s what I call](https://i.imgur.com/ZFbfiWE.jpg)\n\n[tire changing clothes](https://i.imgur.com/FEaabFl.jpg)\n\n27 / print and design  / Toronto \n\n* ll bean duffle\n* polo cashmere sweater\n* brooks bros ocbd\n* RRL jeans\n* Paraboots \n* 2004 Toyota Matrix	2019-11-20 09:11:54-08	2019-11-22 22:02:23.657986-08	2019-11-22 22:02:23.658004-08
66	https://i.imgur.com/mdauAIs.jpg	Drunken_Brunch		Gettin colder \nHat- Stetson \n\nJacket- Barbour \n\nHoodie- bootleg polo bear \n\nDenim- N&F elephant 8\n\nSneakers- Nike AM1  https://i.imgur.com/mdauAIs.jpg	2019-11-20 10:38:27-08	2019-11-22 22:02:23.972012-08	2019-11-22 22:02:23.972031-08
67	https://i.imgur.com/B1tloie.jpg	casechopper	Today	[Today](https://imgur.com/a/LTDvkz2)\n\n* Hat People Full Cut Cap\n* Tellason Heavyweight Coverall Jacket\n* Uniqlo Hoodie\n* T-shirt\n* Uniqlo Long sleeve T-shirt\n* Gustin Okayama Standard Jeans\n* Vans	2019-11-20 09:28:15-08	2019-11-22 22:02:24.133287-08	2019-11-22 22:02:24.133305-08
68	https://i.imgur.com/TYfQPi0.jpg	Shryke123		Casual Autumnal day.\n\nMiu Miu duffle. Love this coat. It’s a hooded wool duffle from the 2005 runway. Such a great shape. I’ll have to take a clearer photo next time.\n\nMargiela knit & trousers\n\nSvensson sneakers\n\nhttps://imgur.com/a/ofBHSaS	2019-11-21 13:21:48-08	2019-11-22 22:02:24.682797-08	2019-11-22 22:02:24.682815-08
69	https://i.imgur.com/GxMfGMU.jpg	AMPduppp	if it could stop being gray and gloomy out that'd be great	[if it could stop being gray and gloomy out that'd be great](https://i.imgur.com/GxMfGMU_d.jpg?maxwidth=640&shape=thumb&fidelity=medium)\n\nJ Crew//Uniqlo U//Luther's//Chippewa	2019-11-18 09:54:04-08	2019-11-22 22:02:26.354634-08	2019-11-22 22:02:26.354652-08
70	https://i.imgur.com/uBVDCAf.jpg	wrknthegats	Indigo & Olive	[Indigo & Olive](https://imgur.com/a/RkMXOjW)\n\nButtonUp - QLo\nTee - idk\nPants - APC PNS\nSneaks - NB 696	2019-11-18 11:44:30-08	2019-11-22 22:02:26.532653-08	2019-11-22 22:02:26.53267-08
71	https://i.imgur.com/7mE7u95.jpg	amahl3r	Fit	Still new to posting fits...\n\n[Fit ](https://imgur.com/a/6WeEatf)\n\nUniqlo x EG \n\nVince Rogue \n\nRogue Territory\n\nFlorsheim	2019-11-18 12:10:03-08	2019-11-22 22:02:26.975723-08	2019-11-22 22:02:26.975741-08
72	https://i.imgur.com/nkitfz2.jpg	manliftingbanner	grey trousers are the building block of modern society	[grey trousers are the building block of modern society](https://i.imgur.com/nkitfz2.jpg)\n \nDrake’s / Filson / Norse Projects / M&S / Alfred Sargent \n \n[top down and textures for /u/Chuckflowers22](https://imgur.com/a/JlHfZ9w)	2019-11-18 09:04:56-08	2019-11-22 22:02:27.271465-08	2019-11-22 22:02:27.271483-08
73	https://i.imgur.com/LI3ratj.jpg	manliftingbanner	top down and textures for /u/Chuckflowers22	[grey trousers are the building block of modern society](https://i.imgur.com/nkitfz2.jpg)\n \nDrake’s / Filson / Norse Projects / M&S / Alfred Sargent \n \n[top down and textures for /u/Chuckflowers22](https://imgur.com/a/JlHfZ9w)	2019-11-18 09:04:56-08	2019-11-22 22:02:27.453003-08	2019-11-22 22:02:27.45302-08
74	https://i.imgur.com/ER7JEe2.jpg	jakeeng	Fit	Love these pants. \n\n[Fit](https://i.imgur.com/ER7JEe2.jpg)	2019-11-18 11:26:15-08	2019-11-22 22:02:27.74533-08	2019-11-22 22:02:27.745348-08
75	https://i.imgur.com/opFjUaw.jpg	Kiirot	Felt cute might delete later	[Felt cute might delete later](https://imgur.com/a/KyN8c7u)\n\n- Uniqlo\n- Zara\n- Levi's\n- Artisan Lab	2019-11-18 10:33:26-08	2019-11-22 22:02:27.935938-08	2019-11-22 22:02:27.935957-08
76	https://i.imgur.com/C1dE1VH.jpg	kylestroupe		First real post on this subreddit, please be gentle: https://imgur.com/gallery/gaMBGRj\n\nJacket: Levi’s\n\nShirt: Uniqlo\n\nPants: Levi’s\n\nShoes: Adidas	2019-11-18 13:29:13-08	2019-11-22 22:02:28.138637-08	2019-11-22 22:02:28.13866-08
77	https://i.imgur.com/H9WRgwP.jpg	TheComebackKid	extreme comfort	[extreme comfort](https://imgur.com/a/A4cROXh)\n\nHat: Upstate Stock\n\nJacket: Vintage\n\nShirt: Engineered Garments\n\nTurtleneck: Uniqlo\n\nPants: Polo\n\nShoes: New Balance\n\n[Insta!](https://www.instagram.com/thisisallihavenow)	2019-11-18 09:16:07-08	2019-11-22 22:02:28.303745-08	2019-11-22 22:02:28.303762-08
78	https://i.imgur.com/WSqZlRN.jpg	horganzola	WAYWT	[WAYWT](https://imgur.com/a/l75hZm2) \n\nCarhartt WIP/Gap/Abercrombie/Nike/Dads old scarf	2019-11-18 10:32:48-08	2019-11-22 22:02:28.492496-08	2019-11-22 22:02:28.492514-08
79	https://i.imgur.com/4ViWTKx.jpg	mfgfm93	hello!	[hello!](https://imgur.com/a/SNQghd1) \n\n* apc\n* uniqlo u\n* rogue territory \n* visvim\n\nig: mar.garments	2019-11-18 09:36:03-08	2019-11-22 22:02:28.708313-08	2019-11-22 22:02:28.708331-08
80	https://i.imgur.com/Ez5PlCV.jpg	pzonee	first time trying white socks	26 / Northern NJ / Special Education\n\n[first time trying white socks](https://imgur.com/a/PSQAGR6)\n\nJcrew beanie/A days march wool overshirt/Uniqlo heat tech turtleneck/Uniqlo x Jw Anderson cords/dr marten 1461\n\n[grams](https://www.instagram.com/zachpav1/)	2019-11-18 09:08:35-08	2019-11-22 22:02:28.884839-08	2019-11-22 22:02:28.884857-08
81	https://i.imgur.com/JenNG1y.jpg	warpweftwatergate	Kooples/MKC/Amiri/FTF	[Kooples/MKC/Amiri/FTF](https://imgur.com/a/a43MP3l) \n\n[milsurp/Officine Generale/Eton/Saint Laurent/CK205](https://imgur.com/a/IGm1ZMj)	2019-11-18 09:13:24-08	2019-11-22 22:02:29.065976-08	2019-11-22 22:02:29.065994-08
82	https://i.imgur.com/u2bnCyx.jpg	warpweftwatergate	milsurp/Officine Generale/Eton/Saint Laurent/CK205	[Kooples/MKC/Amiri/FTF](https://imgur.com/a/a43MP3l) \n\n[milsurp/Officine Generale/Eton/Saint Laurent/CK205](https://imgur.com/a/IGm1ZMj)	2019-11-18 09:13:24-08	2019-11-22 22:02:29.250758-08	2019-11-22 22:02:29.250776-08
83	https://i.imgur.com/IwGuXiC.jpg	theteenagegentleman	The visible Striped Undershirt	Been something new with the [The *visible* Striped Undershirt](https://i.imgur.com/IwGuXiC.jpg)\n\n- 1950's Army Khaki Civvie workshirt (flea market)\n- H&M Tee (thrifted)\n- LVC 1945s I paint in\n- Harvey Alden Tassel from Brogue\n\n[blog post on the style move!](https://streetxsprezza.wordpress.com/2019/11/17/the-striped-tee-undershirt/)	2019-11-18 09:08:07-08	2019-11-22 22:02:29.554086-08	2019-11-22 22:02:29.554105-08
84	https://i.imgur.com/8igoSxz.jpg	JerichoKilo	Today mean mug	[Today mean mug](https://i.imgur.com/8igoSxz.jpg)\n\n[Last Friday glamour shot](https://i.imgur.com/eIcZiCO.jpg)	2019-11-18 09:14:05-08	2019-11-22 22:02:29.862269-08	2019-11-22 22:02:29.862286-08
85	https://i.imgur.com/eIcZiCO.jpg	JerichoKilo	Last Friday glamour shot	[Today mean mug](https://i.imgur.com/8igoSxz.jpg)\n\n[Last Friday glamour shot](https://i.imgur.com/eIcZiCO.jpg)	2019-11-18 09:14:05-08	2019-11-22 22:02:30.147585-08	2019-11-22 22:02:30.147603-08
86	https://i.imgur.com/oqoktM6.jpg	KibblesNKirbs	wop	[wop](https://i.imgur.com/oqoktM6.jpg)\n\na vontade | paa | evan kinori | ymc x paraboot	2019-11-18 09:15:47-08	2019-11-22 22:02:30.456556-08	2019-11-22 22:02:30.456571-08
87	https://i.imgur.com/pTD2jtl.jpg	karuto	I call this outfit "The King"	[I call this outfit "The King"](https://imgur.com/a/XAj4Vpj)\n\nJacket: Thrifted Levi's\n\nSweater: Beams+\n\nPants: Thrifted\n\nBoots: C&J for Brooks Brothers\n\n[Check out my Instagram!](https://www.instagram.com/whyweweardotcom)	2019-11-18 09:05:04-08	2019-11-22 22:02:30.646447-08	2019-11-22 22:02:30.646464-08
88	https://i.imgur.com/q4rCTcq.jpg	ayysic	h e r i t a g e	[h e r i t a g e](https://i.imgur.com/q4rCTcq.jpg)\n\n* filson double mackinaw\n\n* unlabeled wool aran rollneck\n\n* unlabeled tweed trousers\n\n* alden 405\n\n[also here is a post I made last year about mackinaw jackets](https://www.reddit.com/r/malefashionadvice/comments/9lm17g/the_mackinaw_jacket_a_brief_history_and/)	2019-11-18 09:04:57-08	2019-11-22 22:02:31.02144-08	2019-11-22 22:02:31.021462-08
89	https://i.imgur.com/zaWJ64m.jpg	trackday_bro	a picture of an outfit	[a picture of an outfit](https://i.imgur.com/zaWJ64m.jpg)\n\n-\tengineered garments \n-\tj crew\n-\tpolo rl\n-\tconverse	2019-11-18 09:11:31-08	2019-11-22 22:02:31.332165-08	2019-11-22 22:02:31.332186-08
90	https://i.imgur.com/hdVIC3C.jpg	Chashew	fuzzy	[fuzzy](https://i.imgur.com/hdVIC3C.jpg)\n\n[wuzzy](https://i.imgur.com/VG2B66l.jpg)\n\n* Uniqlo toque\n* LL Bean duffle coat\n* Uniqlo turtleneck\n* Eddie Bauer cords\n* Meermin chelseas	2019-11-18 09:09:49-08	2019-11-22 22:02:31.650512-08	2019-11-22 22:02:31.650527-08
91	https://i.imgur.com/VG2B66l.jpg	Chashew	wuzzy	[fuzzy](https://i.imgur.com/hdVIC3C.jpg)\n\n[wuzzy](https://i.imgur.com/VG2B66l.jpg)\n\n* Uniqlo toque\n* LL Bean duffle coat\n* Uniqlo turtleneck\n* Eddie Bauer cords\n* Meermin chelseas	2019-11-18 09:09:49-08	2019-11-22 22:02:31.930354-08	2019-11-22 22:02:31.930367-08
92	https://i.imgur.com/77MBBX7.jpg	ddaann97	Went out for drinks	[Went out for drinks](https://imgur.com/a/KK2r3zF)\n\nJacket - Independent\n\nShirt - Asos\n\nJeans - Levi's\n\nBoots - Asos	2019-11-18 10:00:58-08	2019-11-22 22:02:32.10106-08	2019-11-22 22:02:32.101078-08
93	https://i.imgur.com/jc63oJ3.jpg	fareastern_falsafah	Today — Hot and sunny in the day, brief thunderstorm in the evening	I was going to call it a day and not post my today’s fit, but I then saw u/theteenagegentleman post a cool blog entry about striped shirts...so screw it! I can’t let this fit go to waste. \n\n\n[Today — Hot and sunny in the day, brief thunderstorm in the evening ](https://imgur.com/a/NYeXhmJ) \n\n\n- Wolf Vintage/Etsy chore coat\n- Uniqlo striped t-shirt\n- Levi’s 501 straight-leg jeans\n- Weinbrenner boat shoes (Yes, I’ll replace this very soon)	2019-11-18 13:12:45-08	2019-11-22 22:02:32.324356-08	2019-11-22 22:02:32.324375-08
94	https://i.imgur.com/jtWBFVy.jpg	iptables-abuse	Long time no post. What's up?	[Long time no post. What's up?](https://imgur.com/a/77R1SLE)\n\n31 / Software / Vancouver\n\nMEC jacket / Bugatti scarf / British Khaki cardigan / Our Legacy shirt / J Crew chinos / Blundstones	2019-11-18 09:08:45-08	2019-11-22 22:02:32.502808-08	2019-11-22 22:02:32.502827-08
95	https://i.imgur.com/fyKoWHX.jpg	citaro	Hello	[Hello](https://imgur.com/a/z21Q40Q)\n\n* Studio Nicholson\n* Lemaire\n* Lemaire\n* Paraboots	2019-11-18 09:09:33-08	2019-11-22 22:02:32.66565-08	2019-11-22 22:02:32.665664-08
97	https://i.imgur.com/491yDHM.jpg	DenaunMan	Threw my shirt jacket on top of my school uniform this morning.	[Threw my shirt jacket on top of my school uniform this morning.](http://imgur.com/a/aLI1SNW) Nothing noteworthy, but the shine on my Oxfords makes me feel good about this.	2019-11-18 09:36:04-08	2019-11-22 22:02:33.513963-08	2019-11-22 22:02:33.51398-08
98	https://i.imgur.com/MtzrUoY.jpg	McBawse	Finally joined the Wyatt club.	[Finally joined the Wyatt club.](https://imgur.com/MtzrUoY)  \n  \n* AllSaints x 3\n* Saint Laurent\n  \nFeels nice to actually buy a grail after so long, basic SLP aesthetic outfit to go with it because what else am I going to wear for their maiden voyage.	2019-11-18 09:05:25-08	2019-11-22 22:02:33.807091-08	2019-11-22 22:02:33.807107-08
99	https://i.imgur.com/t84uxE9.jpg	nixthar	comfy	Comfy and blue today\n\n[comfy ](https://imgur.com/a/vRPtcgL) \n\nWallace and Barnes chore coat - new\n\nAEO twill flannel\n\nGoodfellow (Target) flannel lined navy chinos\n\nPair of Kings double monks	2019-11-18 13:36:52-08	2019-11-22 22:02:33.975775-08	2019-11-22 22:02:33.975793-08
100	https://i.imgur.com/UzFO7sD.jpg	Chefsupreme	recent fit	[recent fit](https://imgur.com/a/E1BxMfx)\n\nIron heart M65\n\nPortuguese flannel overshirt \n\nKirkland shirt\n\nOrslow fatigue pants \n\nVisvim Christo\n\n[Instagram ](https://www.instagram.com/harrisongering/)	2019-11-18 09:05:37-08	2019-11-22 22:02:34.140964-08	2019-11-22 22:02:34.140981-08
101	https://i.imgur.com/lVeDApG.jpg	fluxknot	Weekend Fit	[Weekend Fit](http://imgur.com/a/yScPIZs)\n\n* Sweater: Allsaints \n* Pants: Vintage US Army \n* Belt: Zam Barrett \n* Boots: The Last Conspiracy \n\n[WIWT](http://imgur.com/a/7k7ZJMI) \n\n* Jacket: Allsaints \n* Shirt: Thrift\n* Pants: UU \n* Sneakers: Greats	2019-11-18 09:07:11-08	2019-11-22 22:02:34.312588-08	2019-11-22 22:02:34.312605-08
102	https://i.imgur.com/S5t5eK2.jpg	fluxknot	WIWT	[Weekend Fit](http://imgur.com/a/yScPIZs)\n\n* Sweater: Allsaints \n* Pants: Vintage US Army \n* Belt: Zam Barrett \n* Boots: The Last Conspiracy \n\n[WIWT](http://imgur.com/a/7k7ZJMI) \n\n* Jacket: Allsaints \n* Shirt: Thrift\n* Pants: UU \n* Sneakers: Greats	2019-11-18 09:07:11-08	2019-11-22 22:02:34.501257-08	2019-11-22 22:02:34.501274-08
103	https://i.imgur.com/1oWJOTF.png	cdfchopper		http://imgur.com/a/jmNSL6M\n\nRevisiting an idea I'm still not entirely happy with.\n\n* Gap\n* Thrifted\n* Engineered Garments\n* Docs X Engineered Garments	2019-11-18 09:08:22-08	2019-11-22 22:02:34.718406-08	2019-11-22 22:02:34.718422-08
104	https://i.imgur.com/xh0XpHh.jpg	Skinnygold	Heading home from uni in some warm, earthy colours.	[Heading home from uni in some warm, earthy colours.](https://i.imgur.com/xh0XpHh.jpg) My first time posting a fit, please be kind!\n\n20 / Manchester / Psychology student\n\n* Ace & Tate glasses\n* Folk jumper \n* Sunspel t-shirt\n* Jigsaw chinos\n* Vans mid tops\n* Sandqvist backpack	2019-11-18 09:11:52-08	2019-11-22 22:02:35.075466-08	2019-11-22 22:02:35.075484-08
105	https://i.imgur.com/RgBCl28.jpg	Fiiro	Tried a cropped for the first time	[Tried a cropped for the first time](https://imgur.com/a/ZLhvVjf)\n\nI cut it myself.\n\nSorry for the low quality picture.	2019-11-18 15:26:35-08	2019-11-22 22:02:35.276698-08	2019-11-22 22:02:35.276716-08
\.


--
-- Data for Name: api_postarticles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.api_postarticles (id, xpos, ypos, width, height, date_created, date_modified, article_id, post_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add article	7	add_article
26	Can change article	7	change_article
27	Can delete article	7	delete_article
28	Can view article	7	view_article
29	Can add outfit post	8	add_outfitpost
30	Can change outfit post	8	change_outfitpost
31	Can delete outfit post	8	delete_outfitpost
32	Can view outfit post	8	view_outfitpost
33	Can add post articles	9	add_postarticles
34	Can change post articles	9	change_postarticles
35	Can delete post articles	9	delete_postarticles
36	Can view post articles	9	view_postarticles
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$RW1GOTqRwIk5$+GcOnKaxRzNVOyonl/9y/82tLu5gVp65ccybswLH3po=	2019-11-22 22:04:19.219118-08	t	admin			admin@admin.com	t	t	2019-11-22 21:35:43.343738-08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	article
8	api	outfitpost
9	api	postarticles
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-22 21:34:52.467626-08
2	auth	0001_initial	2019-11-22 21:34:52.539044-08
3	admin	0001_initial	2019-11-22 21:34:52.576918-08
4	admin	0002_logentry_remove_auto_add	2019-11-22 21:34:52.589661-08
5	admin	0003_logentry_add_action_flag_choices	2019-11-22 21:34:52.599617-08
6	api	0001_initial	2019-11-22 21:34:52.622408-08
7	api	0002_auto_20191110_1229	2019-11-22 21:34:52.633032-08
8	api	0003_auto_20191114_0627	2019-11-22 21:34:52.639154-08
9	contenttypes	0002_remove_content_type_name	2019-11-22 21:34:52.662513-08
10	auth	0002_alter_permission_name_max_length	2019-11-22 21:34:52.668494-08
11	auth	0003_alter_user_email_max_length	2019-11-22 21:34:52.677983-08
12	auth	0004_alter_user_username_opts	2019-11-22 21:34:52.687114-08
13	auth	0005_alter_user_last_login_null	2019-11-22 21:34:52.696863-08
14	auth	0006_require_contenttypes_0002	2019-11-22 21:34:52.698736-08
15	auth	0007_alter_validators_add_error_messages	2019-11-22 21:34:52.70723-08
16	auth	0008_alter_user_username_max_length	2019-11-22 21:34:52.718434-08
17	auth	0009_alter_user_last_name_max_length	2019-11-22 21:34:52.727185-08
18	auth	0010_alter_group_name_max_length	2019-11-22 21:34:52.735763-08
19	auth	0011_update_proxy_permissions	2019-11-22 21:34:52.746425-08
20	sessions	0001_initial	2019-11-22 21:34:52.752365-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dkqpu1f1twdt5wrymn0o7yr9r7nty90w	NTJjOWU4YTBlNWQ4OGZlYzIzMDVlNGEzMGVlMzM4MGFkNjQ2MzRmNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4OGVkOGIzNWFlOTdjYzM0YWQyODkyMTAxODYyMDNiNTE5NDUwMGRkIn0=	2019-12-06 22:04:19.221229-08
\.


--
-- Name: api_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.api_article_id_seq', 1, false);


--
-- Name: api_outfitpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.api_outfitpost_id_seq', 105, true);


--
-- Name: api_postarticles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.api_postarticles_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: api_article api_article_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_article
    ADD CONSTRAINT api_article_pkey PRIMARY KEY (id);


--
-- Name: api_outfitpost api_outfitpost_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_outfitpost
    ADD CONSTRAINT api_outfitpost_pkey PRIMARY KEY (id);


--
-- Name: api_postarticles api_postarticles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_postarticles
    ADD CONSTRAINT api_postarticles_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_postarticles_article_id_597b74ec; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX api_postarticles_article_id_597b74ec ON public.api_postarticles USING btree (article_id);


--
-- Name: api_postarticles_post_id_98ebc990; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX api_postarticles_post_id_98ebc990 ON public.api_postarticles USING btree (post_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_postarticles api_postarticles_article_id_597b74ec_fk_api_article_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_postarticles
    ADD CONSTRAINT api_postarticles_article_id_597b74ec_fk_api_article_id FOREIGN KEY (article_id) REFERENCES public.api_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_postarticles api_postarticles_post_id_98ebc990_fk_api_outfitpost_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.api_postarticles
    ADD CONSTRAINT api_postarticles_post_id_98ebc990_fk_api_outfitpost_id FOREIGN KEY (post_id) REFERENCES public.api_outfitpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

