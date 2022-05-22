-- CREATE OR REPLACE PROCEDURE display_employee IS
--   CURSOR get_employee IS SELECT * FROM EMPLOYEE WHERE mod(EMP_CODE, 2) = 0;
-- BEGIN
--   FOR EMP_REC IN get_employee LOOP
--     DBMS_OUTPUT.PUT_LINE(EMP_REC.EMP_FIRST_NAME || ' ' || EMP_REC.EMP_LAST_NAME || ' has salary of ' || EMP_REC.EMP_SALARY);
--   END LOOP;
-- END display_employee;
-- /


execute display_employee;