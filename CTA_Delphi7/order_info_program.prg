CLOSE TABLES ALL

* Процедура видалення файлу для того, щоб не було вікна-попередження щодо перезапису файлу (якщо файл існує чи не був видалено фізично)
IF (FILE('order_info_program_free_table.dbf')) THEN
	ERASE order_info_program_free_table.dbf
ENDIF

SELECT code_o, name_d, price_d, code_w, fullname_w, date_o  FROM order_table;
INNER JOIN dish_table ON code_d_o = code_d;
INNER JOIN worker_table ON code_w_o = code_w;
ORDER BY code_o;
INTO TABLE order_info_program_free_table

CLOSE TABLES ALL

countOrder = getCountOrder()

DO FORM order_info_program_form.scx
_SCREEN.ActiveForm.Width = 965
_SCREEN.ActiveForm.Height = 250
_SCREEN.ActiveForm.AutoCenter = .T.
_SCREEN.ActiveForm.ControlBox = .F.
CLEAR

lengthLineInForm = 160
lengthLineInFormForDish = 240
counterPage = 1
xPointer = 0
yPointer = 0
yFieldNameDish = 10
yFieldPriceDish = 45 + yFieldNameDish 
yFieldCodeWorker = 30 + yFieldPriceDish
yFieldFullnameWorker = 30 + yFieldCodeWorker
yFieldDateOrder = 70 + yFieldCodeWorker 

countLinesForDish = 4
counterLinesForDish = 0
counterPages = 1

USE order_info_program_free_table
GOTO TOP
codeOrderNow = ""
IF (NOT EOF()) THEN
	CLOSE TABLES ALL 
	FOR counterOrderForOutput = 1 TO countOrder	STEP 1
		codeOrderNow = getCodeOrder(counterOrderForOutput)
		setCaptionForm(codeOrderNow, counterPages, "")
		
		createHeaderForReport(codeOrderNow)
		
		countDishInOrderNow = 0
		
		USE order_info_program_free_table
		GOTO TOP
		DO WHILE (.T.)
			IF (codeOrderNow == code_o) THEN
				countDishInOrderNow = countDishInOrderNow + 1 
				
				@ xPointer, yFieldNameDish SAY name_d
				@ xPointer, yFieldPriceDish SAY STR (price_d, INT(lengthIntegerNumber(price_d)) + 3, 2)
				@ xPointer, yFieldCodeWorker SAY code_w
				@ xPointer, yFieldFullnameWorker SAY fullname_w
				@ xPointer, yFieldDateOrder SAY TRANSFORM(date_o)				
				xPointer = xPointer + 1 
				@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForDish)
				xPointer = xPointer + 1 
				counterLinesForDish = counterLinesForDish + 1 
				IF (counterLinesForDish = countLinesForDish OR EOF()) THEN
					startWaitWindow(codeOrderNow, counterPages, "") 
					CLEAR
					
					counterPages = counterPages + 1 
					counterLinesForDish = 0 
					
					setCaptionForm(codeOrderNow, counterPages, "")
					createHeaderForReport(codeOrderNow)
				ENDIF				
			ENDIF
			
			SKIP	
			
			* Вивід результатуючих даних
			IF (EOF()) THEN 	
				CLOSE TABLES ALL 
				IF (countDishInOrderNow != countLinesForDish) THEN 
					startWaitWindow(codeOrderNow, counterPages, "")
					counterPages = counterPages + 1 
				ENDIF
				
				CLEAR	
				createHeaderForResultReportOrder(codeOrderNow)
				setCaptionForm(codeOrderNow, counterPages, "РЕЗУЛЬТАТИ ЗАМОВЛЕННЯ")
				
				
				startWaitWindow(codeOrderNow, counterPages, "РЕЗУЛЬТАТ ЗАМОВЛЕННЯ")
			 	CLEAR 
				
				counterLinesForDish = 0
				counterPages = 1
				countDishInOrderNow = 0
				
				EXIT 
			ENDIF
		ENDDO
		CLOSE TABLES ALL
	ENDFOR
