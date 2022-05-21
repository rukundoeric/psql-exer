-- Write a PLSQL Function to find the highest number in two numbers

create or replace function highestNumber(num1 number, num2 number)
return number
IS
res number;
begin
  if num1 > num2 then
    res := num1;
  elsif num2 > num1 then
    res := num2;
  else
    DBMS_OUTPUT.PUT_LINE('NUMBERS ARE EQUAL!'); 
    res := num2;  
  end if;
  return res;
end;
/

declare
  num1 number := 30;
  num2 number := 30;
  res number;
begin
  res := highestNumber(num1, num2);
  DBMS_OUTPUT.PUT_LINE('THE HIGHEST NUMBER IS !  ' || res); 
end;