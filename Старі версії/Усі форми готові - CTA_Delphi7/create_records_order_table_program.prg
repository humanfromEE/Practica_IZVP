CLOSE TABLES ALL

* Отримав кількість працівників
countWorker = 0
SELECT a
USE worker_table
COUNT FOR a->code_w != "0000" TO countWorker

* Отримав кількість страв
countDish = 0
SELECT b
USE dish_table
COUNT FOR b->code_d != "0000" TO countDish

* Очистив таблицю перед новим перезаписом
SELECT c
USE order_table
DELETE ALL 
PACK 

CLOSE TABLES ALL

IF ( (countWorker != 0).and.(countDish != 0) ) THEN 
	countOrder = 100
	minCountOrderDay = 1
	maxCountOrderDay = 5
	minCountOrdersForWorker = 1
	maxCountOrdersForWorker = 5
	
	countOrderInDay = getRandomPositiveIntNumberInRange(minCountOrderDay, maxCountOrderDay)
	counterOrderInDay = 1
	dateOfOrders = DATE(2023, 1, 23)
	
	FOR i = 1 TO countOrder STEP 1
		numberWorker = getRandomPositiveIntNumberInRange(1, countWorker)
		countOrdersForWorker = getRandomPositiveIntNumberInRange(minCountOrdersForWorker, maxCountOrdersForWorker )
		
		IF (counterOrderInDay = countOrderInDay) THEN
			dateOfOrders = dateOfOrders + 1
			countOrderInDay = getRandomPositiveIntNumberInRange(minCountOrderDay, maxCountOrderDay)
			counterOrderInDay = 1
		ENDIF
		
		FOR j = 1 TO countOrdersForWorker STEP 1
			INSERT INTO order_table (code_o, code_d_o, code_w_o, date_o);
				VALUES;
					(getCodeOrder(i),;
					getCodeWorkerOrDish(getRandomPositiveIntNumberInRange(1, countDish), "d"),;
					getCodeWorkerOrDish(numberWorker, "w"),;
					dateOfOrders)
		ENDFOR 
		
		counterOrderInDay = counterOrderInDay + 1
	ENDFOR
ENDIF

CLOSE TABLES ALL 

* =================================================================================
* =================================================================================
* =================================================================================

* Повернення коду замовлення у вигляді строки
FUNCTION getCodeOrder
PARAMETERS codeOrder
	lengthCodeOrder = lengthIntegerNumber(codeOrder)
	DO CASE
   		CASE lengthCodeOrder = 1
      		RETURN ( "0000" + STR(codeOrder, lengthCodeOrder, 0) + "o" )
   		CASE lengthCodeOrder = 2
      		RETURN ( "000" + STR(codeOrder, lengthCodeOrder, 0) + "o" )
      	CASE lengthCodeOrder = 3
      		RETURN ( "00" + STR(codeOrder, lengthCodeOrder, 0) + "o" )
      	CASE lengthCodeOrder = 4
      		RETURN ( "0" + STR(codeOrder, lengthCodeOrder, 0) + "o" )
      	CASE lengthCodeOrder = 5
      		RETURN ( STR(codeOrder, lengthCodeOrder, 0) + "o" )
      	OTHERWISE
      		RETURN ""
	ENDCASE
ENDFUNC

* Повернення коду працівника чи страви у вигляді строки
FUNCTION getCodeWorkerOrDish
PARAMETERS codeWorkerOrDish, tableLastSymol
	lengthCodeWorkerOrDish = lengthIntegerNumber(codeWorkerOrDish)
	DO CASE
   		CASE lengthCodeWorkerOrDish = 1
      		RETURN ( "00" + STR(codeWorkerOrDish, lengthCodeWorkerOrDish, 0) + tableLastSymol ) 
   		CASE lengthCodeWorkerOrDish = 2
   			RETURN ( "0" + STR(codeWorkerOrDish, lengthCodeWorkerOrDish, 0) + tableLastSymol )
      	CASE lengthCodeWorkerOrDish = 3
      		RETURN ( STR(codeWorkerOrDish, lengthCodeWorkerOrDish, 0) + tableLastSymol )
      	OTHERWISE
      		RETURN ""
	ENDCASE
ENDFUNC

* Поверенння випадкового цілого позитивного числа в діапазоні [min, max]
FUNCTION getRandomPositiveIntNumberInRange
PARAMETERS minPositiveIntNumber, maxPositiveIntNumber
	RETURN INT( (maxPositiveIntNumber - minPositiveIntNumber + 1) * RAND() + minPositiveIntNumber )
ENDFUNC

* Функція повернення довжини числа: 100 - 3; -100 - 4; 0 - 1 і т. д.
FUNCTION lengthIntegerNumber 
PARAMETERS intNumber
	positiveIntNumber = ABS(intNumber)
	powerTen = 1
	DO WHILE (.T.)
		IF (positiveIntNumber < 10 ^ powerTen) THEN
			IF (intNumber < 0) THEN
				powerTen = powerTen + 1
			ENDIF
			RETURN powerTen
		ELSE
			powerTen = powerTen + 1
		ENDIF
	ENDDO
ENDFUNC