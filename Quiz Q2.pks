-- create or replace function get_average
-- RETURN NUMBER
-- IS
-- res number;
-- begin
--  SELECT  AVG(EMP_SALARY) INTO res FROM EMPLOYEE;
--  return res;
-- end get_average;
-- /
-- exec get_average

create or replace procedure update_sal IS
  average NUMBER := get_average;
  CURSOR get_employee IS SELECT * FROM EMPLOYEE WHERE EMP_SALARY < average; 
  emp_new_sal number;
BEGIN 
  FOR EMP_REC IN get_employee LOOP
    emp_new_sal := EMP_REC.EMP_SALARY + ((EMP_REC.EMP_SALARY*5)/ 100); 
    UPDATE EMPLOYEE SET EMP_SALARY = emp_new_sal WHERE EMP_CODE = EMP_REC.EMP_CODE;
      DBMS_OUTPUT.PUT_LINE(''); 
      DBMS_OUTPUT.PUT_LINE('======================================================='); 
      DBMS_OUTPUT.PUT_LINE('THE UPDATED RECORDS  '); 
      DBMS_OUTPUT.PUT_LINE('======================================================='); 
      DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_FIRST_NAME || EMP_REC.EMP_LAST_NAME ); 
      DBMS_OUTPUT.PUT_LINE('=======================================================');
      DBMS_OUTPUT.PUT_LINE(' OLD SALARY : ' || EMP_REC.EMP_SALARY);
      DBMS_OUTPUT.PUT_LINE(' AVERAGE : ' || average);
      DBMS_OUTPUT.PUT_LINE('NEW SALARY : ' || emp_new_sal);
      DBMS_OUTPUT.PUT_LINE('=======================================================');
      DBMS_OUTPUT.PUT_LINE('');
  END LOOP;
 
  EXCEPTION 
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('NO RECORD MATCHING THE CONDITION');
end update_sal;

-- EXEC update_sal;


-- declare
-- average number;
-- begin
--  average := get_average;
--  DBMS_OUTPUT.PUT_LINE(average);
-- end;







