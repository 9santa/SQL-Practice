# LIKE Statement
# % and _ (% - any amount of characters, _ - only one character)

select *
from Parks_and_Recreation.employee_demographics
where first_name like 'Jer%';

select *
from Parks_and_Recreation.employee_demographics
where first_name like 'a%';

select *
from Parks_and_Recreation.employee_demographics
where first_name like 'a__';