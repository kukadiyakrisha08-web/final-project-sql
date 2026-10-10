::: {align="center"}
# 🎓 University Course Management System

### ✨ A MySQL Database Project ✨

**A simple, structured, and reliable way to manage university data.**

![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Queries-orange?style=for-the-badge&logo=databricks&logoColor=white)
![Academic
Project](https://img.shields.io/badge/Academic-Project-8A2BE2?style=for-the-badge)

------------------------------------------------------------------------

*Students • Courses • Instructors • Departments • Enrollments*
:::

## 🌟 About the Project

The **University Course Management System** is a relational database
project developed using **MySQL**. It organizes key university
information, including student records, available courses, instructors,
departments, and course enrollments.

This project demonstrates practical SQL skills, from creating tables and
managing records to writing queries that combine and analyze data.

## 🎯 Project Goals

-   Build a relational database with connected tables.
-   Store and organize university information clearly.
-   Apply CRUD operations: **Create, Read, Update, and Delete**.
-   Retrieve useful information using SQL queries.
-   Practice joins, aggregate functions, subqueries, date functions, and
    window functions.
-   Document the project so it is easy to set up and understand.

## 🛠️ Tools & Technologies

  Tool              Purpose
  ----------------- ---------------------------------------
  MySQL             Relational database
  SQL               Creating, updating, and querying data
  MySQL Workbench   Running SQL scripts
  GitHub            Hosting and sharing the project

## 🗃️ Database Tables

  -----------------------------------------------------------------------
  Table                               What it stores
  ----------------------------------- -----------------------------------
  `Students`                          Student names, email addresses,
                                      birth dates, and enrollment dates

  `Departments`                       University department names

  `Courses`                           Course names, department IDs, and
                                      credits

  `Instructors`                       Instructor details, department IDs,
                                      and salary

  `Enrollments`                       The relationship between students
                                      and courses
  -----------------------------------------------------------------------

### 🔗 Relationships at a Glance

``` text
Departments ─────< Courses ─────< Enrollments >───── Students
      │
      └──────────< Instructors
```

-   One department can offer multiple courses.
-   One department can have multiple instructors.
-   A student can enroll in multiple courses.
-   A course can have multiple enrolled students.
-   The `Enrollments` table connects students and courses.

## 💡 SQL Concepts Covered

-   **Database design:** `CREATE DATABASE`, `CREATE TABLE`
-   **CRUD:** `INSERT`, `SELECT`, `UPDATE`, `DELETE`
-   **Constraints:** `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`
-   **Filtering:** `WHERE`, `IN`, `ORDER BY`, `LIMIT`
-   **Joins:** `INNER JOIN`, `LEFT JOIN`
-   **Aggregate functions:** `COUNT()`, `AVG()`, `MAX()`
-   **Grouping:** `GROUP BY`, `HAVING`
-   **Subqueries:** nested queries
-   **String functions:** `CONCAT()`
-   **Date functions:** `YEAR()`, `CURDATE()`, `DATE_SUB()`
-   **Window functions:** `COUNT() OVER()`
-   **Conditional expressions:** `CASE`

## 🚀 How to Run the Project

### Prerequisites

-   MySQL Server
-   MySQL Workbench (recommended)

### Setup Instructions

1.  Download or clone this repository.
2.  Open MySQL Workbench and connect to your MySQL Server.
3.  Open `university_course_management.sql`.
4.  Execute the script section by section in the correct order:
    -   Create and select the database
    -   Create the tables
    -   Insert sample data
    -   Run CRUD examples
    -   Execute the assignment queries
5.  Review the result grids in MySQL Workbench.

> **Important:** Avoid running the same `CREATE TABLE` and sample
> `INSERT` statements repeatedly on an already-populated database unless
> your script is designed for repeated execution.

## 📋 Assignment Queries Included

This project demonstrates 16 tasks:

1.  CRUD operations on the database tables.
2.  Students enrolled after 2022.
3.  Mathematics department courses, limited to five results.
4.  Courses with more than five enrolled students.
5.  Students enrolled in both *Introduction to SQL* and *Data
    Structures*.
6.  Students enrolled in either of those courses.
7.  Average credits across all courses.
8.  Maximum instructor salary in Computer Science.
9.  Distinct enrolled students by department.
10. `INNER JOIN` to show students and their courses.
11. `LEFT JOIN` to show all students, including those without
    enrollments.
12. Subquery for students enrolled in courses with more than ten
    students.
13. Extracting the year from an enrollment date.
14. Combining instructor first and last names.
15. Calculating a running total of enrollments.
16. Assigning a `Senior` or `Junior` label based on enrollment date.

## 📊 Sample Data

The sample database includes:

-   **Departments:** Computer Science and Mathematics
-   **Courses:** Introduction to SQL, Data Structures, Database
    Management, Calculus, and Computer Networks
-   **Students:** Sample student records with contact and enrollment
    details
-   **Instructors:** Sample instructor records, including department and
    salary
-   **Enrollments:** Records connecting students to courses

Additional sample records are included so aggregate queries and
subqueries can be tested meaningfully.

## 📝 Assumptions

-   The `Salary` column is included in `Instructors` because assignment
    Query 8 requires a maximum salary.
-   Department counts represent distinct students enrolled in courses
    offered by each department. A student studying courses across
    multiple departments may be counted in each relevant department.
-   `Senior` means the enrollment date is more than four years before
    the current date; otherwise, the label is `Junior`.
-   The running total is ordered by enrollment date and enrollment ID.
-   Query results depend on the sample data in the database and the date
    on which date-based queries are run.

## 📁 Repository Structure

``` text
University-Course-Management-System/
├── README.md
└── university_course_management.sql
```

## 👩‍💻 Author

::: {align="center"}
### **Krisha Kukadiya** 💜

*University Course Management System --- MySQL Project*
:::

## 💌 Thank You!

::: {align="center"}
**Thank you for taking the time to explore my project!** 🙏

I created this project to practice SQL, understand relational database
design, and improve my skills in writing queries.

I hope this project is clear and useful. Feedback and suggestions for
improvement are always welcome.

### ⭐ Thanks for visiting! ⭐
:::

------------------------------------------------------------------------

::: {align="center"}
*Made with 💙, SQL, and a willingness to learn.*
:::
