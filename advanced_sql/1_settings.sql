/*
INT
    - An integer value: 123
    - A whole number 
    - Range: -2,147,483,648 to 2,147,483,647 for a regular INT (4 bytes)

NUMBERIC(precision, scale)
    - A precise number with fixed deciml points
        - precision -is the total number of digits, and
        - scale -is the number of digits to the right of the decimal point 
            e.g. 123.456 with NUMBERIC(6,3)

TEXT
    - A string of characters: 'Hello, World!'
    - Stores variable-length strings with unlimited length
    - Often used for storing long-form text that doesn't fit within the size constraints of VARCHAR

VARCHAR(n)
    - A variable-length string (where n is the maximum length): 'Hello' with VARCHAR(10)
    - Provides a maximum character limit but can store strings of any length up to that limit

BOOLEAN
    - Represents a logical entity that can be true, false, or NULL
    - Suitable for strong true/false values

DATE
    - A specific date and time without timezone: 2024-02-06
    - Format: YYYY-MM-DD

TIMESTAMP
    - A specific date and time without timezone: 2024-02-06 15:04:05
    - Format: YYYY-MM-DD HH:MI:SS, capable of including seconds depending on the precision

TIMESTAMP WITH TIME ZONE
    - A specific date and time with time zone information: 2024-02-06 15:04:05+00:00
    - Similar to TIMESTAMP, but includes time zone information
    - Adjusts stored time based on the time zone
    - Useful for applications requiring time zone awareness
*/


--          MANIPULATE TABLES

/* 
CREATE TABLE
    - CREATE -create tables from scratch
    - Format: 

    CREATE TABLE table_name (
        column_name datatype,
        column_name2 datatype,
        ...
    );

-> Let's create a job_applied table so we can track all the jobs we've applied to
*/

CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

/*
INSERT INTO
    - INSERT INTO -used to insert data into a table
    - VALUES -specify the data you want to add

    INSERT INTO table_name (column_name, column_name2, ...)
    VALUES (value1, value2, ...);
*/

/*
ALTER TABLE
    - Used to select the table that you will add, delete, or modify columns in
    - Similar to using FROM to specify a table for querying

    ALTER TABLE table_name
    -- ADD column_name datatype;
    -- RENAME COLUMN column_name TO new_name;
    -- ALTER COLUMN column_name TYPE datatype;
    -- DROP COLUMN column_name;                 -> delete a column (DROP TABLE: delete an existing table [DROP TABLE table_name])
*/

/*
ALTER COLUMN
    - Used to modify the properties of an existing column in a table

- Change Data Type: Modify the column's data type, subject to compatibility between the old and new types
    ALTER TABLE table_name
    ALTER COLUMN column_name TYPE new_data_type;

- Set/Change Default Value: Assign a default value to the column, which will be used for new rows if no value is specified
    ALTER TABLE table_name
    ALTER COLUMN column_name SET DEFAULT default_value;

- Drop Default Value: Remove the default value from the column if one exists
    ALTER TABLE table_name
    ALTER COLUMN column_name DROP DEFAULT;
*/

/*
UPDATE
    - UPDATE -used to modify existing data in a table 
    - SET -specifies the column to be updated and the new value for that column
    - WHERE -filters which rows to update based on a condition

    UPDATE table_name
    SET column_name = 'new_value'
    WHERE condition;
*/