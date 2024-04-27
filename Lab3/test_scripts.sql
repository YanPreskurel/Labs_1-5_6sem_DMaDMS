SET SERVEROUTPUT ON;

call cmp_func('C##prod', 'C##dev');

call cmp_indx('C##prod', 'C##dev');

call cmp_prc('C##prod', 'C##dev');

call cmp_tbl('C##prod', 'C##dev');




create user C##dev identified by "qwerty12";
create user C##prod identified by "qwerty12";

GRANT ALL PRIVILEGES TO C##dev;
GRANT ALL PRIVILEGES TO C##prod;
