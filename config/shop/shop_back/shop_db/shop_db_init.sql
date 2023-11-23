--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: core_commandhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_commandhistory (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    applied_at timestamp with time zone NOT NULL
);


ALTER TABLE public.core_commandhistory OWNER TO postgres;

--
-- Name: core_commandhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_commandhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_commandhistory_id_seq OWNER TO postgres;

--
-- Name: core_commandhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_commandhistory_id_seq OWNED BY public.core_commandhistory.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: products_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    slug character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_category OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_discount (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    percent numeric(5,2) NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.products_discount OWNER TO postgres;

--
-- Name: products_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_discount_id_seq OWNER TO postgres;

--
-- Name: products_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_discount_id_seq OWNED BY public.products_discount.id;


--
-- Name: products_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_file (
    id bigint NOT NULL,
    name character varying(250),
    file character varying(255) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.products_file OWNER TO postgres;

--
-- Name: products_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_file_id_seq OWNER TO postgres;

--
-- Name: products_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_file_id_seq OWNED BY public.products_file.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    price_currency character varying(3) NOT NULL,
    price numeric(19,4) NOT NULL,
    category_id bigint,
    discount_id bigint,
    slug character varying(100),
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: core_commandhistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_commandhistory ALTER COLUMN id SET DEFAULT nextval('public.core_commandhistory_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_discount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_discount ALTER COLUMN id SET DEFAULT nextval('public.products_discount_id_seq'::regclass);


--
-- Name: products_file id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_file ALTER COLUMN id SET DEFAULT nextval('public.products_file_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add discount	8	add_discount
30	Can change discount	8	change_discount
31	Can delete discount	8	delete_discount
32	Can view discount	8	view_discount
33	Can add product	9	add_product
34	Can change product	9	change_product
35	Can delete product	9	delete_product
36	Can view product	9	view_product
37	Can add file	10	add_file
38	Can change file	10	change_file
39	Can delete file	10	delete_file
40	Can view file	10	view_file
41	Can add command history	11	add_commandhistory
42	Can change command history	11	change_commandhistory
43	Can delete command history	11	delete_commandhistory
44	Can view command history	11	view_commandhistory
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$hQP9hSQEPlYQwHlhJrJvBF$KvmR48AaTAv1MFfhs4uzG1THfHFbs5T75AIBUYXUFjk=	2023-10-13 05:25:14.163075+00	t	allania7med11			allania7med11@gmail.com	t	t	2022-12-04 14:03:30.921562+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: core_commandhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_commandhistory (id, name, applied_at) FROM stdin;
1	add_products_from_dummyjson	2023-02-15 15:27:35.502101+00
2	add_products_from_api	2023-02-15 15:27:41.193772+00
3	update_categories	2023-02-15 15:27:41.22081+00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-04 14:24:55.677208+00	1	mobiles	1	[{"added": {}}]	7	1
2	2022-12-04 14:26:26.072588+00	2	laptops	1	[{"added": {}}]	7	1
3	2022-12-04 14:26:44.665503+00	3	tvs	1	[{"added": {}}]	7	1
4	2022-12-04 14:27:58.272348+00	1	10%	1	[{"added": {}}]	8	1
5	2022-12-04 14:33:22.967805+00	2	SAMSUNG GALAXY A03	1	[{"added": {}}, {"added": {"name": "file", "object": "File object (1)"}}]	9	1
6	2022-12-04 14:34:02.523737+00	2	SAMSUNG GALAXY A03	2	[]	9	1
7	2022-12-04 14:39:27.098335+00	2	20%	1	[{"added": {}}]	8	1
8	2022-12-04 14:39:33.079315+00	3	Acer Predator Triton 500 SE	1	[{"added": {}}]	9	1
9	2022-12-04 14:43:03.837258+00	2	SAMSUNG Galaxy S22+ Cell Phone	2	[{"changed": {"fields": ["Product Name", "Price"]}}, {"added": {"name": "file", "object": "File object (2)"}}, {"deleted": {"name": "file", "object": "File object (None)"}}]	9	1
10	2022-12-04 14:48:53.836359+00	3	15%	1	[{"added": {}}]	8	1
11	2022-12-04 14:49:25.839762+00	4	TCL 32-inch Class 3-Series HD LED Smart Android TV	1	[{"added": {}}, {"added": {"name": "file", "object": "File object (3)"}}]	9	1
15	2023-02-15 21:35:48.956415+00	2	SAMSUNG Galaxy S22+ Cell Phone	2	[{"changed": {"fields": ["Description"]}}]	9	1
16	2023-02-16 10:06:55.777003+00	101	8%	1	[{"added": {}}]	8	1
17	2023-02-16 10:07:20.263085+00	109	Samsung Galaxy S20 FE 5G	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
18	2023-02-16 10:10:55.83365+00	102	30%	1	[{"added": {}}]	8	1
19	2023-02-16 10:11:31.733247+00	108	iPhone 13 Pro Max	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
20	2023-02-16 10:12:14.15322+00	103	21%	1	[{"added": {}}]	8	1
21	2023-02-16 10:12:17.939872+00	111	OnePlus Nord N200 | 5G	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
22	2023-02-16 10:15:16.354759+00	104	36%	1	[{"added": {}}]	8	1
23	2023-02-16 10:15:19.132789+00	110	SAMSUNG Galaxy Z Fold 3 5G Cell Phone	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
24	2023-03-25 05:15:18.987296+00	113	SAMSUNG Galaxy S23 Ultra Cell Phone	1	[{"added": {}}, {"added": {"name": "file", "object": "File object (452)"}}, {"added": {"name": "file", "object": "File object (453)"}}, {"added": {"name": "file", "object": "File object (454)"}}, {"added": {"name": "file", "object": "File object (455)"}}, {"added": {"name": "file", "object": "File object (456)"}}, {"added": {"name": "file", "object": "File object (457)"}}]	9	1
25	2023-03-25 05:23:19.380161+00	105	ONEPLUS 10T | Moonstone Black | 5G	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
26	2023-03-25 05:24:26.700799+00	106	Apple iPhone 12	2	[{"changed": {"fields": ["Discount", "Description"]}}]	9	1
27	2023-03-31 02:32:46.10747+00	113	SAMSUNG Galaxy S23 Ultra Cell Phone	2	[]	9	1
28	2023-03-31 02:33:38.089075+00	2	SAMSUNG Galaxy S22+ Cell Phone	2	[]	9	1
29	2023-03-31 02:34:17.572146+00	113	SAMSUNG Galaxy S23 Ultra Cell Phone	2	[]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	products	category
8	products	discount
9	products	product
10	products	file
11	core	commandhistory
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-03 19:43:07.337909+00
2	auth	0001_initial	2022-12-03 19:43:07.42792+00
3	admin	0001_initial	2022-12-03 19:43:07.450094+00
4	admin	0002_logentry_remove_auto_add	2022-12-03 19:43:07.460463+00
5	admin	0003_logentry_add_action_flag_choices	2022-12-03 19:43:07.47976+00
6	contenttypes	0002_remove_content_type_name	2022-12-03 19:43:07.503603+00
7	auth	0002_alter_permission_name_max_length	2022-12-03 19:43:07.5139+00
8	auth	0003_alter_user_email_max_length	2022-12-03 19:43:07.534199+00
9	auth	0004_alter_user_username_opts	2022-12-03 19:43:07.547353+00
10	auth	0005_alter_user_last_login_null	2022-12-03 19:43:07.560948+00
11	auth	0006_require_contenttypes_0002	2022-12-03 19:43:07.563838+00
12	auth	0007_alter_validators_add_error_messages	2022-12-03 19:43:07.577136+00
13	auth	0008_alter_user_username_max_length	2022-12-03 19:43:07.605084+00
14	auth	0009_alter_user_last_name_max_length	2022-12-03 19:43:07.623485+00
15	auth	0010_alter_group_name_max_length	2022-12-03 19:43:07.64959+00
16	auth	0011_update_proxy_permissions	2022-12-03 19:43:07.662189+00
17	auth	0012_alter_user_first_name_max_length	2022-12-03 19:43:07.673674+00
18	products	0001_initial	2022-12-03 19:43:07.722372+00
19	sessions	0001_initial	2022-12-03 19:43:07.734691+00
20	products	0002_product_slug_alter_category_name_alter_category_slug	2023-02-06 22:53:26.659754+00
21	products	0002_product_description	2023-02-06 22:53:26.679337+00
22	products	0003_merge_20230206_2022	2023-02-06 22:53:26.6832+00
23	core	0001_initial	2023-02-15 15:27:31.618691+00
24	products	0004_category_created_at_category_updated_at_and_more	2023-03-31 01:52:56.905032+00
25	products	0005_alter_product_options	2023-03-31 01:52:56.920506+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zuchn0f4q7cltrkees1edqma2a6m32go	.eJxVjMsOwiAQRf-FtSG8y7h07zeQYQCpGkhKuzL-uzbpQrf3nHNfLOC21rCNvIQ5sTOT7PS7RaRHbjtId2y3zqm3dZkj3xV-0MGvPeXn5XD_DiqO-q0nsmKykYp3JKNURpAHFOhBOQRFDo2xplgCxAJaeg0FjS5Ja0suSvb-ANd5N6M:1p1psm:tA-ey2T0GUM9KKsQ9ph6s4FgzvCAeSlMlRzY746hJ4U	2022-12-18 14:22:16.324724+00
ab9l955flymlnx4sc5oulxq03e6zrryb	.eJxVjDsOwjAQBe_iGlnrdfBiSnrOYK0_iwPIkeKkQtwdIqWA9s3Me6nA61LD2sscxqzOCtXhd4ucHqVtIN-53SadprbMY9Sbonfa9XXK5XnZ3b-Dyr1-65MF68UxGix2cII-skk5grMCLIa5UDl6yiAMWRIaiE4GQiJnDbF6fwDkOjfs:1p2erl:IuNFUov_t1sg9VeihMtMits7P9Jv8KRaNKdC8E5juZw	2022-12-20 20:48:37.331483+00
s2hkpnd0qdz1he8kh5zglkoua64shjad	.eJxVjMsOwiAQRf-FtSHDY6C6dN9vIMNApWogKe3K-O_apAvd3nPOfYlA21rC1vMS5iQuQovT7xaJH7nuIN2p3prkVtdljnJX5EG7HFvKz-vh_h0U6uVbG_SokW3EOICDyTFbGFyOChlBTWCzBtaRMZl0BkOKGBx5xgxGGy_eH8lnN0g:1p2zuT:LwfcSBGtexXAJV6WHqCkv5NGqIqCTIPOvkXM-b5kwD8	2022-12-21 19:16:49.158239+00
bab40bk5h11aalz3xbjx67wn0ascaf8b	.eJxVjEEOwiAQRe_C2hBgmEJduu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur0OLyu0VKT64HyA-q91mmua7LFOWhyJM2OcyZX7fT_Tso1Mpec0RkrbBTRhOCMXlvPWdnRpt6kwxoAAs-RSDleotKRwSHMDqXO_bi8wXMnzcA:1p4TNE:v-owQRcMaBEfmdd-IaYp6ukgXriI17LMOD8uJ3CCN9I	2022-12-25 20:56:36.886931+00
ajkdick5ieod0l5wc5uhsuz8vh9azlb0	.eJxVjEEOwiAQRe_C2hBgmEJduu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur0OLyu0VKT64HyA-q91mmua7LFOWhyJM2OcyZX7fT_Tso1Mpec0RkrbBTRhOCMXlvPWdnRpt6kwxoAAs-RSDleotKRwSHMDqXO_bi8wXMnzcA:1pPANi:PAmwxyr6fH7g3QveXiY3szSgMVfVHA3W2hiMl-CMUvU	2023-02-20 22:54:38.483287+00
mg1epautyc2xu5uoi1pbg4cbe28piqlk	.eJxVjEEOwiAQRe_C2hBgmEJduu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur0OLyu0VKT64HyA-q91mmua7LFOWhyJM2OcyZX7fT_Tso1Mpec0RkrbBTRhOCMXlvPWdnRpt6kwxoAAs-RSDleotKRwSHMDqXO_bi8wXMnzcA:1pSKCC:zwEAxGb9vxw4fOlDDti_zm87unz9cbfBRZhuGTTJ804	2023-03-01 15:59:48.256661+00
if3bc1cfdo66a0os9ow4cyipl4nmkfy1	.eJxVjEEOwiAQRe_C2hBgmEJduu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur0OLyu0VKT64HyA-q91mmua7LFOWhyJM2OcyZX7fT_Tso1Mpec0RkrbBTRhOCMXlvPWdnRpt6kwxoAAs-RSDleotKRwSHMDqXO_bi8wXMnzcA:1pi46O:PwF0qlcF6djZxWy3S0kVCVprEPaZUSO_3FciWd17EpU	2023-04-14 02:02:52.559599+00
k3hxuywh79m1rweok95auaxn4ntx71yc	.eJxVjEEOwiAQRe_C2hBgmEJduu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur0OLyu0VKT64HyA-q91mmua7LFOWhyJM2OcyZX7fT_Tso1Mpec0RkrbBTRhOCMXlvPWdnRpt6kwxoAAs-RSDleotKRwSHMDqXO_bi8wXMnzcA:1qrAfi:0yo_jaJVAKLyA_hOz1AR2alh8pM530bWKkY3oWoFAi8	2023-10-27 05:25:14.170065+00
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category (id, name, slug, created_at, updated_at) FROM stdin;
1	mobiles	mobiles	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
2	laptops	laptops	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
5	Fragrances	fragrances	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
6	Skincare	skincare	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
7	Groceries	groceries	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
8	Home-decoration	home-decoration	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
9	Furniture	furniture	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
10	Tops	tops	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
11	Womens-dresses	womens-dresses	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
12	Womens-shoes	womens-shoes	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
13	Mens-shirts	mens-shirts	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
14	Mens-shoes	mens-shoes	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
15	Mens-watches	mens-watches	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
16	Womens-watches	womens-watches	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
17	Womens-bags	womens-bags	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
18	Womens-jewellery	womens-jewellery	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
19	Sunglasses	sunglasses	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
20	Automotive	automotive	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
21	Motorcycle	motorcycle	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
22	Lighting	lighting	2023-03-31 01:52:56.878518+00	2023-03-31 01:52:56.890543+00
\.


--
-- Data for Name: products_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_discount (id, name, percent, active) FROM stdin;
1	10%	10.00	t
2	20%	20.00	t
3	15%	15.00	t
4	12.96 %	12.96	t
5	17.94 %	17.94	t
6	15.46 %	15.46	t
7	17.91 %	17.91	t
8	10.58 %	10.58	t
9	11.02 %	11.02	t
10	4.15 %	4.15	t
11	10.23 %	10.23	t
12	11.83 %	11.83	t
13	6.18 %	6.18	t
14	8.4 %	8.40	t
15	15.66 %	15.66	t
16	8.14 %	8.14	t
17	15.6 %	15.60	t
18	10.99 %	10.99	t
19	13.31 %	13.31	t
20	4.09 %	4.09	t
21	13.1 %	13.10	t
22	10.68 %	10.68	t
23	16.99 %	16.99	t
24	4.81 %	4.81	t
25	15.58 %	15.58	t
26	8.04 %	8.04	t
27	16.8 %	16.80	t
28	13.58 %	13.58	t
29	17.86 %	17.86	t
30	16.49 %	16.49	t
31	15.34 %	15.34	t
32	2.92 %	2.92	t
33	17.0 %	17.00	t
34	15.59 %	15.59	t
35	4.0 %	4.00	t
36	7.98 %	7.98	t
37	10.89 %	10.89	t
38	12.05 %	12.05	t
39	11.12 %	11.12	t
40	17.2 %	17.20	t
41	13.39 %	13.39	t
42	15.05 %	15.05	t
43	15.37 %	15.37	t
44	15.55 %	15.55	t
45	16.88 %	16.88	t
46	5.07 %	5.07	t
47	16.96 %	16.96	t
48	10.37 %	10.37	t
49	10.83 %	10.83	t
50	2.62 %	2.62	t
51	16.87 %	16.87	t
52	12.76 %	12.76	t
53	14.72 %	14.72	t
54	7.54 %	7.54	t
55	16.44 %	16.44	t
56	15.97 %	15.97	t
57	12.57 %	12.57	t
58	10.91 %	10.91	t
59	12.0 %	12.00	t
60	8.71 %	8.71	t
61	7.55 %	7.55	t
62	7.14 %	7.14	t
63	3.15 %	3.15	t
64	2.56 %	2.56	t
65	10.2 %	10.20	t
66	17.79 %	17.79	t
67	3.23 %	3.23	t
68	16.69 %	16.69	t
69	9.03 %	9.03	t
70	17.55 %	17.55	t
71	8.98 %	8.98	t
72	14.65 %	14.65	t
73	17.5 %	17.50	t
74	10.39 %	10.39	t
75	11.19 %	11.19	t
76	14.87 %	14.87	t
77	13.57 %	13.57	t
78	3.22 %	3.22	t
79	8.02 %	8.02	t
80	12.8 %	12.80	t
81	17.75 %	17.75	t
82	10.1 %	10.10	t
83	6.33 %	6.33	t
84	13.89 %	13.89	t
85	11.27 %	11.27	t
86	10.56 %	10.56	t
87	11.3 %	11.30	t
88	3.19 %	3.19	t
89	17.53 %	17.53	t
90	11.08 %	11.08	t
91	13.63 %	13.63	t
92	14.4 %	14.40	t
93	3.34 %	3.34	t
94	3.85 %	3.85	t
95	17.67 %	17.67	t
96	14.89 %	14.89	t
97	10.94 %	10.94	t
98	5.92 %	5.92	t
99	8.84 %	8.84	t
100	16.0 %	16.00	t
101	8%	8.00	t
102	30%	30.00	t
103	21%	21.00	t
104	36%	36.00	t
\.


--
-- Data for Name: products_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_file (id, name, file, product_id) FROM stdin;
2	\N	image/upload/v1670164983/g6ewzypeexata1zd5vdy.jpg	2
3	\N	image/upload/v1670165365/uxl57c43jqtbiig9vvgr.jpg	4
4	\N	image/upload/v1670440680/w8jhmc2bbtyy4rltuzo9.jpg	3
5	\N	jltgyja3bypkm3xwkphc	5
6	\N	w8nlmfuxam9xjo7nlj6q	5
7	\N	roon3gu4laq0bpdm6deg	5
8	\N	fiat85zsengaoytx4ft7	5
9	\N	vcz6okocyqotuztnwnd3	5
10	\N	cdmn9ulowa1iekbcotyx	6
11	\N	sp0remb4ctiuvcb6m6d7	6
12	\N	imwgaewnbviw6wrqrtrx	6
13	\N	x943ovhgsctvmezadj6w	6
14	\N	vkuo4ezvbmnumhxpzytp	7
15	\N	s1fchvwbo3zpphjnnxhh	8
16	\N	ca0rn4jfz6t9wgylgvm1	8
17	\N	szngp74cwibecgul2q0j	8
18	\N	jzoe744a5glw95wikflt	8
19	\N	fi3yophltn92yihrisaw	8
20	\N	kenenvuqbg7w2wcgns6s	9
21	\N	pombgum7kcpmjt8s1akd	9
22	\N	a2emxijbekpvqy7dqsof	9
23	\N	tve03klcurkivsvx1i4f	10
24	\N	ztc4hl8goodtvjmdkdxu	10
25	\N	onehzuxidftopkfoee5q	10
26	\N	ljfbdtgzzg9tveqrpsse	10
27	\N	cr6ckgjxazrdix0c6lj1	11
28	\N	fymkxh0wxhze9bmexmht	11
29	\N	i2rx81zxdnstjarr2ovf	11
30	\N	vy573rpuqja6hli5vmmr	11
31	\N	kgwl7x4z8xonwbqdou3q	12
32	\N	vy2bdfuacmkkitvf1qu2	12
33	\N	m7tpxxcmpo0g8zxv72le	12
34	\N	kcrbgyso7x6zfwhoixep	12
35	\N	wzow8svlbm6azr0ht1y5	12
36	\N	zefuodtc9otywbxzimbk	13
37	\N	mod20nynpbidwlefgazz	13
38	\N	oqawexlp7y5uwoak9zeo	13
39	\N	rr70yohue131pkwmomuh	13
40	\N	tgvl1wxc1qz60dyneewf	13
41	\N	iolzz6bjla5brdwme0ui	14
42	\N	cxmfdnj8bxgyoy1bdxc9	14
43	\N	ouqa58qylp6v4u18dgd6	14
44	\N	d7lpc1mlwdkuuut1sqr9	14
45	\N	zgbrbgflrnbmamjvnsxq	15
46	\N	mmlszxrf7k35uv1zhaxz	15
47	\N	p4yslhzkdhyzpi8f7znr	15
48	\N	nypxumragsxbnanhdl4p	15
49	\N	o5qunyxy059zq5gkwvat	16
50	\N	gl6ua8xs1ehvac0a1anz	16
51	\N	de2mkkqffxzpnutekfy0	16
52	\N	vsh5rahdsrjisct8hxva	16
53	\N	zvk0jwp6stdizzxlt6vs	16
54	\N	jhhhradwwupojgbi4a46	17
55	\N	v668rctdejrnvx8uiin9	17
56	\N	eaowwujbzmm1c5qvlwyr	17
57	\N	wmdwd3rdg6ml8tngbaxn	17
58	\N	tiyntfnx0tv3ithhj2d0	17
59	\N	yamsu4kjj4blgnjb4zbq	18
60	\N	oai3ni1kkitgye5pmvkb	18
61	\N	kntazruvlqnntw23jfqn	18
62	\N	wl4vwehhcidkqtuvwi48	18
63	\N	x8roq3gfkcbw8sinpmd8	19
64	\N	r3dl8ng46n500cry4wal	19
65	\N	vdk6ebiyd7jlts9tamfw	19
66	\N	xzmlynxk3cjn2ali6u9y	19
67	\N	sepmhslvrgvpwi0cyasn	19
68	\N	mib8fcpl7qzavdtfzjch	20
69	\N	epyh5vz2ctdfwdexwb04	20
70	\N	shv4pzz7wle6rjr4s8el	20
71	\N	hqldpxghrxzv8rrgoda8	20
72	\N	yfca5m89apkqfbp6cg1r	20
73	\N	ehd5bhhhgjqgsyeputk1	21
74	\N	hklgnb7qbzx1ubgfpteg	21
75	\N	egwsvcsqj1tettvshcwb	21
76	\N	uj4jyjdsx7eplazzezna	21
77	\N	bx0yf5ob2rbyvwombqhk	22
78	\N	xetmddlgjh9mwa2ltnyz	22
79	\N	jzqem9klquhv3vi4izjx	22
80	\N	gtmxbkaa7ivkbsmikyjo	22
81	\N	ssaj2hwjehp9k3fcuttp	22
82	\N	vbdkhlyiatezdvifnosc	23
83	\N	wk2ivop86o3tdyncb8t5	23
84	\N	bnrdg6xanqo1e9lojuot	23
85	\N	dmby8phub79mtc9pgpl2	23
86	\N	tdedaly7cpykregvuhso	24
87	\N	laofj4c2cvtxoqxidyf6	24
88	\N	jiyhw2vxnz4yw26poswu	24
89	\N	cohz5gispdpbpc0u5kgf	24
90	\N	sunnnzpjspbf0a6qnt9f	24
91	\N	zck4vm53wglxii4utw8u	25
92	\N	fbu4lz3h8dp5nnj0lr5h	25
93	\N	fjry1eyur6pxojx8caz7	25
94	\N	rom4muxpzmi7awtn34eg	26
95	\N	mrm6myawuw3ahyr7zgyv	26
96	\N	t02ibmguinczcx0osuop	26
97	\N	uwkb4wfffdv3ucpqrygy	27
98	\N	fo2exflagptreo04dfea	27
99	\N	cxobaaowyruuxxfv3gjr	27
100	\N	e5jd6z57btaigh7bvwqe	27
101	\N	nygjuauxf02kkxlwgvxu	27
102	\N	mw51fc3y9ypjhec7kkzs	28
103	\N	d552hu3ezck7bposqv6r	28
104	\N	fem74vkusec07adcd4x7	28
105	\N	xys1jp7onsdgosfiqkex	28
106	\N	s8oweoj67h968bltluwp	28
107	\N	lt8ksdbe3pytesafyqgj	29
108	\N	dcyriknxw8pysmgwbvn2	29
109	\N	edksogc8k2nfdrnkjpxe	29
110	\N	uyzowcpek0lyficnnbxj	29
111	\N	ta9mnfmm0amzatnvn1br	29
112	\N	y7wajcaohmwerg8ria7g	30
113	\N	wcrxqlfalml1kha3wipm	30
114	\N	ouj1j7vkibzstxinfc2k	30
115	\N	b7wzbii5qgtti8zp3qka	30
116	\N	zzcstje6igm8jsp2ys23	30
117	\N	ulxhppyrncuyesqbv8ao	30
118	\N	wjiqtoe4k9bs74ihezqx	31
119	\N	sx0kdxxtmusq7yi90vdx	31
120	\N	di8hx9rg3qvfgmrhew4b	31
121	\N	carrr9yjcknfajglxoai	31
122	\N	bchegz1qrn7e2aa8bvtq	31
123	\N	rnqyihvzwplfu6tuquul	32
124	\N	fnthioey70woextt4siy	32
125	\N	ga9taqkrqlralmfemdgp	32
126	\N	jyophgzkbvmnguwfpc7i	32
127	\N	mvvhiivketumfo3qhqjd	32
128	\N	d0nfwdlcf45nktqul9fk	33
129	\N	oqmkgpcihbk3vtm76c0v	33
130	\N	dhggrod46gsue1ipaehp	33
131	\N	ii9nnrlub1q6beyti2va	33
132	\N	ohkqbc3iggf5ul1cqtvd	33
133	\N	syof0xikg1ud3konaxxe	34
134	\N	mnyrplhub4lkmegh7bux	34
135	\N	vwi22cfmiipyuvdg72zh	34
136	\N	knjarasuk1gytrqaml5s	34
137	\N	kqwmdztw8xsnkhsfyvei	35
138	\N	onibbbd57agj1jlk6vpp	35
139	\N	bq0xkaenwqat9kx2sgd5	35
140	\N	pqtjaq1chwvgpprurlf8	35
141	\N	bq9zefzcuwxl3utjqm0y	35
142	\N	gmcazglfbe9vdqj0nzz7	36
143	\N	fhdn7tndmrd5vgde87cy	36
144	\N	u8irnngurnh3hxjihisc	36
145	\N	gp7jpmxwvtyest2tzjsp	36
146	\N	ekkoezgausz7puddafpl	37
147	\N	bqvggsrjbjomvmf6lcrk	37
148	\N	eap01p3rie21ru3fgoxg	37
149	\N	ro5smzfpbwuugf7h4c5m	37
150	\N	ku2v2opwy0ttrk0gkd7n	37
151	\N	wvavxp2izebekgjvbu4e	38
152	\N	lcntd3fndukciamx5zff	38
153	\N	h6ssg1dhluhsngnb0ucr	38
154	\N	q2mrovel4paba4j6csvy	38
155	\N	wamdfgyjsmj9jggveufq	38
156	\N	f8coeqifyhjbkgpjwvr7	39
157	\N	ykomaf03drcgbaqvluqo	39
158	\N	tpbwfwdi50neb4rf1frx	39
159	\N	vphukal7kvzqmqyk9bth	39
160	\N	o7ynmxxkoyevnbjqw1g2	39
161	\N	dvr3hxji7zehvn7a215u	40
162	\N	nihzjllc0kfswwiqixdf	40
163	\N	bqwnkqmzrvmaaxok1fue	40
164	\N	z5yyammygudeo5zvmsr8	40
165	\N	llxhimo280dkrtxsxjbm	40
166	\N	uckt7m4qrkidj05374aa	41
167	\N	k8a2kgxfe2acllxnhyjb	41
168	\N	ha7srxl9xh7mdcceur5k	41
169	\N	xoyoc1k9asce0klozqbo	41
170	\N	nz1m2l4qr77xaetpsgwu	41
171	\N	mrmixu1bbnvegxq8szoo	42
172	\N	bsfg4gfewxxrdbaipqu8	42
173	\N	akiyudyoyj9uagxugccq	42
174	\N	uvqdkv1luqgrbkdaqc8e	42
175	\N	zvdqj7groi83nchmapr8	43
176	\N	pj93jjr4fnrypebghyiq	43
177	\N	ax3hbaneoujghirbl0cb	43
178	\N	arlo1a0bogacg3rxetvn	43
179	\N	hykgdf5pyf9dfjn4dnud	43
180	\N	amod3if3vehlxwmjga8e	44
181	\N	ngehrbxessasbe4kanqq	44
182	\N	trxjjzffrqb1rhnl9ebl	45
183	\N	cdqffpefoxtrflpwpgzp	45
184	\N	b2fqyzbw2rkllktucafo	45
185	\N	s6j3m5s5hromgmx9vvpi	45
186	\N	xrlxwgab8pra3mgrjfja	45
187	\N	jsfs3moj2t5zpbqmlqbx	46
188	\N	c8rzyokbgtj4l9bzemrg	46
189	\N	rhfdey6hkiwhrkgsuepe	46
190	\N	bvroxmefxqihkmm0vhrt	46
191	\N	xr4pjojzuzadfvmmlxsr	46
192	\N	t3ve0kprwc2ph1vk9kve	47
193	\N	zbiuz9zk09j0rqmicpdd	47
194	\N	lsgopwogxzyklvt7vofd	47
195	\N	npq1crxexbrjpz4ols4k	47
196	\N	d4sq7g5ckj8wdfbopahv	47
197	\N	mxx9ttmk2mjf62qa6uwb	48
198	\N	kdpfvsbgsg1u3ywtlaop	48
199	\N	d7f5kj3icakfewrqa7cs	48
200	\N	xgggsxunuumiltogu9iq	48
201	\N	znbqjtr9x2puz3ucz2k1	48
202	\N	lrxksmhq3n8pu2whvn4r	49
203	\N	zzo4sanq7uzskbfimxpa	49
204	\N	hgt5lznqttu4o2ts2dil	49
205	\N	dhhikkpjzodlwtcwr6r7	49
206	\N	o1j7xyozn0crkzuwteeh	49
207	\N	isqaqsgzgohvuvty1iaj	50
208	\N	afqszjnsg539rhftyixp	50
209	\N	uqh7yrrt04wxnlgbi36m	50
210	\N	eckahtptvxznvyl7rerz	50
211	\N	giwhyrjmr2sprut7j0dj	50
212	\N	ud7z9smoctnt7idmeu4a	51
213	\N	zpgcsj2wchvdrzamzrjy	51
214	\N	kqfg7db5sixgtbz4gbiy	51
215	\N	diyggqrpf0njkehdrh08	51
216	\N	ogccraxjezwi5cce3cgz	52
217	\N	skwsl1yse9qc54tqv8ic	52
218	\N	quxdlwdmd8ezuzxmyz0r	52
219	\N	otjxswobj4sbgwezzuyk	52
220	\N	bpkfd97oyxqvahuuvkgh	52
221	\N	rnzue9goapfgben5xzyu	53
222	\N	ppao36tvw2lrajid8kzu	53
223	\N	gn7evs5y8i2vifmpfvff	53
224	\N	cm6vbjglooiv6vbhxvtl	53
225	\N	qbhpkizhgzi7d1o7ybmf	54
226	\N	edgl1xzokids5yjzbzqo	54
227	\N	mezmugwzwlwr4csbrnyj	54
228	\N	wa8d7rumbfnw4tk3ljcp	55
229	\N	d7vznvn0e1asu8qu1nvc	55
230	\N	uiidxmfyhie7kga6irlx	55
231	\N	obpmza9kuraglcsoajui	55
232	\N	ktjr2kyiuywcakqwfibz	56
233	\N	gnr4nf3dkuktrm5wjvy3	56
234	\N	qzcclmbkxgkqecxgdkhl	56
235	\N	fis9mvtnhrx4zfdvzlez	56
236	\N	kxjdsknslqbqpz9evtrz	56
237	\N	dt4ou9sq8gcldboruvtz	57
238	\N	bkwadycdho1d8gotpg0g	57
239	\N	ldwyz0hmtovpzmdsdecx	57
240	\N	gsnyxztebju7vozvwfn4	57
241	\N	ukojiywqegyy9omm4s28	57
242	\N	flptm2yn7uqtnegbuf7p	58
243	\N	eullxzuvi3zxnl2rvxvw	58
244	\N	rtmwyrwrhyjxkueakwsh	58
245	\N	mwgxbhdp1lqjjxzwe4qq	58
246	\N	t1wdopyogppauadilzjx	58
247	\N	iwseb1zhcpjannkgwhfz	59
248	\N	dbse0mfsjledtynqz6x6	59
249	\N	oncwluxphywec1ycf2ji	59
250	\N	zyz1yyyc7xitybubxjb1	59
251	\N	l1yykmgnvuqjndxnwjak	59
252	\N	e8lrp43uenmyys6yhy6g	60
253	\N	usf4pn9twjtgbghgx67f	60
254	\N	hsawxdmdwxv5ka8vr5zl	60
255	\N	bhwgozctfdcf3b8yshoa	60
256	\N	c7ryjzbh7eubimwxscmf	60
257	\N	rvt32qaa2wkdsnieor7e	60
258	\N	rbjckidozehvqafu1tup	61
259	\N	eexayyiqruyqa21ju5sv	61
260	\N	dumka8yuwj8pbn7dzram	61
261	\N	pnrcwelvzktkdt8kuhp8	61
262	\N	k7sqdw2qgc6mg0adjykk	61
263	\N	bvnrhlztbwt9c3rvanx6	62
264	\N	fveasii9oyshryaqoy0s	62
265	\N	p0vzgm1pafia7kpjk4wq	62
266	\N	j4ltdgwj93lsrwzk8qvm	62
267	\N	f5xpx5t2dogigplc3wvd	62
268	\N	m2y0yra3escwq9z1vdji	63
269	\N	ztbeklm0imzz7nfmpiib	63
270	\N	h3xeyfqgoudc4yumrnch	63
271	\N	n8ccsn2rrih1ugp31g4a	63
272	\N	udnf0gxihfznkovcag2i	63
273	\N	gtqzwxacxjtr9yrrbvfl	64
274	\N	s0syzy6f6pzltod2osi6	64
275	\N	emdh1qwugerr9upazjwi	64
276	\N	gsj0bxddlutdjauckwgb	64
277	\N	ufofn1gljip3ejubiunl	65
278	\N	s1ehtevycocn9vslqubm	65
279	\N	kpsnadkbic6n65hcmtjj	65
280	\N	czpnrnxgappe5lar1wgf	66
281	\N	r1iqnjkl9ef5yjjbtbss	66
282	\N	ly4c4ugqtxctqe3pqp70	67
283	\N	vjs7qiapi9k81k0016di	67
284	\N	hneyd4fnvpxzse7vxytl	67
285	\N	asxrvfdwrdnssei2csna	67
286	\N	shmh2lis4c8cqhor7qpa	68
287	\N	trxz0ttkhbodaprskode	68
288	\N	fmwio8mirt5muae4jesp	68
289	\N	giyovymv938hcvk1dtyb	68
290	\N	iprn4xa61sj0vquvwoty	69
291	\N	qziq8wowywtoatgxm9hj	69
292	\N	gwrjzy0ctjwfigx8z21i	69
293	\N	i96r1qgkoal3w62suvrc	69
294	\N	t2o9kvqya0w3pmm5djmj	69
295	\N	gs2phpeqve6kxtdy9ntz	70
296	\N	nef9fyqigwyzlvpdsawu	70
297	\N	uytzbr8b1i2dl5prszqs	70
298	\N	mtjibmffu6cxoitjdcg4	70
299	\N	wdpprh3got21txbnd5vw	70
300	\N	vhv2pvtmbmsnuytawjxo	71
301	\N	n1bryyu8yas4fb6hqxut	71
302	\N	gupi6ghfq6tvixkd5hyt	71
303	\N	y0tfpfb3029aem9jgiwu	71
304	\N	rtxlgzi9mwelpj9qev0o	71
305	\N	aqx11oopsphzlyjqphgh	72
306	\N	zruogx2ffoxgl77whayn	72
307	\N	jqdihgcaehzt01nekl41	73
308	\N	peksosv0dtekxpv1blnb	73
309	\N	lgd58ddpdyw3glwwptvq	73
310	\N	zedka7zoahgeu1ysvv1f	73
311	\N	zjf7ebgup84nliyad13f	73
312	\N	u7rifdngo6tbqnxhfmwt	74
313	\N	e7wrzoeeb064g5n5d1ly	74
314	\N	ujbzdwjxhzivcijgulri	74
315	\N	qaoc3ahxby9p8lmnxy9j	75
316	\N	ibzzganocnvxtuo4n3jt	75
317	\N	pcryyzuxph4fls1timzc	75
318	\N	spineeyik2xaicqjm3ty	75
319	\N	zey5bryhushbdg0fa0uc	76
320	\N	znugwx9i17wotjz47vzu	76
321	\N	ic7pzhxypilnzqdvbhqn	76
322	\N	qtnzq097ydapoig8oqpr	76
323	\N	qahda81mj8nwdc8wkjru	76
324	\N	qc5ikqw7vqm2st5ols4t	77
325	\N	rjxqtmeo7dnhigptosya	77
326	\N	omm4el5oofazsxllpito	77
327	\N	yztkbd8d7b4tb9qt7mex	77
328	\N	xqzlnuydpbroztv2auux	78
329	\N	ut62u4unnsphu6wxvfgw	78
330	\N	gfbtw1owqapqitmo5kq1	78
331	\N	ideoqtseanuieycr6blm	78
332	\N	xlqjnymrmsfjv6uihjfb	78
333	\N	apggh9nzjftoopx0vpzt	79
334	\N	avfo642stxnz76cfuizq	79
335	\N	xtyeodzgfasrmyyum0bc	79
336	\N	lo6wuz3blwq7uiwrsh9m	79
337	\N	wurewbtsoplo81e6iuyc	80
338	\N	amkamk8yytavfyu2gtgh	80
339	\N	otnaaysydkylbq3n3mhy	80
340	\N	i8pimwagaumergwheamd	81
341	\N	djmrqgue0wpzv46tobxg	81
342	\N	pix2stlz6orapmrbiudq	81
343	\N	vxo72edxds91lh8pefpd	81
344	\N	fdqlc1n09aisvv4pky7i	82
345	\N	umbzuooqgoeotqlju3go	83
346	\N	eguoy9x2tke6lraap3xa	84
347	\N	skypf0jmcuyujp2ndggn	84
348	\N	hm0yqbfbaj5ylkuyyu4w	84
349	\N	cx9uthgd2aulyyltxcfi	84
350	\N	aeqc9oxpkcx8ttvad9bl	84
351	\N	baoqponesnw7kut8qsaq	85
352	\N	fruwzqhy0i1sjpjyjlxl	85
353	\N	vepoaorlhtafocbq9v8m	85
354	\N	kxhsu0sltr2ax1rqfqjs	85
355	\N	c9mttpq9bc2lqklzccrd	85
356	\N	zcs6zmjz6rjscaucccq1	86
357	\N	eubypvtp06qnyweubwl5	86
358	\N	jguwtyc70cohtdjijmmj	86
359	\N	edquqpd22b9jlqpy92ds	86
360	\N	ixcoiv8cwcdwyrlw3dwc	86
361	\N	j3py2wrt3i81tcus9zmh	87
362	\N	czk3jeq9v9nzfyjtobrb	87
363	\N	wszyvqjyoszbnnws8jbg	87
364	\N	cd7fbsqvvr1wdd07ypab	87
365	\N	hgi8wifds8iuvgh4kd4y	87
366	\N	fqx7msthuiej6wral65b	88
367	\N	zw3kuit9ql07umg7eox6	88
368	\N	aih8hlffx7wchhdkwrbx	88
369	\N	ffr9jwmbl02geurymtsn	89
370	\N	vnuyywpydkpzqonxfeeo	89
371	\N	mcpiwcti7jinaiht7r9e	89
372	\N	yddhoqt4pye7bqpcomsk	90
373	\N	mzgl64gxjpgm9gmqrvop	90
374	\N	dw7qpk4h7dn2utygofgm	90
375	\N	yuvkywwqqnez0rwdjyx7	90
376	\N	wqug9tadd30jm6qsfyj8	90
377	\N	kglavw4oitzxrf38ahxr	91
378	\N	itrvgjvqnapjdeiav2u2	91
379	\N	guhe8afam1o2mm4wisbl	91
380	\N	flvyyokcx5qydfkfaedb	91
381	\N	yvbsvhfx8i96e0ozncv0	91
382	\N	x5uhwb4hzplbpipwtrjl	92
383	\N	vk82m4p3aft9d9pbmky0	92
384	\N	sjlpl1enfd9givt0tb9i	92
385	\N	bnhtk8jjptnftbge6rsh	92
386	\N	pmzket5orgfhhk5horjr	92
387	\N	igyu3ajfsq9fok0avb3p	93
388	\N	yehegcnupnpdb0r62p0d	93
389	\N	n62yt8nx3xdezyxjyx4l	93
390	\N	d4we84l0hvlqwkhiobpm	93
391	\N	gso56oo87c8dq7akizmg	93
392	\N	mtnhoqd2trjddxdqydx1	94
393	\N	u6jme6zo3xywicevf58s	94
394	\N	ss3evrumye1rhczr72jg	94
395	\N	sf2aiceo46csbncp9yug	94
396	\N	hjhx5tdz6polmbhat2tl	94
397	\N	ofzdrymn15ywdnzknvce	95
398	\N	l2ny4d9qctdq8d74ms9c	95
399	\N	caghyct2npgmhksudj83	95
400	\N	k6ah0rtcyxnv2ti016kz	95
401	\N	nuptocx68fyqza1c7k3r	95
402	\N	zgactqktvgnrrnkpwumh	96
403	\N	bh7c6ovo9at1jyyyh2zn	96
404	\N	aur1kcf6msku3kpu0tdn	96
405	\N	cf6xgnzim4aw0wxq3fwm	96
406	\N	pcrjvutajbfbrpuzhsbt	97
407	\N	numljvaxr31lqrcda9tx	97
408	\N	pzaeoim2gu79v3eb1gy7	97
409	\N	us7gj2x1g6o6tesdstvj	97
410	\N	arsmb60sayzd90qhxjyf	97
411	\N	dcclobhumol5rpuddpwm	98
412	\N	beeiryzkntdwmeprf9kf	98
413	\N	v0rbcykdi1sqnlk2mfay	98
414	\N	zruscbttvs5zjpznwmyx	98
415	\N	ycgshadkjmcr0dchlatn	99
416	\N	k9hjox46lgvhcar1aihy	99
417	\N	vjlf6xqueifj6rn7amlc	99
418	\N	deue5ltupfapxqh8bsw0	99
419	\N	ln30xszajnonups0ci2a	99
420	\N	o9tkqgbnphkutqn0burn	100
421	\N	sxwjv0w8cth6hjx3h5hv	100
422	\N	xzxvi1c5dteswzjfaj7s	100
423	\N	nictxbtlsbi4yvgnhd97	100
424	\N	g2aqgeaufujsbzn5uiai	100
425	\N	v0maffuxbba6smnfqtwm	101
426	\N	olffbzdn2zfvaspoupxz	101
427	\N	tivbljjtwc5mpgtzzpen	101
428	\N	qlcuzpncviughy1nsu9z	101
429	\N	ooqso7tt5duso8287fnj	101
430	\N	x0x5vx8bu2imftbml00v	102
431	\N	js7erzkvp68wg17msw64	102
432	\N	l0dqjqqmcgz8q24wrupu	102
433	\N	oo74m1znm0inegalp8e8	102
434	\N	kbaxzdeqttu0oi1yvusg	102
435	\N	tktqvsag0vfqqfuwqpby	103
436	\N	xertwwopoyiny5lrga25	103
437	\N	ysb6nmht6ymhoio3u5iv	103
438	\N	bpqywdrfdqoewcq6j2mr	103
439	\N	rvo8dpw1omb2ghfkvhjp	103
440	\N	vfkhyx8qevwb4ubgvurn	104
441	\N	a2ehestq8zcek3hwhq0l	104
442	\N	vhxabmeln1ri0tcxzzrc	104
443	\N	y3gu9wlobozesnle0hmq	104
444	\N	ok2lsexr171hyoxvskbw	105
445	\N	ce3noulrf6xj04108aca	106
446	\N	dnlyx9z8fglnzsxuithu	107
447	\N	tdgps42xwoi5ywvnrk8r	108
448	\N	wmw3jc2fjiolew4eeytu	109
449	\N	mxgulgnprqgokegnht0l	110
450	\N	v6v3dl7dxspdnbduleoh	111
451	\N	lvt2rlsotklcoixobu1m	112
452	\N	image/upload/v1679721316/c2p6o8t5gruuckx2godl.jpg	113
453	\N	image/upload/v1679721316/qbdhcgjsrpc0iizcj5ku.jpg	113
454	\N	image/upload/v1679721317/dr96airpga9cvafje8cs.jpg	113
455	\N	image/upload/v1679721317/xybxachg7zd5i8ahhigl.jpg	113
456	\N	image/upload/v1679721318/dj1zzyggu1jrwgjbr2ij.jpg	113
457	\N	image/upload/v1679721318/bye4ssa5i8uj0liehghu.jpg	113
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, name, price_currency, price, category_id, discount_id, slug, description, created_at, updated_at) FROM stdin;
10	MacBook Pro	USD	1749.0000	2	9	macbook-pro	{"delta": "", "html": "MacBook Pro 2021 with mini-LED display may launch between September, November"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
11	Samsung Galaxy Book	USD	1499.0000	2	10	samsung-galaxy-book	{"delta": "", "html": "Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
12	Microsoft Surface Laptop 4	USD	1499.0000	2	11	microsoft-surface-laptop-4	{"delta": "", "html": "Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
13	Infinix INBOOK	USD	1099.0000	2	12	infinix-inbook	{"delta": "", "html": "Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey \\u2013 1 Year Warranty"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
14	HP Pavilion 15-DK1056WM	USD	1099.0000	2	13	hp-pavilion-15-dk1056wm	{"delta": "", "html": "HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
15	perfume Oil	USD	13.0000	5	14	perfume-oil	{"delta": "", "html": "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
16	Brown Perfume	USD	40.0000	5	15	brown-perfume	{"delta": "", "html": "Royal_Mirage Sport Brown Perfume for Men & Women - 120ml"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
17	Fog Scent Xpressio Perfume	USD	13.0000	5	16	fog-scent-xpressio-perfume	{"delta": "", "html": "Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
18	Non-Alcoholic Concentrated Perfume Oil	USD	120.0000	5	17	non-alcoholic-concentrated-perfume-oil	{"delta": "", "html": "Original Al Munakh\\u00ae by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
19	Eau De Perfume Spray	USD	30.0000	5	18	eau-de-perfume-spray	{"delta": "", "html": "Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
20	Hyaluronic Acid Serum	USD	19.0000	6	19	hyaluronic-acid-serum	{"delta": "", "html": "L'Or\\u00c3\\u00a9al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
21	Tree Oil 30ml	USD	12.0000	6	20	tree-oil-30ml	{"delta": "", "html": "Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
22	Oil Free Moisturizer 100ml	USD	40.0000	6	21	oil-free-moisturizer-100ml	{"delta": "", "html": "Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
23	Skin Beauty Serum.	USD	46.0000	6	22	skin-beauty-serum	{"delta": "", "html": "Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
24	Freckle Treatment Cream- 15gm	USD	70.0000	6	23	freckle-treatment-cream-15gm	{"delta": "", "html": "Fair & Clear is Pakistan's only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
25	- Daal Masoor 500 grams	USD	20.0000	7	24	daal-masoor-500-grams	{"delta": "", "html": "Fine quality Branded Product Keep in a cool and dry place"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
26	Elbow Macaroni - 400 gm	USD	14.0000	7	25	elbow-macaroni-400-gm	{"delta": "", "html": "Product details of Bake Parlor Big Elbow Macaroni - 400 gm"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
27	Orange Essence Food Flavou	USD	14.0000	7	26	orange-essence-food-flavou	{"delta": "", "html": "Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
28	cereals muesli fruit nuts	USD	46.0000	7	27	cereals-muesli-fruit-nuts	{"delta": "", "html": "original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
29	Gulab Powder 50 Gram	USD	70.0000	7	28	gulab-powder-50-gram	{"delta": "", "html": "Dry Rose Flower Powder Gulab Powder 50 Gram \\u2022 Treats Wounds"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
30	Plant Hanger For Home	USD	41.0000	8	29	plant-hanger-for-home	{"delta": "", "html": "Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
31	Flying Wooden Bird	USD	51.0000	8	25	flying-wooden-bird	{"delta": "", "html": "Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
32	3D Embellishment Art Lamp	USD	20.0000	8	30	3d-embellishment-art-lamp	{"delta": "", "html": "3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
33	Handcraft Chinese style	USD	60.0000	8	31	handcraft-chinese-style	{"delta": "", "html": "Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
34	Key Holder	USD	30.0000	8	32	key-holder	{"delta": "", "html": "Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
35	Mornadi Velvet Bed	USD	40.0000	9	33	mornadi-velvet-bed	{"delta": "", "html": "Mornadi Velvet Bed Base with Headboard Slats Support Classic Style Bedroom Furniture Bed Set"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
36	Sofa for Coffe Cafe	USD	50.0000	9	34	sofa-for-coffe-cafe	{"delta": "", "html": "Ratttan Outdoor furniture Set Waterproof  Rattan Sofa for Coffe Cafe"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
37	3 Tier Corner Shelves	USD	700.0000	9	33	3-tier-corner-shelves	{"delta": "", "html": "3 Tier Corner Shelves | 3 PCs Wall Mount Kitchen Shelf | Floating Bedroom Shelf"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
38	Plastic Table	USD	50.0000	9	35	plastic-table	{"delta": "", "html": "V\\ufeffery good quality plastic table for multi purpose now in reasonable price"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
39	3 DOOR PORTABLE	USD	41.0000	9	36	3-door-portable	{"delta": "", "html": "Material: Stainless Steel and Fabric  Item Size: 110 cm x 45 cm x 175 cm Package Contents: 1 Storage Wardrobe"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
3	Acer Predator Triton 500 SE	USD	2900.0000	2	2	acer-predator-triton-500-se	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
4	TCL 32-inch Class 3-Series HD LED Smart Android TV	USD	200.0000	\N	3	tcl-32-inch-class-3-series-hd-led-smart-android-tv	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
40	Sleeve Shirt Womens	USD	90.0000	10	37	sleeve-shirt-womens	{"delta": "", "html": "Cotton Solid Color Professional Wear Sleeve Shirt Womens Work Blouses Wholesale Clothing Casual Plain Custom Top OEM Customized"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
41	ank Tops for Womens/Girls	USD	50.0000	10	38	ank-tops-for-womensgirls	{"delta": "", "html": "PACK OF 3 CAMISOLES ,VERY COMFORTABLE SOFT COTTON STUFF, COMFORTABLE IN ALL FOUR SEASONS"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
42	sublimation plain kids tank	USD	100.0000	10	39	sublimation-plain-kids-tank	{"delta": "", "html": "sublimation plain kids tank tops wholesale"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
43	Women Sweaters Wool	USD	600.0000	10	40	women-sweaters-wool	{"delta": "", "html": "2021 Custom Winter Fall Zebra Knit Crop Top Women Sweaters Wool Mohair Cos Customize Crew Neck Women' S Crop Top Sweater"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
44	women winter clothes	USD	57.0000	10	41	women-winter-clothes	{"delta": "", "html": "women winter clothes thick fleece hoodie top with sweat pantjogger women sweatsuit set joggers pants two piece pants set"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
45	NIGHT SUIT	USD	55.0000	11	42	night-suit	{"delta": "", "html": "NIGHT SUIT RED MICKY MOUSE..  For Girls. Fantastic Suits."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
46	Stiched Kurta plus trouser	USD	80.0000	11	43	stiched-kurta-plus-trouser	{"delta": "", "html": "FABRIC: LILEIN CHEST: 21 LENGHT: 37 TROUSER: (38) :ARABIC LILEIN"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
47	frock gold printed	USD	600.0000	11	44	frock-gold-printed	{"delta": "", "html": "Ghazi fabric long frock gold printed ready to wear stitched collection (G992)"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
48	Ladies Multicolored Dress	USD	79.0000	11	45	ladies-multicolored-dress	{"delta": "", "html": "This classy shirt for women gives you a gorgeous look on everyday wear and specially for semi-casual wears."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
49	Malai Maxi Dress	USD	50.0000	11	46	malai-maxi-dress	{"delta": "", "html": "Ready to wear, Unique design according to modern standard fashion, Best fitting ,Imported stuff"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
50	women's shoes	USD	40.0000	12	47	womens-shoes	{"delta": "", "html": "Close: Lace, Style with bottom: Increased inside, Sole Material: Rubber"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
51	Sneaker shoes	USD	120.0000	12	48	sneaker-shoes	{"delta": "", "html": "Synthetic Leather Casual Sneaker shoes for Women/girls Sneakers For Women"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
52	Women Strip Heel	USD	40.0000	12	49	women-strip-heel	{"delta": "", "html": "Features: Flip-flops, Mid Heel, Comfortable, Striped Heel, Antiskid, Striped"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
53	Chappals & Shoe Ladies Metallic	USD	23.0000	12	50	chappals-shoe-ladies-metallic	{"delta": "", "html": "Womens Chappals & Shoe Ladies Metallic Tong Thong Sandal Flat Summer 2020 Maasai Sandals"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
54	Women Shoes	USD	36.0000	12	51	women-shoes	{"delta": "", "html": "2020 New Arrivals Genuine Leather Fashion Trend Platform Summer Women Shoes"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
55	half sleeves T shirts	USD	23.0000	13	52	half-sleeves-t-shirts	{"delta": "", "html": "Many store is creating new designs and trend every month and every year. Daraz.pk have a beautiful range of men fashion brands"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
56	FREE FIRE T Shirt	USD	10.0000	13	53	free-fire-t-shirt	{"delta": "", "html": "quality and professional print - It doesn't just look high quality, it is high quality."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
57	printed high quality T shirts	USD	35.0000	13	54	printed-high-quality-t-shirts	{"delta": "", "html": "Brand: vintage Apparel ,Export quality"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
58	Pubg Printed Graphic T-Shirt	USD	46.0000	13	55	pubg-printed-graphic-t-shirt	{"delta": "", "html": "Product Description Features: 100% Ultra soft Polyester Jersey. Vibrant & colorful printing on front. Feels soft as cotton without ever cracking"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
59	Money Heist Printed Summer T Shirts	USD	66.0000	13	56	money-heist-printed-summer-t-shirts	{"delta": "", "html": "Fabric Jercy, Size: M & L Wear Stylish Dual Stiched"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
60	Sneakers Joggers Shoes	USD	40.0000	14	57	sneakers-joggers-shoes	{"delta": "", "html": "Gender: Men , Colors: Same as DisplayedCondition: 100% Brand New"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
61	Loafers for men	USD	47.0000	14	58	loafers-for-men	{"delta": "", "html": "Men Shoes - Loafers for men - Rubber Shoes - Nylon Shoes - Shoes for men - Moccassion - Pure Nylon (Rubber) Expot Quality."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
62	formal offices shoes	USD	57.0000	14	59	formal-offices-shoes	{"delta": "", "html": "Pattern Type: Solid, Material: PU, Toe Shape: Pointed Toe ,Outsole Material: Rubber"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
63	Spring and summershoes	USD	20.0000	14	60	spring-and-summershoes	{"delta": "", "html": "Comfortable stretch cloth, lightweight body; ,rubber sole, anti-skid wear;"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
64	Stylish Casual Jeans Shoes	USD	58.0000	14	61	stylish-casual-jeans-shoes	{"delta": "", "html": "High Quality ,Stylish design ,Comfortable wear ,FAshion ,Durable"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
65	Leather Straps Wristwatch	USD	120.0000	15	62	leather-straps-wristwatch	{"delta": "", "html": "Style:Sport ,Clasp:Buckles ,Water Resistance Depth:3Bar"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
66	Waterproof Leather Brand Watch	USD	46.0000	15	63	waterproof-leather-brand-watch	{"delta": "", "html": "Watch Crown With Environmental IPS Bronze Electroplating; Display system of 12 hours"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
67	Royal Blue Premium Watch	USD	50.0000	15	64	royal-blue-premium-watch	{"delta": "", "html": "Men Silver Chain Royal Blue Premium Watch Latest Analog Watch"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
68	Leather Strap Skeleton Watch	USD	46.0000	15	65	leather-strap-skeleton-watch	{"delta": "", "html": "Leather Strap Skeleton Watch for Men - Stylish and Latest Design"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
69	Stainless Steel Wrist Watch	USD	47.0000	15	66	stainless-steel-wrist-watch	{"delta": "", "html": "Stylish Watch For Man (Luxury) Classy Men's Stainless Steel Wrist Watch - Box Packed"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
70	Steel Analog Couple Watches	USD	35.0000	16	67	steel-analog-couple-watches	{"delta": "", "html": "Elegant design, Stylish ,Unique & Trendy,Comfortable wear"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
71	Fashion Magnetic Wrist Watch	USD	60.0000	16	68	fashion-magnetic-wrist-watch	{"delta": "", "html": "Buy this awesome  The product is originally manufactured by the company and it's a top selling product with a very reasonable"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
72	Stylish Luxury Digital Watch	USD	57.0000	16	69	stylish-luxury-digital-watch	{"delta": "", "html": "Stylish Luxury Digital Watch For Girls / Women - Led Smart Ladies Watches For Girls"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
73	Golden Watch Pearls Bracelet Watch	USD	47.0000	16	70	golden-watch-pearls-bracelet-watch	{"delta": "", "html": "Product details of Golden Watch Pearls Bracelet Watch For Girls - Golden Chain Ladies Bracelate Watch for Women"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
74	Stainless Steel Women	USD	35.0000	16	71	stainless-steel-women	{"delta": "", "html": "Fashion Skmei 1830 Shell Dial Stainless Steel Women Wrist Watch Lady Bracelet Watch Quartz Watches Ladies"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
75	Women Shoulder Bags	USD	46.0000	17	72	women-shoulder-bags	{"delta": "", "html": "LouisWill Women Shoulder Bags Long Clutches Cross Body Bags Phone Bags PU Leather Hand Bags Large Capacity Card Holders Zipper Coin Purses Fashion Crossbody Bags for Girls Ladies"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
76	Handbag For Girls	USD	23.0000	17	73	handbag-for-girls	{"delta": "", "html": "This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
77	Fancy hand clutch	USD	44.0000	17	74	fancy-hand-clutch	{"delta": "", "html": "This fashion is designed to add a charming effect to your casual outfit. This Bag is made of synthetic leather."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
78	Leather Hand Bag	USD	57.0000	17	75	leather-hand-bag	{"delta": "", "html": "It features an attractive design that makes it a must have accessory in your collection. We sell different kind of bags for boys, kids, women, girls and also for unisex."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
79	Seven Pocket Women Bag	USD	68.0000	17	76	seven-pocket-women-bag	{"delta": "", "html": "Seven Pocket Women Bag Handbags Lady Shoulder Crossbody Bag Female Purse Seven Pocket Bag"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
80	Silver Ring Set Women	USD	70.0000	18	77	silver-ring-set-women	{"delta": "", "html": "Jewelry Type:RingsCertificate Type:NonePlating:Silver PlatedShapeattern:noneStyle:CLASSICReligious"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
81	Rose Ring	USD	100.0000	18	78	rose-ring	{"delta": "", "html": "Brand: The Greetings Flower Colour: RedRing Colour: GoldenSize: Adjustable"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
82	Rhinestone Korean Style Open Rings	USD	30.0000	18	79	rhinestone-korean-style-open-rings	{"delta": "", "html": "Fashion Jewellery 3Pcs Adjustable Pearl Rhinestone Korean Style Open Rings For Women"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
83	Elegant Female Pearl Earrings	USD	30.0000	18	80	elegant-female-pearl-earrings	{"delta": "", "html": "Elegant Female Pearl Earrings Set Zircon Pearl Earings Women Party Accessories 9 Pairs/Set"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
84	Chain Pin Tassel Earrings	USD	45.0000	18	81	chain-pin-tassel-earrings	{"delta": "", "html": "Pair Of Ear Cuff Butterfly Long Chain Pin Tassel Earrings - Silver ( Long Life Quality Product)"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
85	Round Silver Frame Sun Glasses	USD	19.0000	19	82	round-silver-frame-sun-glasses	{"delta": "", "html": "A pair of sunglasses can protect your eyes from being hurt. For car driving, vacation travel, outdoor activities, social gatherings,"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
86	Kabir Singh Square Sunglass	USD	50.0000	19	17	kabir-singh-square-sunglass	{"delta": "", "html": "Orignal Metal Kabir Singh design 2020 Sunglasses Men Brand Designer Sun Glasses Kabir Singh Square Sunglass"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
87	Wiley X Night Vision Yellow Glasses	USD	30.0000	19	83	wiley-x-night-vision-yellow-glasses	{"delta": "", "html": "Wiley X Night Vision Yellow Glasses for Riders - Night Vision Anti Fog Driving Glasses - Free Night Glass Cover - Shield Eyes From Dust and Virus- For Night Sport Matches"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
88	Square Sunglasses	USD	28.0000	19	84	square-sunglasses	{"delta": "", "html": "Fashion Oversized Square Sunglasses Retro Gradient Big Frame Sunglasses For Women One Piece Gafas Shade Mirror Clear Lens 17059"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
89	LouisWill Men Sunglasses	USD	50.0000	19	85	louiswill-men-sunglasses	{"delta": "", "html": "LouisWill Men Sunglasses Polarized Sunglasses UV400 Sunglasses Day Night Dual Use Safety Driving Night Vision Eyewear AL-MG Frame Sun Glasses with Free Box for Drivers"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
90	Bluetooth Aux	USD	25.0000	20	86	bluetooth-aux	{"delta": "", "html": "Bluetooth Aux Bluetooth Car Aux Car Bluetooth Transmitter Aux Audio Receiver Handfree Car Bluetooth Music Receiver Universal 3.5mm Streaming A2DP Wireless Auto AUX Audio Adapter With Mic For Phone MP3"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
91	t Temperature Controller Incubator Controller	USD	40.0000	20	87	t-temperature-controller-incubator-controller	{"delta": "", "html": "Both Heat and Cool Purpose, Temperature control range; -50 to +110, Temperature measurement accuracy; 0.1, Control accuracy; 0.1"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
92	TC Reusable Silicone Magic Washing Gloves	USD	29.0000	20	88	tc-reusable-silicone-magic-washing-gloves	{"delta": "", "html": "TC Reusable Silicone Magic Washing Gloves with Scrubber, Cleaning Brush Scrubber Gloves Heat Resistant Pair for Cleaning of Kitchen, Dishes, Vegetables and Fruits, Bathroom, Car Wash, Pet Care and Multipurpose"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
93	Qualcomm original Car Charger	USD	40.0000	20	89	qualcomm-original-car-charger	{"delta": "", "html": "best Quality CHarger , Highly Recommended to all best Quality CHarger , Highly Recommended to all"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
94	Cycle Bike Glow	USD	35.0000	20	90	cycle-bike-glow	{"delta": "", "html": "Universal fitment and easy to install no special wires, can be easily installed and removed. Fits most standard tyre air stem valves of road, mountain bicycles, motocycles and cars.Bright led will turn on w"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
95	Black Motorbike	USD	569.0000	21	91	black-motorbike	{"delta": "", "html": "Engine Type:Wet sump, Single Cylinder, Four Stroke, Two Valves, Air Cooled with SOHC (Single Over Head Cam) Chain Drive Bore & Stroke:47.0 x 49.5 MM"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
96	HOT SALE IN EUROPE electric racing motorcycle	USD	920.0000	21	92	hot-sale-in-europe-electric-racing-motorcycle	{"delta": "", "html": "HOT SALE IN EUROPE electric racing motorcycle electric motorcycle for sale adult electric motorcycles"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
97	Automatic Motor Gas Motorcycles	USD	1050.0000	21	93	automatic-motor-gas-motorcycles	{"delta": "", "html": "150cc 4-Stroke Motorcycle Automatic Motor Gas Motorcycles Scooter motorcycles 150cc scooter"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
98	new arrivals Fashion motocross goggles	USD	900.0000	21	94	new-arrivals-fashion-motocross-goggles	{"delta": "", "html": "new arrivals Fashion motocross goggles motorcycle motocross racing motorcycle"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
99	Wholesale cargo lashing Belt	USD	930.0000	21	95	wholesale-cargo-lashing-belt	{"delta": "", "html": "Wholesale cargo lashing Belt Tie Down end Ratchet strap customized strap 25mm motorcycle 1500kgs with rubber handle"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
100	lighting ceiling kitchen	USD	30.0000	22	96	lighting-ceiling-kitchen	{"delta": "", "html": "Wholesale slim hanging decorative kid room lighting ceiling kitchen chandeliers pendant light modern"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
101	Metal Ceramic Flower	USD	35.0000	22	97	metal-ceramic-flower	{"delta": "", "html": "Metal Ceramic Flower Chandelier Home Lighting American Vintage Hanging Lighting Pendant Lamp"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
102	3 lights lndenpant kitchen islang	USD	34.0000	22	98	3-lights-lndenpant-kitchen-islang	{"delta": "", "html": "3 lights lndenpant kitchen islang dining room pendant rice paper chandelier contemporary led pendant light modern chandelier"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
103	American Vintage Wood Pendant Light	USD	46.0000	22	99	american-vintage-wood-pendant-light	{"delta": "", "html": "American Vintage Wood Pendant Light Farmhouse Antique Hanging Lamp Lampara Colgante"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
104	Crystal chandelier maria theresa for 12 light	USD	47.0000	22	100	crystal-chandelier-maria-theresa-for-12-light	{"delta": "", "html": "Crystal chandelier maria theresa for 12 light"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
107	OnePlus 10 Pro | 5G Android Smartphone	USD	697.1700	1	\N	oneplus-10-pro-5g-android-smartphone	{"delta": "", "html": ""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
112	Apple iPhone 11 Pro Max	USD	689.0000	1	\N	apple-iphone-11-pro-max	{"delta": "", "html": ""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
5	iPhone 9	USD	549.0000	1	4	iphone-9	{"delta": "", "html": "An apple mobile which is nothing like apple"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
6	iPhone X	USD	899.0000	1	5	iphone-x	{"delta": "", "html": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ..."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
7	Samsung Universe 9	USD	1249.0000	1	6	samsung-universe-9	{"delta": "", "html": "Samsung's new variant which goes beyond Galaxy to the Universe"}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
8	OPPOF19	USD	280.0000	1	7	oppof19	{"delta": "", "html": "OPPO F19 is officially announced on April 2021."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
9	Huawei P30	USD	499.0000	1	8	huawei-p30	{"delta": "", "html": "Huawei\\u2019s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK."}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
109	Samsung Galaxy S20 FE 5G	USD	550.0000	1	101	samsung-galaxy-s20-fe-5g	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
108	iPhone 13 Pro Max	USD	1101.0000	1	102	iphone-13-pro-max	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
111	OnePlus Nord N200 | 5G	USD	189.9900	1	103	oneplus-nord-n200-5g	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
110	SAMSUNG Galaxy Z Fold 3 5G Cell Phone	USD	1144.0000	1	104	samsung-galaxy-z-fold-3-5g-cell-phone	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
105	ONEPLUS 10T | Moonstone Black | 5G	USD	549.9900	1	3	oneplus-10t-moonstone-black-5g	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
106	Apple iPhone 12	USD	504.0000	1	2	apple-iphone-12	{"delta":"","html":""}	2023-03-31 01:52:56.89608+00	2023-03-31 01:52:56.902893+00
2	SAMSUNG Galaxy S22+ Cell Phone	USD	910.0000	1	1	samsung-galaxy-s22-cell-phone	{"delta":"{\\"ops\\":[{\\"insert\\":\\"6.6\\\\\\", 1080 x 2340pixels, Infinity-O FHD+ Dynamic AMOLED 2X Display, 4500mAh Battery, Wireless Powershare\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"128GB ROM, 8GB RAM, No SD Card Slot, Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm), Octa-Core, Adreno 730\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"Rear Camera: 50MP, f/1.8 + 10MP, f/2.4 + 12MP, f/2.2, Front Camera: 10 MP, f/2.2, Android 12, One UI 4.1\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"2G: GSM 850/900/1800/1900, CDMA 800/1900, 3G: HSDPA 850/900/1700(AWS)/1900/2100, CDMA2000 1xEV-DO, 4G LTE: 1/2/3/4/5/7/8/12/13/14/18/19/20/25/26/28/29/30/38/39/40/41/46/48/66/71, 5G: 1/3/5/7/8/20/28/38/41/66/71/260/261SA/NSA/Sub6/mmWave - Single SIM\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"No Warranty. Compatible with Most GSM and CDMA Carriers like T-Mobile, AT&T, MetroPCS, etc. Will Also work with CDMA Carriers Such as Verizon, Sprint.\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"}]}","html":"<ul><li>6.6\\", 1080 x 2340pixels, Infinity-O FHD+ Dynamic AMOLED 2X Display, 4500mAh Battery, Wireless Powershare</li><li>128GB ROM, 8GB RAM, No SD Card Slot, Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm), Octa-Core, Adreno 730</li><li>Rear Camera: 50MP, f/1.8 + 10MP, f/2.4 + 12MP, f/2.2, Front Camera: 10 MP, f/2.2, Android 12, One UI 4.1</li><li>2G: GSM 850/900/1800/1900, CDMA 800/1900, 3G: HSDPA 850/900/1700(AWS)/1900/2100, CDMA2000 1xEV-DO, 4G LTE: 1/2/3/4/5/7/8/12/13/14/18/19/20/25/26/28/29/30/38/39/40/41/46/48/66/71, 5G: 1/3/5/7/8/20/28/38/41/66/71/260/261SA/NSA/Sub6/mmWave - Single SIM</li><li>No Warranty. Compatible with Most GSM and CDMA Carriers like T-Mobile, AT&amp;T, MetroPCS, etc. Will Also work with CDMA Carriers Such as Verizon, Sprint.</li></ul>"}	2023-03-31 01:52:56.89608+00	2023-03-31 02:33:38.087556+00
113	SAMSUNG Galaxy S23 Ultra Cell Phone	USD	1379.0000	1	1	samsung-galaxy-s23-ultra-cell-phone	{"delta":"{\\"ops\\":[{\\"insert\\":\\"CAPTURE THE NIGHT IN LOW LIGHT: Whether you’re headed to a concert or romantic night out, there’s no such thing as bad lighting with Night Mode; Galaxy S23 Ultra lets you capture epic content in any setting with stunning Nightography\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"HIGHEST PHONE CAMERA RESOLUTION: Create crystal-clear content worth sharing with Galaxy S23 Ultra’s 200MP camera — the highest camera resolution on a phone; Whether you’re posting or printing, Galaxy S23 Ultra always does the moment justice\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"STUNNINGLY SMOOTH VIDEO: Capture incredibly smooth video during life’s most exciting moments; With Video Stabilization, this smartphone easily records daytime outdoor adventures or those spur-of-the-moment dance parties at night\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"WRITE, DRAW, CREATE w/ S PEN: Whether you’re in Samsung Note, Microsoft Office or Google Suite, with the built-in S Pen, you can convert handwriting to text, share your creations live and keep everything on your Galaxy S23 Ultra device\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"SNAP PICS w/ S PEN: Capture epic selfies and beautiful photos with the click of your S Pen; Simply open up the camera app and click the button on the S Pen instead of the screen; Getting that great shot just got easier\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"FASTEST MOBILE PROCESSOR AVAILABLE: Whether you’re working hard, playing hard or doing both at the same time, smoothly switch between apps with our fastest processor ever\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"UNLOCK SMOOTH GAMING: Game at full throttle and smoothly switch between apps; Get more done with our fastest processor ever combined with massive internal storage; And if you’re on the move, keep going with a screen that adapts to your environment\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"BATTERY THAT POWERS YOUR DAY: Power through a packed day* or long night of gaming without worrying about your phone dying; The robust 5,000mAh battery has been fine-tuned with a smarter processor that helps manage energy usage without slowing you down\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"MORE STORAGE. MORE MEMORIES: You’re good on storage space; With an impressive amount of storage, starting at 256GB, you can enjoy being behind the camera without the stress that comes with getting close to filling up your phone\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"ADAPTIVE DISPLAY: Watch your content comfortably as Adaptive Vision Booster helps your screen adapt to your environment; Whether out in direct sunlight or in bed with the lights off, the contrast on Samsung Galaxy S23 Ultra's expansive screen still looks amazing\\"},{\\"attributes\\":{\\"list\\":\\"bullet\\"},\\"insert\\":\\"\\\\n\\"},{\\"insert\\":\\"\\\\n\\"}]}","html":"<ul><li>CAPTURE THE NIGHT IN LOW LIGHT: Whether you’re headed to a concert or romantic night out, there’s no such thing as bad lighting with Night Mode; Galaxy S23 Ultra lets you capture epic content in any setting with stunning Nightography</li><li>HIGHEST PHONE CAMERA RESOLUTION: Create crystal-clear content worth sharing with Galaxy S23 Ultra’s 200MP camera — the highest camera resolution on a phone; Whether you’re posting or printing, Galaxy S23 Ultra always does the moment justice</li><li>STUNNINGLY SMOOTH VIDEO: Capture incredibly smooth video during life’s most exciting moments; With Video Stabilization, this smartphone easily records daytime outdoor adventures or those spur-of-the-moment dance parties at night</li><li>WRITE, DRAW, CREATE w/ S PEN: Whether you’re in Samsung Note, Microsoft Office or Google Suite, with the built-in S Pen, you can convert handwriting to text, share your creations live and keep everything on your Galaxy S23 Ultra device</li><li>SNAP PICS w/ S PEN: Capture epic selfies and beautiful photos with the click of your S Pen; Simply open up the camera app and click the button on the S Pen instead of the screen; Getting that great shot just got easier</li><li>FASTEST MOBILE PROCESSOR AVAILABLE: Whether you’re working hard, playing hard or doing both at the same time, smoothly switch between apps with our fastest processor ever</li><li>UNLOCK SMOOTH GAMING: Game at full throttle and smoothly switch between apps; Get more done with our fastest processor ever combined with massive internal storage; And if you’re on the move, keep going with a screen that adapts to your environment</li><li>BATTERY THAT POWERS YOUR DAY: Power through a packed day* or long night of gaming without worrying about your phone dying; The robust 5,000mAh battery has been fine-tuned with a smarter processor that helps manage energy usage without slowing you down</li><li>MORE STORAGE. MORE MEMORIES: You’re good on storage space; With an impressive amount of storage, starting at 256GB, you can enjoy being behind the camera without the stress that comes with getting close to filling up your phone</li><li>ADAPTIVE DISPLAY: Watch your content comfortably as Adaptive&nbsp;Vision&nbsp;Booster helps your&nbsp;screen&nbsp;adapt to your environment; Whether out in direct sunlight or in bed with the lights off, the contrast on Samsung Galaxy S23 Ultra's expansive&nbsp;screen&nbsp;still looks amazing</li></ul><p><br></p>"}	2023-03-31 01:52:56.89608+00	2023-03-31 02:34:17.570074+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_commandhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_commandhistory_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 22, true);


--
-- Name: products_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_discount_id_seq', 104, true);


--
-- Name: products_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_file_id_seq', 457, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 113, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: core_commandhistory core_commandhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_commandhistory
    ADD CONSTRAINT core_commandhistory_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_slug_key UNIQUE (slug);


--
-- Name: products_discount products_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_pkey PRIMARY KEY (id);


--
-- Name: products_file products_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_file
    ADD CONSTRAINT products_file_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: products_category_slug_c558efae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_slug_c558efae_like ON public.products_category USING btree (slug varchar_pattern_ops);


--
-- Name: products_file_product_id_fff42171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_file_product_id_fff42171 ON public.products_file USING btree (product_id);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_product_discount_id_8fe9ca7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_discount_id_8fe9ca7a ON public.products_product USING btree (discount_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_file products_file_product_id_fff42171_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_file
    ADD CONSTRAINT products_file_product_id_fff42171_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_discount_id_8fe9ca7a_fk_products_discount_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_discount_id_8fe9ca7a_fk_products_discount_id FOREIGN KEY (discount_id) REFERENCES public.products_discount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

