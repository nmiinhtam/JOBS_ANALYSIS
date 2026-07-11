/*
HANDLING DATES

Date Functions in SQL: Used to perform operations on date and time values
- ::DATE : Converts to a date format by removing the time portion
- AT TIME ZONE : Converts a timestamp to a specified time zone
- EXTRACT : Gets specific date parts (e.g., year, month, day)

🗓️ ::DATE
SELECT
    timestamp_column::DATE AS date_column
FROM
    table_name;

-> Notes:
- :: -used for casting, which means converting a value from one data type to another
    You can use it to convert a host of different data types

SELECT '2023-02-19'::DATE, '123'::INTEGER, 'true'::BOOLEAN, '3.14'::REAL;

- ::DATE -convert this value into a date format
    - In this case, it's converting a timestamp into a date format
    - Date Format: YYYY-MM-DD
        Example: 2024-02-06
    - Timestamp Format: YYYY-MM-DD HH:MM:SS
        Example: 2024-02-06 12:30:45
*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date --chỉ còn định dạng YYYY-MM-DD
FROM
    job_postings_fact;

/*
⏰ AT TIME ZONE
- AT TIME ZONE -converts timestamps between different time zones
- It can be used on timestamps with or without time zone information
- Recall:
    - TIMESTAMP
        - A specific date and time without timezone: 2024-02-06 12:30:45
        - Format: YYYY-MM-DD HH:MM:SS
    - TIMESTAMP WITH TIME ZONE
        - A specific date and time with timezone information: 2024-02-06 12:30:45+00:00
        - Similar to TIMESTAMP, but includes timezone information
    - Timestamps with Time Zone:
        - Stored as UTC, displayed per query's or system's time zone
        - AT TIME ZONE converts UTC to the specified time zone correctly
*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time --chuyển time zone từ UTC (+00:00) sang EST (-05:00)
FROM job_postings_fact
LIMIT 5;

/*
🧬 EXTRACT
- gets field (e.g., year, month, day) from date/time value
*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
LIMIT 5;


-- Practice: Tháng có số lượng job được đăng tuyển nhiều nhất?
SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;