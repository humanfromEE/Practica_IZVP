CLOSE ALL TABLES

ON KEY LABEL CTRL+Y APPEND BLANK

SELECT a
USE type_product_table
SET ORDER TO TAG code_tp
GOTO TOP

SELECT b
USE product_table
SET ORDER TO TAG code_p
SET RELATION TO code_tp_p INTO a

BROWSE TITLE '������� �������� - ��������� �����: CTRL+Y; �����: Escape';
	FIELDS;
		code_p:H = '���_��������',;
		code_tp_p:H = '���_����_��������',;
		a->name_tp:H = '�����_����_��������':R,;
		name_p:H = '�����_��������',;
		price_p:H = 'ֳ��_��������'

PACK

CLOSE ALL 

RETURN