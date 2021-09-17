/********************************
-- Question 3
The HR Team wants to know for each employee what was their age on the date
they joined the company and who they currently report to. Provide them with 
a list of every employees with the following information:

1. their full name (first name and last name combined in a single field)
2. their job title
3. their age at the time they were hired
4. their manager full name (first name and last name combined in a single field)
5. their manager job title

Finally order the results by employee age and employee full name in an ascending order (lowest first).
***********************************/

-- Solution Query
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_full_name,
	e.title AS employee_title,
	EXTRACT(YEAR FROM AGE(e.hire_date, e.birth_date))::INT AS employee_age,
	CONCAT(m.first_name, ' ', m.last_name) AS manager_full_name,
	m.title AS manager_title
FROM
    employees AS e
INNER JOIN employees AS m 
ON m.employee_id = e.reports_to
ORDER BY
    employee_age,
	employee_full_name;

--Result
+───────────────────────+─────────────────────────────+─────────────────+──────────────────────+──────────────────────────+
| "employee_full_name"  | "employee_title"            | "employee_age"  | "manager_full_name"  | "manager_title"          |
+───────────────────────+─────────────────────────────+─────────────────+──────────────────────+──────────────────────────+
| "Anne Dodsworth"      | "Sales Representative"      | 28              | "Steven Buchanan"    | "Sales Manager"          |
| "Janet Leverling"     | "Sales Representative"      | 28              | "Andrew Fuller"      | "Vice President, Sales"  |
| "Michael Suyama"      | "Sales Representative"      | 30              | "Steven Buchanan"    | "Sales Manager"          |
| "Robert King"         | "Sales Representative"      | 33              | "Steven Buchanan"    | "Sales Manager"          |
| "Laura Callahan"      | "Inside Sales Coordinator"  | 36              | "Andrew Fuller"      | "Vice President, Sales"  |
| "Steven Buchanan"     | "Sales Manager"             | 38              | "Andrew Fuller"      | "Vice President, Sales"  |
| "Nancy Davolio"       | "Sales Representative"      | 43              | "Andrew Fuller"      | "Vice President, Sales"  |
| "Margaret Peacock"    | "Sales Representative"      | 55              | "Andrew Fuller"      | "Vice President, Sales"  |
+───────────────────────+─────────────────────────────+─────────────────+──────────────────────+──────────────────────────+