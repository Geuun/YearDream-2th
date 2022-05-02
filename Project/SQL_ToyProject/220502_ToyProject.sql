/*
a. Computer Science 학부 과목을 한 과목이라도 수강하고 있는 모든 학생의 ID와 이름을 출력하세요.
(단, 중복을 제거하여 출력해주세요)
*/

SELECT a.ID, a.name
FROM student as a
	INNER JOIN (SELECT ID, a.course_id, dept_name
				FROM course as a
					INNER JOIN takes as b
					ON a.course_id = b.course_id
				WHERE dept_name = 'Comp. Sci.'
				ORDER BY course_id) as b
	ON a.ID = b.ID;


#----------------------------------------------------------------------------------------


/*
b. "CS-001"를 id로 가지고, "Weekly Seminar"가 title인 1학점짜리 과목을 새로 신설해보세요.
*/

SELECT *
FROM course;

insert into course values('001', 'Weekly Seminar', 'Comp. Sci.', 1);

SELECT *
FROM course
ORDER BY title;


#----------------------------------------------------------------------------------------


/*
c. Computer Science 학부생 전원을 sec_id가 1인 2007년도 가을학기 세션에 등록시켜주세요.
(HINT. University ERD도 참고해보세요.)
*/

SELECT *
FROM section;


#----------------------------------------------------------------------------------------


/*
d. 각 학부별로 가장 많은 연봉을 가진 instructor 중에서 가장 연봉이 낮은 instructor의 name과 dept_name을 찾아주세요.
*/


SELECT a.name, a.dept_name, a.salary
FROM instructor as a
	INNER JOIN
(SELECT dept_name, max(salary) as max_salary
FROM instructor
GROUP BY dept_name
ORDER BY max_salary) as b
	ON a.salary = b.max_salary
ORDER BY a.salary
LIMIT 1;


#----------------------------------------------------------------------------------------


/*
e. 2018년도 가을학기에 수업을 진행하는 모든 instructor를 찾아주세요.
*/


SELECT *
FROM teaches;

SELECT *
FROM instructor;


SELECT a.name
FROM instructor as a
	INNER JOIN 
(SELECT ID
FROM teaches
WHERE semester = 'Fall') as b
	ON a.ID = b.ID;
    

#----------------------------------------------------------------------------------------


/*
f. 2017년도 기준 물리학부에 재학중인 모든 학생을 찾아주세요.
*/


SELECT *
FROM student;

SELECT *
FROM takes;


SELECT a.ID, a.name, b.year
FROM student as a
	INNER JOIN
(SELECT ID, year
FROM takes
WHERE year = 2007) as b
	ON a.ID = b. ID;


#----------------------------------------------------------------------------------------


/*
g. 컴퓨터 공학 강사 Lee가 담당하고 있는 학생들 중 다른 학부 학생을 모두 찾아주세요.
*/

SELECT *
FROM instructor;

SELECT name, dept_name
FROM instructor
WHERE name = 'Lee';


#----------------------------------------------------------------------------------------


/*
h. 이 때까지 한번도 과목을 수강한 적이 없는 모든 학생의 ID와 name을 출력해주세요.
*/


SELECT *
FROM student;

SELECT ID, name, tot_cred
FROM student
WHERE tot_cred = '0'

