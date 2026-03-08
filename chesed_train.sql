--
-- PostgreSQL database dump
--



-- Dumped from database version 14.20 (Ubuntu 14.20-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.20 (Ubuntu 14.20-0ubuntu0.22.04.1)

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO chesed_train_db_user;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO chesed_train_db_user;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO chesed_train_db_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO chesed_train_db_user;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO chesed_train_db_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO chesed_train_db_user;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO chesed_train_db_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO chesed_train_db_user;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ads; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.ads (
    id bigint NOT NULL,
    name character varying,
    start_date timestamp(6) without time zone,
    end_date timestamp(6) without time zone,
    views integer DEFAULT 0,
    clicks integer DEFAULT 0,
    zipcode character varying,
    country character varying,
    link character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location character varying DEFAULT 'top'::character varying,
    paused boolean DEFAULT false
);


ALTER TABLE public.ads OWNER TO chesed_train_db_user;

--
-- Name: ad_reports; Type: VIEW; Schema: public; Owner: chesed_train_db_user
--

CREATE VIEW public.ad_reports AS
 WITH country_codes(country_name, country_code) AS (
         VALUES ('United States'::text,'+1'::text), ('Argentina'::text,'+54'::text), ('Australia'::text,'+61'::text), ('Austria'::text,'+43'::text), ('Belarus'::text,'+375'::text), ('Belgium'::text,'+32'::text), ('Belize'::text,'+501'::text), ('Benin'::text,'+229'::text), ('Bhutan'::text,'+975'::text), ('Bolivia'::text,'+591'::text), ('Brazil'::text,'+55'::text), ('Brunei'::text,'+673'::text), ('Canada'::text,'+1c'::text), ('Chile'::text,'+56'::text), ('Colombia'::text,'+57'::text), ('Comoros'::text,'+269'::text), ('Congo'::text,'+242'::text), ('Costa Rica'::text,'+506'::text), ('Croatia'::text,'+385'::text), ('Cuba'::text,'+53'::text), ('Cyprus'::text,'+357'::text), ('Czech Republic'::text,'+420'::text), ('Denmark'::text,'+45'::text), ('Ecuador'::text,'+593'::text), ('Egypt'::text,'+20'::text), ('El Salvador'::text,'+503'::text), ('Finland'::text,'+358'::text), ('France'::text,'+33'::text), ('Georgia'::text,'+995'::text), ('Germany'::text,'+49'::text), ('Greece'::text,'+30'::text), ('Guatemala'::text,'+502'::text), ('Haiti'::text,'+509'::text), ('Honduras'::text,'+504'::text), ('Hungary'::text,'+36'::text), ('Iceland'::text,'+354'::text), ('Iran'::text,'+98'::text), ('Iraq'::text,'+964'::text), ('Ireland'::text,'+353'::text), ('Israel'::text,'+972'::text), ('Italy'::text,'+39'::text), ('Jamaica'::text,'+1-876'::text), ('Japan'::text,'+81'::text), ('Jordan'::text,'+962'::text), ('Lebanon'::text,'+961'::text), ('Mexico'::text,'+52'::text), ('Monaco'::text,'+377'::text), ('Mongolia'::text,'+976'::text), ('Morocco'::text,'+212'::text), ('Netherlands'::text,'+31'::text), ('New Zealand'::text,'+64'::text), ('Peru'::text,'+51'::text), ('Philippines'::text,'+63'::text), ('Poland'::text,'+48'::text), ('Portugal'::text,'+351'::text), ('Qatar'::text,'+974'::text), ('Romania'::text,'+40'::text), ('Russia'::text,'+7'::text), ('Saudi Arabia'::text,'+966'::text), ('Singapore'::text,'+65'::text), ('South Africa'::text,'+27'::text), ('Spain'::text,'+34'::text), ('Sweden'::text,'+46'::text), ('Switzerland'::text,'+41'::text), ('Thailand'::text,'+66'::text), ('Turkey'::text,'+90'::text), ('Ukraine'::text,'+380'::text), ('United Arab Emirates'::text,'+971'::text), ('United Kingdom'::text,'+44'::text)
        )
 SELECT ads.id,
    ads.name,
    ads.start_date,
    ads.end_date,
    ads.views,
    ads.clicks,
    ads.zipcode,
    ads.country,
    ads.link,
    ads.created_at,
    ads.updated_at,
    country_codes.country_name
   FROM (public.ads
     LEFT JOIN country_codes ON (((ads.country)::text = country_codes.country_code)));


ALTER TABLE public.ad_reports OWNER TO chesed_train_db_user;

--
-- Name: ads_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_id_seq OWNER TO chesed_train_db_user;

--
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.ads_id_seq OWNED BY public.ads.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO chesed_train_db_user;

--
-- Name: event_dates; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.event_dates (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    date_number character varying,
    date_weekday character varying,
    date_month character varying,
    chesed_train_id bigint,
    special_note character varying,
    volunteer_id bigint,
    bringing text,
    full_date date,
    event_id bigint
);


ALTER TABLE public.event_dates OWNER TO chesed_train_db_user;

--
-- Name: event_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.event_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_dates_id_seq OWNER TO chesed_train_db_user;

--
-- Name: event_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.event_dates_id_seq OWNED BY public.event_dates.id;


--
-- Name: event_reports; Type: VIEW; Schema: public; Owner: chesed_train_db_user
--

CREATE VIEW public.event_reports AS
SELECT
    NULL::character varying AS event_name,
    NULL::character varying AS event_type,
    NULL::text AS owner,
    NULL::character varying AS email,
    NULL::text AS contact_number,
    NULL::timestamp(6) without time zone AS start_date,
    NULL::timestamp(6) without time zone AS end_date,
    NULL::character varying AS recipient_email,
    NULL::character varying AS recipient_name,
    NULL::character varying AS country,
    NULL::character varying AS postal_code,
    NULL::character varying AS state,
    NULL::timestamp(6) without time zone AS created_at,
    NULL::bigint AS volunteer_count;


ALTER TABLE public.event_reports OWNER TO chesed_train_db_user;

--
-- Name: events; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying,
    start_date timestamp(6) without time zone,
    end_date timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    recipent_email character varying,
    recipent_name character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    state character varying,
    adults integer,
    kids integer,
    allergies character varying,
    preferred_time character varying,
    dietary_restrictions character varying,
    special_message text,
    owner_id bigint,
    type character varying,
    "least" character varying,
    shabbat_instructions character varying,
    fav_rest character varying,
    step integer,
    country character varying,
    postal_code character varying,
    status integer DEFAULT 0 NOT NULL,
    date_range jsonb,
    slug character varying
);


ALTER TABLE public.events OWNER TO chesed_train_db_user;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO chesed_train_db_user;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO chesed_train_db_user;

--
-- Name: selections; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.selections (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    quantity bigint DEFAULT 0,
    special_note character varying,
    placeholder character varying,
    potluck_id bigint,
    volunteer_id bigint,
    bringing character varying,
    potluck_date timestamp(6) without time zone,
    event_date_id bigint
);


ALTER TABLE public.selections OWNER TO chesed_train_db_user;

--
-- Name: selections_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.selections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selections_id_seq OWNER TO chesed_train_db_user;

--
-- Name: selections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.selections_id_seq OWNED BY public.selections.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    ip_address character varying,
    user_agent character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO chesed_train_db_user;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO chesed_train_db_user;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: updates; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.updates (
    id bigint NOT NULL,
    event_id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.updates OWNER TO chesed_train_db_user;

--
-- Name: updates_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.updates_id_seq OWNER TO chesed_train_db_user;

--
-- Name: updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.updates_id_seq OWNED BY public.updates.id;


--
-- Name: user_reports; Type: VIEW; Schema: public; Owner: chesed_train_db_user
--

CREATE VIEW public.user_reports AS
SELECT
    NULL::text AS full_name,
    NULL::character varying AS email_address,
    NULL::text AS contact_number,
    NULL::boolean AS pro,
    NULL::boolean AS sms,
    NULL::timestamp(6) without time zone AS created_at,
    NULL::text AS country_name,
    NULL::bigint AS event_created,
    NULL::bigint AS volunteered_events;


ALTER TABLE public.user_reports OWNER TO chesed_train_db_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email_address character varying NOT NULL,
    password_digest character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    phone_number character varying,
    updates boolean DEFAULT true,
    tos boolean,
    sms boolean,
    guest boolean DEFAULT false,
    is_paying boolean DEFAULT false,
    is_admin boolean DEFAULT false,
    country_code character varying,
    stripe_customer_id character varying,
    stripe_subscription_id character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    area_code character varying,
    toke character varying DEFAULT 'e0f21c27251b14be467f'::character varying
);


ALTER TABLE public.users OWNER TO chesed_train_db_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO chesed_train_db_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: volunteer_events; Type: TABLE; Schema: public; Owner: chesed_train_db_user
--

