SELECT setval(pg_get_serial_sequence('users', 'id'), max(id)) FROM users;
SELECT setval(pg_get_serial_sequence('user_charts', 'id'), max(id)) FROM user_charts;
SELECT setval(pg_get_serial_sequence('reasons', 'id'), max(id)) FROM reasons;
SELECT setval(pg_get_serial_sequence('providers', 'id'), max(id)) FROM providers;
SELECT setval(pg_get_serial_sequence('members', 'id'), max(id)) FROM members;
SELECT setval(pg_get_serial_sequence('dx_codes', 'id'), max(id)) FROM dx_codes;
SELECT setval(pg_get_serial_sequence('dx_claims', 'id'), max(id)) FROM dx_claims;
SELECT setval(pg_get_serial_sequence('cpt_codes', 'id'), max(id)) FROM cpt_codes;
SELECT setval(pg_get_serial_sequence('cpt_claims', 'id'), max(id)) FROM cpt_claims;
SELECT setval(pg_get_serial_sequence('charts', 'id'), max(id)) FROM charts;
SELECT setval(pg_get_serial_sequence('chart_claims', 'id'), max(id)) FROM chart_claims;
SELECT setval(pg_get_serial_sequence('cannot_review_messages', 'id'), max(id)) FROM cannot_review_messages;
SELECT setval(pg_get_serial_sequence('active_charts', 'id'), max(id)) FROM active_charts;