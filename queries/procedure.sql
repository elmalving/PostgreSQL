CREATE OR REPLACE PROCEDURE generate_student_discounts()
LANGUAGE plpgsql
AS $$
DECLARE
    student_cursor CURSOR FOR
        SELECT id_student, jmeno, prijmeni FROM student;

    student_record RECORD;
    attendance_percentage SMALLINT;
BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor INTO student_record;

        EXIT WHEN NOT FOUND;

        SELECT
            COALESCE(SUM(procento_dochazky), 0)
        INTO
            attendance_percentage
        FROM
            dochazka
        WHERE
            id_student = student_record.id_student;

        IF attendance_percentage > 80 THEN
            UPDATE student
            SET discount = 0.10
            WHERE id_student = student_record.id_student;
        END IF;
    END LOOP;

    CLOSE student_cursor;

EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'An error occurred while generating student discounts.';
END;
$$;

CALL generate_student_discounts();