SELECT * FROM MyTable;

--Task3
DECLARE
   result VARCHAR2(10);
BEGIN
   result := CheckEvenOdd();
   DBMS_OUTPUT.PUT_LINE('���������: ' || result);
END;

--Task4
DECLARE
   insert_command VARCHAR2(200);
BEGIN
   insert_command := GenerateInsertCommand(1, 50); -- �������� �������� ��� ��������� �������
   DBMS_OUTPUT.PUT_LINE('������� INSERT: ' || insert_command);
END;

--Task5
BEGIN
   InsertRecord(1, 50); -- �������� �������� ��� �������
END;

BEGIN
   UpdateRecord(1, 50); -- �������� �������� ��� �������
END;

BEGIN
   DeleteRecord(1); -- �������� �������� ��� �������
END;

--Task6
DECLARE
   total_reward NUMBER;
BEGIN
   total_reward := CalculateTotalReward(5000, 10); -- �������� �������� ��� �������
   DBMS_OUTPUT.PUT_LINE('����� �������������� �� ���: ' || total_reward);
END;


