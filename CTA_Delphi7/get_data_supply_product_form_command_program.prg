PARAMETERS codeSupplyProductNow 

CLOSE TABLES ALL

* Процедура видалення файлу для того, щоб не було вікна-попередження щодо перезапису файлу (якщо файл існує чи не був видалено фізично)
IF (FILE('supply_product_info_program_free_table.dbf')) THEN
	ERASE supply_product_info_program_free_table.dbf
ENDIF

SELECT code_sp, name_p, price_p, code_pv, name_pv, date_sp, count_sp  FROM supply_product_table;
INNER JOIN product_table ON code_p_sp = code_p;
INNER JOIN provider_table ON code_pv_sp = code_pv;
ORDER BY code_sp;
INTO TABLE supply_product_info_program_free_table

CLOSE TABLES ALL

DO FORM supply_product_info_program_form.scx
_SCREEN.ActiveForm.Width = 1285
_SCREEN.ActiveForm.Height = 240
_SCREEN.ActiveForm.AutoCenter = .T.
_SCREEN.ActiveForm.ControlBox = .F.
CLEAR

lengthLineInForm = 213
lengthLineInFormForProduct = 255
counterPage = 1
xPointer = 0
yPointer = 0
yFieldNameProduct = 5
yFieldPriceProduct = 45 + yFieldNameProduct 
yFieldCodeProvider = 30 + yFieldPriceProduct
yFieldNameProvider = 35 + yFieldCodeProvider
yFieldDateSupplyProduct = 85 + yFieldCodeProvider 
yFieldCountSupplyProduct = 40 + yFieldDateSupplyProduct
yFieldCostSupplyProduct = 30 + yFieldCountSupplyProduct  

countLinesForProduct = 4
counterLinesForProduct = 0
counterPages = 1

USE supply_product_info_program_free_table
GOTO TOP
IF (NOT EOF()) THEN
	CLOSE TABLES ALL
	
	setCaptionForm(codeSupplyProductNow, counterPages, "")
	
	createHeaderForReport(codeSupplyProductNow)
	
	countProductInSupplyProductNow = 0
	
	USE supply_product_info_program_free_table
	GOTO TOP
	DO WHILE (.T.)
		IF (codeSupplyProductNow == code_sp) THEN
			countProductInSupplyProductNow = countProductInSupplyProductNow + 1 
			
			@ xPointer, yFieldNameProduct SAY name_p
			@ xPointer, yFieldPriceProduct SAY STR (price_p, INT(lengthIntegerNumber(price_p)) + 3, 2)
			@ xPointer, yFieldCodeProvider SAY code_pv
			@ xPointer, yFieldNameProvider SAY name_pv
			@ xPointer, yFieldDateSupplyProduct SAY TRANSFORM(date_sp)				
			@ xPointer, yFieldCountSupplyProduct SAY STR(count_sp, INT(lengthIntegerNumber(count_sp)) + 4, 3)
			@ xPointer, yFieldCostSupplyProduct SAY STR(price_p * count_sp, INT(lengthIntegerNumber(price_p * count_sp)) + 3, 2)
			xPointer = xPointer + 1 
			@ xPointer, yPointer SAY createStringLine("*", lengthLineInFormForProduct)
			xPointer = xPointer + 1 
			counterLinesForProduct = counterLinesForProduct + 1 
			IF (counterLinesForProduct = countLinesForProduct OR EOF()) THEN
				startWaitWindow(codeSupplyProductNow, counterPages, "") 
				CLEAR
				
				counterPages = counterPages + 1 
				counterLinesForProduct = 0 
				
				setCaptionForm(codeSupplyProductNow, counterPages, "")
				createHeaderForReport(codeSupplyProductNow)
			ENDIF				
		ENDIF
		
		SKIP	
		
		* Вивід результатуючих даних
		IF (EOF()) THEN 	
			CLOSE TABLES ALL 
			IF (countProductInSupplyProductNow != countLinesForProduct) THEN 
				startWaitWindow(codeSupplyProductNow, counterPages, "")
				counterPages = counterPages + 1 
			ENDIF
			
			CLEAR	
			createHeaderForResultReportOrder(codeSupplyProductNow)
			setCaptionForm(codeSupplyProductNow, counterPages, "РЕЗУЛЬТАТИ ЗАМОВЛЕННЯ")
			
			
			startWaitWindow(codeSupplyProductNow, counterPages, "РЕЗУЛЬТАТ ЗАМОВЛЕННЯ")
		 	CLEAR 
			
			counterLinesForProduct = 0
			counterPages = 1
			countProductInSupplyProductNow = 0
			
			EXIT 
		ENDIF
	ENDDO
	CLOSE TABLES ALL
