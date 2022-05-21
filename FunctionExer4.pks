-- Write a PLSQL Function to find the factorial of a given number

create or replace function factorial(numInput number)
return number
IS
res number := 1;
begin
  for i_num in 1.. numInput loop
    res := res * i_num;
  end loop;
  return res;
end factorial;
/

declare
 inputNum number := 5;
 facto number;
begin
  facto := factorial(inputNum);
  DBMS_OUTPUT.PUT_LINE('FACTORIAL OF ' || inputNum || ' IS ' || facto);
end;