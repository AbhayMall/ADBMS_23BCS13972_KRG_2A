-- Hard Level Problem

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    class INT
);

DO $$
BEGIN
    BEGIN
        INSERT INTO students(name, age, class) VALUES ('Shivanshu',20,12);
        INSERT INTO students(name, age, class) VALUES ('Tanya',21,12);
        INSERT INTO students(name, age, class) VALUES ('Devanshu',16,10);

        RAISE NOTICE 'Transaction Successfully Done';
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Transaction Failed..! Rolling back all changes.';
            RAISE;
    END;
END;
$$;

SELECT * FROM students;

BEGIN; 


SAVEPOINT sp1;
INSERT INTO students(name, age, class) VALUES ('Karan',19,12);
DO $$ BEGIN RAISE NOTICE 'Inserted Karan successfully'; END $$;


SAVEPOINT sp2;
DO $$
BEGIN
    BEGIN
        INSERT INTO students(name, age, class) VALUES ('Rohit','wrong',12);
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'Failed to insert Rohit, rolling back to savepoint sp2';
    END;
END;
$$;

ROLLBACK TO SAVEPOINT sp2;

SAVEPOINT sp3;
INSERT INTO students(name, age, class) VALUES ('Aditya',17,10);
DO $$ BEGIN RAISE NOTICE 'Inserted Aditya successfully'; END $$;

COMMIT;

SELECT * FROM students;