ELSE
	createHeaderForReport(codeSupplyProductNow)
	@ xPointer, yPointer SAY createStringSpace(100) + "НЕМАЄ ЗАМОВЛЕНЬ - ЗАПОВНІТЬ ТАБЛИЦЮ"
	xPointer = xPointer + 1 
	@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForProduct)
	
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
	@ xCordinate, yCordinate SAY "ІНФОРМАЦІЯ ПРО ПОСТАЧАННЯ № " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "СТАНОМ НА " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameProduct SAY "Назва продукту" FONT "" STYLE "I"
	@ xCordinate, yFieldPriceProduct SAY "Ціна продукту" FONT "" STYLE "I"
	@ xCordinate, yFieldCodeProvider SAY "Код постачальника" FONT "" STYLE "I"
	@ xCordinate, yFieldNameProvider SAY "Назва постачальника" FONT "" STYLE "I"
	@ xCordinate, yFieldDateSupplyProduct SAY "Дата постачання" FONT "" STYLE "I"
	@ xCordinate, yFieldCountSupplyProduct SAY "Кількість" FONT "" STYLE "I"
	@ xCordinate, yFieldCostSupplyProduct SAY "Вартість" FONT "" STYLE "I"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("*", lengthLineInFormForProduct)
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
	@ xCordinate, yCordinate SAY "РЕЗУЛЬТАТИ ПОСТАЧАННЯ № " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "СТАНОМ НА " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameProduct SAY createStringSpace(110) + "РЕЗУЛЬТАТИ ПОСТАЧАННЯ" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("*", lengthLineInFormForProduct)
	xCordinate = xCordinate + 1	
	
	yResultDataReport = 25
	yResultDataValueReport = 160
	
	@ xCordinate, yResultDataReport SAY "Сума постачання: "
	@ xCordinate, yResultDataValueReport SAY STR(getSummCostInSP(codeOrderForReportInString), lengthIntegerNumber(INT(getSummCostInSP(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Середня вартість постачання: "
	@ xCordinate, yResultDataValueReport SAY STR(getAvarageCostInSP(codeOrderForReportInString), lengthIntegerNumber(INT(getAvarageCostInSP(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Кількість продуктів у постачанні: "
	@ xCordinate, yResultDataValueReport SAY STR(getCountOfProductInSP(codeOrderForReportInString), lengthIntegerNumber(getCountOfProductInSP(codeOrderForReportInString)), 0)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Мінімальна вартість постачання: "
	@ xCordinate, yResultDataValueReport SAY STR(getMinCostOfProductInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMinCostOfProductInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "Максимальна вартість постачання: "
	@ xCordinate, yResultDataValueReport SAY STR(getMaxCostOfProductInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMaxCostOfProductInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	
	@ xCordinate, yPointer SAY createStringLine("*", lengthLineInFormForProduct)
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
	_SCREEN.ActiveForm.Caption = "Постачання № " + numberOrder + " | " + "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd
ENDPROC

* Процедура запуску вікна очікування
PROCEDURE startWaitWindow
PARAMETERS numberOrder, numberPage, messageInEnd
	WAIT WINDOW "Постачання № " + numberOrder + " | " + "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd 
ENDPROC

* Повернення коду постачання продукту у вигляді строки
FUNCTION getCodeSupplyProduct
PARAMETERS codeSupplyProduct
	lengthCodeSupplyProduct = lengthIntegerNumber(codeSupplyProduct)
	DO CASE
   		CASE lengthCodeSupplyProduct = 1
      		RETURN ( "000" + STR(codeSupplyProduct, lengthCodeSupplyProduct, 0) + "sp" )
   		CASE lengthCodeSupplyProduct = 2
      		RETURN ( "00" + STR(codeSupplyProduct, lengthCodeSupplyProduct, 0) + "sp" )
      	CASE lengthCodeSupplyProduct = 3
      		RETURN ( "0" + STR(codeSupplyProduct, lengthCodeSupplyProduct, 0) + "sp" )
      	CASE lengthCodeSupplyProduct = 4
      		RETURN ( STR(codeSupplyProduct, lengthCodeSupplyProduct, 0) + "sp" )
      	OTHERWISE
      		RETURN ""
	ENDCASE
ENDFUNC

* Повернути кількість постачань
FUNCTION getcountSupplyProduct
	USE supply_product_table
	GOTO TOP
	counterOrder = 0
	IF (NOT EOF()) THEN
		counterOrder = 1
		codeOrder = getCodeSupplyProduct(counterOrder)
		DO WHILE (NOT EOF())
			IF (codeOrder != code_sp) THEN
				counterOrder = counterOrder + 1
				codeOrder = getCodeSupplyProduct(counterOrder)
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

* Повернення суми вартості постачання
FUNCTION getSummCostInSP
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	summCostOfCodeSP = 0
	DO WHILE (NOT EOF())
		IF (codeSPInString == code_sp) THEN
			summCostOfCodeSP = summCostOfCodeSP + price_p * count_sp
		ENDIF
		SKIP
	ENDDO
	CLOSE TABLES ALL
	RETURN summCostOfCodeSP
ENDFUNC

* Повернення кількості продуктів у постачанні
FUNCTION getCountOfProductInSP
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	countCostInSPofCodeSP = 0
	DO WHILE (NOT EOF())
		IF (codeSPInString == code_sp) THEN
			countCostInSPofCodeSP = countCostInSPofCodeSP + 1 
		ENDIF
		SKIP
	ENDDO
	CLOSE TABLES ALL
	RETURN countCostInSPofCodeSP
ENDFUNC

* Повернення сереньої вартості постачання
FUNCTION getAvarageCostInSP
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	RETURN ROUND(getSummCostInSP(codeSPInString) / getCountOfProductInSP(codeSPInString), 2)
ENDFUNC

* Повернення мімальної вартості постачання
FUNCTION getMinCostOfProductInOrder
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	minCostOfProductInSP = 0
	
	* Перша цикл для знаходження першої ціни постачання
	DO WHILE (NOT EOF()) 
		IF (codeSPInString == code_sp) THEN
			minCostOfProductInSP = minCostOfProductInSP + price_p * count_sp
			DO WHILE (NOT EOF())
				IF ( (codeSPInString == code_sp) AND (minCostOfProductInSP > price_p * count_sp) )
					minCostOfProductInSP = price_p * count_sp
				ENDIF
				SKIP
			ENDDO
			
			* Вихід з першого циклу
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN minCostOfProductInSP 
ENDFUNC

* Повернення максимальної вартості постачання
FUNCTION getMaxCostOfProductInOrder
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	maxCostOfProductInSP = 0
	
	* Перша цикл для знаходження першої ціни постачання
	DO WHILE (NOT EOF()) 
		IF (codeSPInString == code_sp) THEN
			maxCostOfProductInSP = maxCostOfProductInSP + price_p * count_sp
			DO WHILE (NOT EOF())
				IF ( (codeSPInString == code_sp) AND (maxCostOfProductInSP < price_p * count_sp) )
					maxCostOfProductInSP = price_p * count_sp
				ENDIF
				SKIP
			ENDDO
			
			* Вихід з першого циклу
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN maxCostOfProductInSP
ENDFUNC