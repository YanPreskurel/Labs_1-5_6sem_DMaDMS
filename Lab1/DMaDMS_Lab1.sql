
DROP TABLE MyTable;

--Task 1
CREATE TABLE MyTable (
        id NUMBER PRIMARY KEY,
        val NUMBER NOT NULL 
);

--Task2
DECLARE
   v_id NUMBER;
   v_val NUMBER;
BEGIN
   FOR i IN 1..10 LOOP
      v_id := i;
      v_val := ROUND(DBMS_RANDOM.VALUE * 100);
      INSERT INTO MyTable VALUES (v_id, v_val);
   END LOOP;
   COMMIT;
END;

--Task3
CREATE OR REPLACE FUNCTION CheckEvenOdd
RETURN VARCHAR2
IS
   v_even_count NUMBER := 0;
   v_odd_count NUMBER := 0;
BEGIN
   FOR rec IN (SELECT val FROM MyTable) LOOP
      IF MOD(rec.val, 2) = 0 THEN
         v_even_count := v_even_count + 1;
      ELSE
         v_odd_count := v_odd_count + 1;
      END IF;
   END LOOP;

   IF v_even_count > v_odd_count THEN
      RETURN 'TRUE';
   ELSIF v_even_count < v_odd_count THEN
      RETURN 'FALSE';
   ELSE
      RETURN 'EQUAL';
   END IF;
END;

--Task4
CREATE OR REPLACE FUNCTION GenerateInsertCommand(p_id NUMBER, p_val NUMBER)
RETURN VARCHAR2
IS
   v_command VARCHAR2(200);
BEGIN
   v_command := 'INSERT INTO MyTable VALUES (' || p_id || ', ' || p_val || ')';
   RETURN v_command;
END;

--Task5

CREATE OR REPLACE PROCEDURE InsertRecord(p_id NUMBER, p_val NUMBER)
IS
BEGIN
   BEGIN
      INSERT INTO MyTable VALUES (p_id, p_val);
      COMMIT;
   EXCEPTION
      WHEN VALUE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('Ошибка вставки. Некорректное значение.');
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Произошла ошибка вставки.');
   END;
END InsertRecord;

CREATE OR REPLACE PROCEDURE UpdateRecord(p_id NUMBER, p_new_val NUMBER)
IS
BEGIN
   UPDATE MyTable SET val = p_new_val WHERE id = p_id;
   IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('Запись с указанным ID не найдена.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Запись успешно обновлена.');
   END IF;
   COMMIT;
END UpdateRecord;

CREATE OR REPLACE PROCEDURE DeleteRecord(p_id NUMBER)
IS
BEGIN
   DELETE FROM MyTable WHERE id = p_id;
   IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('Запись с указанным ID не найдена.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Запись успешно удалена.');
   END IF;
   COMMIT;
END DeleteRecord;

--Task6
CREATE OR REPLACE FUNCTION CalculateTotalReward(p_monthly_salary NUMBER, p_annual_bonus_percentage NUMBER)
RETURN NUMBER
IS
   v_annual_bonus_percentage NUMBER := p_annual_bonus_percentage / 100;
   v_annual_bonus NUMBER;
BEGIN
   BEGIN
      v_annual_bonus := (1 + v_annual_bonus_percentage) * 12 * p_monthly_salary;
      RETURN v_annual_bonus;
   EXCEPTION
      WHEN OTHERS THEN
         DBMS_OUTPUT.PUT_LINE('Произошла ошибка при вычислении общего вознаграждения за год.');
         RETURN NULL;
   END;
END;


