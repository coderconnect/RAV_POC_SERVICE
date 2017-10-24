--- REPLACE THE FOLLOWING
-- <SCHEMA>
-- <CATALOG>
-- <TABLESPACE>
-- <DB_USER>

-- Table: <SCHEMA>.active_charts

-- DROP TABLE <SCHEMA>.active_charts;

CREATE TABLE <SCHEMA>.active_charts
(
    id integer NOT NULL DEFAULT nextval('active_charts_id_seq'::regclass),
    user_id integer,
    chart_id integer,
    CONSTRAINT active_charts_pkey PRIMARY KEY (id),
    CONSTRAINT user_id UNIQUE (user_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.active_charts
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.cannot_review_messages

-- DROP TABLE <SCHEMA>.cannot_review_messages;

CREATE TABLE <SCHEMA>.cannot_review_messages
(
    id integer NOT NULL DEFAULT nextval('cannot_review_messages_id_seq'::regclass),
    name character varying(210) ,
    CONSTRAINT cannot_review_messages_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.cannot_review_messages
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.chart_claims

-- DROP TABLE <SCHEMA>.chart_claims;

CREATE TABLE <SCHEMA>.chart_claims
(
    id integer NOT NULL DEFAULT nextval('chart_claims_id_seq'::regclass),
    chart_id integer,
    claim_id character varying(110) ,
    comment text ,
    status integer DEFAULT 0,
    date_of_service character varying(110) ,
    coding_date character varying(110) ,
    provider_id integer,
    reviewed boolean,
    insert_type character varying(110) ,
    CONSTRAINT id PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.chart_claims
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.charts

-- DROP TABLE <SCHEMA>.charts;

CREATE TABLE <SCHEMA>.charts
(
    id integer NOT NULL DEFAULT nextval('charts_id_seq'::regclass),
    name character varying(210) ,
    member_id integer,
    provider_id integer,
    comment text ,
    reason_id integer,
    status integer,
    uri character varying(210) ,
    CONSTRAINT charts_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.charts
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.cpt_claims

-- DROP TABLE <SCHEMA>.cpt_claims;

CREATE TABLE <SCHEMA>.cpt_claims
(
    id integer NOT NULL DEFAULT nextval('cpt_claims_id_seq'::regclass),
    claim_id character varying(210) ,
    cpt_id integer,
    modifiers character varying(110) ,
    comment text ,
    insert_type character varying(110) ,
    CONSTRAINT cpt_claims_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.cpt_claims
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.cpt_codes

-- DROP TABLE <SCHEMA>.cpt_codes;

CREATE TABLE <SCHEMA>.cpt_codes
(
    id integer NOT NULL DEFAULT nextval('cpt_codes_id_seq'::regclass),
    cptcode character varying(210) ,
    description text ,
    CONSTRAINT cpt_codes_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.cpt_codes
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.dx_claims

-- DROP TABLE <SCHEMA>.dx_claims;

CREATE TABLE <SCHEMA>.dx_claims
(
    id integer NOT NULL DEFAULT nextval('dx_claims_id_seq'::regclass),
    claim_id character varying(210) ,
    dx_id integer,
    comment text ,
    provider_id integer,
    reason_id integer,
    status integer,
    insert_type character varying(110) ,
    invalid boolean,
    CONSTRAINT dx_claims_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.dx_claims
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.dx_codes

-- DROP TABLE <SCHEMA>.dx_codes;

CREATE TABLE <SCHEMA>.dx_codes
(
    id integer NOT NULL DEFAULT nextval('dx_codes_id_seq'::regclass),
    dxcode character varying(110) ,
    description text ,
    hcc character varying(110) ,
    CONSTRAINT dx_codes_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.dx_codes
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.members

-- DROP TABLE <SCHEMA>.members;

CREATE TABLE <SCHEMA>.members
(
    id integer NOT NULL DEFAULT nextval('members_id_seq'::regclass),
    full_name character varying(210) ,
    date_of_birth character varying(110) ,
    address character varying(210) ,
    memid character varying(110) ,
    provider_id integer,
    CONSTRAINT members_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.members
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.providers

-- DROP TABLE <SCHEMA>.providers;

CREATE TABLE <SCHEMA>.providers
(
    id integer NOT NULL DEFAULT nextval('providers_id_seq'::regclass),
    full_name character varying(210) ,
    npi character varying(110) ,
    CONSTRAINT providers_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.providers
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.reasons

-- DROP TABLE <SCHEMA>.reasons;

CREATE TABLE <SCHEMA>.reasons
(
    id integer NOT NULL DEFAULT nextval('reasons_id_seq'::regclass),
    name character varying(110) ,
    CONSTRAINT reasons_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.reasons
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.user_charts

-- DROP TABLE <SCHEMA>.user_charts;

CREATE TABLE <SCHEMA>.user_charts
(
    id integer NOT NULL DEFAULT nextval('user_charts_id_seq'::regclass),
    user_id integer,
    chart_id integer,
    status integer,
    CONSTRAINT user_charts_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.user_charts
    OWNER to <DB-USER>;

-- Table: <SCHEMA>.users

-- DROP TABLE <SCHEMA>.users;

CREATE TABLE <SCHEMA>.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    full_name character varying(110) ,
    email character varying(110) ,
    username character varying(110) ,
    password character varying(110) ,
    role character varying ,
    status integer,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT email UNIQUE (email)
)
WITH (
    OIDS = FALSE
)
TABLESPACE <TABLESPACE>;

ALTER TABLE <SCHEMA>.users
    OWNER to <DB-USER>;
