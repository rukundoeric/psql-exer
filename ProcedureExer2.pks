-- Write a stored procedure to update the salary of employee whose code is greater than 10 and
-- has a salary less than 2500

create or replace PROCEDURE update_employee_salary is
  cursor get_employee is select * from EMPLOYEE where EMP_CODE < 10 and EMP_SALARY < 2500;
  EMP_NEW_SALARY NUMBER;
  AF_COUNT NUMBER := 0;
begin
  for EMP_REC in get_employee loop
    -- ADD 10% TO EXISTING SALARY
    EMP_NEW_SALARY := EMP_REC.EMP_SALARY + ((EMP_REC.EMP_SALARY*10)/ 100);
    AF_COUNT := AF_COUNT + 1;
  end loop;
  DBMS_OUTPUT.PUT_LINE('The affected records are : ' || AF_COUNT); 
end update_employee_salary;
/

declare
  cursor get_all_employess is select * from employee;
begin
  --  Update salary of emplayees whose Id is < 10 and whose salary is < 2500 by adding 10% of thier initial salary ;
  update_employee_salary;
  --  List all employees to see changes; 
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('THE LIST OF ALL EMPLOYEES : '); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('CODE' ||  CHR(9)  || 'FNAME' || CHR(9) || 'LNAME' || CHR(9) || 'SALARY' ); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  for EMP_REC in get_all_employess loop
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_CODE ||  CHR(9)  || EMP_REC.EMP_FIRST_NAME || CHR(9) || EMP_REC.EMP_LAST_NAME || CHR(9)  || EMP_REC.EMP_SALARY ); 
  end loop;  
end;