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

BROWSE TITLE 'Таблиця ПРОДУКТИ - Долучення даних: CTRL+Y; Вихід: Escape';
	FIELDS;
		code_p:H = 'Код_продукту',;
		code_tp_p:H = 'Код_виду_продукту',;
		a->name_tp:H = 'Назва_виду_продукту':R,;
		name_p:H = 'Назва_продукту',;
		price_p:H = 'Ціна_продукту'

PACK

CLOSE ALL 

RETURN