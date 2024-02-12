CREATE OR REPLACE FUNCTION transfer_money (
    sender_id INTEGER,
    receiver_id INTEGER,
    amount NUMERIC
)
RETURNS TEXT AS $$
DECLARE
    sender_balance NUMERIC;
BEGIN
    SELECT balance INTO sender_balance FROM student WHERE id_student = sender_id;
    IF sender_balance < amount THEN
        RETURN 'Transfer failed: Insufficient funds.';
    END IF;

    UPDATE student SET balance = balance - amount WHERE id_student = sender_id;
    UPDATE student SET balance = balance + amount WHERE id_student = receiver_id;

    RETURN 'Transfer successful';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Transfer failed: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;


SELECT transfer_money(1, 2, 500);