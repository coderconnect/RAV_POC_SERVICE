--- REPLACE THE FOLLOWING
-- <SCHEMA>
-- <DB-USER>


-- Sequence for active_charts

CREATE SEQUENCE <SCHEMA>.active_charts_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.active_charts_id_seq
    OWNER TO <DB-USER>;

-- Sequence for cannot_review_messages

CREATE SEQUENCE <SCHEMA>.cannot_review_messages_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.cannot_review_messages_id_seq
    OWNER TO <DB-USER>;

-- Sequence for chart_claims

CREATE SEQUENCE <SCHEMA>.chart_claims_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.chart_claims_id_seq
    OWNER TO <DB-USER>;

-- Sequence for charts

CREATE SEQUENCE <SCHEMA>.charts_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.charts_id_seq
    OWNER TO <DB-USER>;

 -- Sequence for cpt_claims

 CREATE SEQUENCE <SCHEMA>.cpt_claims_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.cpt_claims_id_seq
    OWNER TO <DB-USER>;

-- Sequence for cpt_codes

CREATE SEQUENCE <SCHEMA>.cpt_codes_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.cpt_codes_id_seq
    OWNER TO <DB-USER>;

-- Sequence for dx_claims

 CREATE SEQUENCE <SCHEMA>.dx_claims_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.dx_claims_id_seq
    OWNER TO <DB-USER>;

-- Sequence for dx_codes

CREATE SEQUENCE <SCHEMA>.dx_codes_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.dx_codes_id_seq
    OWNER TO <DB-USER>;

-- Sequence for members

CREATE SEQUENCE <SCHEMA>.members_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.members_id_seq
    OWNER TO <DB-USER>;

-- Sequence for Providers

CREATE SEQUENCE <SCHEMA>.providers_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.providers_id_seq
    OWNER TO <DB-USER>;

-- Sequence for Reasons

CREATE SEQUENCE <SCHEMA>.reasons_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.reasons_id_seq
    OWNER TO <DB-USER>;

-- Sequence for User_charts

CREATE SEQUENCE <SCHEMA>.user_charts_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.user_charts_id_seq
    OWNER TO <DB-USER>;

-- Sequence for Users
CREATE SEQUENCE <SCHEMA>.users_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE <SCHEMA>.users_id_seq
    OWNER TO <DB-USER>;
