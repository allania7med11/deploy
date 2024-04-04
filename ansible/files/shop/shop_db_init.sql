--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE shop_db;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:vB6R/QWWK3Dn8VO33mNIIg==$G6FGbEKryWoOvtNAVGeO9/3IPDbyqUr4BcXlXHNBPXc=:BiPekGgtV2BlNvchhGOR7E6WOmPBBBVp25mNfkCKYUA=';






--
-- Databases
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "shop_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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

--
-- Name: shop_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shop_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE shop_db OWNER TO postgres;

\connect shop_db

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


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
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

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
-- Name: products_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_order (
    id bigint NOT NULL,
    order_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2),
    status character varying(50) NOT NULL,
    user_id integer,
    uuid uuid
);


ALTER TABLE public.products_order OWNER TO postgres;

--
-- Name: products_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_order_id_seq OWNER TO postgres;

--
-- Name: products_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_order_id_seq OWNED BY public.products_order.id;


--
-- Name: products_orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_orderitems (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    subtotal numeric(10,2),
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT products_orderitems_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.products_orderitems OWNER TO postgres;

--
-- Name: products_orderitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_orderitems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_orderitems_id_seq OWNER TO postgres;

--
-- Name: products_orderitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_orderitems_id_seq OWNED BY public.products_orderitems.id;


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
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(200) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL,
    provider_id character varying(200) NOT NULL,
    settings jsonb NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


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
-- Name: products_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_order ALTER COLUMN id SET DEFAULT nextval('public.products_order_id_seq'::regclass);


--
-- Name: products_orderitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_orderitems ALTER COLUMN id SET DEFAULT nextval('public.products_orderitems_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


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
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add email address	9	add_emailaddress
34	Can change email address	9	change_emailaddress
35	Can delete email address	9	delete_emailaddress
36	Can view email address	9	view_emailaddress
37	Can add email confirmation	10	add_emailconfirmation
38	Can change email confirmation	10	change_emailconfirmation
39	Can delete email confirmation	10	delete_emailconfirmation
40	Can view email confirmation	10	view_emailconfirmation
41	Can add social account	11	add_socialaccount
42	Can change social account	11	change_socialaccount
43	Can delete social account	11	delete_socialaccount
44	Can view social account	11	view_socialaccount
45	Can add social application	12	add_socialapp
46	Can change social application	12	change_socialapp
47	Can delete social application	12	delete_socialapp
48	Can view social application	12	view_socialapp
49	Can add social application token	13	add_socialtoken
50	Can change social application token	13	change_socialtoken
51	Can delete social application token	13	delete_socialtoken
52	Can view social application token	13	view_socialtoken
53	Can add command history	14	add_commandhistory
54	Can change command history	14	change_commandhistory
55	Can delete command history	14	delete_commandhistory
56	Can view command history	14	view_commandhistory
57	Can add category	15	add_category
58	Can change category	15	change_category
59	Can delete category	15	delete_category
60	Can view category	15	view_category
61	Can add discount	16	add_discount
62	Can change discount	16	change_discount
63	Can delete discount	16	delete_discount
64	Can view discount	16	view_discount
65	Can add product	17	add_product
66	Can change product	17	change_product
67	Can delete product	17	delete_product
68	Can view product	17	view_product
69	Can add file	18	add_file
70	Can change file	18	change_file
71	Can delete file	18	delete_file
72	Can view file	18	view_file
73	Can add order	19	add_order
74	Can change order	19	change_order
75	Can delete order	19	delete_order
76	Can view order	19	view_order
77	Can add order items	20	add_orderitems
78	Can change order items	20	change_orderitems
79	Can delete order items	20	delete_orderitems
80	Can view order items	20	view_orderitems
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
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
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: core_commandhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.core_commandhistory (id, name, applied_at) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
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
7	authtoken	token
8	authtoken	tokenproxy
9	account	emailaddress
10	account	emailconfirmation
11	socialaccount	socialaccount
12	socialaccount	socialapp
13	socialaccount	socialtoken
14	core	commandhistory
15	products	category
16	products	discount
17	products	product
18	products	file
19	products	order
20	products	orderitems
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-04-04 00:48:45.320857+00
2	auth	0001_initial	2024-04-04 00:48:45.377319+00
3	account	0001_initial	2024-04-04 00:48:45.406357+00
4	account	0002_email_max_length	2024-04-04 00:48:45.416625+00
5	account	0003_alter_emailaddress_create_unique_verified_email	2024-04-04 00:48:45.436447+00
6	account	0004_alter_emailaddress_drop_unique_email	2024-04-04 00:48:45.450474+00
7	account	0005_emailaddress_idx_upper_email	2024-04-04 00:48:45.462488+00
8	admin	0001_initial	2024-04-04 00:48:45.482553+00
9	admin	0002_logentry_remove_auto_add	2024-04-04 00:48:45.491092+00
10	admin	0003_logentry_add_action_flag_choices	2024-04-04 00:48:45.501249+00
11	contenttypes	0002_remove_content_type_name	2024-04-04 00:48:45.521616+00
12	auth	0002_alter_permission_name_max_length	2024-04-04 00:48:45.533273+00
13	auth	0003_alter_user_email_max_length	2024-04-04 00:48:45.543432+00
14	auth	0004_alter_user_username_opts	2024-04-04 00:48:45.552942+00
15	auth	0005_alter_user_last_login_null	2024-04-04 00:48:45.563377+00
16	auth	0006_require_contenttypes_0002	2024-04-04 00:48:45.565457+00
17	auth	0007_alter_validators_add_error_messages	2024-04-04 00:48:45.573608+00
18	auth	0008_alter_user_username_max_length	2024-04-04 00:48:45.58658+00
19	auth	0009_alter_user_last_name_max_length	2024-04-04 00:48:45.598043+00
20	auth	0010_alter_group_name_max_length	2024-04-04 00:48:45.608168+00
21	auth	0011_update_proxy_permissions	2024-04-04 00:48:45.617716+00
22	auth	0012_alter_user_first_name_max_length	2024-04-04 00:48:45.627183+00
23	authtoken	0001_initial	2024-04-04 00:48:45.644986+00
24	authtoken	0002_auto_20160226_1747	2024-04-04 00:48:45.703107+00
25	authtoken	0003_tokenproxy	2024-04-04 00:48:45.706048+00
26	core	0001_initial	2024-04-04 00:48:45.712873+00
27	products	0001_initial	2024-04-04 00:48:45.747204+00
28	products	0002_product_slug_alter_category_name_alter_category_slug	2024-04-04 00:48:45.763071+00
29	products	0002_product_description	2024-04-04 00:48:45.770668+00
30	products	0003_merge_20230206_2022	2024-04-04 00:48:45.773201+00
31	products	0004_category_created_at_category_updated_at_and_more	2024-04-04 00:48:45.7927+00
32	products	0005_order_alter_product_options_orderitems	2024-04-04 00:48:45.837038+00
33	products	0006_alter_order_total_amount_alter_orderitems_subtotal	2024-04-04 00:48:45.856185+00
34	products	0007_alter_orderitems_unique_together	2024-04-04 00:48:45.869271+00
35	products	0008_alter_orderitems_quantity	2024-04-04 00:48:45.880915+00
36	products	0009_remove_order_session_id_order_uuid	2024-04-04 00:48:45.90249+00
37	products	0010_alter_order_uuid_alter_orderitems_order	2024-04-04 00:48:45.925774+00
38	sessions	0001_initial	2024-04-04 00:48:45.937612+00
39	socialaccount	0001_initial	2024-04-04 00:48:46.012401+00
40	socialaccount	0002_token_max_lengths	2024-04-04 00:48:46.036229+00
41	socialaccount	0003_extra_data_default_dict	2024-04-04 00:48:46.048737+00
42	socialaccount	0004_app_provider_id_settings	2024-04-04 00:48:46.068779+00
43	socialaccount	0005_socialtoken_nullable_app	2024-04-04 00:48:46.093812+00
44	socialaccount	0006_alter_socialaccount_extra_data	2024-04-04 00:48:46.113891+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
3cw47l3key5wme4u7ncp36aauziasbn0	eyJvcmRlcl91dWlkIjoiYjljOTQ3MWMtNjhiMS00ZjljLWIyMmMtNTBlMGI0OGEzZTIwIn0:1rsBMp:d2TJG66oPNmFfE1ET4752bhhvISziX_9WEmcbmuUAKo	2024-04-18 00:54:11.830015+00
66n8fcs4ieb4ldlza9vv9curuiz3908w	eyJvcmRlcl91dWlkIjoiYzdkNWU5Y2YtYjAzZS00Zjc1LTgzYTEtODc4ZGFlYzg0ZmU4In0:1rsBQB:1zyXypupUpfpy0vOn6sucgPD3BYTLDIRFTG4g7An_TM	2024-04-18 00:57:39.775055+00
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category (id, name, slug, created_at, updated_at) FROM stdin;
1	mobiles	mobiles	2024-04-04 00:57:19.387676+00	2024-04-04 00:57:19.387691+00
2	Smartphones	smartphones	2024-04-04 00:57:58.616441+00	2024-04-04 00:57:58.616456+00
3	Laptops	laptops	2024-04-04 00:58:10.528237+00	2024-04-04 00:58:10.52827+00
4	Fragrances	fragrances	2024-04-04 00:58:26.604271+00	2024-04-04 00:58:26.604286+00
5	Skincare	skincare	2024-04-04 00:58:50.988322+00	2024-04-04 00:58:50.988374+00
6	Groceries	groceries	2024-04-04 00:59:07.657714+00	2024-04-04 00:59:07.657734+00
7	Home-decoration	home-decoration	2024-04-04 00:59:23.695706+00	2024-04-04 00:59:23.69574+00
\.


--
-- Data for Name: products_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_discount (id, name, percent, active) FROM stdin;
1	12.96 %	12.96	t
2	17.94 %	17.94	t
3	15.46 %	15.46	t
4	17.91 %	17.91	t
5	10.58 %	10.58	t
6	11.02 %	11.02	t
7	4.15 %	4.15	t
8	10.23 %	10.23	t
9	11.83 %	11.83	t
10	6.18 %	6.18	t
11	8.4 %	8.40	t
12	15.66 %	15.66	t
13	8.14 %	8.14	t
14	15.6 %	15.60	t
15	10.99 %	10.99	t
16	13.31 %	13.31	t
17	4.09 %	4.09	t
18	13.1 %	13.10	t
19	10.68 %	10.68	t
20	16.99 %	16.99	t
21	4.81 %	4.81	t
22	15.58 %	15.58	t
23	8.04 %	8.04	t
24	16.8 %	16.80	t
25	13.58 %	13.58	t
26	17.86 %	17.86	t
27	16.49 %	16.49	t
28	15.34 %	15.34	t
29	2.92 %	2.92	t
\.


--
-- Data for Name: products_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_file (id, name, file, product_id) FROM stdin;
1	\N	dlyeoi0sttffbb4ym6pn	1
2	\N	jd1uhczkvfvsgk3dtma5	2
3	\N	ejlablhmugsmhpcare3z	3
4	\N	sabrusbcu4bys6fcoemd	4
5	\N	cngzwch0xhcdqo3jfflq	5
6	\N	bogpmclbujlea1zs00p2	6
7	\N	znocdqz3ted43vonpqlb	7
8	\N	kk18qz9vxs9psnfmskja	8
9	\N	gjj9criwmgwxcgvcvl2u	9
10	\N	jkocapuohaewxo1mhoou	9
11	\N	ejmuw7k0ijowyguznqod	9
12	\N	nemxnj8ctb8gmx3z7tqc	9
13	\N	zr3rfxj7leqbychcxlh1	9
14	\N	hstbkhi6e6noozkl4vk3	10
15	\N	yeecwzerolstmspmkr1w	10
16	\N	zl9rgrlpsg4wgxoiibwa	10
17	\N	jc49mikceurkrrp8rf0x	10
18	\N	qdejlnmo4vhuo5ozzwsy	10
19	\N	rlpshk0nwhdy0woiwrtp	11
20	\N	oykxa8r08pkknvbfqpbg	11
21	\N	glmw02aenzzs3kuenmpr	11
22	\N	goy5xt3oelph7xid8cmf	11
23	\N	trys9kkch5vmdvnozdim	12
24	\N	pvtagoq6js5c20ckksqg	13
25	\N	upxqljdr9bjyo0vyyasj	13
26	\N	zig7lcez67yjl1xghalb	13
27	\N	qodpd58aekmpp3b3r0mb	13
28	\N	vdloeteiumaecimaxo0n	13
29	\N	un6rpemflrrcgppzifav	14
30	\N	eek6alnoi2di7590dqrj	14
31	\N	kh9i11nzybhix3f0nqnz	14
32	\N	bcuwqfzz4tulopkdssow	15
33	\N	wu63qewreyhjgkoqaosq	15
34	\N	rl1mqozujuqcgxsaoxtl	15
35	\N	qt9y24srpegir6g56jwr	15
36	\N	ed311mk9bizykajjmtlg	16
37	\N	xarwcv0g4tt3p5vzzzkm	16
38	\N	ngy6ctj4o3b9xchflro2	16
39	\N	zos8pt02bbirxydvae9p	16
40	\N	c4jsvorevqord2ocplbv	17
41	\N	shsqcqumn3hlgurqpxzo	17
42	\N	m28efa3iez9cflu8upnl	17
43	\N	t4vposhqj0jjn7s02km0	17
44	\N	mkh5jf8wiwrvl3xzcxa1	17
45	\N	kboey2xnjyhexzuk4hvi	18
46	\N	japxvtaglkelcafikvz4	18
47	\N	figvwoh55qwjynshwibh	18
48	\N	exupzq27csftq1g2iuna	18
49	\N	nuvzziikohp15lfwmi78	18
50	\N	bvvfl66taxkpgybkggzo	19
51	\N	pivbsph2ox1siz4hj2ch	19
52	\N	jjqcorntlia9krlbldkn	19
53	\N	x10qurfiosfpxf4jvsi6	19
54	\N	wakwibkcougpmyalysgw	20
55	\N	imrp4l5kbspwrngtc72l	20
56	\N	liy0iddcgqtuedlbyxad	20
57	\N	udzciwm719tizzsp2cba	20
58	\N	ya0wxcgkq2cymwyo245v	21
59	\N	mrb1dnrympy5gpfdyw0f	21
60	\N	kkreo33r8l9rtibxvstj	21
61	\N	yhghhsgq2rz5r7ejxtwq	21
62	\N	as4twucvrg1rcm9rvb0b	21
63	\N	ocjahhnl6eamp2vo6875	22
64	\N	fzdxhnubheyhhtoe4zcz	22
65	\N	v96i7uunzxpj7rwenlzs	22
66	\N	y8ry9y2yqyjgzqyvzo9p	22
67	\N	x8a2nfm19ahmopmk5cox	22
68	\N	rf75n4wlgpb49ivod4ve	23
69	\N	z29olxqafa3ksxwn7trp	23
70	\N	ert7wmrjsximl3b0ykum	23
71	\N	gk48mltzju5aljxfdjjg	23
72	\N	quprettur7dxldveo41k	24
73	\N	wyb4t4i13ixigmf35kxv	24
74	\N	omeuladh8np80plrfik4	24
75	\N	vms90owk5lq4tx2wzkyx	24
76	\N	owkduj8cxwduyaqnw5nl	24
77	\N	uirshkcivjjuqz5zp70d	25
78	\N	hj5nqmeyoonajqsmgtcv	25
79	\N	ao754k7jrcfkongsawii	25
80	\N	e88cvueuh2kez4gycaak	25
81	\N	ooiwrsnl8d49lgqegqa1	25
82	\N	pulwsfwhwbhd8t7qymjy	26
83	\N	krch3wx0hnepdcxzhnrl	26
84	\N	jjbjyof8x1yc18vrkjrn	26
85	\N	wmhijm2ldk10egfxlixw	26
86	\N	y45ufisz3musgf9zrmpv	27
87	\N	sfd41mrmoqy2ppnh6lcq	27
88	\N	xuirsjucrcfpfacsmewc	27
89	\N	csqglsewwwh9vuez9rvg	27
90	\N	y7fa3unarnglidq3ijdd	27
91	\N	xpirmnfas1frh5f8s5ki	28
92	\N	yof4ulubrurgtn75ed5n	28
93	\N	grehs7aeqyeo2bbqx2uo	28
94	\N	vsdxkjotngp7w81wgl2f	28
95	\N	hvl9glonjzizlrpazlf0	29
96	\N	xxlb8pn2uhnraf2dvj5q	29
97	\N	tnngvpautvl2tns5gqsb	29
98	\N	sq9txeyimr5xw5jzhwgm	29
99	\N	aamv7pktyobhhr6lzori	29
100	\N	ggfo3mae4cjppxzojm9g	30
101	\N	dbvplzfcpz1ibvcblvin	30
102	\N	s8fdffkoz2kmrlbzv08s	30
103	\N	z1anaytmk1sdouibbgkp	31
104	\N	vzghdtzrkbnjrqs37zyz	31
105	\N	n9gupsnst1jd6ggxmdew	31
106	\N	mfidk9rl2bjmfelfynzx	32
107	\N	x5vvcfi8qvfncs5i1rhy	32
108	\N	c2dkj3bclclpqsp7wxdz	32
109	\N	ifgujxyzhw0zvbbyxwq8	32
110	\N	zd5ltshq81b4815alswf	32
111	\N	wrmdnx7bex7p8zrva8re	33
112	\N	fw7pr1muvirgupri2cey	33
113	\N	rttpgsox1ea53guuxcav	33
114	\N	pq72am8hamtrrjcfzktt	33
115	\N	uypugsn7eesylbvcrvry	33
116	\N	frchyqyta9wgf4bll37j	34
117	\N	khd3hcdprl7tnjj1xyyv	34
118	\N	f0b7nxnkggjxbtmgykag	34
119	\N	opgazhw1fsacyxlivpui	34
120	\N	unpy1fts1vkys73o4c4m	34
121	\N	y65qrcyxpckr9aj9nrrh	35
122	\N	qouifayzom5gu5nc7zan	35
123	\N	b6damhivy9cicbqzggyj	35
124	\N	qwenxill5qve7y67igji	35
125	\N	og9mdchb1wkahnjrw9qv	35
126	\N	mihf8xs1i7uh2kejpgpk	35
127	\N	pift0a6eqifakzl0e0ui	36
128	\N	rybebm5vhaicjttnzhyx	36
129	\N	joiyr0gtdttsd9oi5gcm	36
130	\N	ffbn3mq503km3nnyf7ct	36
131	\N	pg2gv94mnzjnliravryn	36
132	\N	xg3q6ercszb4pfmr6xf7	37
133	\N	iko9is0hkp5ypbvcxqhg	37
134	\N	stcoyvpy9ficw0dj9nbb	37
135	\N	tswbydzgdl2ykfuijcb0	37
136	\N	a8n4paljvaocwtgsgapf	37
137	\N	ktpkwzqiivi4oih1k0m8	38
138	\N	hanwfdkugciyaw98jlgd	38
139	\N	tlqj2qc5rc1uhu0lij6p	38
140	\N	a73wspf8om5emod3jyfb	38
141	\N	vzzjguj4hanlhrg2ts6a	38
142	\N	vtdwfmc1ajwogx84ba8p	39
143	\N	hkexvyovitmik13iqfbm	39
144	\N	z585xgcg3j5y8mmlpdls	39
145	\N	homv3i2bci5qqm85zlx0	39
\.


--
-- Data for Name: products_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_order (id, order_date, total_amount, status, user_id, uuid) FROM stdin;
1	2024-04-04 00:54:11.820791+00	\N	draft	\N	b9c9471c-68b1-4f9c-b22c-50e0b48a3e20
2	2024-04-04 00:57:39.770767+00	\N	draft	\N	c7d5e9cf-b03e-4f75-83a1-878daec84fe8
\.


--
-- Data for Name: products_orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_orderitems (id, quantity, subtotal, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, name, price_currency, price, category_id, discount_id, slug, description, created_at, updated_at) FROM stdin;
1	ONEPLUS 10T | Moonstone Black | 5G	USD	549.9900	1	\N	oneplus-10t-moonstone-black-5g	{"delta": "", "html": ""}	2024-04-04 00:57:19.391285+00	2024-04-04 00:57:19.391298+00
2	Apple iPhone 12	USD	504.0000	1	\N	apple-iphone-12	{"delta": "", "html": ""}	2024-04-04 00:57:21.786834+00	2024-04-04 00:57:21.786861+00
3	OnePlus 10 Pro | 5G Android Smartphone	USD	697.1700	1	\N	oneplus-10-pro-5g-android-smartphone	{"delta": "", "html": ""}	2024-04-04 00:57:23.231141+00	2024-04-04 00:57:23.231188+00
4	iPhone 13 Pro Max	USD	1101.0000	1	\N	iphone-13-pro-max	{"delta": "", "html": ""}	2024-04-04 00:57:24.435771+00	2024-04-04 00:57:24.435794+00
5	Samsung Galaxy S20 FE 5G	USD	550.0000	1	\N	samsung-galaxy-s20-fe-5g	{"delta": "", "html": ""}	2024-04-04 00:57:25.177751+00	2024-04-04 00:57:25.177798+00
6	SAMSUNG Galaxy Z Fold 3 5G Cell Phone	USD	1144.0000	1	\N	samsung-galaxy-z-fold-3-5g-cell-phone	{"delta": "", "html": ""}	2024-04-04 00:57:26.292534+00	2024-04-04 00:57:26.292554+00
7	OnePlus Nord N200 | 5G	USD	189.9900	1	\N	oneplus-nord-n200-5g	{"delta": "", "html": ""}	2024-04-04 00:57:26.921837+00	2024-04-04 00:57:26.921882+00
8	Apple iPhone 11 Pro Max	USD	689.0000	1	\N	apple-iphone-11-pro-max	{"delta": "", "html": ""}	2024-04-04 00:57:27.736093+00	2024-04-04 00:57:27.736139+00
9	SAMSUNG Galaxy S22+ Cell Phone	USD	910.0000	1	\N	samsung-galaxy-s22-cell-phone	{"delta": "", "html": "<ul><li>6.6\\", 1080 x 2340pixels, Infinity-O FHD+ Dynamic AMOLED 2X Display, 4500mAh Battery, Wireless Powershare</li><li>128GB ROM, 8GB RAM, No SD Card Slot, Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm), Octa-Core, Adreno 730</li><li>Rear Camera: 50MP, f/1.8 + 10MP, f/2.4 + 12MP, f/2.2, Front Camera: 10 MP, f/2.2, Android 12, One UI 4.1</li><li>2G: GSM 850/900/1800/1900, CDMA 800/1900, 3G: HSDPA 850/900/1700(AWS)/1900/2100, CDMA2000 1xEV-DO, 4G LTE: 1/2/3/4/5/7/8/12/13/14/18/19/20/25/26/28/29/30/38/39/40/41/46/48/66/71, 5G: 1/3/5/7/8/20/28/38/41/66/71/260/261SA/NSA/Sub6/mmWave - Single SIM</li><li>No Warranty. Compatible with Most GSM and CDMA Carriers like T-Mobile, AT&amp;T, MetroPCS, etc. Will Also work with CDMA Carriers Such as Verizon, Sprint.</li></ul>"}	2024-04-04 00:57:28.410137+00	2024-04-04 00:57:28.410187+00
10	iPhone 9	USD	549.0000	2	1	iphone-9	{"delta": "", "html": "An apple mobile which is nothing like apple"}	2024-04-04 00:57:58.619445+00	2024-04-04 00:57:58.619456+00
11	iPhone X	USD	899.0000	2	2	iphone-x	{"delta": "", "html": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ..."}	2024-04-04 00:58:02.354087+00	2024-04-04 00:58:02.354133+00
12	Samsung Universe 9	USD	1249.0000	2	3	samsung-universe-9	{"delta": "", "html": "Samsung's new variant which goes beyond Galaxy to the Universe"}	2024-04-04 00:58:04.807858+00	2024-04-04 00:58:04.807905+00
13	OPPOF19	USD	280.0000	2	4	oppof19	{"delta": "", "html": "OPPO F19 is officially announced on April 2021."}	2024-04-04 00:58:05.732435+00	2024-04-04 00:58:05.732468+00
14	Huawei P30	USD	499.0000	2	5	huawei-p30	{"delta": "", "html": "Huawei\\u2019s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK."}	2024-04-04 00:58:08.493163+00	2024-04-04 00:58:08.493195+00
15	MacBook Pro	USD	1749.0000	3	6	macbook-pro	{"delta": "", "html": "MacBook Pro 2021 with mini-LED display may launch between September, November"}	2024-04-04 00:58:10.535627+00	2024-04-04 00:58:10.535667+00
16	Samsung Galaxy Book	USD	1499.0000	3	7	samsung-galaxy-book	{"delta": "", "html": "Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched"}	2024-04-04 00:58:12.915177+00	2024-04-04 00:58:12.915224+00
17	Microsoft Surface Laptop 4	USD	1499.0000	3	8	microsoft-surface-laptop-4	{"delta": "", "html": "Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen."}	2024-04-04 00:58:15.747568+00	2024-04-04 00:58:15.747584+00
18	Infinix INBOOK	USD	1099.0000	3	9	infinix-inbook	{"delta": "", "html": "Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey \\u2013 1 Year Warranty"}	2024-04-04 00:58:19.025205+00	2024-04-04 00:58:19.025226+00
19	HP Pavilion 15-DK1056WM	USD	1099.0000	3	10	hp-pavilion-15-dk1056wm	{"delta": "", "html": "HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10"}	2024-04-04 00:58:24.241803+00	2024-04-04 00:58:24.241817+00
20	perfume Oil	USD	13.0000	4	11	perfume-oil	{"delta": "", "html": "Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil"}	2024-04-04 00:58:26.607632+00	2024-04-04 00:58:26.607647+00
21	Brown Perfume	USD	40.0000	4	12	brown-perfume	{"delta": "", "html": "Royal_Mirage Sport Brown Perfume for Men & Women - 120ml"}	2024-04-04 00:58:29.367722+00	2024-04-04 00:58:29.367743+00
22	Fog Scent Xpressio Perfume	USD	13.0000	4	13	fog-scent-xpressio-perfume	{"delta": "", "html": "Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men"}	2024-04-04 00:58:32.325635+00	2024-04-04 00:58:32.325688+00
23	Non-Alcoholic Concentrated Perfume Oil	USD	120.0000	4	14	non-alcoholic-concentrated-perfume-oil	{"delta": "", "html": "Original Al Munakh\\u00ae by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil"}	2024-04-04 00:58:36.536647+00	2024-04-04 00:58:36.536675+00
24	Eau De Perfume Spray	USD	30.0000	4	15	eau-de-perfume-spray	{"delta": "", "html": "Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality"}	2024-04-04 00:58:47.134258+00	2024-04-04 00:58:47.134296+00
25	Hyaluronic Acid Serum	USD	19.0000	5	16	hyaluronic-acid-serum	{"delta": "", "html": "L'Or\\u00c3\\u00a9al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid"}	2024-04-04 00:58:50.999922+00	2024-04-04 00:58:50.999965+00
26	Tree Oil 30ml	USD	12.0000	5	17	tree-oil-30ml	{"delta": "", "html": "Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,"}	2024-04-04 00:58:54.974222+00	2024-04-04 00:58:54.974264+00
27	Oil Free Moisturizer 100ml	USD	40.0000	5	18	oil-free-moisturizer-100ml	{"delta": "", "html": "Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen."}	2024-04-04 00:58:57.596996+00	2024-04-04 00:58:57.597029+00
28	Skin Beauty Serum.	USD	46.0000	5	19	skin-beauty-serum	{"delta": "", "html": "Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m"}	2024-04-04 00:59:00.561691+00	2024-04-04 00:59:00.561714+00
29	Freckle Treatment Cream- 15gm	USD	70.0000	5	20	freckle-treatment-cream-15gm	{"delta": "", "html": "Fair & Clear is Pakistan's only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects."}	2024-04-04 00:59:03.159743+00	2024-04-04 00:59:03.159766+00
30	- Daal Masoor 500 grams	USD	20.0000	6	21	daal-masoor-500-grams	{"delta": "", "html": "Fine quality Branded Product Keep in a cool and dry place"}	2024-04-04 00:59:07.661939+00	2024-04-04 00:59:07.661957+00
31	Elbow Macaroni - 400 gm	USD	14.0000	6	22	elbow-macaroni-400-gm	{"delta": "", "html": "Product details of Bake Parlor Big Elbow Macaroni - 400 gm"}	2024-04-04 00:59:09.362617+00	2024-04-04 00:59:09.362632+00
32	Orange Essence Food Flavou	USD	14.0000	6	23	orange-essence-food-flavou	{"delta": "", "html": "Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item"}	2024-04-04 00:59:11.644084+00	2024-04-04 00:59:11.644108+00
33	cereals muesli fruit nuts	USD	46.0000	6	24	cereals-muesli-fruit-nuts	{"delta": "", "html": "original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji"}	2024-04-04 00:59:15.662244+00	2024-04-04 00:59:15.662261+00
34	Gulab Powder 50 Gram	USD	70.0000	6	25	gulab-powder-50-gram	{"delta": "", "html": "Dry Rose Flower Powder Gulab Powder 50 Gram \\u2022 Treats Wounds"}	2024-04-04 00:59:18.810672+00	2024-04-04 00:59:18.810718+00
35	Plant Hanger For Home	USD	41.0000	7	26	plant-hanger-for-home	{"delta": "", "html": "Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf"}	2024-04-04 00:59:23.70122+00	2024-04-04 00:59:23.701239+00
36	Flying Wooden Bird	USD	51.0000	7	22	flying-wooden-bird	{"delta": "", "html": "Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm"}	2024-04-04 00:59:27.391854+00	2024-04-04 00:59:27.391896+00
37	3D Embellishment Art Lamp	USD	20.0000	7	27	3d-embellishment-art-lamp	{"delta": "", "html": "3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)"}	2024-04-04 00:59:32.354987+00	2024-04-04 00:59:32.355009+00
38	Handcraft Chinese style	USD	60.0000	7	28	handcraft-chinese-style	{"delta": "", "html": "Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate"}	2024-04-04 00:59:35.435461+00	2024-04-04 00:59:35.435487+00
39	Key Holder	USD	30.0000	7	29	key-holder	{"delta": "", "html": "Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality"}	2024-04-04 00:59:39.811659+00	2024-04-04 00:59:39.811672+00
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key, provider_id, settings) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 80, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: core_commandhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_commandhistory_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 7, true);


--
-- Name: products_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_discount_id_seq', 29, true);


--
-- Name: products_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_file_id_seq', 145, true);


--
-- Name: products_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_order_id_seq', 2, true);


--
-- Name: products_orderitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_orderitems_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 39, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_user_id_email_987c8728_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_email_987c8728_uniq UNIQUE (user_id, email);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


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
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


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
-- Name: products_order products_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_order
    ADD CONSTRAINT products_order_pkey PRIMARY KEY (id);


--
-- Name: products_order products_order_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_order
    ADD CONSTRAINT products_order_uuid_key UNIQUE (uuid);


--
-- Name: products_orderitems products_orderitems_order_id_product_id_46191271_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_orderitems
    ADD CONSTRAINT products_orderitems_order_id_product_id_46191271_uniq UNIQUE (order_id, product_id);


--
-- Name: products_orderitems products_orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_orderitems
    ADD CONSTRAINT products_orderitems_pkey PRIMARY KEY (id);


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
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_upper; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_upper ON public.account_emailaddress USING btree (upper((email)::text));


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


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
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


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
-- Name: products_order_user_id_dfb540d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_order_user_id_dfb540d8 ON public.products_order USING btree (user_id);


--
-- Name: products_orderitems_order_id_4e93d267; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_orderitems_order_id_4e93d267 ON public.products_orderitems USING btree (order_id);


--
-- Name: products_orderitems_product_id_06cb5ae9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_orderitems_product_id_06cb5ae9 ON public.products_orderitems USING btree (product_id);


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
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: unique_verified_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_verified_email ON public.account_emailaddress USING btree (email) WHERE verified;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: products_order products_order_user_id_dfb540d8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_order
    ADD CONSTRAINT products_order_user_id_dfb540d8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_orderitems products_orderitems_order_id_4e93d267_fk_products_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_orderitems
    ADD CONSTRAINT products_orderitems_order_id_4e93d267_fk_products_order_id FOREIGN KEY (order_id) REFERENCES public.products_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_orderitems products_orderitems_product_id_06cb5ae9_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_orderitems
    ADD CONSTRAINT products_orderitems_product_id_06cb5ae9_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

