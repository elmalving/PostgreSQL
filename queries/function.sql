-- Vrátit celkové procento docházky pro studenta (potřebuje ID studenta)
CREATE OR REPLACE FUNCTION calculate_total_attendance_percentage(student_id INTEGER)
RETURNS SMALLINT AS $$
DECLARE
    total_attendance SMALLINT;
BEGIN
    SELECT
        COALESCE(SUM(procento_dochazky), 0) -- Pokud nejsou dochazka, pak vratí 0
    INTO
        total_attendance
    FROM
        dochazka
    WHERE
        id_student = student_id;

    RETURN total_attendance;
END;
$$ LANGUAGE plpgsql;

SELECT calculate_total_attendance_percentage(1);