CREATE TABLE public.volunteer_events (
    id bigint NOT NULL,
    user_id bigint,
    event_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.volunteer_events OWNER TO chesed_train_db_user;

--
-- Name: volunteer_events_id_seq; Type: SEQUENCE; Schema: public; Owner: chesed_train_db_user
--

CREATE SEQUENCE public.volunteer_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteer_events_id_seq OWNER TO chesed_train_db_user;

--
-- Name: volunteer_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: chesed_train_db_user
--

ALTER SEQUENCE public.volunteer_events_id_seq OWNED BY public.volunteer_events.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: ads id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.ads ALTER COLUMN id SET DEFAULT nextval('public.ads_id_seq'::regclass);


--
-- Name: event_dates id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.event_dates ALTER COLUMN id SET DEFAULT nextval('public.event_dates_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: selections id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.selections ALTER COLUMN id SET DEFAULT nextval('public.selections_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: updates id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.updates ALTER COLUMN id SET DEFAULT nextval('public.updates_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: volunteer_events id; Type: DEFAULT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.volunteer_events ALTER COLUMN id SET DEFAULT nextval('public.volunteer_events_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.ads (id, name, start_date, end_date, views, clicks, zipcode, country, link, created_at, updated_at, location, paused) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2024-12-25 18:50:20.418693	2024-12-25 18:50:20.4187
schema_sha1	5881ac5292483fc71eae2072789dd13ef222292b	2024-12-25 18:50:20.425415	2024-12-25 18:50:20.425419
\.


--
-- Data for Name: event_dates; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.event_dates (id, created_at, updated_at, date_number, date_weekday, date_month, chesed_train_id, special_note, volunteer_id, bringing, full_date, event_id) FROM stdin;
801	2025-09-11 20:16:51.079458	2025-09-11 20:16:51.079458	11	Thursday	9	196	\N	\N	\N	2025-09-11	\N
503	2025-03-19 17:00:32.16688	2025-03-19 17:00:32.16688	19	Wednesday	3	137	\N	\N	\N	2025-03-19	\N
516	2025-03-19 17:00:32.270648	2025-03-19 17:00:32.270648	1	Tuesday	4	137	\N	\N	\N	2025-04-01	\N
505	2025-03-19 17:00:32.182944	2025-03-19 17:02:06.771787	21	Friday	3	137		512	Shabbos food is being sent by Yehudis's Grandma	2025-03-21	\N
506	2025-03-19 17:00:32.190118	2025-03-19 17:02:15.738708	22	Saturday	3	137		512	Shabbos food is being sent by Yehudis's Grandma	2025-03-22	\N
504	2025-03-19 17:00:32.175159	2025-03-20 02:27:57.834244	20	Thursday	3	137	Mazel tov!	532	Pizza pie	2025-03-20	\N
507	2025-03-19 17:00:32.197959	2025-03-20 02:50:29.440885	23	Sunday	3	137		533	Pasta & meat sauce	2025-03-23	\N
509	2025-03-19 17:00:32.21801	2025-03-20 02:54:09.090575	25	Tuesday	3	137		534	Breaded cutlets, potatoes and vegetable	2025-03-25	\N
511	2025-03-19 17:00:32.233391	2025-03-20 03:13:52.214282	27	Thursday	3	137		512	TBD	2025-03-27	\N
508	2025-03-19 17:00:32.20585	2025-03-20 03:23:08.306706	24	Monday	3	137	Mazel tov!	536	TBD	2025-03-24	\N
510	2025-03-19 17:00:32.225207	2025-03-20 03:37:02.424514	26	Wednesday	3	137		537	Meat balls and spaghetti 	2025-03-26	\N
514	2025-03-19 17:00:32.255258	2025-03-20 11:21:38.514703	30	Sunday	3	137	Mazal tov!!!!	543	BBQ	2025-03-30	\N
512	2025-03-19 17:00:32.240775	2025-03-20 12:07:55.406609	28	Friday	3	137		544	Friday night meal menu tbd  appetizer, soup, chicken, hot vegetable, starch, dessert	2025-03-28	\N
513	2025-03-19 17:00:32.248244	2025-03-25 03:20:04.562034	29	Saturday	3	137		643	liver, egg salad, Cholent, salad	2025-03-29	\N
515	2025-03-19 17:00:32.261946	2025-03-28 02:14:41.257337	31	Monday	3	137		660	Chicken rice salad 	2025-03-31	\N
517	2025-03-19 17:00:32.280305	2025-03-28 10:55:47.904009	2	Wednesday	4	137		663	Pasta and meat sauce 	2025-04-02	\N
581	2025-04-04 16:28:48.74678	2025-04-04 16:30:43.796506	30	Wednesday	4	152		706	Chicken entree	2025-04-30	\N
589	2025-04-19 00:45:08.541733	2025-04-19 00:45:08.541733	24	Thursday	4	156	\N	\N	\N	2025-04-24	\N
590	2025-04-19 00:45:08.547681	2025-04-19 00:45:08.547681	25	Friday	4	156	\N	\N	\N	2025-04-25	\N
591	2025-04-19 00:45:08.552466	2025-04-19 00:45:08.552466	26	Saturday	4	156	\N	\N	\N	2025-04-26	\N
592	2025-04-19 00:45:08.557119	2025-04-19 00:45:08.557119	27	Sunday	4	156	\N	\N	\N	2025-04-27	\N
593	2025-04-19 00:45:08.562049	2025-04-19 00:45:08.562049	28	Monday	4	156	\N	\N	\N	2025-04-28	\N
594	2025-04-19 00:45:08.566438	2025-04-19 00:45:08.566438	29	Tuesday	4	156	\N	\N	\N	2025-04-29	\N
757	2025-08-14 22:35:12.019098	2025-08-14 22:35:12.019098	22	Friday	8	186	\N	\N	\N	2025-08-22	\N
758	2025-08-14 22:35:12.03207	2025-08-14 22:35:12.03207	23	Saturday	8	186	\N	\N	\N	2025-08-23	\N
764	2025-08-14 22:35:12.084519	2025-08-14 22:35:12.084519	29	Friday	8	186	\N	\N	\N	2025-08-29	\N
765	2025-08-14 22:35:12.097853	2025-08-14 22:35:12.097853	30	Saturday	8	186	\N	\N	\N	2025-08-30	\N
753	2025-08-14 22:35:11.996691	2025-08-14 23:47:09.021817	18	Monday	8	186		1740		2025-08-18	\N
737	2025-08-03 20:24:04.330912	2025-08-15 01:32:48.944051	18	Monday	8	184	Mazal Tov!! 	1742	Dairy yummy!! 	2025-08-18	\N
756	2025-08-14 22:35:12.013745	2025-08-15 02:09:20.346236	21	Thursday	8	186		1744	Chicken/Rice/Veggies/Salad/Desert	2025-08-21	\N
766	2025-08-15 02:27:09.921266	2025-08-15 02:27:09.921266	19	Tuesday	8	184	\N	\N	\N	2025-08-19	\N
769	2025-08-15 02:27:09.93339	2025-08-15 02:27:09.93339	22	Friday	8	184	\N	\N	\N	2025-08-22	\N
770	2025-08-15 02:27:09.95454	2025-08-15 02:27:09.95454	23	Saturday	8	184	\N	\N	\N	2025-08-23	\N
771	2025-08-15 02:27:09.969123	2025-08-15 02:27:09.969123	24	Sunday	8	184	\N	\N	\N	2025-08-24	\N
772	2025-08-15 02:27:09.973575	2025-08-15 02:27:09.973575	25	Monday	8	184	\N	\N	\N	2025-08-25	\N
773	2025-08-15 02:27:09.977746	2025-08-15 02:27:09.977746	26	Tuesday	8	184	\N	\N	\N	2025-08-26	\N
774	2025-08-15 02:27:09.982821	2025-08-15 02:27:09.982821	27	Wednesday	8	184	\N	\N	\N	2025-08-27	\N
775	2025-08-15 02:27:09.986972	2025-08-15 02:27:09.986972	28	Thursday	8	184	\N	\N	\N	2025-08-28	\N
776	2025-08-15 02:27:09.991647	2025-08-15 02:27:09.991647	29	Friday	8	184	\N	\N	\N	2025-08-29	\N
755	2025-08-14 22:35:12.007624	2025-08-15 02:35:33.225127	20	Wednesday	8	186		1745	Somethin fresh	2025-08-20	\N
767	2025-08-15 02:27:09.926331	2025-08-15 03:08:33.440762	20	Wednesday	8	184	Mazal tov !!!	1746	Whatever your heart desires !	2025-08-20	\N
768	2025-08-15 02:27:09.930165	2025-08-15 03:08:55.680029	21	Thursday	8	184	Mazal tovvvv	1746	anything u like !	2025-08-21	\N
754	2025-08-14 22:35:12.002126	2025-08-15 05:35:36.110727	19	Tuesday	8	186		1625		2025-08-19	\N
759	2025-08-14 22:35:12.044629	2025-08-15 05:39:39.742567	24	Sunday	8	186	Mazal tov! 	1747	Chinese Food	2025-08-24	\N
760	2025-08-14 22:35:12.048208	2025-08-15 05:45:48.742105	25	Monday	8	186	Can’t wait to meet Kira!	1748	Chicken and rice 	2025-08-25	\N
761	2025-08-14 22:35:12.070775	2025-08-15 13:45:30.810232	26	Tuesday	8	186		1753		2025-08-26	\N
763	2025-08-14 22:35:12.080415	2025-08-15 22:15:41.924753	28	Thursday	8	186		1758	TBD 	2025-08-28	\N
762	2025-08-14 22:35:12.076242	2025-08-17 00:54:39.619898	27	Wednesday	8	186	Food delivery platform of your choice 	1771	Gift card	2025-08-27	\N
778	2025-08-18 13:03:05.783131	2025-08-18 13:03:05.783131	1	Monday	9	186	\N	\N	\N	2025-09-01	\N
779	2025-08-18 13:03:05.787004	2025-08-18 13:03:05.787004	2	Tuesday	9	186	\N	\N	\N	2025-09-02	\N
780	2025-08-18 13:03:05.789891	2025-08-18 13:03:05.789891	3	Wednesday	9	186	\N	\N	\N	2025-09-03	\N
781	2025-08-18 13:03:05.792623	2025-08-18 13:03:05.792623	4	Thursday	9	186	\N	\N	\N	2025-09-04	\N
733	2025-08-03 20:24:04.259017	2025-08-03 20:24:04.259017	14	Thursday	8	184	\N	\N	\N	2025-08-14	\N
734	2025-08-03 20:24:04.266402	2025-08-03 20:24:04.266402	15	Friday	8	184	\N	\N	\N	2025-08-15	\N
735	2025-08-03 20:24:04.294504	2025-08-03 20:24:04.294504	16	Saturday	8	184	\N	\N	\N	2025-08-16	\N
736	2025-08-03 20:24:04.32413	2025-08-03 20:24:04.32413	17	Sunday	8	184	\N	\N	\N	2025-08-17	\N
777	2025-08-18 13:03:05.779134	2025-08-19 12:02:27.952407	31	Sunday	8	186	Mazel tov! 	1793		2025-08-31	\N
794	2025-08-28 03:04:22.774524	2025-08-28 03:04:22.774524	27	Wednesday	8	193	\N	\N	\N	2025-08-27	\N
795	2025-08-28 03:04:22.77988	2025-08-28 03:04:22.77988	28	Thursday	8	193	\N	\N	\N	2025-08-28	\N
802	2025-09-11 20:16:51.083698	2025-09-11 20:16:51.083698	15	Monday	9	196	\N	\N	\N	2025-09-15	\N
803	2025-09-11 20:16:51.087168	2025-09-11 20:16:51.087168	16	Tuesday	9	196	\N	\N	\N	2025-09-16	\N
804	2025-09-11 20:17:17.764961	2025-09-11 20:17:17.764961	19	Friday	9	196	\N	\N	\N	2025-09-19	\N
805	2025-09-11 20:17:17.780587	2025-09-11 20:17:17.780587	20	Saturday	9	196	\N	\N	\N	2025-09-20	\N
815	2025-09-16 18:07:38.040752	2025-09-16 18:07:38.040752	26	Friday	9	198	\N	\N	\N	2025-09-26	\N
816	2025-09-16 18:07:38.055356	2025-09-16 18:07:38.055356	27	Saturday	9	198	\N	\N	\N	2025-09-27	\N
821	2025-09-16 18:07:38.088585	2025-09-16 18:07:38.088585	2	Thursday	10	198	\N	\N	\N	2025-10-02	\N
822	2025-09-16 18:07:38.093793	2025-09-16 18:07:38.093793	3	Friday	10	198	\N	\N	\N	2025-10-03	\N
823	2025-09-16 18:07:38.107001	2025-09-16 18:07:38.107001	4	Saturday	10	198	\N	\N	\N	2025-10-04	\N
819	2025-09-16 18:07:38.077049	2025-09-16 20:56:29.130673	30	Tuesday	9	198	Mazal Tov!!	1829	Chicken fajitas 	2025-09-30	\N
814	2025-09-16 18:05:58.154131	2025-09-16 23:45:26.61846	5	Sunday	10	198	Mazel Tov!	1830	TBD	2025-10-05	\N
818	2025-09-16 18:07:38.07306	2025-09-17 00:44:07.474365	29	Monday	9	198	Mazal 	1831	TBD 	2025-09-29	\N
817	2025-09-16 18:07:38.069499	2025-09-17 01:32:39.201344	28	Sunday	9	198	Mazal Tov!	1832	Chicken, rice, salad	2025-09-28	\N
813	2025-09-16 18:05:58.149672	2025-09-17 06:00:22.44912	25	Thursday	9	198	Mazel Tov!! 🎉🎉	1833	Pizza (shop)	2025-09-25	\N
820	2025-09-16 18:07:38.081788	2025-09-26 01:49:59.376646	1	Wednesday	10	198	ILYSM! 💙💙💙	1836	Soup, chicken thighs, rice, veggie	2025-10-01	\N
826	2025-11-11 17:28:46.120584	2025-11-11 17:28:46.120584	14	Friday	11	199	\N	\N	\N	2025-11-14	\N
827	2025-11-11 17:28:46.16564	2025-11-11 17:28:46.16564	15	Saturday	11	199	\N	\N	\N	2025-11-15	\N
833	2025-11-11 17:28:46.202711	2025-11-11 17:28:46.202711	21	Friday	11	199	\N	\N	\N	2025-11-21	\N
834	2025-11-11 17:28:46.215415	2025-11-11 17:28:46.215415	22	Saturday	11	199	\N	\N	\N	2025-11-22	\N
836	2025-11-11 17:28:46.234903	2025-11-11 17:28:46.234903	24	Monday	11	199	\N	\N	\N	2025-11-24	\N
839	2025-11-11 17:28:46.248147	2025-11-11 17:28:46.248147	27	Thursday	11	199	\N	\N	\N	2025-11-27	\N
840	2025-11-11 17:28:46.252853	2025-11-11 17:28:46.252853	28	Friday	11	199	\N	\N	\N	2025-11-28	\N
841	2025-11-11 17:28:46.270036	2025-11-11 17:28:46.270036	29	Saturday	11	199	\N	\N	\N	2025-11-29	\N
828	2025-11-11 17:28:46.181733	2025-11-11 19:14:34.696292	16	Sunday	11	199		1838	Meatballs 	2025-11-16	\N
825	2025-11-11 17:28:46.11674	2025-11-11 21:20:39.458233	13	Thursday	11	199	Mazal Tov! 	1839	Schnitzel & Mashed potatoes	2025-11-13	\N
830	2025-11-11 17:28:46.190126	2025-11-12 03:04:03.194258	18	Tuesday	11	199	Mazal Tov! 	1840	Fleishigs 	2025-11-18	\N
831	2025-11-11 17:28:46.194376	2025-11-12 05:26:33.652471	19	Wednesday	11	199		1841	Burgers and fries	2025-11-19	\N
824	2025-11-11 17:28:46.111906	2025-11-12 14:31:16.214159	12	Wednesday	11	199		1842	Chicken, rice, salad	2025-11-12	\N
835	2025-11-11 17:28:46.230888	2025-11-12 19:25:51.286808	23	Sunday	11	199	Mazel Tov!  	1843	Fleshings!!	2025-11-23	\N
829	2025-11-11 17:28:46.186358	2025-11-13 03:09:01.402485	17	Monday	11	199		1844	shnitzel / rice	2025-11-17	\N
848	2025-11-13 14:25:39.980115	2025-11-13 14:25:39.980115	18	Tuesday	11	202	\N	\N	\N	2025-11-18	\N
832	2025-11-11 17:28:46.19895	2025-11-13 22:29:11.548163	20	Thursday	11	199		1846	Take out 	2025-11-20	\N
849	2025-11-16 02:51:51.563864	2025-11-16 02:51:51.563864	19	Wednesday	11	203	\N	\N	\N	2025-11-19	\N
850	2025-11-16 02:51:51.568805	2025-11-16 02:51:51.568805	25	Tuesday	11	203	\N	\N	\N	2025-11-25	\N
851	2025-11-16 02:51:51.572699	2025-11-16 02:51:51.572699	27	Thursday	11	203	\N	\N	\N	2025-11-27	\N
852	2025-11-18 14:40:11.779185	2025-11-18 14:40:11.779185	28	Friday	11	206	\N	\N	\N	2025-11-28	\N
853	2025-11-18 14:40:11.812512	2025-11-18 14:40:11.812512	15	Saturday	11	206	\N	\N	\N	2025-11-15	\N
854	2025-11-18 14:42:44.605504	2025-11-18 14:42:44.605504	25	Tuesday	11	207	\N	\N	\N	2025-11-25	\N
855	2025-11-18 14:42:44.610083	2025-11-18 14:42:44.610083	26	Wednesday	11	207	\N	\N	\N	2025-11-26	\N
856	2025-11-18 14:42:44.614785	2025-11-18 14:42:44.614785	27	Thursday	11	207	\N	\N	\N	2025-11-27	\N
857	2025-11-18 14:42:44.619122	2025-11-18 14:42:44.619122	28	Friday	11	207	\N	\N	\N	2025-11-28	\N
858	2025-11-18 14:46:16.632036	2025-11-18 14:46:16.632036	28	Friday	11	208	\N	\N	\N	2025-11-28	\N
859	2025-11-18 14:46:16.648783	2025-11-18 14:46:16.648783	14	Friday	11	208	\N	\N	\N	2025-11-14	\N
860	2025-11-18 14:46:55.266983	2025-11-18 14:46:55.266983	18	Tuesday	11	209	\N	\N	\N	2025-11-18	\N
861	2025-11-18 14:46:55.271024	2025-11-18 14:46:55.271024	24	Monday	11	209	\N	\N	\N	2025-11-24	\N
862	2025-11-18 14:46:55.275245	2025-11-18 14:46:55.275245	19	Wednesday	11	209	\N	\N	\N	2025-11-19	\N
863	2025-11-18 14:46:55.279729	2025-11-18 14:46:55.279729	20	Thursday	11	209	\N	\N	\N	2025-11-20	\N
864	2025-11-18 14:46:55.283393	2025-11-18 14:46:55.283393	21	Friday	11	209	\N	\N	\N	2025-11-21	\N
865	2025-11-18 14:48:18.792989	2025-11-18 14:48:18.792989	18	Tuesday	11	210	\N	\N	\N	2025-11-18	\N
866	2025-11-18 14:48:18.797205	2025-11-18 14:48:18.797205	19	Wednesday	11	210	\N	\N	\N	2025-11-19	\N
867	2025-11-18 14:48:18.800762	2025-11-18 14:48:18.800762	20	Thursday	11	210	\N	\N	\N	2025-11-20	\N
868	2025-11-18 14:48:18.805023	2025-11-18 14:48:18.805023	21	Friday	11	210	\N	\N	\N	2025-11-21	\N
869	2025-11-18 14:50:23.506097	2025-11-18 14:50:23.506097	26	Wednesday	11	211	\N	\N	\N	2025-11-26	\N
870	2025-11-18 14:50:23.509565	2025-11-18 14:50:23.509565	27	Thursday	11	211	\N	\N	\N	2025-11-27	\N
871	2025-11-18 14:50:23.512801	2025-11-18 14:50:23.512801	28	Friday	11	211	\N	\N	\N	2025-11-28	\N
872	2025-11-18 15:10:24.491134	2025-11-18 15:10:24.491134	27	Thursday	11	212	\N	\N	\N	2025-11-27	\N
873	2025-11-18 15:10:24.495117	2025-11-18 15:10:24.495117	28	Friday	11	212	\N	\N	\N	2025-11-28	\N
837	2025-11-11 17:28:46.239333	2025-11-20 23:25:04.850664	25	Tuesday	11	199	From Idit Bazes	1842	Salmon, rice, veggies	2025-11-25	\N
876	2025-11-23 18:23:13.301865	2025-11-23 18:23:13.301865	28	Friday	11	215	\N	\N	\N	2025-11-28	\N
877	2025-11-23 18:23:13.33027	2025-11-23 18:23:13.33027	29	Saturday	11	215	\N	\N	\N	2025-11-29	\N
874	2025-11-23 18:22:19.044637	2025-11-25 22:09:27.421783	27	Thursday	11	215	Mazal tov! 	1858	Pizza, fries, salad	2025-11-27	\N
838	2025-11-11 17:28:46.243752	2025-11-26 01:43:00.068595	26	Wednesday	11	199		1842	Supper from Chani Haberman	2025-11-26	\N
875	2025-11-23 18:22:19.049569	2025-11-26 18:16:49.77327	4	Thursday	12	215	Mia Warshaw 	1624		2025-12-04	\N
879	2025-11-23 18:23:13.350451	2025-11-23 18:29:55.43127	1	Monday	12	215	Mazel tov!!	1856	Tacos Iy’H 	2025-12-01	\N
881	2025-11-23 18:23:13.361741	2025-11-23 18:44:30.211333	3	Wednesday	12	215	Mazel Tov!	1830	TBD	2025-12-03	\N
878	2025-11-23 18:23:13.345298	2025-11-23 18:46:29.820788	30	Sunday	11	215	Mazal Tov!!	1832	Chicken, rice, and salad	2025-11-30	\N
882	2025-11-25 22:21:26.961434	2025-11-25 22:21:26.961434	2	Tuesday	12	215	\N	\N	\N	2025-12-02	\N
886	2025-12-01 18:28:45.394144	2025-12-01 18:28:45.394144	5	Friday	12	216	\N	\N	\N	2025-12-05	\N
887	2025-12-01 18:28:45.409031	2025-12-01 18:28:45.409031	6	Saturday	12	216	\N	\N	\N	2025-12-06	\N
888	2025-12-01 18:28:45.422418	2025-12-01 19:12:01.882918	7	Sunday	12	216	Mazal tov!	1859	Dairy	2025-12-07	\N
885	2025-12-01 18:28:45.389256	2025-12-01 19:31:32.542488	4	Thursday	12	216	Mazel tov!!!	1860	Shwarma, rice, Israeli salad	2025-12-04	\N
883	2025-12-01 18:28:45.379093	2025-12-01 20:26:39.082052	3	Wednesday	12	216	Mazel Tov!	1861	TBD	2025-12-03	\N
884	2025-12-01 18:28:45.384568	2025-12-01 21:19:50.180168	10	Wednesday	12	216	Mazel Tov! 	1830	TBD	2025-12-10	\N
889	2025-12-01 18:28:45.42606	2025-12-02 01:32:11.019613	8	Monday	12	216	Mazel Tov!	1864	Meat Dinner	2025-12-08	\N
890	2025-12-01 18:28:45.429906	2025-12-02 03:10:57.683346	9	Tuesday	12	216		1865	TBD 	2025-12-09	\N
891	2025-12-01 18:28:45.433715	2025-12-04 14:34:16.151144	11	Thursday	12	216	Mazel Tov!	1870	TBD	2025-12-11	\N
895	2025-12-05 17:30:25.59288	2025-12-05 17:30:25.59288	12	Friday	12	219	\N	\N	\N	2025-12-12	\N
897	2025-12-05 17:30:25.619713	2025-12-05 17:30:25.619713	13	Saturday	12	219	\N	\N	\N	2025-12-13	\N
902	2025-12-05 17:30:25.661409	2025-12-05 17:30:25.661409	18	Thursday	12	219	\N	\N	\N	2025-12-18	\N
903	2025-12-05 17:30:25.665624	2025-12-05 17:30:25.665624	19	Friday	12	219	\N	\N	\N	2025-12-19	\N
904	2025-12-05 17:30:25.678362	2025-12-05 17:30:25.678362	20	Saturday	12	219	\N	\N	\N	2025-12-20	\N
898	2025-12-05 17:30:25.642622	2025-12-05 18:43:33.522685	14	Sunday	12	219		1741		2025-12-14	\N
905	2025-12-05 17:30:25.696258	2025-12-05 22:01:33.082185	21	Sunday	12	219	Mazal Tov!!	1832	Chicken, rice, salad	2025-12-21	\N
899	2025-12-05 17:30:25.647175	2025-12-06 23:30:45.82978	15	Monday	12	219	Mazel tov!	1872	Something Meat	2025-12-15	\N
893	2025-12-05 17:30:25.57993	2025-12-07 01:07:47.754279	9	Tuesday	12	219	Mazal Tov!!	1873	Dairy 	2025-12-09	\N
892	2025-12-05 17:30:25.570443	2025-12-07 01:27:27.070262	8	Monday	12	219	Mazel Tov!	1856	Tacos	2025-12-08	\N
896	2025-12-05 17:30:25.612183	2025-12-08 18:18:16.668992	11	Thursday	12	219		1624	Rachel Wilkerson 	2025-12-11	\N
900	2025-12-05 17:30:25.652177	2025-12-09 13:46:03.367554	16	Tuesday	12	219	Mazal tov!!	1645	Meatballs rice salad	2025-12-16	\N
894	2025-12-05 17:30:25.585296	2025-12-09 13:53:55.425515	10	Wednesday	12	219		1744	Rice, chicken cutlets, veggies 	2025-12-10	\N
901	2025-12-05 17:30:25.656409	2025-12-09 18:51:17.183975	17	Wednesday	12	219		1624	Reena Zisquit	2025-12-17	\N
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.events (id, name, start_date, end_date, created_at, updated_at, recipent_email, recipent_name, address1, address2, city, state, adults, kids, allergies, preferred_time, dietary_restrictions, special_message, owner_id, type, "least", shabbat_instructions, fav_rest, step, country, postal_code, status, date_range, slug) FROM stdin;
193	eee312	2025-08-27 04:00:00	2025-08-28 04:00:00	2025-08-28 03:04:16.955873	2025-09-02 21:08:58.900774	gusffp@gmail.com	312	1455 North Treasure Drive	6a	North Bay Village	FL	\N	\N					1203	ChesedTrain				\N	United States	33141	0	\N	eee312
199	Haberman meal train	2025-11-12 05:00:00	2025-11-29 05:00:00	2025-11-11 17:26:27.586856	2025-11-13 05:57:29.23464	Mlhaberman@bethrivkah.edu	Millie Haberman	41 East 92nd Street  		Brooklyn	Ny	2	2		5:00- 6:30 pm	None bh	Thank you!	1842	ChesedTrain	Hot Dogs, Salami		all are great!	\N	USA 	11212	0	\N	haberman-meal-train
204	IPVbnLWqPMWbMglaJg	\N	\N	2025-11-16 09:44:43.120702	2025-11-16 09:44:43.120702	qigukepome09@gmail.com	dHPMvcOrMPvndYexvhA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1849	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ipvbnlwqpmwbmglajg
205	XouXEiBEnDOztLHelfYsG	\N	\N	2025-11-16 09:53:51.103145	2025-11-16 09:53:51.103145	qigukepome09@gmail.com	htkTxkNclBgKTbVHdoMjHV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1850	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	xouxeibendoztlhelfysg
213	aWqaAtnBkxZEbcMQocmdV	\N	\N	2025-11-21 13:03:59.672887	2025-11-21 13:03:59.672887	vunaxeka86@gmail.com	tjgsZyrnqDZlezQzYbSfrCh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1854	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	awqaatnbkxzebcmqocmdv
217	QZTvIAPjLWrhDejOkksrOwNa	\N	\N	2025-12-03 14:52:28.079374	2025-12-03 14:52:28.079374	iqunewafame765@gmail.com	WgRLCIjaHWWVEVZTCAsBOfpd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1867	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	qztviapjlwrhdejokksrowna
219	Warshaw Baby	2025-12-08 05:00:00	2025-12-21 05:00:00	2025-12-05 17:29:25.806101	2025-12-09 00:35:21.208403	Nechama.Schachter@gmail.Com	Mia & Yonatan Warshaw	3104 Bermwood Lane		Hollywood	FL	4	1	No	5 pm		Mazal Tov Mia and Yonatan Warshaw on your new princess!!	1624	ChesedTrain				\N	United States	33021	0	"2025-12-10, 2025-12-12, 2025-12-13, 2025-12-16, 2025-12-17, 2025-12-18, 2025-12-19, 2025-12-20, 2025-12-14, 2025-12-21, 2025-12-15, 2025-12-09, 2025-12-08, 2025-12-11"	warshaw-baby
223	siJAuRNxzBBgqGBtKrHryOx	\N	\N	2025-12-22 15:52:06.372265	2025-12-22 15:52:06.372265	ruwiyobo306@gmail.com	lPUaXNgHTRxdsmopropUmBg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1877	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	sijaurnxzbbgqgbtkrhryox
196	2nd one	2025-09-11 04:00:00	2025-09-20 04:00:00	2025-09-11 20:16:41.360263	2025-09-11 21:18:43.204344	gustavoanalytics@gmail.com	312	1455 North Treasure Drive	6a	North Bay Village	FL	\N	\N				this is a special message	1203	ChesedTrain				\N	United States	33141	0	"2025-09-11, 2025-09-15, 2025-09-16, 2025-09-19, 2025-09-20"	2nd-one
227	qfPXryQoZdySBEgvetmQJi	\N	\N	2026-01-07 09:33:56.664165	2026-01-07 09:33:56.664165	hi.sez.uk.od.ine83@gmail.com	kyaoIuJXunmMiiJPAmR	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1881	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	qfpxryqozdysbegvetmqji
235	tnGvBblCRXMKtVJYDU	\N	\N	2026-01-27 01:20:19.947672	2026-01-27 01:20:19.947672	gug.o.he.zuhu951@gmail.com	KMEEuLYjDlmjywjRRY	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1886	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	tngvbblcrxmktvjydu
236	vsbjDXXAPNWCypZgaiWjc	\N	\N	2026-01-27 01:24:56.582763	2026-01-27 01:24:56.582763	gugo.hez.u.h.u95.1@gmail.com	HOtDEGkYWwHHpdGjhtEoZ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1887	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	vsbjdxxapnwcypzgaiwjc
241	rkIlXIGgQghXpNftIV	\N	\N	2026-01-28 10:54:14.653338	2026-01-28 10:54:14.653338	ime.ju.r.ujafu89@gmail.com	hptOIkNGyZYUvcWeXV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1892	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	rkilxiggqghxpnftiv
245	WFATUGdufikpSDuFstl	\N	\N	2026-02-02 18:47:10.9821	2026-02-02 18:47:10.9821	f.ohi.h.ago.gi.81@gmail.com	gwDspWekirQcgNvvdyYWtJtD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1896	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	wfatugdufikpsdufstl
249	nGTUJnIXqmWhWkSYoTdS	\N	\N	2026-02-04 23:48:47.172983	2026-02-04 23:48:47.172983	ke.v.et.aj.ahu.q05@gmail.com	YScwAqqzMnoKJQwjYPMxT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1900	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ngtujnixqmwhwksyotds
250	TdKCtCZlTPYOoqlgXzbU	\N	\N	2026-02-04 23:54:58.142736	2026-02-04 23:54:58.142736	ke.v.e.taj.ahu.q05@gmail.com	eTvrXQAuiFjoIzgBCQAzbqG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1901	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	tdkctczltpyooqlgxzbu
224	hzdgBNjbpQBfdvWrIyK	\N	\N	2026-01-04 21:02:30.940907	2026-01-04 21:02:30.940907	azeyeriguzu06@gmail.com	xdTgvAJUWOqrxfdIZpwM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1878	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	hzdgbnjbpqbfdvwriyk
228	gqSdssKrNrNBdszTHPCR	\N	\N	2026-01-07 09:53:41.767372	2026-01-07 09:53:41.767372	h.is.ezu.kodi.ne.83@gmail.com	BgidPGnEokkLHUJoXVFFG	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1882	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	gqsdsskrnrnbdszthpcr
232	IXUJcyaflbtoShjQJZyOZjxE	\N	\N	2026-01-25 01:20:29.223286	2026-01-25 01:20:29.223286	z.u.h.a.foho.d.u5.2@gmail.com	ECeOGkOXiwbIhEulLV	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1883	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ixujcyaflbtoshjqjzyozjxe
237	ILyBvpbPVmJGxuVG	\N	\N	2026-01-27 01:34:36.43446	2026-01-27 01:34:36.43446	gugo.he.z.u.hu9.51@gmail.com	rsqIRPIFmxwxfnZWQrPKJ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1888	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ilybvpbpvmjgxuvg
206	Test	2025-11-28 05:00:00	2025-11-15 05:00:00	2025-11-18 14:40:06.909431	2025-11-18 14:41:55.425195	miamirabbi@gmail.com	Test 	4300 Alton Road		Miami Beach	FL	2	3	Na				1851	ChesedTrain				\N	United States	33140	0	\N	test-abde9e5e-0296-4895-9ae5-c64f50985d7a
242	HwFYIdgrdajkVaTlVMpqiRgZ	\N	\N	2026-01-31 11:36:06.661728	2026-01-31 11:36:06.661728	f.i.sek.uvexe7.8.8@gmail.com	wGgpXuYsBuzwlovGsOWDISqI	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1893	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	hwfyidgrdajkvatlvmpqirgz
186	Barannikov Baby	2025-08-18 04:00:00	2025-09-04 04:00:00	2025-08-14 22:34:27.609628	2025-09-02 21:08:58.878743	Nechama.Schachter@gmail.Com	Shoshana & Gary Barannikov	3897 Meadow Lane 		Hollywood	FL	2	2	None	5 pm		Mazal Tov Shoshana & Gary Barannikov on your new princess!!	1624	ChesedTrain				\N	United States	33021	0	"2025-08-18 to 2025-09-04"	barannikov-baby
188	Test	2025-08-28 04:00:00	2025-08-28 04:00:00	2025-08-28 01:47:33.78073	2025-09-02 21:08:58.88753	\N	\N	4300 Alton rd		Miami 	Fl	\N	\N		6:30pm			1817	Potluck	\N	\N	\N	\N	Usa	33140	0	\N	test
194	eee312	\N	\N	2025-09-02 19:29:25.136089	2025-09-02 21:08:58.905143	gustavoanalytics@gmail.com	2	1455 North Treasure Drive	6a	North Bay Village	FL	\N	\N	\N	\N	\N	\N	1822	ChesedTrain	\N	\N	\N	\N	United States	33141	0	\N	eee312-208eb5d6-a48c-446f-836c-19a5dbb1206f
246	ZIULwXurAcfLFeqaZ	\N	\N	2026-02-02 19:57:09.681123	2026-02-02 19:57:09.681123	f.oh.i.h.a.gogi81@gmail.com	ruMCBEmnGBNUDSZgchRxB	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1897	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ziulwxuracflfeqaz
208	Test 	2025-11-28 05:00:00	2025-11-14 05:00:00	2025-11-18 14:46:10.261417	2025-11-18 14:46:25.88174	miamirabbi@gmail.com	Tes	4300 Alton Road		Miami Beach	FL	2	2					1851	ChesedTrain				\N	United States	33140	0	\N	test-bd96dd3d-d255-41ca-a428-e2020d8e0420
209	2nd one	2025-11-18 05:00:00	2025-11-21 05:00:00	2025-11-18 14:46:36.904759	2025-11-18 14:46:57.367817	gustavoanalytics@gmail.com	312	1455 N TREASURE DR APT 6A		North Bay Village	FL	\N	\N					1203	ChesedTrain				\N	United States	33141	0	\N	2nd-one-083ae41c-3fd5-447e-921e-8fcce52d7ac0
210	2nd one	2025-11-18 05:00:00	2025-11-21 05:00:00	2025-11-18 14:48:10.190251	2025-11-18 14:48:20.806051	pares101@aol.com	312	1455 N TREASURE DR APT 6A		North Bay Village	FL	\N	\N					1852	ChesedTrain				\N	United States	33141	0	\N	2nd-one-46a5292f-12d4-44f8-99a4-ddd613902106
211	Test	2025-11-26 05:00:00	2025-11-28 05:00:00	2025-11-18 14:50:13.837989	2025-11-18 14:50:30.21663	miamirabbi@gmail.com	Test	4300 Alton Road		Miami Beach	FL	2	2					1851	ChesedTrain				\N	United States	33140	0	\N	test-fde7baf1-a8f6-4813-8ab2-2068837ebe1b
214	NJzFivNUhWStmMBAaJUW	\N	\N	2025-11-21 13:37:58.445466	2025-11-21 13:37:58.445466	vunaxeka86@gmail.com	YEwxrnsoVbXMomKBkSaBX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1855	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	njzfivnuhwstmmbaajuw
218	FFxWwUNYcGVFMpsGgKC	\N	\N	2025-12-03 15:06:38.12827	2025-12-03 15:06:38.12827	iqunewafame765@gmail.com	jDvJDCSaJFYbBXyZSuByZd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1868	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ffxwwunycgvfmpsggkc
220	cpVbwGnSIkwRVZBfnAHorFs	\N	\N	2025-12-07 06:18:34.79708	2025-12-07 06:18:34.79708	adajahas277@gmail.com	naXnfmJOWGyRNhAtmfORya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1874	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	cpvbwgnsikwrvzbfnahorfs
201	Wasserman 	\N	\N	2025-11-13 14:24:23.714545	2025-11-13 14:24:23.714545	Dnless	Wasserman family	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1845	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	wasserman
243	yIQWkgQtGPpZLGIbPTJRzPz	\N	\N	2026-01-31 11:52:21.761267	2026-01-31 11:52:21.761267	fi.sek.uv.ex.e.7.8.8@gmail.com	AGcstowKgkUhSzsMITIVQOg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1894	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	yiqwkgqtgppzlgibptjrzpz
247	ktKaebxCtonCyYQuMAc	\N	\N	2026-02-02 20:15:48.774651	2026-02-02 20:15:48.774651	fohi.h.agog.i.8.1@gmail.com	xPiaPCZYniGYFzpl	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1898	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ktkaebxctoncyyqumac
202	Wasserman 	2025-11-18 05:00:00	2025-11-18 05:00:00	2025-11-13 14:25:06.663902	2025-11-13 14:26:04.232124	Dnlwss@ Hotmail.com	Wasserman family	73 e 91	Eny& Rutland 	Brooklyn	NY	2	1				No fish please 	1845	ChesedTrain				\N	United States	11212-1302	0	\N	wasserman-09907801-ca6e-46b2-8a50-ff25f8f732d4
190	xxx	2026-02-20 05:00:00	2026-02-20 05:00:00	2025-08-28 01:58:44.90887	2025-09-02 21:08:58.892365	\N	\N	1455 North Treasure Drive	6a	North Bay Village	FL	\N	\N		312			1203	Potluck	\N	\N	\N	\N	United States	33141	0	\N	xxx
207	Test	2025-11-25 05:00:00	2025-11-28 05:00:00	2025-11-18 14:42:36.492707	2025-11-18 14:42:51.636397	miamirabbi@gmail.com	Tes	4300 Alton Road		Miami Beach	FL	2	2					1851	ChesedTrain				\N	United States	33140	0	\N	test-2ec1aa39-5768-4669-a2b8-2ea8f40e4f5c
198	Williams Baby 	2025-09-25 04:00:00	2025-10-04 04:00:00	2025-09-16 18:04:48.936763	2025-09-28 23:22:29.321698	Nechama.Schachter@gmail.Com	Chana Ora & Jeremy Williams 	5820 Lakeshore Dr	Apt 102	Ft. Lauderdale 	FL 	2	0	No	6 pm		Mazal Tov Chana Ora & Jeremy Williams on your new baby boy!!!	1624	ChesedTrain				\N	United States	33312	0	"2025-09-26, 2025-09-27, 2025-10-02, 2025-10-03, 2025-10-04, 2025-09-30, 2025-10-05, 2025-09-29, 2025-09-28, 2025-09-25, 2025-10-01"	williams-baby
215	Levy Baby 	2025-11-27 05:00:00	2025-12-02 05:00:00	2025-11-23 18:21:40.952725	2025-11-25 22:21:26.972839	Nechama.Schachter@gmail.Com	Yael & Raffi Levy	3182 Stirling Rd, C4 		Hollywood	FL	2	1	No	5 pm		Mazal Tov Yael & Raffi Levy on your new baby!!	1624	ChesedTrain				\N	United States	33021	0	"2025-12-04, 2025-11-28, 2025-11-29, 2025-11-27, 2025-12-01, 2025-12-03, 2025-11-30, 2025-12-02"	levy-baby
221	zIizzpwOIbjwPPYa	\N	\N	2025-12-07 07:16:34.760398	2025-12-07 07:16:34.760398	adajahas277@gmail.com	LcQNZcpCYmBBtZMGVOgiWUo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1875	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ziizzpwoibjwppya
225	xHaUuHKkbLfISIkoRNTt	\N	\N	2026-01-04 22:05:41.279647	2026-01-04 22:05:41.279647	yetojifez897@gmail.com	xTYJGakLCMaVUlZFksoUkKX	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1879	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	xhauuhkkblfisikorntt
233	rGmnOyaoWsNxKiWx	\N	\N	2026-01-25 02:23:10.839086	2026-01-25 02:23:10.839086	zuha.f.o.hod.u52@gmail.com	GdmBqhkclnfodIEOrqquXnu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1884	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	rgmnoyaowsnxkiwx
238	cadgZNeSKqbcpXKYEaBkJrrA	\N	\N	2026-01-27 02:09:07.852584	2026-01-27 02:09:07.852584	g.ugohez.u.hu95.1@gmail.com	JakwaTezGtQEIdwwCGzT	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1889	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	cadgzneskqbcpxkyeabkjrra
203	Test 	2025-11-19 05:00:00	2025-11-27 05:00:00	2025-11-16 02:51:29.300417	2025-11-16 02:51:51.577678	mendylevy@gmail.com	Test 	2815 Prairie Ave		Miami Beach	FL	\N	\N	\N	\N	\N	\N	1848	ChesedTrain	\N	\N	\N	\N	United States	33140	0	\N	test-95f718e1-f9b7-4527-8025-2735a4f82c91
212	Test	2025-11-27 05:00:00	2025-11-28 05:00:00	2025-11-18 15:10:14.87176	2025-11-18 15:10:48.734638	miamirabbi@gmail.com	Test	4300 Alton Road		Miami Beach	FL	2	3					1853	ChesedTrain				\N	United States	33140	0	\N	test-5bd189e2-017e-4826-bb48-ec629c34d148
137	Mazel Tov to Yehudis and Chesky on the birth of a baby girl!!	2025-03-19 04:00:00	2025-04-02 04:00:00	2025-03-19 17:00:01.164241	2025-09-02 21:08:58.858756	carlykhabinsky@gmail.com	Yehudis and Chesky Sheinkopf	17000 NE 7th ct		North Miami Beach	FL	2	2	Sesame, tree nuts	5:30		Please help to fill this meal train!	512	ChesedTrain				\N	United States	33162-2150	0	\N	mazel-tov-to-yehudis-and-chesky-on-the-birth-of-a-baby-girl
152	Lorrie Klemons	2025-04-30 04:00:00	2025-04-30 04:00:00	2025-04-04 16:28:38.697942	2025-09-02 21:08:58.864975	Lorrieklemons@gmail.com	Lorrie Klemons	2199 Leopold Way		Sun Prairie	WI	2	\N	None	6pm	Keeps kosher 		706	ChesedTrain	Beets, spinach 	Brisket 		\N	United States	53590	0	\N	lorrie-klemons
156	BIC Kindness List	2025-04-24 04:00:00	2025-04-29 04:00:00	2025-04-19 00:41:42.619249	2025-09-02 21:08:58.869327	kindness@bethisraelcenter.org	Mary	see address in email		Madison	WI	1	\N	No	Between 5:00 and 6:00 pm. 	None	See email	724	ChesedTrain	hot dogs	No		\N	United States	53717	0	\N	bic-kindness-list
184	Borin Baby	2025-08-14 04:00:00	2025-08-29 04:00:00	2025-08-03 20:23:00.162744	2025-09-02 21:08:58.874112	Nechama.Schachter@gmail.Com	Avital & Maksim Borin and family 	5951 sw 32 terrace		Ft Lauderdale 	FL 	2	5	Nuts	5 pm		Mazal Tov Avital & Maksim Borin on your new baby! \n\n2 kids are picky eaters 	1624	ChesedTrain				\N	USA 	33312	0	"2025-08-14 to 2025-08-29"	borin-baby
191	xxx	2026-02-20 05:00:00	2026-02-20 05:00:00	2025-08-28 02:27:59.489548	2025-09-02 21:08:58.896388	\N	\N	1455 North Treasure Drive	6a	North Bay Village	FL	\N	\N		312312			1203	Potluck	\N	\N	\N	\N	United States	33141	0	\N	xxx-1c15002b-bf37-4d0a-9f49-8c917fe411e0
216	Burle Family 	2025-12-03 05:00:00	2025-12-11 05:00:00	2025-12-01 18:26:45.14743	2025-12-01 19:13:17.536094	Elianadalfen@gmail.com	Eliana and Ephraim Burle	5511 Garfield Street		Hollywood	Florida	2	1	No				1859	ChesedTrain				\N	US	33021	0	"2025-12-03, 2025-12-10, 2025-12-04, 2025-12-05, 2025-12-06, 2025-12-08, 2025-12-09, 2025-12-11, 2025-12-07"	burle-baby
222	ecNaudaNYSzwzxLYYcbF	\N	\N	2025-12-08 15:29:14.168765	2025-12-08 15:29:14.168765	liqucuradu460@gmail.com	tuhLkaNhYArDuQYVSDi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1876	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	ecnaudanyszwzxlyycbf
226	FVCZsuENrKDaGpCkBtWc	\N	\N	2026-01-04 22:19:54.878071	2026-01-04 22:19:54.878071	yetojifez897@gmail.com	bjsORaZIvwSQVoGpCEAwyN	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1880	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	fvczsuenrkdagpckbtwc
234	RAcuulgmNeCNjJDn	\N	\N	2026-01-25 03:10:41.49188	2026-01-25 03:10:41.49188	w.ihi.l.o.ni.z.ey21@gmail.com	ZrkpmoLMKMwAnTQwhSQBju	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1885	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	racuulgmnecnjjdn
239	fCmJEBNJrDzFFmBjrv	\N	\N	2026-01-28 09:48:03.954869	2026-01-28 09:48:03.954869	i.meju.rujaf.u.8.9@gmail.com	azWYdwXaolwvcRUEfnExTg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1890	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	fcmjebnjrdzffmbjrv
240	QbkTiGKdXuCQshcBuZE	\N	\N	2026-01-28 09:53:12.398919	2026-01-28 09:53:12.398919	imejuruj.afu8.9@gmail.com	aAXCkTljhFHYPmiGpzC	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1891	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	qbktigkdxucqshcbuze
244	IGmmHVYrKDjhUaqeeeZunHR	\N	\N	2026-01-31 13:36:11.048619	2026-01-31 13:36:11.048619	f.ise.k.uv.e.xe7.88@gmail.com	ARHuCuHkpqvdRGuwSIhEJ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1895	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	igmmhvyrkdjhuaqeeezunhr
248	XpTSkmaAwPjaCKqxrAI	\N	\N	2026-02-04 23:23:50.273393	2026-02-04 23:23:50.273393	xuxevuw.ad.ep7.8.5@gmail.com	MtdxFzycSHneRnKnprgeo	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1899	ChesedTrain	\N	\N	\N	\N	\N	\N	0	\N	xptskmaawpjackqxrai
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.schema_migrations (version) FROM stdin;
20241224042401
20241223092411
20241223081134
20241223081043
20241223070425
20241223065720
20241223052508
20241223050812
20241218225357
20241218225343
20241218223610
20241218210445
20241216220923
20241216211406
20241216211139
20241216211013
20241213024518
20241213023219
20241213021828
20241211045834
20241211045614
20241211045438
20241211044445
20241211044444
20241225210209
20241225224213
20241226002700
20241226024912
20241229183333
20241229192103
20241229193628
20241231215351
20241231220440
20250101195010
20250108004634
20250119172317
20250119232754
20250120005854
20250128053908
20250203031036
20250204031819
20250218041338
20250307085350
20250325181521
20250325205438
20250326184008
20250326191953
20250326194434
20250327022944
20250423183652
20250424200913
20250721131656
20250721175309
20250902204018
\.


--
-- Data for Name: selections; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.selections (id, created_at, updated_at, name, quantity, special_note, placeholder, potluck_id, volunteer_id, bringing, potluck_date, event_date_id) FROM stdin;
494	2025-08-28 02:27:59.494569	2025-08-28 02:28:04.078567	Salads	1		Salads	191	\N	\N	2026-02-20 05:00:00	\N
495	2025-08-28 02:27:59.495801	2025-08-28 02:28:04.079734	Side Dishes	1		Side Dishes	191	\N	\N	2026-02-20 05:00:00	\N
496	2025-08-28 02:27:59.498055	2025-08-28 02:28:04.080756	Main Dishes	1		Main Dishes	191	\N	\N	2026-02-20 05:00:00	\N
497	2025-08-28 02:27:59.499778	2025-08-28 02:28:04.081698	Beverages	1		Beverages	191	\N	\N	2026-02-20 05:00:00	\N
498	2025-08-28 02:27:59.500997	2025-08-28 02:28:04.082782	Desserts	1		Desserts	191	\N	\N	2026-02-20 05:00:00	\N
541	2025-09-16 18:07:38.043342	2025-09-16 18:07:38.043342	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-09-26 04:00:00	815
542	2025-09-16 18:07:38.045258	2025-09-16 18:07:38.045258	Salads	1	\N	Salads	\N	\N	\N	2025-09-26 04:00:00	815
543	2025-09-16 18:07:38.046534	2025-09-16 18:07:38.046534	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-09-26 04:00:00	815
544	2025-09-16 18:07:38.047811	2025-09-16 18:07:38.047811	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-09-26 04:00:00	815
545	2025-09-16 18:07:38.049171	2025-09-16 18:07:38.049171	Beverages	1	\N	Beverages	\N	\N	\N	2025-09-26 04:00:00	815
546	2025-09-16 18:07:38.05058	2025-09-16 18:07:38.05058	Desserts	1	\N	Desserts	\N	\N	\N	2025-09-26 04:00:00	815
547	2025-09-16 18:07:38.057337	2025-09-16 18:07:38.057337	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-09-27 04:00:00	816
548	2025-09-16 18:07:38.059014	2025-09-16 18:07:38.059014	Salads	1	\N	Salads	\N	\N	\N	2025-09-27 04:00:00	816
549	2025-09-16 18:07:38.06085	2025-09-16 18:07:38.06085	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-09-27 04:00:00	816
550	2025-09-16 18:07:38.062411	2025-09-16 18:07:38.062411	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-09-27 04:00:00	816
493	2025-08-28 02:27:59.492879	2025-10-27 17:08:43.530518	Appetizers	1		Appetizers	191	1203	testing it out	2026-02-20 05:00:00	\N
424	2025-08-14 22:35:12.025958	2025-08-15 10:58:18.014328	Main Dishes	1		Main Dishes	\N	1751	Meat and chicken 	2025-08-22 04:00:00	757
385	2025-08-03 20:24:04.271221	2025-08-03 20:25:13.12901	Appetizers	1		Appetizers	\N	\N	\N	2025-08-15 04:00:00	734
386	2025-08-03 20:24:04.273986	2025-08-03 20:25:13.133738	Salads	1		Salads	\N	\N	\N	2025-08-15 04:00:00	734
387	2025-08-03 20:24:04.277164	2025-08-03 20:25:13.138031	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-15 04:00:00	734
388	2025-08-03 20:24:04.280201	2025-08-03 20:25:13.142276	Main Dishes	1		Main Dishes	\N	\N	\N	2025-08-15 04:00:00	734
389	2025-08-03 20:24:04.283003	2025-08-03 20:25:13.146571	Beverages	1		Beverages	\N	\N	\N	2025-08-15 04:00:00	734
390	2025-08-03 20:24:04.285896	2025-08-03 20:25:13.150814	Desserts	1		Desserts	\N	\N	\N	2025-08-15 04:00:00	734
391	2025-08-03 20:24:04.298823	2025-08-03 20:25:16.710245	Appetizers	1		Appetizers	\N	\N	\N	2025-08-16 04:00:00	735
392	2025-08-03 20:24:04.302574	2025-08-03 20:25:16.714025	Salads	1		Salads	\N	\N	\N	2025-08-16 04:00:00	735
393	2025-08-03 20:24:04.306339	2025-08-03 20:25:16.717733	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-16 04:00:00	735
394	2025-08-03 20:24:04.309918	2025-08-03 20:25:16.721751	Main Dishes	1		Main Dishes	\N	\N	\N	2025-08-16 04:00:00	735
395	2025-08-03 20:24:04.31324	2025-08-03 20:25:16.725396	Beverages	1		Beverages	\N	\N	\N	2025-08-16 04:00:00	735
396	2025-08-03 20:24:04.317451	2025-08-03 20:25:16.729369	Desserts	1		Desserts	\N	\N	\N	2025-08-16 04:00:00	735
475	2025-08-28 01:47:33.784144	2025-08-28 01:48:01.019443	Appetizers	1		Appetizers	188	\N	\N	2025-08-28 04:00:00	\N
476	2025-08-28 01:47:33.785874	2025-08-28 01:48:01.021241	Salads	1		Salads	188	\N	\N	2025-08-28 04:00:00	\N
477	2025-08-28 01:47:33.787158	2025-08-28 01:48:01.022805	Side Dishes	1		Side Dishes	188	\N	\N	2025-08-28 04:00:00	\N
478	2025-08-28 01:47:33.788363	2025-08-28 01:48:01.024121	Main Dishes	1		Main Dishes	188	\N	\N	2025-08-28 04:00:00	\N
479	2025-08-28 01:47:33.789403	2025-08-28 01:48:01.025294	Beverages	1		Beverages	188	\N	\N	2025-08-28 04:00:00	\N
480	2025-08-28 01:47:33.790489	2025-08-28 01:48:01.026265	Desserts	1		Desserts	188	\N	\N	2025-08-28 04:00:00	\N
523	2025-09-11 20:17:17.767649	2025-09-11 20:17:17.767649	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-09-19 04:00:00	804
551	2025-09-16 18:07:38.064019	2025-09-16 18:07:38.064019	Beverages	1	\N	Beverages	\N	\N	\N	2025-09-27 04:00:00	816
552	2025-09-16 18:07:38.065576	2025-09-16 18:07:38.065576	Desserts	1	\N	Desserts	\N	\N	\N	2025-09-27 04:00:00	816
553	2025-09-16 18:07:38.096346	2025-09-16 18:07:38.096346	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-10-03 04:00:00	822
554	2025-09-16 18:07:38.09819	2025-09-16 18:07:38.09819	Salads	1	\N	Salads	\N	\N	\N	2025-10-03 04:00:00	822
555	2025-09-16 18:07:38.099802	2025-09-16 18:07:38.099802	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-10-03 04:00:00	822
524	2025-09-11 20:17:17.769774	2025-09-11 20:17:17.769774	Salads	1	\N	Salads	\N	\N	\N	2025-09-19 04:00:00	804
525	2025-09-11 20:17:17.771268	2025-09-11 20:17:17.771268	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-09-19 04:00:00	804
526	2025-09-11 20:17:17.772737	2025-09-11 20:17:17.772737	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-09-19 04:00:00	804
527	2025-09-11 20:17:17.774206	2025-09-11 20:17:17.774206	Beverages	1	\N	Beverages	\N	\N	\N	2025-09-19 04:00:00	804
528	2025-09-11 20:17:17.775441	2025-09-11 20:17:17.775441	Desserts	1	\N	Desserts	\N	\N	\N	2025-09-19 04:00:00	804
529	2025-09-11 20:17:17.782856	2025-09-11 20:17:17.782856	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-09-20 04:00:00	805
530	2025-09-11 20:17:17.784582	2025-09-11 20:17:17.784582	Salads	1	\N	Salads	\N	\N	\N	2025-09-20 04:00:00	805
531	2025-09-11 20:17:17.785814	2025-09-11 20:17:17.785814	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-09-20 04:00:00	805
532	2025-09-11 20:17:17.786933	2025-09-11 20:17:17.786933	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-09-20 04:00:00	805
533	2025-09-11 20:17:17.788654	2025-09-11 20:17:17.788654	Beverages	1	\N	Beverages	\N	\N	\N	2025-09-20 04:00:00	805
534	2025-09-11 20:17:17.789749	2025-09-11 20:17:17.789749	Desserts	1	\N	Desserts	\N	\N	\N	2025-09-20 04:00:00	805
556	2025-09-16 18:07:38.101061	2025-09-16 18:07:38.101061	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-10-03 04:00:00	822
557	2025-09-16 18:07:38.102186	2025-09-16 18:07:38.102186	Beverages	1	\N	Beverages	\N	\N	\N	2025-10-03 04:00:00	822
421	2025-08-14 22:35:12.021434	2025-08-14 22:36:25.002754	Appetizers	1		Appetizers	\N	\N	\N	2025-08-22 04:00:00	757
422	2025-08-14 22:35:12.022901	2025-08-14 22:36:25.007961	Salads	1		Salads	\N	\N	\N	2025-08-22 04:00:00	757
423	2025-08-14 22:35:12.024772	2025-08-14 22:36:25.012119	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-22 04:00:00	757
425	2025-08-14 22:35:12.027175	2025-08-14 22:36:25.018631	Beverages	1		Beverages	\N	\N	\N	2025-08-22 04:00:00	757
426	2025-08-14 22:35:12.028291	2025-08-14 22:36:25.021988	Desserts	1		Desserts	\N	\N	\N	2025-08-22 04:00:00	757
427	2025-08-14 22:35:12.034459	2025-08-14 22:36:29.621313	Appetizers	1		Appetizers	\N	\N	\N	2025-08-23 04:00:00	758
428	2025-08-14 22:35:12.036015	2025-08-14 22:36:29.624616	Salads	1		Salads	\N	\N	\N	2025-08-23 04:00:00	758
429	2025-08-14 22:35:12.037249	2025-08-14 22:36:29.627887	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-23 04:00:00	758
430	2025-08-14 22:35:12.038412	2025-08-14 22:36:29.63089	Main Dishes	1		Main Dishes	\N	\N	\N	2025-08-23 04:00:00	758
431	2025-08-14 22:35:12.039497	2025-08-14 22:36:29.63355	Beverages	1		Beverages	\N	\N	\N	2025-08-23 04:00:00	758
432	2025-08-14 22:35:12.040561	2025-08-14 22:36:29.637061	Desserts	1		Desserts	\N	\N	\N	2025-08-23 04:00:00	758
433	2025-08-14 22:35:12.08743	2025-08-14 22:36:40.853409	Appetizers	1		Appetizers	\N	\N	\N	2025-08-29 04:00:00	764
434	2025-08-14 22:35:12.088952	2025-08-14 22:36:40.857258	Salads	1		Salads	\N	\N	\N	2025-08-29 04:00:00	764
435	2025-08-14 22:35:12.090328	2025-08-14 22:36:40.860584	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-29 04:00:00	764
436	2025-08-14 22:35:12.091623	2025-08-14 22:36:40.864072	Main Dishes	1		Main Dishes	\N	\N	\N	2025-08-29 04:00:00	764
437	2025-08-14 22:35:12.09283	2025-08-14 22:36:40.866885	Beverages	1		Beverages	\N	\N	\N	2025-08-29 04:00:00	764
438	2025-08-14 22:35:12.093877	2025-08-14 22:36:40.869912	Desserts	1		Desserts	\N	\N	\N	2025-08-29 04:00:00	764
439	2025-08-14 22:35:12.099583	2025-08-14 22:36:43.546549	Appetizers	1		Appetizers	\N	\N	\N	2025-08-30 04:00:00	765
440	2025-08-14 22:35:12.10077	2025-08-14 22:36:43.55124	Salads	1		Salads	\N	\N	\N	2025-08-30 04:00:00	765
441	2025-08-14 22:35:12.102035	2025-08-14 22:36:43.555304	Side Dishes	1		Side Dishes	\N	\N	\N	2025-08-30 04:00:00	765
442	2025-08-14 22:35:12.103292	2025-08-14 22:36:43.559181	Main Dishes	1		Main Dishes	\N	\N	\N	2025-08-30 04:00:00	765
443	2025-08-14 22:35:12.104956	2025-08-14 22:36:43.562506	Beverages	1		Beverages	\N	\N	\N	2025-08-30 04:00:00	765
444	2025-08-14 22:35:12.106102	2025-08-14 22:36:43.566497	Desserts	1		Desserts	\N	\N	\N	2025-08-30 04:00:00	765
445	2025-08-15 02:27:09.935425	2025-08-15 02:27:09.935425	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-08-22 04:00:00	769
446	2025-08-15 02:27:09.936986	2025-08-15 02:27:09.936986	Salads	1	\N	Salads	\N	\N	\N	2025-08-22 04:00:00	769
447	2025-08-15 02:27:09.938384	2025-08-15 02:27:09.938384	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-08-22 04:00:00	769
448	2025-08-15 02:27:09.93961	2025-08-15 02:27:09.93961	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-08-22 04:00:00	769
449	2025-08-15 02:27:09.947761	2025-08-15 02:27:09.947761	Beverages	1	\N	Beverages	\N	\N	\N	2025-08-22 04:00:00	769
450	2025-08-15 02:27:09.949861	2025-08-15 02:27:09.949861	Desserts	1	\N	Desserts	\N	\N	\N	2025-08-22 04:00:00	769
451	2025-08-15 02:27:09.95723	2025-08-15 02:27:09.95723	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-08-23 04:00:00	770
452	2025-08-15 02:27:09.959307	2025-08-15 02:27:09.959307	Salads	1	\N	Salads	\N	\N	\N	2025-08-23 04:00:00	770
453	2025-08-15 02:27:09.961517	2025-08-15 02:27:09.961517	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-08-23 04:00:00	770
454	2025-08-15 02:27:09.962998	2025-08-15 02:27:09.962998	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-08-23 04:00:00	770
455	2025-08-15 02:27:09.964315	2025-08-15 02:27:09.964315	Beverages	1	\N	Beverages	\N	\N	\N	2025-08-23 04:00:00	770
456	2025-08-15 02:27:09.965504	2025-08-15 02:27:09.965504	Desserts	1	\N	Desserts	\N	\N	\N	2025-08-23 04:00:00	770
457	2025-08-15 02:27:09.993809	2025-08-15 02:27:09.993809	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-08-29 04:00:00	776
458	2025-08-15 02:27:09.995542	2025-08-15 02:27:09.995542	Salads	1	\N	Salads	\N	\N	\N	2025-08-29 04:00:00	776
459	2025-08-15 02:27:09.99711	2025-08-15 02:27:09.99711	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-08-29 04:00:00	776
460	2025-08-15 02:27:09.998481	2025-08-15 02:27:09.998481	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-08-29 04:00:00	776
461	2025-08-15 02:27:09.99983	2025-08-15 02:27:09.99983	Beverages	1	\N	Beverages	\N	\N	\N	2025-08-29 04:00:00	776
462	2025-08-15 02:27:10.002423	2025-08-15 02:27:10.002423	Desserts	1	\N	Desserts	\N	\N	\N	2025-08-29 04:00:00	776
487	2025-08-28 01:58:44.922252	2025-08-28 01:58:50.353408	Appetizers	1		Appetizers	190	\N	\N	2026-02-20 05:00:00	\N
488	2025-08-28 01:58:44.924573	2025-08-28 01:58:50.354693	Salads	1		Salads	190	\N	\N	2026-02-20 05:00:00	\N
489	2025-08-28 01:58:44.926726	2025-08-28 01:58:50.355625	Side Dishes	1		Side Dishes	190	\N	\N	2026-02-20 05:00:00	\N
490	2025-08-28 01:58:44.928203	2025-08-28 01:58:50.356376	Main Dishes	1		Main Dishes	190	\N	\N	2026-02-20 05:00:00	\N
491	2025-08-28 01:58:44.929672	2025-08-28 01:58:50.357111	Beverages	1		Beverages	190	\N	\N	2026-02-20 05:00:00	\N
492	2025-08-28 01:58:44.931101	2025-08-28 01:58:50.357897	Desserts	1		Desserts	190	\N	\N	2026-02-20 05:00:00	\N
558	2025-09-16 18:07:38.103409	2025-09-16 18:07:38.103409	Desserts	1	\N	Desserts	\N	\N	\N	2025-10-03 04:00:00	822
559	2025-09-16 18:07:38.10897	2025-09-16 18:07:38.10897	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-10-04 04:00:00	823
560	2025-09-16 18:07:38.110315	2025-09-16 18:07:38.110315	Salads	1	\N	Salads	\N	\N	\N	2025-10-04 04:00:00	823
561	2025-09-16 18:07:38.111937	2025-09-16 18:07:38.111937	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-10-04 04:00:00	823
562	2025-09-16 18:07:38.113109	2025-09-16 18:07:38.113109	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-10-04 04:00:00	823
563	2025-09-16 18:07:38.11424	2025-09-16 18:07:38.11424	Beverages	1	\N	Beverages	\N	\N	\N	2025-10-04 04:00:00	823
564	2025-09-16 18:07:38.115323	2025-09-16 18:07:38.115323	Desserts	1	\N	Desserts	\N	\N	\N	2025-10-04 04:00:00	823
565	2025-11-11 17:28:46.137647	2025-11-11 17:28:46.137647	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-14 05:00:00	826
567	2025-11-11 17:28:46.143646	2025-11-11 17:28:46.143646	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-14 05:00:00	826
569	2025-11-11 17:28:46.147808	2025-11-11 17:28:46.147808	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-14 05:00:00	826
570	2025-11-11 17:28:46.160455	2025-11-11 17:28:46.160455	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-14 05:00:00	826
571	2025-11-11 17:28:46.167921	2025-11-11 17:28:46.167921	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-15 05:00:00	827
572	2025-11-11 17:28:46.170138	2025-11-11 17:28:46.170138	Salads	1	\N	Salads	\N	\N	\N	2025-11-15 05:00:00	827
573	2025-11-11 17:28:46.17306	2025-11-11 17:28:46.17306	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-15 05:00:00	827
574	2025-11-11 17:28:46.174844	2025-11-11 17:28:46.174844	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-15 05:00:00	827
575	2025-11-11 17:28:46.176489	2025-11-11 17:28:46.176489	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-15 05:00:00	827
576	2025-11-11 17:28:46.177708	2025-11-11 17:28:46.177708	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-15 05:00:00	827
577	2025-11-11 17:28:46.204646	2025-11-11 17:28:46.204646	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-21 05:00:00	833
579	2025-11-11 17:28:46.207636	2025-11-11 17:28:46.207636	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-21 05:00:00	833
581	2025-11-11 17:28:46.210201	2025-11-11 17:28:46.210201	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-21 05:00:00	833
583	2025-11-11 17:28:46.218101	2025-11-11 17:28:46.218101	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-22 05:00:00	834
584	2025-11-11 17:28:46.219813	2025-11-11 17:28:46.219813	Salads	1	\N	Salads	\N	\N	\N	2025-11-22 05:00:00	834
585	2025-11-11 17:28:46.221384	2025-11-11 17:28:46.221384	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-22 05:00:00	834
586	2025-11-11 17:28:46.223004	2025-11-11 17:28:46.223004	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-22 05:00:00	834
587	2025-11-11 17:28:46.224727	2025-11-11 17:28:46.224727	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-22 05:00:00	834
588	2025-11-11 17:28:46.226141	2025-11-11 17:28:46.226141	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-22 05:00:00	834
589	2025-11-11 17:28:46.254845	2025-11-11 17:28:46.254845	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	840
590	2025-11-11 17:28:46.256683	2025-11-11 17:28:46.256683	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	840
591	2025-11-11 17:28:46.258432	2025-11-11 17:28:46.258432	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	840
592	2025-11-11 17:28:46.260354	2025-11-11 17:28:46.260354	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	840
593	2025-11-11 17:28:46.261892	2025-11-11 17:28:46.261892	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	840
594	2025-11-11 17:28:46.263808	2025-11-11 17:28:46.263808	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	840
595	2025-11-11 17:28:46.276202	2025-11-11 17:28:46.276202	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-29 05:00:00	841
596	2025-11-11 17:28:46.277956	2025-11-11 17:28:46.277956	Salads	1	\N	Salads	\N	\N	\N	2025-11-29 05:00:00	841
597	2025-11-11 17:28:46.279826	2025-11-11 17:28:46.279826	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-29 05:00:00	841
598	2025-11-11 17:28:46.281388	2025-11-11 17:28:46.281388	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-29 05:00:00	841
599	2025-11-11 17:28:46.282737	2025-11-11 17:28:46.282737	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-29 05:00:00	841
600	2025-11-11 17:28:46.284031	2025-11-11 17:28:46.284031	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-29 05:00:00	841
566	2025-11-11 17:28:46.141451	2025-11-14 03:45:58.929794	Salads	1	\N	Salads	\N	\N	\N	2025-11-14 05:00:00	826
578	2025-11-11 17:28:46.206284	2025-11-14 03:46:41.653904	Salads	1	\N	Salads	\N	1847	Flatbread salad, tomato dip, olive dip	2025-11-21 05:00:00	833
580	2025-11-11 17:28:46.208924	2025-11-14 03:48:30.988376	Main Dishes	1	\N	Main Dishes	\N	1847	Chicken soup, challah 	2025-11-21 05:00:00	833
582	2025-11-11 17:28:46.211567	2025-11-14 03:50:22.005696	Desserts	1	\N	Desserts	\N	1847	Cookies/cake	2025-11-21 05:00:00	833
568	2025-11-11 17:28:46.145913	2025-11-14 03:46:02.065062	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-14 05:00:00	826
625	2025-11-18 14:40:11.79429	2025-11-18 14:40:11.79429	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	852
626	2025-11-18 14:40:11.797035	2025-11-18 14:40:11.797035	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	852
627	2025-11-18 14:40:11.799287	2025-11-18 14:40:11.799287	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	852
628	2025-11-18 14:40:11.801556	2025-11-18 14:40:11.801556	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	852
629	2025-11-18 14:40:11.803589	2025-11-18 14:40:11.803589	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	852
630	2025-11-18 14:40:11.805965	2025-11-18 14:40:11.805965	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	852
631	2025-11-18 14:40:11.815124	2025-11-18 14:40:11.815124	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-15 05:00:00	853
632	2025-11-18 14:40:11.817329	2025-11-18 14:40:11.817329	Salads	1	\N	Salads	\N	\N	\N	2025-11-15 05:00:00	853
633	2025-11-18 14:40:11.819092	2025-11-18 14:40:11.819092	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-15 05:00:00	853
634	2025-11-18 14:40:11.821009	2025-11-18 14:40:11.821009	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-15 05:00:00	853
635	2025-11-18 14:40:11.822946	2025-11-18 14:40:11.822946	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-15 05:00:00	853
636	2025-11-18 14:40:11.825296	2025-11-18 14:40:11.825296	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-15 05:00:00	853
637	2025-11-18 14:42:44.621591	2025-11-18 14:42:44.621591	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	857
638	2025-11-18 14:42:44.62337	2025-11-18 14:42:44.62337	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	857
639	2025-11-18 14:42:44.624907	2025-11-18 14:42:44.624907	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	857
640	2025-11-18 14:42:44.626424	2025-11-18 14:42:44.626424	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	857
641	2025-11-18 14:42:44.627807	2025-11-18 14:42:44.627807	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	857
642	2025-11-18 14:42:44.629119	2025-11-18 14:42:44.629119	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	857
643	2025-11-18 14:46:16.634378	2025-11-18 14:46:16.634378	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	858
644	2025-11-18 14:46:16.636169	2025-11-18 14:46:16.636169	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	858
645	2025-11-18 14:46:16.637883	2025-11-18 14:46:16.637883	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	858
646	2025-11-18 14:46:16.639572	2025-11-18 14:46:16.639572	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	858
647	2025-11-18 14:46:16.641115	2025-11-18 14:46:16.641115	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	858
648	2025-11-18 14:46:16.643565	2025-11-18 14:46:16.643565	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	858
649	2025-11-18 14:46:16.650643	2025-11-18 14:46:16.650643	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-14 05:00:00	859
650	2025-11-18 14:46:16.652116	2025-11-18 14:46:16.652116	Salads	1	\N	Salads	\N	\N	\N	2025-11-14 05:00:00	859
651	2025-11-18 14:46:16.653347	2025-11-18 14:46:16.653347	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-14 05:00:00	859
652	2025-11-18 14:46:16.654925	2025-11-18 14:46:16.654925	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-14 05:00:00	859
653	2025-11-18 14:46:16.656379	2025-11-18 14:46:16.656379	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-14 05:00:00	859
654	2025-11-18 14:46:16.657609	2025-11-18 14:46:16.657609	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-14 05:00:00	859
655	2025-11-18 14:46:55.285191	2025-11-18 14:46:55.285191	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-21 05:00:00	864
656	2025-11-18 14:46:55.286726	2025-11-18 14:46:55.286726	Salads	1	\N	Salads	\N	\N	\N	2025-11-21 05:00:00	864
657	2025-11-18 14:46:55.288064	2025-11-18 14:46:55.288064	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-21 05:00:00	864
658	2025-11-18 14:46:55.289279	2025-11-18 14:46:55.289279	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-21 05:00:00	864
659	2025-11-18 14:46:55.290832	2025-11-18 14:46:55.290832	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-21 05:00:00	864
660	2025-11-18 14:46:55.292166	2025-11-18 14:46:55.292166	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-21 05:00:00	864
661	2025-11-18 14:48:18.807099	2025-11-18 14:48:18.807099	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-21 05:00:00	868
662	2025-11-18 14:48:18.808733	2025-11-18 14:48:18.808733	Salads	1	\N	Salads	\N	\N	\N	2025-11-21 05:00:00	868
663	2025-11-18 14:48:18.810321	2025-11-18 14:48:18.810321	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-21 05:00:00	868
664	2025-11-18 14:48:18.811719	2025-11-18 14:48:18.811719	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-21 05:00:00	868
665	2025-11-18 14:48:18.813666	2025-11-18 14:48:18.813666	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-21 05:00:00	868
666	2025-11-18 14:48:18.815284	2025-11-18 14:48:18.815284	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-21 05:00:00	868
667	2025-11-18 14:50:23.514446	2025-11-18 14:50:23.514446	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	871
668	2025-11-18 14:50:23.515987	2025-11-18 14:50:23.515987	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	871
669	2025-11-18 14:50:23.517192	2025-11-18 14:50:23.517192	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	871
670	2025-11-18 14:50:23.518168	2025-11-18 14:50:23.518168	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	871
671	2025-11-18 14:50:23.519615	2025-11-18 14:50:23.519615	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	871
672	2025-11-18 14:50:23.521022	2025-11-18 14:50:23.521022	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	871
673	2025-11-18 15:10:24.497533	2025-11-18 15:10:24.497533	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	873
674	2025-11-18 15:10:24.499273	2025-11-18 15:10:24.499273	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	873
675	2025-11-18 15:10:24.500572	2025-11-18 15:10:24.500572	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	873
676	2025-11-18 15:10:24.501668	2025-11-18 15:10:24.501668	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	873
677	2025-11-18 15:10:24.502868	2025-11-18 15:10:24.502868	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	873
678	2025-11-18 15:10:24.504082	2025-11-18 15:10:24.504082	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	873
679	2025-11-23 18:23:13.313538	2025-11-23 18:23:13.313538	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-28 05:00:00	876
680	2025-11-23 18:23:13.316379	2025-11-23 18:23:13.316379	Salads	1	\N	Salads	\N	\N	\N	2025-11-28 05:00:00	876
681	2025-11-23 18:23:13.318473	2025-11-23 18:23:13.318473	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-28 05:00:00	876
682	2025-11-23 18:23:13.320323	2025-11-23 18:23:13.320323	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-28 05:00:00	876
683	2025-11-23 18:23:13.322293	2025-11-23 18:23:13.322293	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-28 05:00:00	876
684	2025-11-23 18:23:13.324355	2025-11-23 18:23:13.324355	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-28 05:00:00	876
685	2025-11-23 18:23:13.332732	2025-11-23 18:23:13.332732	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-11-29 05:00:00	877
686	2025-11-23 18:23:13.334411	2025-11-23 18:23:13.334411	Salads	1	\N	Salads	\N	\N	\N	2025-11-29 05:00:00	877
687	2025-11-23 18:23:13.336232	2025-11-23 18:23:13.336232	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-11-29 05:00:00	877
688	2025-11-23 18:23:13.337991	2025-11-23 18:23:13.337991	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-11-29 05:00:00	877
689	2025-11-23 18:23:13.339493	2025-11-23 18:23:13.339493	Beverages	1	\N	Beverages	\N	\N	\N	2025-11-29 05:00:00	877
690	2025-11-23 18:23:13.340948	2025-11-23 18:23:13.340948	Desserts	1	\N	Desserts	\N	\N	\N	2025-11-29 05:00:00	877
692	2025-12-01 18:28:45.398845	2025-12-01 18:28:45.398845	Salads	1	\N	Salads	\N	\N	\N	2025-12-05 05:00:00	886
695	2025-12-01 18:28:45.403131	2025-12-01 18:28:45.403131	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-05 05:00:00	886
696	2025-12-01 18:28:45.404595	2025-12-01 18:28:45.404595	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-05 05:00:00	886
697	2025-12-01 18:28:45.411124	2025-12-01 18:28:45.411124	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-12-06 05:00:00	887
699	2025-12-01 18:28:45.414386	2025-12-01 18:28:45.414386	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-12-06 05:00:00	887
701	2025-12-01 18:28:45.417084	2025-12-01 18:28:45.417084	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-06 05:00:00	887
702	2025-12-01 18:28:45.418332	2025-12-01 18:28:45.418332	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-06 05:00:00	887
694	2025-12-01 18:28:45.401736	2025-12-02 01:25:18.379086	Main Dishes	1	\N	Main Dishes	\N	1863	Sushi Platter	2025-12-05 05:00:00	886
691	2025-12-01 18:28:45.396447	2025-12-02 23:43:05.365132	Appetizers	1	\N	Appetizers	\N	1866	Fish salad	2025-12-05 05:00:00	886
693	2025-12-01 18:28:45.400407	2025-12-04 14:19:14.88551	Side Dishes	1	\N	Side Dishes	\N	1869	Apricot chicken, pastrami orzo, roasted sweet potatoes	2025-12-05 05:00:00	886
700	2025-12-01 18:28:45.415822	2025-12-04 15:59:03.675971	Main Dishes	1	\N	Main Dishes	\N	1869	Meyrav Kanel will send main	2025-12-06 05:00:00	887
698	2025-12-01 18:28:45.41289	2025-12-04 15:59:31.128641	Salads	1	\N	Salads	\N	1869	Meyrav Kanel will send salad	2025-12-06 05:00:00	887
704	2025-12-05 17:30:25.598413	2025-12-05 17:30:25.598413	Salads	1	\N	Salads	\N	\N	\N	2025-12-12 05:00:00	895
705	2025-12-05 17:30:25.600603	2025-12-05 17:30:25.600603	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-12-12 05:00:00	895
706	2025-12-05 17:30:25.602644	2025-12-05 17:30:25.602644	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-12-12 05:00:00	895
707	2025-12-05 17:30:25.604522	2025-12-05 17:30:25.604522	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-12 05:00:00	895
708	2025-12-05 17:30:25.606404	2025-12-05 17:30:25.606404	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-12 05:00:00	895
709	2025-12-05 17:30:25.624085	2025-12-05 17:30:25.624085	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-12-13 05:00:00	897
713	2025-12-05 17:30:25.634896	2025-12-05 17:30:25.634896	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-13 05:00:00	897
714	2025-12-05 17:30:25.637104	2025-12-05 17:30:25.637104	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-13 05:00:00	897
715	2025-12-05 17:30:25.66808	2025-12-05 17:30:25.66808	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-12-19 05:00:00	903
716	2025-12-05 17:30:25.669691	2025-12-05 17:30:25.669691	Salads	1	\N	Salads	\N	\N	\N	2025-12-19 05:00:00	903
718	2025-12-05 17:30:25.672282	2025-12-05 17:30:25.672282	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-12-19 05:00:00	903
719	2025-12-05 17:30:25.673438	2025-12-05 17:30:25.673438	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-19 05:00:00	903
720	2025-12-05 17:30:25.674532	2025-12-05 17:30:25.674532	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-19 05:00:00	903
721	2025-12-05 17:30:25.680473	2025-12-05 17:30:25.680473	Appetizers	1	\N	Appetizers	\N	\N	\N	2025-12-20 05:00:00	904
722	2025-12-05 17:30:25.682964	2025-12-05 17:30:25.682964	Salads	1	\N	Salads	\N	\N	\N	2025-12-20 05:00:00	904
723	2025-12-05 17:30:25.684815	2025-12-05 17:30:25.684815	Side Dishes	1	\N	Side Dishes	\N	\N	\N	2025-12-20 05:00:00	904
724	2025-12-05 17:30:25.686675	2025-12-05 17:30:25.686675	Main Dishes	1	\N	Main Dishes	\N	\N	\N	2025-12-20 05:00:00	904
725	2025-12-05 17:30:25.688862	2025-12-05 17:30:25.688862	Beverages	1	\N	Beverages	\N	\N	\N	2025-12-20 05:00:00	904
726	2025-12-05 17:30:25.690722	2025-12-05 17:30:25.690722	Desserts	1	\N	Desserts	\N	\N	\N	2025-12-20 05:00:00	904
717	2025-12-05 17:30:25.671101	2025-12-05 17:43:30.246853	Side Dishes	1	\N	Side Dishes	\N	1871	potato kugel! 	2025-12-19 05:00:00	903
712	2025-12-05 17:30:25.63139	2025-12-07 14:46:16.242461	Main Dishes	1	\N	Main Dishes	\N	1624	Dara Linder	2025-12-13 05:00:00	897
711	2025-12-05 17:30:25.628633	2025-12-07 14:46:31.459454	Side Dishes	1	\N	Side Dishes	\N	1624	Dara Linder	2025-12-13 05:00:00	897
710	2025-12-05 17:30:25.626314	2025-12-07 14:46:50.263801	Salads	1	\N	Salads	\N	1624	Dara Linder	2025-12-13 05:00:00	897
703	2025-12-05 17:30:25.5956	2025-12-09 17:15:52.35009	Appetizers	1	\N	Appetizers	\N	1856	Chicken soup	2025-12-12 05:00:00	895
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.sessions (id, user_id, ip_address, user_agent, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: updates; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.updates (id, event_id, title, body, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.users (id, email_address, password_digest, created_at, updated_at, first_name, last_name, phone_number, updates, tos, sms, guest, is_paying, is_admin, country_code, stripe_customer_id, stripe_subscription_id, reset_password_token, reset_password_sent_at, area_code, toke) FROM stdin;
265	wingchi7321@gmail.com	$2a$12$rZd3o9Cv.5KIv18rZitr/.TTw0tkvmxEYbmsDiiQ/mpNaCSalhYkq	2025-02-27 20:52:20.063445	2025-02-27 20:53:30.669987	Zalman	Levy	7182905262	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1793	meralevin@gmail.com	$2a$12$YhajT5C0zWmP.J9vAhMd2.zqLnqmUREN2Nvrt0nmyrWcb9goZ5562	2025-08-19 12:02:13.384042	2025-08-19 12:02:13.384042	Mera 	Levin 	7738700901	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1914	gusffpf@gmail.com	$2a$12$guH8s79LnS096i0x5iFV4eGG.Am17dZfRBTVWx.QvreoEDEJPXuqG	2026-02-12 05:32:21.293287	2026-02-12 05:32:21.293287	Gus	Pares	3055490635	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1915	xxxx@gmail.com	$2a$12$QrFOil.9dFKeoQjjsJNW/OYISGwg3kMIDzphovaSLCE7Y6po4i6sS	2026-02-12 05:33:31.42056	2026-02-12 05:33:31.42056	Gustavo	pares	3055490635	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1824	tsabo522@yahoo.com	$2a$12$VWPkYJOM5F1kF/KAeVrc1OCr7jQw/8XXwKNgSYXqQfnXdjTZ5yk4e	2025-09-15 01:09:39.689046	2025-09-15 01:09:39.689046	Tzila	Sabo	3055385729	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1825	sgluck1@gmail.com	$2a$12$xKotqhcJjBgqD5pUzGefFOTFKEl6X46fhFAgGe8a7GqFKx/0erYom	2025-09-15 01:29:07.943799	2025-09-15 01:29:07.943799	Shira	Gluck	8455584064	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1836	taliyalc3313@gmail.com	$2a$12$s8F76.jFqTSkTERJhO1bmeIsUbK/5HZmYt.OH4HCblxNjICW2AeD.	2025-09-26 01:48:29.035315	2025-09-26 01:48:29.035315	Taliya	Corbett	5619619612	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1847	minafsamuels@gmail.com	$2a$12$euOslywwGpUKxbGgMQLDQ.hMK2zvSyQp.HXk1yNnAfZggoj0cJHyO	2025-11-14 03:42:42.1851	2025-11-14 03:42:42.1851	Mina	Carlebach 	3478816348	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1861	sabrinakarr@gmail.com	$2a$12$5/RSbR7rr9t3i0vQqVCCkeoAmlSUbENBTk9SFcKAGcH2CZ3S1rE8i	2025-12-01 20:25:10.858223	2025-12-01 20:25:10.858223	Sabrina	Karr	9293345678	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1869	leahly28@gmail.com	$2a$12$KaqW9fdRmf1uLpjPFH8mKuM1gZuSFw7187WnlY7DaOVHoHloqhpki	2025-12-04 14:18:29.526557	2025-12-04 14:18:29.526557	Leah	Hill	4435708223	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1880	guest_912e70cf-f256-4852-b924-f46df3cd8b3e@example.com	$2a$12$NgG4i6pD/Bsq0FnWzfHjvOAN4epJAnB0JSr625gxHKt8aZbcyrzTe	2026-01-04 22:19:54.87263	2026-01-04 22:19:54.87263	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1893	guest_0ce00dae-0756-44b9-aded-c5f888af7268@example.com	$2a$12$5ODrWubChzsNRqcYRpPB/.IOrJdlG9ajB6kdK7NjyxHQGzoVzbd.W	2026-01-31 11:36:06.65088	2026-01-31 11:36:06.65088	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
274	zalmylevy@gmail.com	$2a$12$7OKYm62LdxN5nP.nBgUase0lPXJLJRnOSlUn7wgi7n6Oc4gg2/sMS	2025-03-03 00:41:14.053956	2025-03-03 00:41:14.053956	Zalman	Levy	7182905262	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1905	foo@123.com	$2a$12$GKgWVQSioNLenjW0FBjm4uCUOoR7OklErX3WM8XgVnKJxkMVjNNZa	2026-02-12 04:37:07.583372	2026-02-12 04:38:00.036837	Gustavo	pares	3055490635	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
272	velvilrosler@gmail.com	$2a$12$cxoy9TLfDDx2i1L/fk.9a.5x0UEzukMhD2hQ9Pj.1yCLh1pRjqJve	2025-02-28 14:11:52.194281	2025-03-03 20:55:00.451959	Velvil	Rosler	3479316129	t	t	t	f	t	t	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
268	miamirabbi@gmail.com	$2a$12$nF.3kmS4g5N4Y00QIg/pVu4HK2qmSVqTyureBveGqSE8kS/wlILvW	2025-02-27 22:56:05.101793	2025-03-11 16:59:24.222799	Miami	Rabbi	3053426665	t	t	t	f	f	f	\N	cus_RthNXTb0LEWGLg	\N	\N	\N	+1	e0f21c27251b14be467f
1751	ayalaavroya@gmail.com	$2a$12$89xseg1NPKskoovXMlvte.nyeRB0dc9SmQpxgy7NyvYM8UyXFq77y	2025-08-15 10:58:03.079217	2025-08-15 10:58:03.079217	Ayala 	Avroya 	9546286316	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1645	zerbibhannah@gmail.com	$2a$12$vu1hyYFxRCqL6yHlHuVOw.5YW1y6HtTOIUrqiaUl8Ak3GjskEVrAy	2025-08-05 17:23:42.299593	2025-08-05 17:23:42.299593	Hannah	Zerbib	3477684656	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1826	miriamshakib@gmail.com	$2a$12$l/I0c9OIugsjSMaTmkU8Z.ZNfzA6n9xsDr.7L8KILxymw3hpE3HPS	2025-09-15 02:45:00.039417	2025-09-15 02:45:00.039417	Miriam 	Shakib	3055023700	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1837	guest_0c122eca-4b83-497e-8e51-0c07e2384a3a@example.com	$2a$12$iRI8hj7xywx/In/pxOcdYucn3FuFqyjkLdzd.Hwu7kogo/M2i/tt2	2025-11-11 17:26:27.576943	2025-11-11 17:26:27.576943	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1848	guest_9ed15136-ee43-48bf-86bf-57cd7d611d3f@example.com	$2a$12$j80bMXp4QX33EvFyCSPUvOkEkPz3/mVP19PrGi7qN9NRR18rp9L5C	2025-11-16 02:51:29.292685	2025-11-16 02:51:29.292685	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1862	elianadalfen@gmail.com	$2a$12$eBdoikPjc4d1edhuno4td.lMe7FHTV7KYHrP/VBfGCSjQmOdAjTve	2025-12-02 01:23:55.246377	2025-12-02 01:23:55.246377	Chana	Bahar	9293345678	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1863	chanabahar@gmail.com	$2a$12$cMhKrafToaFxnr9ALtJNLuac6jsdDA1bLwPnKDfD5ewRNA44I1Q7i	2025-12-02 01:24:27.814597	2025-12-02 01:24:27.814597	Chana	Bahar	9293345678	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1864	sarahkalstein@gmail.com	$2a$12$KiQg7Q.M9/LBLRTF6ymAyuMLC5VmE71ZnmWxS1N6vKW2bIaJA7zMC	2025-12-02 01:30:34.231463	2025-12-02 01:30:34.231463	Sarah	Kalstein	9899608078	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1870	atararubin@gmail.com	$2a$12$USfXcEwJJ/8BZ2l6aGSlJ.FQvNbbONlI96pL3CK7G5czYAFB2jGje	2025-12-04 14:33:29.611949	2025-12-04 14:33:29.611949	Atara	Rubin	9789908970	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1881	guest_b0cb9849-beb6-48a2-9047-d2039ea6c060@example.com	$2a$12$RE.425KGhnfXASAOpsKFYu7a54iuInOydnkQqlHkBuGkMUJMNihG.	2026-01-07 09:33:56.653491	2026-01-07 09:33:56.653491	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1894	guest_17f4a9b5-70cb-466d-bdd4-8f921cf4e419@example.com	$2a$12$ag.e6picp/AKOhEpMLautO7F8d2hf2K26.6yHWRx/0PqqIO7qiUb.	2026-01-31 11:52:21.755332	2026-01-31 11:52:21.755332	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1816	srslevy@gmail.com	$2a$12$j9w6VKQc5QIM8V5ylccnJOGX7hgZX4zTrpKTDatL5Y6IQiQUHKqau	2025-08-28 00:52:34.544906	2026-02-11 19:16:04.201116	Stephanie	Levy	7863167298	t	t	t	f	f	f	\N	\N	\N	\N	2025-08-28 00:55:11.954888	+1	e0f21c27251b14be467f
1918	gusffp@gmail.com	$2a$12$bCDoCjo6jH0KNQ5gHmn56udd0PcVbqV0VvSwxlbJAl0F1Ke68YSo.	2026-02-12 05:47:48.022177	2026-02-12 05:47:48.022177	Gustavo	pares	3055490635	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1061	adinalipskar@gmail.com	$2a$12$JGCT2JLts1PJU1.RZyz5GuZQyqtMYcIyFWcc3Gi/dtEsh43U1UMi2	2025-05-20 18:06:31.163498	2025-05-20 18:06:31.163498	Adina	Lipskar	7863684886	f	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1817	guest_63cd5d73-221b-4597-9005-8c8e0fcd08d0@example.com	$2a$12$VwvK7DMp.I8yJNQY/DvyOuTAX9S.hCyOvBK4bSuPylk8z/u0qGG0u	2025-08-28 01:47:33.774525	2025-08-28 01:47:33.774525	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1827	chavrosen@gmail.com	$2a$12$TWOfTS9ujjNhD6ijZRGyyO6Oo.UNlp7Plg.rFrIPN0SV4iHIGix8q	2025-09-15 17:06:35.309508	2025-09-15 17:06:35.309508	Chava 	Rosenblatt	3053231836	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1646	esmintz@yahoo.com	$2a$12$x4.KpPu/pahOlSt3voXoZukT8sn.OQ0Oi1n0urjDiGZ2tmmBMmAla	2025-08-05 18:35:07.093484	2025-08-05 18:35:07.093484	Elianna	Perez	9522127801	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
724	skaron218@gmail.com	$2a$12$QWSQFkqx0sUy2YBeZZJfBeOKJmbtEe4R7clFunC6tomejq87k17Yq	2025-04-07 00:34:16.098196	2025-04-07 00:36:49.621141	Sara	Karon	6086950551	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1838	geulasimchabanayan@gmail.com	$2a$12$zGVoXSLUXUxqLxht.ajeoe5WAkOBL8Y0rMAOf/egNef13asOxtPj2	2025-11-11 19:13:38.335844	2025-11-11 19:13:38.335844	Geulah	Banayan	6316409257	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1669	rochelhalpert1@gmail.com	$2a$12$zdsKuq3rbc6yOfvbPzl4BO0sCSdisUIanuudvT10DVWZXSlxW1KOm	2025-08-07 19:50:07.854779	2025-08-07 19:50:07.854779	Rochel	Herschmann 	8455966790	f	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1849	guest_3361c6ea-6b9b-485a-bcce-a3ad514f9fb6@example.com	$2a$12$Wxv2jJVM0bA/sgRgSaVNyuA8v6MlfQTIb6JKviFDeKyakm8fU5Qsm	2025-11-16 09:44:43.108949	2025-11-16 09:44:43.108949	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1850	guest_5b46ead8-a6d0-4547-acad-dfa354bc0bfc@example.com	$2a$12$fiCkcQAAkfZ99ve4acOENe9RlATxOIE5k.n75KS15MXPYxBdWFxXm	2025-11-16 09:53:51.09805	2025-11-16 09:53:51.09805	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1865	abshore92@gmail.com	$2a$12$DpnYugd7vSDCk5WQYgKl2uHKAIoI8bdbmP7cyvtgTtit2/IWIY8Vy	2025-12-02 03:10:38.544053	2025-12-02 03:10:38.544053	Amanda	Adler	5166606839	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1871	chava.tepler@gmail.com	$2a$12$eb2k5lGhJLlRZ96I.ee6P.MRWbxyKDLh5sTLWdEV2Uh8MRBKycycG	2025-12-05 17:42:27.329677	2025-12-05 17:42:27.329677	Chava	chava.tepler@gmail.com	2489149317	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1882	guest_f0560de7-a499-46f8-9e18-56fc57063f14@example.com	$2a$12$95hXKHzF/QPSGq9wy8bI5.ObcHQ2OmaJJ4xN3h5kYKIaV8LgG7DLK	2026-01-07 09:53:41.760815	2026-01-07 09:53:41.760815	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1895	guest_c259726d-11ad-4368-a270-6931216a75f1@example.com	$2a$12$scLHdhlo5tCwMCkZMK1nyu355da4ojajUO9TtNn8qI6c2VIxqEn32	2026-01-31 13:36:11.040498	2026-01-31 13:36:11.040498	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1919	testing@foomanchoo.com	$2a$12$yFWvUr2B6Oncj4xjdZoaHe7nA9/RTwdsQMpatLYIpVr7bv.wa/LI.	2026-02-12 06:01:51.170851	2026-02-12 06:01:51.170851	Gustavo	pares	3055490635	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1115	ninazimm@aol.com	$2a$12$DGnbAsc2Wc0gdQq7xaXW4OPaEijUS47yy6VXxeiNF4mRFvVbuC44G	2025-05-29 22:48:34.891662	2025-05-29 22:48:34.891662	Nina	Zimm	3214464971	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1920	foobae@gmail.com	$2a$12$7dK4D4xlAhhb7pOkmjm6JO76YF/GgCX/T8lItOVA5sxkg6mC0zJIG	2026-02-12 06:02:50.060577	2026-02-12 06:02:50.060577	Gustavo	pares	3055490635	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1818	heatheroppen1@gmail.com	$2a$12$bFB/GVHEXIOrjuE9l8Go9.aToDRhDg1r7Ug5GkmF0Cjo2I5yd8hRO	2025-08-28 04:22:44.442742	2025-08-28 04:22:44.442742	Heather	Oppen	9547012976	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1624	nechama.schachter@gmail.com	$2a$12$1ZsMaKVh7Xk0b2gKvsMyf.w.jw6cin17ohfveUCP3a.6wqxKTVpSa	2025-08-03 20:22:27.326057	2025-08-03 20:22:27.326057	Nechama	Cohen	9546393111	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1828	devorahy@gmail.com	$2a$12$n4NnpjQZMJVFHcBRrauwqu6yDnlGilVYaMeCGDCpsn8.awg9VHc8S	2025-09-16 18:32:36.112683	2025-09-16 18:32:36.112683	Devorah	Raskin	6467084989	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1753	riffylevin@gmail.com	$2a$12$wJrmqjfIlQjKQ4Mkm0iP7uKp/Obt9TTw4FIQbyTmCGBX/UnCnP6MS	2025-08-15 13:45:23.722349	2025-08-15 13:45:23.722349	Riff	Levin	2032009279	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1839	mhzirkind@gmail.com	$2a$12$68AQ5oVqH9UPAmCnJVlBQu1XelGuv6VrKl6sPM7WiZ109gRwZ6Nui	2025-11-11 21:19:37.328035	2025-11-11 21:19:37.328035	Mordy	Zirkind	3476689241	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1851	guest_d2fb3f34-a767-4b10-aa6e-cabbf6fba425@example.com	$2a$12$5A98JVBsGQvr5UbbvFZjJuvIxiGBqwz8QG/Ki039tWnXl.xUbibjC	2025-11-18 14:40:06.894425	2025-11-18 14:40:06.894425	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1852	guest_71567864-ba7b-48fb-8ade-956985f414fb@example.com	$2a$12$ln3qkReqYrGDgqWhajYykupSVtG.U5tm0Ur2r.z7XnoTag6WSPCSa	2025-11-18 14:48:10.185373	2025-11-18 14:48:10.185373	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1866	pninarottman@gmail.com	$2a$12$JgU2XoPgZdj2CuHuvHnd2.ECH2wFxZ2Ec2Agr7Cn5Y7p3LVYWxvZO	2025-12-02 23:41:42.285782	2025-12-02 23:41:42.285782	P'nina	Rottman	3056133505	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1872	shoshana.gottfried@gmail.com	$2a$12$yXD3SS04kGWNF7qXsXVXq.hkPOLRuCAtpp1FZVhSB01xwsE0uBN6y	2025-12-06 23:30:24.802331	2025-12-06 23:30:24.802331	SHOSHANA	GOTTFRIED	7865141849	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1883	guest_4136bb48-89f0-4d9b-b26f-e5cfb6968ef4@example.com	$2a$12$hxEHNbtyUOoPRfBT1w03cOuHn.MiGFoddLOpp8wzMRqoMzj2N8wJi	2026-01-25 01:20:29.214878	2026-01-25 01:20:29.214878	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1896	guest_82171eb5-6210-4249-8dc2-25064ee50bc8@example.com	$2a$12$K.IqruGj35IJg3MnfHmiruqILXtcreD6PVo4xMPHEYy4kdSWWq6Qi	2026-02-02 18:47:10.972949	2026-02-02 18:47:10.972949	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1921	gustest@aol.com	$2a$12$mYUzqF8y5SdQVbdCajb0FuiwZQWQO9vitfBWZcLAooiIxd6jud6Sm	2026-02-12 06:38:58.211921	2026-02-12 06:38:58.211921	Test	Teat	3055490635	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1625	rleeeee@gmail.com	$2a$12$CQ/hQoikMOB6/dfzwOvNgu/Ls5W0iO1ohwN5kicGlckTWriEuFeuO	2025-08-03 21:19:45.636884	2025-08-03 21:19:45.636884	Rachelle 	Schachter 	5614144402	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1636	tauba77@gmail.com	$2a$12$y4suJg.1t4e00KJof4QhLeVcg07DEXpkXcZByP2q3tnahRMWyrLfy	2025-08-05 00:27:25.177775	2025-08-05 00:27:25.177775	Tauba	Fitzig	3039197340	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1637	sara@sdifinc.com	$2a$12$oEZYrJphqxLra79tWSmKIeyCGliDAz9cbBvcuvxXwLpWquTb./L52	2025-08-05 00:27:29.808147	2025-08-05 00:27:29.808147	Sara 	Roth 	8455968131	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1740	shulslab@gmail.com	$2a$12$1Djshck3ZkBsm5x72CGVOuc4P9caSngtghYqxXUHC1MOYAIYdSTdi	2025-08-14 23:47:02.588314	2025-08-14 23:47:02.588314	Shuli 	Labkowski 	3059689767	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1819	rozyhilel@gmail.com	$2a$12$qhDb9mqFYFqAeepjo/2R6epnthnMrToxw3UhkDkwAp.GXzHf.qLwO	2025-08-29 15:21:30.988063	2025-08-29 15:21:30.988063	Rozy	Hilel	3058045020	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1820	shiraele@gmail.com	$2a$12$9J1QbKxJHxL1AZul9w3VsuYY4DOh3edUfMCHbaVBZeMdsHSVunH4y	2025-08-29 15:27:59.131618	2025-08-29 15:27:59.131618	Shira	Gold	7863166216	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1829	tzippy.t.11@gmail.com	$2a$12$.22bPu/ZTPzFgM5BpYo2b.ZLrRIF3AAPA9NlHd41i96yHL0BxJVuO	2025-09-16 20:55:02.23981	2025-09-16 20:55:02.23981	Tzippy	Albrecht 	3477220135	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1840	hecht3@gmail.com	$2a$12$6OI77pOm2gJWMgXkAB6JIu6Es0RR/NirVxuVgJUrs.pi51iIYgVyS	2025-11-12 00:56:20.982711	2025-11-12 00:56:20.982711	Michal	Nimni	9178227891	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
409	velvil@greenwolfstrategies.com	$2a$12$.ini2U3B8GW94qDxnQ08VOSaeaQiRfvBQyllsc.aKcx8QT0ihdY0i	2025-03-18 02:05:48.778341	2025-03-18 02:07:31.155176	Velvil	Rosler	3479316129	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1853	guest_55d0dc84-3af4-47fb-bed0-f97a2926ed58@example.com	$2a$12$VWRhDUuKIMiZWndvT22Asur.TsR05W1bGlmWdWd/7SoMDh6tP1wMC	2025-11-18 15:10:14.863292	2025-11-18 15:10:14.863292	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1867	guest_841efdb1-6c38-4747-8022-f60a274e9f1c@example.com	$2a$12$c7wJlMa9cRbab863Ss.GIega.O1eLv5Ng/8TZsWGPs/floAjSsvvO	2025-12-03 14:52:28.069043	2025-12-03 14:52:28.069043	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1873	tantenr1@yahoo.com	$2a$12$LuZCzQ7ZoMkNPhL4ChydcuXAPmo2jBbUt2BIhb.8GPU5Mhye33ZWm	2025-12-07 01:06:59.985093	2025-12-07 01:06:59.985093	Barash	Family 	9545493315	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
412	rivkah101@gmail.com	$2a$12$JiMVlPzCOqRLiofdvilZC.tsuZ589p7EUhDV.58sUa6MXm6xNQ4VK	2025-03-18 02:33:05.726033	2025-03-18 02:35:12.798548	Rivkah	Levy	3476616579	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1884	guest_03218d46-0051-4dcf-acb9-0abcd2b31f1e@example.com	$2a$12$dV6yrmp8JsjphfFUuK6bn.BWJCPA8xbPlwtPkiL1qf0sANMv.SXSe	2026-01-25 02:23:10.829977	2026-01-25 02:23:10.829977	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1897	guest_db175731-50ea-4e27-bc8c-ae53eff42e92@example.com	$2a$12$LIz4ko5.ftKqPUU58KnPZuFPFXU/Pbj7z818cw0WUeeDTpVMVj.m6	2026-02-02 19:57:09.673101	2026-02-02 19:57:09.673101	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1922	mendylevy@gmail.com	$2a$12$7YSgseHIsvHhqg7YDklG4OTE/lWGjgIyoycS0isXAO5ElweYgcguy	2026-02-12 13:00:44.362163	2026-02-12 13:00:44.362163	Mendy 	Levy	3053426665	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1741	rivkyinglis@gmail.com	$2a$12$d4u6afyYWVg8K506PKYwWuGucfiehAcBaiIsBq5JljdwlzNjpLlVG	2025-08-15 01:02:27.976748	2025-08-15 01:02:27.976748	Rivky	Inglis	3053368950	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1203	gustavoanalytics@gmail.com	$2a$12$2ykuYVkNagGUQ//DpYJnx.Uz1zFpsuSLPcIzEKLHFajOPnxGIVKo6	2025-06-11 16:11:34.926206	2025-08-28 01:57:52.24275	Gus	Pares	3055490635	t	t	t	f	f	t	+1	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1821	mamablass@gmail.com	$2a$12$JlDytUBwuKLghMa7EFm.b.FpeKX/gR6lT83ji/pR0EWwkmoxQUVAS	2025-08-29 16:30:45.456574	2025-08-29 16:30:45.456574	Rochel	Blass	6463425876	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1841	hadarafriedman@gmail.com	$2a$12$gq6GWwmyugqWyYTDKuqUAOKXlFFcjcaMETtuwKtBIDabQ6IQMamfW	2025-11-12 05:24:27.695533	2025-11-12 05:25:33.871928	Hadara	Prager	9295038551	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1854	guest_89bb96c9-b605-448c-8e71-72e5ef31d043@example.com	$2a$12$6H03q9zecDvstbGQrDVtY.9a31RlMaZ7r9KwQLAAg0cSx//L6wo0G	2025-11-21 13:03:59.663667	2025-11-21 13:03:59.663667	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1830	jessica.neuwirth9@gmail.com	$2a$12$1kaJDA68wXR/MBseiLLQxOmPlVJYzRiiMNiQUAKDatWWLxKwbXJMu	2025-09-16 23:45:15.215141	2025-12-01 21:18:57.513801	Jessica	Neuwirth	5614006150	t	t	f	f	f	f	\N	\N	\N	\N	2025-12-01 21:18:05.548278	+1	e0f21c27251b14be467f
1868	guest_f85a27e1-2def-4813-8c7a-bed5b8a3a09c@example.com	$2a$12$VOrmLog6hGVFdH49aaZXc.weCE8u3fZm6MuQGS3C1PyA8Lm4sPDw2	2025-12-03 15:06:38.120907	2025-12-03 15:06:38.120907	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1874	guest_d3616be7-fb39-4e16-8d66-e6406be8c01f@example.com	$2a$12$9J50V3T6xlPVJP0YVTgbNukMyCq.QFPe6ROyBEDTjltIhTxsD8vay	2025-12-07 06:18:34.790642	2025-12-07 06:18:34.790642	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1885	guest_f8349ecd-944f-43f8-af72-41a6b13cef71@example.com	$2a$12$t9PlHSvHbZSKy0PONk09VuqB1S.XW3WEehJXUlfYUIy47C7vxdGVa	2026-01-25 03:10:41.485662	2026-01-25 03:10:41.485662	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1898	guest_62183475-5d86-4f44-bb3a-4ff194e3a794@example.com	$2a$12$f17bv.o8pHkKkrNzZXcbd.2LlxjdkYN6RL2aunElV6FcRm7I1Egsy	2026-02-02 20:15:48.765958	2026-02-02 20:15:48.765958	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
660	allijeger@gmail.com	$2a$12$TshG5j715EjA2urQv2nbx.PPQqXEviCFQBTzK2wUuzNbBlKTtv.wK	2025-03-28 02:13:06.742897	2025-03-28 02:13:06.742897	Alli	Jeger	9179727695	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1742	yaelush30@gmail.com	$2a$12$tAL.9vfarU663Khmvc.MnOVw1v5KBjbW2cX.RBUM8ewoh3diJbAEu	2025-08-15 01:32:29.893373	2025-08-15 01:32:29.893373	Yael	Battash	6092160802	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
706	lorrieklemons@gmail.com	$2a$12$/xRNAiOG4a5h3qpogibU/ezHVtiFzLS6aTOy8rrC0H5ntxh2Eiuum	2025-04-04 16:28:38.691722	2025-04-04 16:30:16.16235	Lorrie	Klemons	7045641542	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1822	guest_e6fb82fc-faf8-4f53-8b2c-f1a8a7b844e6@example.com	$2a$12$d1Izqm2OnZcTyqEYgujw6.OHrSUW8AGEjYZaNnQ/BZrTbsVR20s6W	2025-09-02 19:29:25.128774	2025-09-02 19:29:25.128774	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1650	melissabgl@yahoo.com	$2a$12$ZhmZJqAuqQ3jBeuRx/AfCeBbHPETixBVAAyVJspXMTFvvI2nP11MW	2025-08-06 02:45:32.152399	2025-08-06 02:45:32.152399	Melissa	Leonard	5165576191	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1744	blumimayzlesh@gmail.com	$2a$12$eeOJTjDlx9ePv4.IK3TW.eP/KzuBiaAUX5Nof1NPMODxsat4CSkKm	2025-08-15 02:08:45.3872	2025-08-15 02:08:45.3872	Blumi 	Mayzlesh 	000000000	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1831	dahannechama@gmail.com	$2a$12$QSCPgvirk4xVavUFq96h6ebUY4L21oFGUHxDowR0qO/asmAL1kC2K	2025-09-17 00:43:33.787456	2025-09-17 00:43:33.787456	Nechama	Junger	9294223120	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1842	chayamh@outlook.com	$2a$12$HflqOW72t1ztV5mJqY1wc.Lr8uPIPwohJ3rIM8rsbpe22a3M4/8S6	2025-11-12 14:29:42.509492	2025-11-12 14:29:42.509492	Mushky	Halsband	3057883669	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1695	frida0129@yahoo.com	$2a$12$5eRU6pHX1q1XisnOWT1B2.e0NxJkK8sBBUULHG2XwdPK53lSRNU4y	2025-08-11 03:18:25.86428	2025-08-11 03:18:25.86428	Frida 	Uvaydov	6464634317	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1855	guest_b33540b8-7614-4fb2-8eef-28fe5d2d641c@example.com	$2a$12$n1HZ2LOIz0InvPNqpdX5Q.qFyVWWLO5kHbHk8uPrfDdsL6YihiV0.	2025-11-21 13:37:58.434591	2025-11-21 13:37:58.434591	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1875	guest_e092c0e4-140f-406a-a217-9174e7929326@example.com	$2a$12$CpSUeJIcP8P8Dl6rVp19PeL64Q65Rz795W/nEF2a6Z7JOt0xMxf4W	2025-12-07 07:16:34.753848	2025-12-07 07:16:34.753848	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1886	guest_bded1571-3fb3-4bba-9f6e-de2ff1b696b0@example.com	$2a$12$IAG4zazj2ZEskqgKDALavuL97YugWw7Q9zRsNbHu7HuxLLMpvG7B6	2026-01-27 01:20:19.93675	2026-01-27 01:20:19.93675	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1887	guest_93e40d7e-046d-46f5-9860-e43582c113b8@example.com	$2a$12$flv7R1FjcN3GaO/xNtiuPOiTnlQZwRgLZPTGTDWjClfoaWJewMw76	2026-01-27 01:24:56.576971	2026-01-27 01:24:56.576971	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1899	guest_10113c34-d17b-4326-b2a9-adbb96fe8721@example.com	$2a$12$pup1HArkjepeR1jBcZ0squeFOZ35gBx5A5aiWVR6oVGbx0d5xkk4W	2026-02-04 23:23:50.263784	2026-02-04 23:23:50.263784	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
512	carlykhabinsky@gmail.com	$2a$12$16IRxhBhmM8kjH8psSXe/.7V1r/QbAJOEYkdvqcvUvLWV064Eluhq	2025-03-19 17:00:01.154923	2025-03-19 17:01:31.370453	Carly	khabinsky	5614454450	f	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1823	thrower_lacking0c@icloud.com	$2a$12$dkxLAGcJyoT39ZD3MBj5x.63aBpGS47Lrb4bzrscMR/s4maVWo3ma	2025-09-04 14:32:31.747147	2025-09-04 14:32:31.747147	Test	Test	3053426665	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1745	naomilevinmorris@gmail.com	$2a$12$zgvNXj4ktXzYzuMjNkenSuoneNlOP0L2DiSM3o5DATDoPcVCIcpE2	2025-08-15 02:35:19.460199	2025-08-15 02:35:19.460199	Naomi	Levin	2035305372	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1832	goldieschachter@gmail.com	$2a$12$RbRzlf5muk6UG.28X7vcyuqWbkdOxtJwHsfgGTa6ZfNYHSiSsX4/G	2025-09-17 01:32:06.558489	2025-09-17 01:32:06.558489	Goldie	Silverman	9542749326	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1843	shaindelsoup@gmail.com	$2a$12$xlj8XP1.dJ54.Fp.LqZRQ.o1flwRBQyUBrPwe/aXedzDcd9UIMTy6	2025-11-12 19:25:06.421193	2025-11-12 19:25:06.421193	Shaindel 	Wilansky 	6467969171	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1876	guest_6eb000d3-5198-44d3-911d-f368bf6e4b8b@example.com	$2a$12$qGALkotdqmYzedfcpEoBF.IvevgtPnIlF.E07Tf7zl8APMsQqnypq	2025-12-08 15:29:14.160789	2025-12-08 15:29:14.160789	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1856	kailah.kaner@gmail.com	$2a$12$HrgxHGd0A.LhiE0fpNvJYu2/ccaOnUAYBGoq3hWzqRcMAjkArCJwS	2025-11-23 18:29:31.699584	2025-12-09 17:15:15.634111	Kailah	Nulman	2014069310	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1888	guest_f008d4c6-0b59-4be2-9424-cd2896e3fd0e@example.com	$2a$12$ODS6iDiUOVqYvKpdRcDhr.DVh73d88/DfeVeaDb9mJb0g5Y4DJbtG	2026-01-27 01:34:36.42897	2026-01-27 01:34:36.42897	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1900	guest_fcc0fa50-a9ef-4396-8566-3a5c8c107099@example.com	$2a$12$2Zjv.tdd0N76gKoXGH76ru7PaKnKsKHUgoY7.1Xl7Y8H3OHpC7DTO	2026-02-04 23:48:47.166743	2026-02-04 23:48:47.166743	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1901	guest_7b65ad9c-7fdf-40b7-9479-30916eb8a3ef@example.com	$2a$12$q18s.mVr74IDXHNunlskNeDeDaBCNDy7cFYni6rt6dfV0.e.spXyy	2026-02-04 23:54:58.136902	2026-02-04 23:54:58.136902	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
532	agschoolgirl@yahoo.com	$2a$12$r4Mps7HBZki7BMot1rzu0O2/Pyjc4LlgT1f.1aXDgTw/LtGeDW7Q6	2025-03-20 02:17:08.63568	2025-03-20 02:17:08.63568	Aliza	Sklar	6465736924	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
533	daskatzfl@gmail.com	$2a$12$NKLWwsR1pEHR1mgSE0Nb/.Q7gbq9k/d0/PgXZqot3Y3iFWNjbWXc.	2025-03-20 02:49:31.520615	2025-03-20 02:49:31.520615	Hadassah 	Katz	3055276284	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
534	fraidylev@gmail.com	$2a$12$OX4E7kqEMbi.qjiIo65Q7.QWf.FXoReve1tjdK3WTzxkI6t3XXIa.	2025-03-20 02:53:10.623998	2025-03-20 02:53:10.623998	Fraidy	Hoberman	7322786780	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
536	krakauer.r@gmail.com	$2a$12$mrXIVzQd2/Wda.jdfIDD9u4H3EJMwzuPD.S1qmg6xS89P18zMEtXS	2025-03-20 03:21:49.737163	2025-03-20 03:21:49.737163	Racheli	Krakauer	3135704988	f	t	f	f	f	f	\N	\N	\N	\N	\N		e0f21c27251b14be467f
537	generalflo@gmail.com	$2a$12$2vx9YdiAw7ToHOJffqq9/Op/fHjH/li7J0KlAujIXXNyvEwQSBjAe	2025-03-20 03:36:50.341203	2025-03-20 03:36:50.341203	Sarah	Florans 	7187876771	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
543	ziscancook@gmail.com	$2a$12$xOGRWY9SNRDfcZgHVRgxDuY7s8583fLsD8TPwHMUMQOP5de1OTb3q	2025-03-20 11:21:09.524364	2025-03-20 11:21:09.524364	Zisi	Blatt	7867882341	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
544	rflamholtz@gmail.com	$2a$12$slQIGbKajM/Wm3/OWxIpwOa2KA3q4tS0uIvamJwcYWzMwvigoNdJ6	2025-03-20 12:06:39.7737	2025-03-20 12:06:39.7737	Rifkie	Flamholtz	3055022608	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1629	melbaz86@gmail.com	$2a$12$agETCsIi7NzHbl714pX9ve648DDnQAZisCIJB.4gUgpwnYCAi1VQ2	2025-08-04 05:25:19.906471	2025-08-04 05:25:19.906471	Moran	Elbaz	9293312892	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1746	miriamdh2018@gmail.com	$2a$12$l5SB8JfTURAJaD5DCj9ad.mruKLitV0zuQNKx9XK63Q2aDuW2ecl6	2025-08-15 03:08:10.663335	2025-08-15 03:08:10.663335	Miriam 	Zag	3106511443	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1758	hagit.schiller@gmail.com	$2a$12$Om2xRArkgD3Ufxz8MnpVc.K1Dd.NSzrTLzYKksn/TonfxKRLIC6kW	2025-08-15 22:15:23.33441	2025-08-15 22:15:23.33441	Hagit 	Schiller 	8189150599	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1833	ldpopack@gmail.com	$2a$12$nvE4bkurav75r5nL4YiTquQZFeOFvH1/cN/24f.WUjPYVWal3MPfW	2025-09-17 05:54:55.640294	2025-09-17 05:54:55.640294	Lippe	Popack	8184158754	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1844	moussy7@gmail.com	$2a$12$6VlLyXMgtm9Lf7L8bSlksejLySndefH1/Fseo/SyTtEhlwhgIeTOC	2025-11-13 03:07:06.49445	2025-11-13 03:07:06.49445	Moussie	Lipskier	3479846130	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1858	jitchabad@yahoo.com	$2a$12$MM3if5kiuZxp/e3d3Ge35ueY2KI7zL3vfnTLnk/Z5hGd5KMpLWmy.	2025-11-25 22:08:52.992531	2025-11-25 22:08:52.992531	Rivkie	Barash	9545493315	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1877	guest_154d545c-7993-49c2-8abc-1e3ede6bb783@example.com	$2a$12$F3OVBYGcZwWD9t2TIV8dneZ3hPn0IFejSNN/HqAfDuR9gaqgP.aXK	2025-12-22 15:52:06.364363	2025-12-22 15:52:06.364363	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1889	guest_cfcb5b41-a25b-414e-b9d6-ba2d38bedff7@example.com	$2a$12$FqW/3cBf7Q9l2KtRvLsDXub0lbEHP5PacK9RklawZG76VSUTYVFmO	2026-01-27 02:09:07.845317	2026-01-27 02:09:07.845317	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1902	lorrainemweiss@gmail.com	$2a$12$Y83pwz5kuTVInYychHeV4O.0xA9mV/8Ko4os6W.GjWUDwLbHJYrGC	2026-02-11 08:12:55.777045	2026-02-11 08:12:55.777045	Lorraine	Weiss	3057208406	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
663	novick.rachel@gmail.com	$2a$12$TTz3AldRupNsiAdsULbcoOFuSBk0dC773flW52R/VbnNFzYzYEBLi	2025-03-28 10:54:47.0766	2025-03-28 10:54:47.0766	Rachel 	Haber 	5614970398	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1747	pesach5757@gmail.com	$2a$12$EW9I25ysSuAWSN2b1rnzou4.q4mriVhzdX8NvHMRhQxD38RRULuSy	2025-08-15 05:39:10.526289	2025-08-15 05:39:10.526289	Pesach	Shifman	3053371786	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1748	zisalevin@gmail.com	$2a$12$rt3Bk63DlcFlKyV7t9v36OmDN54sfjyIj3zekIEdLEynrO7suE1TC	2025-08-15 05:45:22.687633	2025-08-15 05:45:22.687633	Zisa	Levin	7736770901	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1834	dvoragoldfeder@gmail.com	$2a$12$Cvjz0WtROhnxP8/sA5W72OcNgvm1nBULBwQ/YDZ8HkI0SkXkvMvmu	2025-09-17 12:00:10.511443	2025-09-17 12:00:10.511443	Dvora	Goldfeder	9739069941	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1771	ruthhvolk@gmail.com	$2a$12$eZX6t3OR29MR3I7uRBMFGOTIKSv2LARLneA0XOQCnRePQQwxR1aC2	2025-08-17 00:53:02.195356	2025-08-17 00:53:02.195356	Ruth	Dagan	3234040406	f	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1845	skido20@gmail.com	$2a$12$mOW1W0DrbP42E8n6FZEp7eGUpHccKNUG1BcbfKykqBqi0yByBYWtC	2025-11-13 14:24:23.705493	2025-11-13 14:26:48.519502	Chani	Brashevitzky	8628123625	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1859	brachazieglerre@gmail.com	$2a$12$0Qajj8JP50XzMDrHhlBw8eczmqFi2015V8NJwt5a5b5DefmHXVovm	2025-12-01 18:26:45.13688	2025-12-01 19:05:20.432928	Bracha	Ziegler	7189865283	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1878	guest_19a8a0da-375c-493c-800c-c0cf6d84f956@example.com	$2a$12$MVEUaAiN1JIMyZ1t.TFjgeqNR23m.2os8jEnHbMRP13uJFNCITINm	2026-01-04 21:02:30.933272	2026-01-04 21:02:30.933272	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1890	guest_00c06d6e-834c-4308-aebf-8c241184bc15@example.com	$2a$12$1QXd68DBVLCGjTVClygsHOrWwXAvG8y2jJ9.aysQrLlEs1LslKl5a	2026-01-28 09:48:03.942663	2026-01-28 09:48:03.942663	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1891	guest_cb519d98-e53e-490d-b0db-4486ffcf0969@example.com	$2a$12$GsYoDlmUiEMJsNOebFAFneOKOKT/R01qhBWmbQlccUmJtcEsCcu4C	2026-01-28 09:53:12.390443	2026-01-28 09:53:12.390443	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1903	sarifellig@gmail.com	$2a$12$mInbrb8wZfoyoG1/0QFa7eFuJY./l9TXr7bQFFU09Yq8p01cdM2ym	2026-02-11 15:16:05.023906	2026-02-11 15:16:05.023906	Sari	Delevkovitz 	7867149351	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1479	chabadpr770@gmail.com	$2a$12$mDQmZL5SWZWgOf97ACKAPOfJQm9.5KRHc6qkKcxCAB01bU0R8ewhm	2025-07-17 02:00:03.480059	2025-09-15 00:24:47.882828	Chabad	PR	3053426665	t	t	t	f	f	f	\N	\N	\N	\N	2025-09-15 00:19:39.280956	+1	e0f21c27251b14be467f
1846	mushkysamuels@gmail.com	$2a$12$u4QHGAympW8zW8FxLU6HA.0v26cjFszgxNWTUta4O0ueYvwJrMjc2	2025-11-13 22:28:28.742007	2025-11-13 22:28:28.742007	Mushky	And Fruma 	9173750493	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1860	alana.ziegler7@gmail.com	$2a$12$IzBEEOw648Y5.g4iiEp5feMO2eXF06beJU5ZNZHvvAo/LOnKgTsVm	2025-12-01 19:30:40.585579	2025-12-01 19:30:40.585579	Alana	Ziegler 	3102797316	f	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1879	guest_b585c0a0-9121-4816-84e9-4591b7408083@example.com	$2a$12$oMbCbjSNwp5CTH8ekh38hu2T25q7VjFfyOnvHAeR/7nh9KAQJKkBK	2026-01-04 22:05:41.273545	2026-01-04 22:05:41.273545	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1892	guest_ac9145ad-98e3-4017-94e8-824cb0e66577@example.com	$2a$12$6XAbbFNiNmndfyaHAXWoS.C/EklcAwu2hnvH/hPmvvm8SVtdenOWq	2026-01-28 10:54:14.641106	2026-01-28 10:54:14.641106	Guest	Guest	305000000	t	\N	\N	t	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1904	sarir1234@gmail.com	$2a$12$JK62GcSsEZu0Gitif9J9h.QqwtZ/SmMuxoYzR67CtmauzmCsN78x2	2026-02-11 19:38:53.695586	2026-02-11 19:38:53.695586	Sari	Parmett	3054321407	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
1835	testing1@aol.com	$2a$12$ecEbvcf8Iy1PHkGaphrDGOSR1xyIEewcrloQcXrSFj/0NfBqxRL8u	2025-09-18 03:04:29.340317	2026-02-12 04:36:57.313283	Gustavo	Pares	3055490635	t	t	f	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
643	mshnids1@gmail.com	$2a$12$oRFY.QqLV2iLYW2QT5Pkwu48.nCkERHoR5LCN20xuVUs87fvC9ZU2	2025-03-25 03:18:52.398211	2025-03-25 03:18:52.398211	yehudis	shnidman	4436767653	t	t	t	f	f	f	\N	\N	\N	\N	\N	+1	e0f21c27251b14be467f
\.


--
-- Data for Name: volunteer_events; Type: TABLE DATA; Schema: public; Owner: chesed_train_db_user
--

COPY public.volunteer_events (id, user_id, event_id, created_at, updated_at) FROM stdin;
153	1745	186	2025-08-15 02:35:33.23647	2025-08-15 02:35:33.23647
154	1746	184	2025-08-15 03:08:33.446209	2025-08-15 03:08:33.446209
155	1746	184	2025-08-15 03:08:55.685106	2025-08-15 03:08:55.685106
156	1625	186	2025-08-15 05:35:36.116736	2025-08-15 05:35:36.116736
157	1747	186	2025-08-15 05:39:39.74807	2025-08-15 05:39:39.74807
158	1748	186	2025-08-15 05:45:48.74598	2025-08-15 05:45:48.74598
159	1751	186	2025-08-15 10:58:18.029402	2025-08-15 10:58:18.029402
160	1753	186	2025-08-15 13:45:30.814593	2025-08-15 13:45:30.814593
161	1758	186	2025-08-15 22:15:41.941164	2025-08-15 22:15:41.941164
162	1771	186	2025-08-17 00:54:39.630747	2025-08-17 00:54:39.630747
163	1793	186	2025-08-19 12:02:27.980869	2025-08-19 12:02:27.980869
188	1828	198	2025-09-16 18:33:06.935506	2025-09-16 18:33:06.935506
189	1829	198	2025-09-16 20:56:29.134441	2025-09-16 20:56:29.134441
190	1830	198	2025-09-16 23:45:26.631539	2025-09-16 23:45:26.631539
191	1831	198	2025-09-17 00:44:07.47824	2025-09-17 00:44:07.47824
192	1832	198	2025-09-17 01:32:39.20498	2025-09-17 01:32:39.20498
193	1833	198	2025-09-17 06:00:22.460186	2025-09-17 06:00:22.460186
197	1836	198	2025-09-26 01:49:59.389055	2025-09-26 01:49:59.389055
198	1203	191	2025-10-27 11:33:12.595197	2025-10-27 11:33:12.595197
111	512	137	2025-03-19 17:01:31.404802	2025-03-19 17:01:31.404802
112	512	137	2025-03-19 17:02:06.777282	2025-03-19 17:02:06.777282
113	512	137	2025-03-19 17:02:15.750543	2025-03-19 17:02:15.750543
114	532	137	2025-03-20 02:27:57.841964	2025-03-20 02:27:57.841964
115	533	137	2025-03-20 02:50:29.445591	2025-03-20 02:50:29.445591
116	534	137	2025-03-20 02:54:09.097261	2025-03-20 02:54:09.097261
117	512	137	2025-03-20 03:13:52.22258	2025-03-20 03:13:52.22258
118	536	137	2025-03-20 03:23:08.312047	2025-03-20 03:23:08.312047
119	537	137	2025-03-20 03:37:02.429311	2025-03-20 03:37:02.429311
199	1838	199	2025-11-11 19:14:34.707464	2025-11-11 19:14:34.707464
120	543	137	2025-03-20 11:21:38.521505	2025-03-20 11:21:38.521505
121	544	137	2025-03-20 12:07:55.418848	2025-03-20 12:07:55.418848
200	1839	199	2025-11-11 21:20:39.464326	2025-11-11 21:20:39.464326
123	643	137	2025-03-25 03:20:04.591214	2025-03-25 03:20:04.591214
201	1840	199	2025-11-12 03:04:03.209539	2025-11-12 03:04:03.209539
202	1841	199	2025-11-12 05:25:05.054262	2025-11-12 05:25:05.054262
126	660	137	2025-03-28 02:14:41.261871	2025-03-28 02:14:41.261871
127	663	137	2025-03-28 10:55:47.908692	2025-03-28 10:55:47.908692
128	706	152	2025-04-04 16:30:16.180751	2025-04-04 16:30:16.180751
129	706	152	2025-04-04 16:30:43.810623	2025-04-04 16:30:43.810623
203	1841	199	2025-11-12 05:26:33.656122	2025-11-12 05:26:33.656122
204	1842	199	2025-11-12 14:31:16.223945	2025-11-12 14:31:16.223945
205	1843	199	2025-11-12 19:25:51.301669	2025-11-12 19:25:51.301669
206	1844	199	2025-11-13 03:09:01.424922	2025-11-13 03:09:01.424922
208	1845	202	2025-11-13 14:26:48.527908	2025-11-13 14:26:48.527908
209	1846	199	2025-11-13 22:29:11.55938	2025-11-13 22:29:11.55938
210	1847	199	2025-11-14 03:43:09.815776	2025-11-14 03:43:09.815776
139	1625	184	2025-08-03 21:19:58.027618	2025-08-03 21:19:58.027618
140	1629	184	2025-08-04 05:26:00.495296	2025-08-04 05:26:00.495296
141	1637	184	2025-08-05 00:28:06.829092	2025-08-05 00:28:06.829092
142	1636	184	2025-08-05 00:28:12.919551	2025-08-05 00:28:12.919551
143	1637	184	2025-08-05 00:30:40.774314	2025-08-05 00:30:40.774314
144	1637	184	2025-08-05 00:31:05.362831	2025-08-05 00:31:05.362831
145	1645	184	2025-08-05 17:24:52.430144	2025-08-05 17:24:52.430144
146	1646	184	2025-08-05 18:35:20.174182	2025-08-05 18:35:20.174182
148	1695	184	2025-08-11 03:19:46.467582	2025-08-11 03:19:46.467582
149	1740	186	2025-08-14 23:47:09.03432	2025-08-14 23:47:09.03432
150	1741	186	2025-08-15 01:02:33.335576	2025-08-15 01:02:33.335576
151	1742	184	2025-08-15 01:32:48.948875	2025-08-15 01:32:48.948875
152	1744	186	2025-08-15 02:09:20.353068	2025-08-15 02:09:20.353068
211	1847	199	2025-11-14 03:44:18.739227	2025-11-14 03:44:18.739227
212	1847	199	2025-11-14 03:46:41.657479	2025-11-14 03:46:41.657479
213	1847	199	2025-11-14 03:47:05.842262	2025-11-14 03:47:05.842262
214	1847	199	2025-11-14 03:50:22.010193	2025-11-14 03:50:22.010193
215	1842	199	2025-11-20 23:25:04.869642	2025-11-20 23:25:04.869642
216	1856	215	2025-11-23 18:29:55.442519	2025-11-23 18:29:55.442519
217	1740	215	2025-11-23 18:39:05.357634	2025-11-23 18:39:05.357634
218	1830	215	2025-11-23 18:44:30.21514	2025-11-23 18:44:30.21514
219	1832	215	2025-11-23 18:46:29.82654	2025-11-23 18:46:29.82654
220	1858	215	2025-11-25 22:09:27.432821	2025-11-25 22:09:27.432821
221	1842	199	2025-11-26 01:43:00.080177	2025-11-26 01:43:00.080177
222	1624	215	2025-11-26 18:16:49.788141	2025-11-26 18:16:49.788141
223	1859	216	2025-12-01 19:03:35.509347	2025-12-01 19:03:35.509347
224	1859	216	2025-12-01 19:12:01.891451	2025-12-01 19:12:01.891451
225	1860	216	2025-12-01 19:31:32.547635	2025-12-01 19:31:32.547635
226	1861	216	2025-12-01 20:26:39.086847	2025-12-01 20:26:39.086847
227	1830	216	2025-12-01 21:19:50.184007	2025-12-01 21:19:50.184007
228	1863	216	2025-12-02 01:25:18.395731	2025-12-02 01:25:18.395731
229	1864	216	2025-12-02 01:32:11.02423	2025-12-02 01:32:11.02423
230	1865	216	2025-12-02 03:10:57.694105	2025-12-02 03:10:57.694105
231	1866	216	2025-12-02 23:43:05.379037	2025-12-02 23:43:05.379037
232	1869	216	2025-12-04 14:19:14.896528	2025-12-04 14:19:14.896528
233	1870	216	2025-12-04 14:34:16.155729	2025-12-04 14:34:16.155729
234	1869	216	2025-12-04 15:59:03.680104	2025-12-04 15:59:03.680104
235	1869	216	2025-12-04 15:59:31.132179	2025-12-04 15:59:31.132179
236	1871	219	2025-12-05 17:43:30.261626	2025-12-05 17:43:30.261626
237	1741	219	2025-12-05 18:43:33.528819	2025-12-05 18:43:33.528819
238	1832	219	2025-12-05 22:01:33.095032	2025-12-05 22:01:33.095032
239	1872	219	2025-12-06 23:30:45.840543	2025-12-06 23:30:45.840543
240	1740	219	2025-12-07 01:07:41.989138	2025-12-07 01:07:41.989138
241	1873	219	2025-12-07 01:07:47.757848	2025-12-07 01:07:47.757848
242	1856	219	2025-12-07 01:27:27.074639	2025-12-07 01:27:27.074639
243	1624	219	2025-12-07 14:46:16.252146	2025-12-07 14:46:16.252146
244	1624	219	2025-12-07 14:46:31.463355	2025-12-07 14:46:31.463355
245	1624	219	2025-12-07 14:46:50.267507	2025-12-07 14:46:50.267507
246	1624	219	2025-12-08 18:18:16.680218	2025-12-08 18:18:16.680218
247	1645	219	2025-12-09 13:46:03.380562	2025-12-09 13:46:03.380562
248	1744	219	2025-12-09 13:53:55.429868	2025-12-09 13:53:55.429868
249	1856	219	2025-12-09 17:15:52.354459	2025-12-09 17:15:52.354459
250	1624	219	2025-12-09 18:51:17.189406	2025-12-09 18:51:17.189406
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 14, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 14, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: ads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.ads_id_seq', 3, true);


--
-- Name: event_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.event_dates_id_seq', 930, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.events_id_seq', 252, true);


--
-- Name: selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.selections_id_seq', 768, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.sessions_id_seq', 164, true);


--
-- Name: updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.updates_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1922, true);


--
-- Name: volunteer_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: chesed_train_db_user
--

SELECT pg_catalog.setval('public.volunteer_events_id_seq', 256, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: event_dates event_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.event_dates
    ADD CONSTRAINT event_dates_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: selections selections_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: updates updates_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.updates
    ADD CONSTRAINT updates_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: volunteer_events volunteer_events_pkey; Type: CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.volunteer_events
    ADD CONSTRAINT volunteer_events_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_event_dates_on_chesed_train_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_event_dates_on_chesed_train_id ON public.event_dates USING btree (chesed_train_id);


--
-- Name: index_event_dates_on_event_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_event_dates_on_event_id ON public.event_dates USING btree (event_id);


--
-- Name: index_event_dates_on_volunteer_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_event_dates_on_volunteer_id ON public.event_dates USING btree (volunteer_id);


--
-- Name: index_events_on_owner_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_events_on_owner_id ON public.events USING btree (owner_id);


--
-- Name: index_events_on_slug; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE UNIQUE INDEX index_events_on_slug ON public.events USING btree (slug);


--
-- Name: index_selections_on_event_date_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_selections_on_event_date_id ON public.selections USING btree (event_date_id);


--
-- Name: index_selections_on_potluck_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_selections_on_potluck_id ON public.selections USING btree (potluck_id);


--
-- Name: index_selections_on_volunteer_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_selections_on_volunteer_id ON public.selections USING btree (volunteer_id);


--
-- Name: index_sessions_on_user_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_sessions_on_user_id ON public.sessions USING btree (user_id);


--
-- Name: index_updates_on_event_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_updates_on_event_id ON public.updates USING btree (event_id);


--
-- Name: index_users_on_email_address; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE UNIQUE INDEX index_users_on_email_address ON public.users USING btree (email_address);


--
-- Name: index_volunteer_events_on_event_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_volunteer_events_on_event_id ON public.volunteer_events USING btree (event_id);


--
-- Name: index_volunteer_events_on_user_id; Type: INDEX; Schema: public; Owner: chesed_train_db_user
--

CREATE INDEX index_volunteer_events_on_user_id ON public.volunteer_events USING btree (user_id);


--
-- Name: event_reports _RETURN; Type: RULE; Schema: public; Owner: chesed_train_db_user
--

CREATE OR REPLACE VIEW public.event_reports AS
 SELECT events.name AS event_name,
    events.type AS event_type,
    (((users.first_name)::text || ' '::text) || (users.last_name)::text) AS owner,
    users.email_address AS email,
    (((users.area_code)::text || ' '::text) || (users.phone_number)::text) AS contact_number,
    events.start_date,
    events.end_date,
    events.recipent_email AS recipient_email,
    events.recipent_name AS recipient_name,
    events.country,
    events.postal_code,
    events.state,
    events.created_at,
    count(volunteer_events.id) AS volunteer_count
   FROM ((public.events
     JOIN public.users ON ((events.owner_id = users.id)))
     LEFT JOIN public.volunteer_events ON ((events.id = volunteer_events.event_id)))
  WHERE (users.guest = false)
  GROUP BY events.id, users.id;


--
-- Name: user_reports _RETURN; Type: RULE; Schema: public; Owner: chesed_train_db_user
--

CREATE OR REPLACE VIEW public.user_reports AS
 WITH selected_countries(country_name, country_code) AS (
         VALUES ('United States'::text,'+1'::text), ('Argentina'::text,'+54'::text), ('Australia'::text,'+61'::text), ('Austria'::text,'+43'::text), ('Belarus'::text,'+375'::text), ('Belgium'::text,'+32'::text), ('Belize'::text,'+501'::text), ('Benin'::text,'+229'::text), ('Bhutan'::text,'+975'::text), ('Bolivia'::text,'+591'::text), ('Brazil'::text,'+55'::text), ('Brunei'::text,'+673'::text), ('Canada'::text,'+1c'::text), ('Chile'::text,'+56'::text), ('Colombia'::text,'+57'::text), ('Comoros'::text,'+269'::text), ('Congo'::text,'+242'::text), ('Costa Rica'::text,'+506'::text), ('Croatia'::text,'+385'::text), ('Cuba'::text,'+53'::text), ('Cyprus'::text,'+357'::text), ('Czech Republic'::text,'+420'::text), ('Denmark'::text,'+45'::text), ('Ecuador'::text,'+593'::text), ('Egypt'::text,'+20'::text), ('El Salvador'::text,'+503'::text), ('Finland'::text,'+358'::text), ('France'::text,'+33'::text), ('Georgia'::text,'+995'::text), ('Germany'::text,'+49'::text), ('Greece'::text,'+30'::text), ('Guatemala'::text,'+502'::text), ('Haiti'::text,'+509'::text), ('Honduras'::text,'+504'::text), ('Hungary'::text,'+36'::text), ('Iceland'::text,'+354'::text), ('Iran'::text,'+98'::text), ('Iraq'::text,'+964'::text), ('Ireland'::text,'+353'::text), ('Israel'::text,'+972'::text), ('Italy'::text,'+39'::text), ('Jamaica'::text,'+1-876'::text), ('Japan'::text,'+81'::text), ('Jordan'::text,'+962'::text), ('Lebanon'::text,'+961'::text), ('Mexico'::text,'+52'::text), ('Monaco'::text,'+377'::text), ('Mongolia'::text,'+976'::text), ('Morocco'::text,'+212'::text), ('Netherlands'::text,'+31'::text), ('New Zealand'::text,'+64'::text), ('Peru'::text,'+51'::text), ('Philippines'::text,'+63'::text), ('Poland'::text,'+48'::text), ('Portugal'::text,'+351'::text), ('Qatar'::text,'+974'::text), ('Romania'::text,'+40'::text), ('Russia'::text,'+7'::text), ('Saudi Arabia'::text,'+966'::text), ('Singapore'::text,'+65'::text), ('South Africa'::text,'+27'::text), ('Spain'::text,'+34'::text), ('Sweden'::text,'+46'::text), ('Switzerland'::text,'+41'::text), ('Thailand'::text,'+66'::text), ('Turkey'::text,'+90'::text), ('Ukraine'::text,'+380'::text), ('United Arab Emirates'::text,'+971'::text), ('United Kingdom'::text,'+44'::text)
        )
 SELECT (((users.first_name)::text || ' '::text) || (users.last_name)::text) AS full_name,
    users.email_address,
    ((users.area_code)::text || (users.phone_number)::text) AS contact_number,
    users.is_paying AS pro,
    users.sms,
    users.created_at,
    selected_countries.country_name,
    count(events.*) AS event_created,
    count(volunteer_events.*) AS volunteered_events
   FROM (((public.users
     LEFT JOIN public.events ON ((users.id = events.owner_id)))
     LEFT JOIN public.volunteer_events ON ((users.id = volunteer_events.user_id)))
     LEFT JOIN selected_countries ON (((users.country_code)::text = selected_countries.country_code)))
  WHERE (users.guest = false)
  GROUP BY users.id, users.first_name, users.last_name, users.email_address, users.area_code, users.phone_number, users.is_paying, users.created_at, selected_countries.country_name;


--
-- Name: event_dates fk_rails_261ec9f0f8; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.event_dates
    ADD CONSTRAINT fk_rails_261ec9f0f8 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_dates fk_rails_4fc09b9514; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.event_dates
    ADD CONSTRAINT fk_rails_4fc09b9514 FOREIGN KEY (volunteer_id) REFERENCES public.users(id);


--
-- Name: sessions fk_rails_758836b4f0; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_758836b4f0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: selections fk_rails_95d4fff52e; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT fk_rails_95d4fff52e FOREIGN KEY (volunteer_id) REFERENCES public.users(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: updates fk_rails_b880855b2b; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.updates
    ADD CONSTRAINT fk_rails_b880855b2b FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: volunteer_events fk_rails_ecd655e03b; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.volunteer_events
    ADD CONSTRAINT fk_rails_ecd655e03b FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: events fk_rails_f58490957c; Type: FK CONSTRAINT; Schema: public; Owner: chesed_train_db_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_f58490957c FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict qIPXcuCOTF1VICRuB8k4tF7yPZ5SQO9oY2dDvDDsqrgSDBRz27eQxlp4MXaagy8

