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

BROWSE TITLE 'Таблиця СТРАВИ - Долучення даних: CTRL+Y; Вихід: Escape';
	FIELDS;
		code_d:H = 'Код_страви',;
		code_td_d:H = 'Код_виду_страви',;
		a->name_td:H = 'Назва_виду_страви':R,;
		code_p_d:H = 'Код_продукту',;
		b->name_p:H = 'Назва_продукту':R,;
		b->price_p:H = 'Ціна_продукту':R,;
		name_d:H = 'Назва_страви',;
		price_d:H = 'Ціна_страви',;
		weight_d:H = 'Вага_страви',;
		composition_d:H = 'Склад_страви'

PACK

CLOSE ALL 

RETURN
