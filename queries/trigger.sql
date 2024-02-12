CREATE OR REPLACE FUNCTION student_audit_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO student_audit_log (id_student, modified_by)
        VALUES (NEW.id_student, current_user);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_audit
AFTER UPDATE ON student
FOR EACH ROW
EXECUTE FUNCTION student_audit_trigger();