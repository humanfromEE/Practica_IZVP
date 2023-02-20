CLOSE ALL TABLES

ON KEY LABEL CTRL+Y APPEND BLANK

SELECT a
USE product_table
SET ORDER TO TAG code_p
GOTO TOP

SELECT b
USE provider_table
SET ORDER TO TAG code_pv
GOTO TOP

SELECT c
USE supply_product_table
SET RELATION TO code_p_sp INTO a, code_pv_sp INTO b

BROWSE TITLE 'Таблиця ПОСТАЧАННЯ ПРОДУКТІВ - Додавання даних: CTRL+Y; Вихід: Escape';
	FIELDS;
		code_sp:H = 'Код_постачання',;
		code_p_sp:H = 'Код_продукту',;
		a->name_p = 'Назва_продукту':R,;
		code_pv_sp:H = 'Код_постачальника',;
		b->name_pv:H = 'Назва_постачальника':R,;
		date_sp:H = 'Дата_постчання',;
		count_sp:H = 'Кількість_постчання'

PACK

CLOSE ALL 

RETURN