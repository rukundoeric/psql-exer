-- Write a PLSQL procedure that users a cursor to print the full names of all employees in department 1

CREATE OR REPLACE PROCEDURE display_employee(DEP_CODE NUMBER) IS
  CURSOR get_employee IS SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT = DEP_CODE;
BEGIN
  DBMS_OUTPUT.PUT_LINE(''); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('THE LIST OF ALL EMPLOYEES NAMES: '); 
  DBMS_OUTPUT.PUT_LINE('======================================================='); 
  DBMS_OUTPUT.PUT_LINE('CODE' ||  CHR(9)  || 'FNAME' || CHR(9) || 'LNAME'  ); 
  DBMS_OUTPUT.PUT_LINE('=======================================================');
  FOR EMP_REC IN get_employee LOOP
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_CODE ||  CHR(9)  || EMP_REC.EMP_FIRST_NAME || CHR(9) || EMP_REC.EMP_LAST_NAME);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('========================================================='); 
END display_employee;
/

DECLARE
DEP_CODE NUMBER := 3;
BEGIN
  display_employee(DEP_CODE);
END;
