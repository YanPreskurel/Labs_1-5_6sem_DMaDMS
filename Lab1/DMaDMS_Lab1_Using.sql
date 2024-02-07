SELECT * FROM MyTable;

--Task3
DECLARE
   result VARCHAR2(10);
BEGIN
   result := CheckEvenOdd();
   DBMS_OUTPUT.PUT_LINE('Результат: ' || result);
END;

--Task4
DECLARE
   insert_command VARCHAR2(200);
BEGIN
   insert_command := GenerateInsertCommand(1, 50); -- Передаем значения для генерации команды
   DBMS_OUTPUT.PUT_LINE('Команда INSERT: ' || insert_command);
END;

--Task5
BEGIN
   InsertRecord(1, 50); -- Передаем значения для вставки
END;

BEGIN
   UpdateRecord(1, 50); -- Передаем значения для вставки
END;

BEGIN
   DeleteRecord(1); -- Передаем значения для вставки
END;

--Task6
DECLARE
   total_reward NUMBER;
BEGIN
   total_reward := CalculateTotalReward(5000, 10); -- Передаем значения для расчета
   DBMS_OUTPUT.PUT_LINE('Общее вознаграждение за год: ' || total_reward);
END;


