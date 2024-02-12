-- Lock (only reading)
-- LOCK TABLE student IN SHARE MODE;

-- Lock (reading and writing)
-- LOCK TABLE student IN ROW EXCLUSIVE MODE;
BEGIN;
LOCK TABLE student IN SHARE MODE;

DO $$ 
BEGIN
    RAISE NOTICE 'Table locked. Performing some operations...';
END $$;

COMMIT;