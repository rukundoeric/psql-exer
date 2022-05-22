-- Write a PLSQL procedure to print the names of all employees in the CS department.
-- After print, the procedure should update the department of all employees in CS department to IT department and 
-- print the names of all employees in the IT department after update. 

create or replace procedure dispayEmployees(depart_no number) IS
  CURSOR get_employee IS SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT = depart_no;
begin
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('THE LIST OF EMPLOYEES: '); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('CODE' ||  CHR(9)  || 'FNAME' || CHR(9) || 'LNAME'  ); 
  DBMS_OUTPUT.PUT_LINE('=======================================================');
  FOR EMP_REC IN get_employee LOOP
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_CODE ||  CHR(9)  || EMP_REC.EMP_FIRST_NAME || CHR(9) || EMP_REC.EMP_LAST_NAME);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('========================================================='); 
end dispayEmployees;
/

-- exec dispayEmployees(1);

create or replace procedure executeTask(depart_no_1 number) IS
  CURSOR get_employee IS SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT = depart_no_1;
  depart_no number;
begin
dispayEmployees(depart_no_1);
select depart_no into depart_no from department where depart_name = 'IT';
  FOR EMP_REC IN get_employee LOOP
    UPDATE EMPLOYEE SET EMP_DEPARTMENT = depart_no WHERE EMP_CODE = EMP_REC.EMP_CODE;
  END LOOP;
dispayEmployees(depart_no);
end executeTask;
/

-- exec executeTask(2);


declare
  DEPART_NO number;
begin
  select DEPART_NO into DEPART_NO from DEPARTMENT where DEPART_NAME = 'Finance';
  executeTask(DEPART_NO);