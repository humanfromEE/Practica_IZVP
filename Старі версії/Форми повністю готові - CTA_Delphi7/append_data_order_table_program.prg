CLOSE ALL TABLES

ON KEY LABEL CTRL+Y APPEND BLANK

SELECT a
USE dish_table
SET ORDER TO TAG code_d
GOTO TOP

SELECT b
USE worker_table
SET ORDER TO TAG code_w
GOTO TOP

SELECT c
USE order_table
SET RELATION TO code_d_o INTO a, code_w_o INTO b

BROWSE TITLE '������� ���������� - ��������� �����: CTRL+Y; �����: Escape';
	FIELDS;
		code_o:H = '���_����������',;
		code_d_o:H = '���_������',;
		a->name_d:H = '�����_������':R,;
		code_w_o:H = '���_����������',;
		b->fullname_w:H = 'ϲ�_����������':R,;
		date_o:H = '����_����������'

PACK

CLOSE ALL 

RETURN