ELSE
	createHeaderForReport(codeOrderNow)
	@ xPointer, yPointer SAY createStringSpace(100) + "НЕМАЄ ЗАМОВЛЕНЬ - ЗАПОВНІТЬ ТАБЛИЦЮ"
	xPointer = xPointer + 1 
	@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForDish)
	
	startWaitWindow("", "ВИХІД") 
	setCaptionForm("", "ВИХІД")
ENDIF

_SCREEN.ActiveForm.Release()
CLOSE TABLES ALL 

*!*	* ====================================================================================================
*!*	* ====================================================================================================
*!*	* ====================================================================================================

* Процедура створення шапки для звіту
PROCEDURE createHeaderForReport
PARAMETERS codeOrderForReportInString
	xCordinate = 0
	yCordinate = 0

	* Шапка звіту
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "ІНФОРМАЦІЯ ПРО ЗАМОВЛЕННЯ № " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "СТАНОМ НА " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameDish SAY "Назва страви" FONT "" STYLE "B"
	@ xCordinate, yFieldPriceDish SAY "Ціна страви" FONT "" STYLE "B"
	@ xCordinate, yFieldCodeWorker SAY "Код працівника" FONT "" STYLE "B"
	@ xCordinate, yFieldFullnameWorker SAY "ПІП працівника" FONT "" STYLE "B"
	@ xCordinate, yFieldDateOrder SAY "Дата замовлення" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInFormForDish)
	xCordinate = xCordinate + 1
	
	xPointer = xCordinate
ENDPROC

