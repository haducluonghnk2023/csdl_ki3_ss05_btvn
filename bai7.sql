use ss5;
-- 2
SELECT s.name,s.email,c.course_name,e.enrollment_date
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE s.email IS NULL OR e.enrollment_date BETWEEN '2025-01-12' AND '2025-01-18'
ORDER BY s.name ASC;
-- 3
SELECT c.course_name,c.fee,s.name,e.enrollment_date
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON e.student_id = s.student_id
WHERE c.fee > 1000000 OR e.enrollment_date IS NULL
ORDER BY c.fee DESC, c.course_name ASC;
-- 4
select s.name as student_name, s.email, c.course_name, e.enrollment_date
from students s
right join enrollments e on s.student_id = e.student_id
right join courses c on e.course_id = c.course_id
where (s.email is null or c.fee > 1000000)
ORDER BY s.name asc, c.course_name asc;
