CLOSE ALL TABLES

ON KEY LABEL CTRL+Y APPEND BLANK

SELECT a
USE type_dish_table
SET ORDER TO TAG code_td
GOTO TOP

SELECT b
USE product_table
SET ORDER TO TAG code_p
GOTO TOP

SELECT c
USE dish_table
SET ORDER TO TAG code_d
SET RELATION TO code_td_d INTO a, code_p_d INTO b

BROWSE TITLE '������� ������ - ��������� �����: CTRL+Y; �����: Escape';
	FIELDS;
		code_d:H = '���_������',;
		code_td_d:H = '���_����_������',;
		a->name_td:H = '�����_����_������':R,;
		code_p_d:H = '���_��������',;
		b->name_p:H = '�����_��������':R,;
		b->price_p:H = 'ֳ��_��������':R,;
		name_d:H = '�����_������',;
		price_d:H = 'ֳ��_������',;
		weight_d:H = '����_������',;
		composition_d:H = '�����_������'

PACK

CLOSE ALL 

RETURN
