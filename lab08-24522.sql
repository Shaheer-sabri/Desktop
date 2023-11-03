-- Q1
set serveroutput on
declare num int :=2;
begin
	for i in 1..6 Loop
		dbms_output.put_line(num);
		num := num + 2;
	End loop;
	commit;
end;

--Q2
begin
	for i in REVERSE 10..20 loop
		dbms_output.put_line(i);
	end loop;
	commit;
end;

Q3
declare x number ;
begin 
    x := &user_input;
	if MOD(x,2)=0 then dbms_output.put_line('Even');
	ELSE dbms_output.put_line('ODD');
	end if
end;

--Q4
declare num Number;
i number := 1;
begin
    num := &user_input
    while i<= 10 loop
    	dbms_output.put_line(num || 'x' || i || '=' || num*i);
		i:= i + 1;
	end loop;
end

--Q5
declare name varchar2(20);
begin
	select first_name into name from hr.employees where employee_id=200;
	dbms_output.put_line('The first name of the employee with ID=100 is '|| name);
end;/

--Q6

create or replace procedure get_email(empid IN number) AS v_email hr.employees.email%type;
begin
	select email INTO v_email from hr.employees where employee_id = empid;
	dbms_output.put_line('EMP ID : '|| empid || ': '||v_email);
	Exception
		when NO_DATA_FOUND then dbms_output.put_line('EMP ID : '|| empid || ': '|| 'Does not exist');
END;
/
Begin
	get_email(101);
end;
/

--Q7
create or replace procedure get_emp_city (empid IN number) as v_city varchar2(30);
begin
	select city into v_city from hr.locations, hr.employees,hr.departments 
    where hr.departments.department_id=hr.employees.employee_id AND empid= hr.employees.employee_id AND  hr.departments.location_id = hr.locations.location_id;
	dbms_output.put_line('EMP ID : '|| empid || ' city : '||v_city);
	Exception
		when NO_DATA_FOUND then dbms_output.put_line('EMP ID : '|| empid || ': '|| 'Does not exist');
END;
/
begin
	get_emp_city(100);
end;/

--8
SELECT * from hr.employees;
SELECT * from hr.DEPARTMENTS;

CREATE OR REPLACE PROCEDURE printEmployees AS
    FULLNAME employees.FIRST_NAME%TYPE;
    JOBNAME JOBS.JOB_TITLE%TYPE;
    CURSOR C1 IS
        SELECT FIRST_NAME||' '||LAST_NAME AS FULL_NAME, JOBS.JOB_TITLE 
        FROM employees
        INNER JOIN JOBS ON JOBS.JOB_ID = EMPLOYEES.JOB_ID
        INNER JOIN DEPARTMENTS ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
        WHERE DEPARTMENTS.DEPARTMENT_NAME = 'IT';

    BEGIN
        OPEN C1;
        LOOP
        FETCH C1 into FULLNAME, JOBNAME;
        EXIT WHEN C1%NOTFOUND;
        dbms_output.put_line(FULLNAME || ' works as ' || JOBNAME);
        END LOOP;
        CLOSE C1;
    END;
BEGIN
printEmployees;
END;

--9
CREATE OR REPLACE PROCEDURE get_job_history AS
    empName hr.employees.FIRST_NAME%TYPE;
    jobid hr.employees.JOB_ID%TYPE;
    startdate JOB_HISTORY.START_DATE%TYPE;

    CURSOR C1 IS
        SELECT FIRST_NAME || ' ' || LAST_NAME as fullname, hr.EMPLOYEES.JOB_ID, JOB_HISTORY.START_DATE 
        FROM hr.employees
        INNER JOIN JOB_HISTORY ON JOB_HISTORY.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID
        WHERE hr.EMPLOYEES.DEPARTMENT_ID = 50;
    BEGIN
        FOR emprecord in C1
        LOOP
            empName := emprecord.fullname;
            jobid := emprecord.JOB_ID;
            startdate := emprecord.START_DATE;
            dbms_output.put_line(empName || ' JOB ID: ' || jobid || ' START DATE: ' || startdate);
        END LOOP;
    END;

BEGIN
get_job_history;
END;


--10
SELECT EMPLOYEE_ID,SALARY FROM hr.EMPLOYEES WHERE EMPLOYEE_ID = 120 OR EMPLOYEE_ID = 122; 


DECLARE
    temp1 hr.EMPLOYEES.SALARY%TYPE;
    temp2 hr.EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT SALARY INTO TEMP1 FROM hr.EMPLOYEES WHERE EMPLOYEE_ID = 120;
    SELECT SALARY INTO TEMP2 FROM hr.EMPLOYEES WHERE EMPLOYEE_ID = 122;
    UPDATE hr.EMPLOYEES SET SALARY = TEMP1 WHERE EMPLOYEE_ID = 122;
    UPDATE hr.EMPLOYEES SET SALARY = TEMP2 WHERE EMPLOYEE_ID = 120;
END;