* Процедура створення шапки для звіту в результатах звіту
PROCEDURE createHeaderForResultReportOrder
PARAMETERS codeOrderForReportInString
	xCordinate = 0
	yCordinate = 0

	* Шапка звіту
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "РЕЗУЛЬТАТИ ЗАМОВЛЕННЯ № " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "СТАНОМ НА " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameDish SAY createStringSpace(80) + "РЕЗУЛЬТАТИ ЗВІТУ" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInFormForDish)
	xCordinate = xCordinate + 1	
	
	yResultDataReport = 25
	yResultDataValueReport = 160
	
	@ xCordinate, yResultDataReport SAY "Сума замовлення: "
	@ xCordinate, yResultDataValueReport SAY STR(getSummInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getSummInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Середня ціна страви у замовлені: "
	@ xCordinate, yResultDataValueReport SAY STR(getAvaragePriceOfDishInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getAvaragePriceOfDishInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Кількість страв у замовлені: "
	@ xCordinate, yResultDataValueReport SAY STR(getCountOfDishInOrder(codeOrderForReportInString), lengthIntegerNumber(getCountOfDishInOrder(codeOrderForReportInString)), 0)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Мінімальна ціна у замовлені: "
	@ xCordinate, yResultDataValueReport SAY STR(getMinPriceOfDishInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMinPriceOfDishInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Максимальна ціна у замовлені: "
	@ xCordinate, yResultDataValueReport SAY STR(getMaxPriceOfDishInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMaxPriceOfDishInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	
	@ xCordinate, yPointer SAY createStringLine("-", lengthLineInFormForDish)
	xCordinate = xCordinate + 1	
	
	xPointer = xCordinate
ENDPROC

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

* Процедура зміни заголовку для форми
PROCEDURE setCaptionForm
PARAMETERS numberOrder, numberPage, messageInEnd
	_SCREEN.ActiveForm.Caption = "Замовлення № " + numberOrder + " | " + "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd
ENDPROC

* Процедура запуску вікна очікування
PROCEDURE startWaitWindow
PARAMETERS numberOrder, numberPage, messageInEnd
	WAIT WINDOW "Замовлення № " + numberOrder + " | " + "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd 
ENDPROC

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

* Повернути кількість ЗАМОВЛЕНЬ
FUNCTION getCountOrder
	USE order_table
	GOTO TOP
	counterOrder = 0
	IF (NOT EOF()) THEN
		counterOrder = 1
		codeOrder = getCodeOrder(counterOrder)
		DO WHILE (NOT EOF())
			IF (codeOrder != code_o) THEN
				counterOrder = counterOrder + 1
				codeOrder = getCodeOrder(counterOrder)
			ENDIF
			SKIP
		ENDDO
	ENDIF
	CLOSE TABLES ALL 
	RETURN counterOrder
ENDFUNC

* Створення лінії
FUNCTION createStringLine
PARAMETERS symbolLine, lengthLine
	stringLine = ""
	FOR i = 1 TO lengthLine STEP 1
		stringLine = stringLine + symbolLine
	ENDFOR
	RETURN stringLine
ENDFUNC

* Створення строки з пробілами
FUNCTION createStringSpace
PARAMETERS lengthLine
	stringLine = ""
	FOR i = 1 TO lengthLine STEP 1
		stringLine = stringLine + " "
	ENDFOR
	RETURN stringLine
ENDFUNC

* Повернення суми замовлення
FUNCTION getSummInOrder
PARAMETERS codeOrderInString
	CLOSE TABLES ALL 
	USE order_info_program_free_table
	GOTO TOP
	summOrderOfCodeOrder = 0
	DO WHILE (NOT EOF())
		IF (codeOrderInString == code_o) THEN
			summOrderOfCodeOrder = summOrderOfCodeOrder + price_d
		ENDIF
		SKIP
	ENDDO
	CLOSE TABLES ALL
	RETURN summOrderOfCodeOrder
ENDFUNC

* Повернення кількості страв у замовлені
FUNCTION getCountOfDishInOrder
PARAMETERS codeOrderInString
	CLOSE TABLES ALL 
	USE order_info_program_free_table
	GOTO TOP
	countDishInOrderOfCodeOrder = 0
	DO WHILE (NOT EOF())
		IF (codeOrderInString == code_o) THEN
			countDishInOrderOfCodeOrder = countDishInOrderOfCodeOrder + 1 
		ENDIF
		SKIP
	ENDDO
	CLOSE TABLES ALL
	RETURN countDishInOrderOfCodeOrder
ENDFUNC

* Повернення сереньої ціни страви у замовленні
FUNCTION getAvaragePriceOfDishInOrder
PARAMETERS codeOrderInString
	CLOSE TABLES ALL 
	RETURN ROUND(getSummInOrder(codeOrderInString) / getCountOfDishInOrder(codeOrderInString), 2)
ENDFUNC

* Повернення мімальної ціни страви у замовленні
FUNCTION getMinPriceOfDishInOrder
PARAMETERS codeOrderInString
	CLOSE TABLES ALL 
	USE order_info_program_free_table
	GOTO TOP
	minPriceOfDish = 0
	
	* Перша цикл для знаходження першої ціни замовлення
	DO WHILE (NOT EOF()) 
		IF (codeOrderInString == code_o) THEN
			minPriceOfDish = minPriceOfDish + price_d
			DO WHILE (NOT EOF())
				IF ( (codeOrderInString == code_o) AND (minPriceOfDish > price_d) )
					minPriceOfDish = price_d
				ENDIF
				SKIP
			ENDDO
			
			* Вихід з першого циклу
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN minPriceOfDish 
ENDFUNC

* Повернення максимальної ціни страви у замовленні
FUNCTION getMaxPriceOfDishInOrder
PARAMETERS codeOrderInString
	CLOSE TABLES ALL 
	USE order_info_program_free_table
	GOTO TOP
	maxPriceOfDish = 0
	
	* Перша цикл для знаходження першої ціни замовлення
	DO WHILE (NOT EOF()) 
		IF (codeOrderInString == code_o) THEN
			maxPriceOfDish = maxPriceOfDish + price_d
			DO WHILE (NOT EOF())
				IF ( (codeOrderInString == code_o) AND (maxPriceOfDish < price_d) )
					maxPriceOfDish = price_d
				ENDIF
				SKIP
			ENDDO
			
			* Вихід з першого циклу
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN maxPriceOfDish
ENDFUNC