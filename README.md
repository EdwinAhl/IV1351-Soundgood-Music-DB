# IV1351 Soundgood Music DB
Database for the Soundgood Music School.

Contains following functions with business rules in consideration:
- Register students and teachers with neccesary contact information
- Lease instruments
- Book lectures
  - Individual
  - Group
  - Ensamble

## To import the database do the following:

CREATE DATABASE sgm;
\c sgm;
\i enums.sql;
\i sgm.sql;
\i data.sql;

## To delete the database do the following:

DROP DATABASE sgm;
