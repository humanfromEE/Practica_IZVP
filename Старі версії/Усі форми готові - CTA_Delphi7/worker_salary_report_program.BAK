CLOSE TABLES ALL

* Процедура видалення файлу для того, щоб не було вікна-попередження щодо перезапису файлу (якщо файл існує чи не був видалено фізично)
IF (FILE('worker_salary_report_free_table.dbf')) THEN
	ERASE worker_salary_report_free_table.dbf
ENDIF

SELECT * FROM worker_table;
ORDER BY fullname_w;
INTO TABLE worker_salary_report_free_table

DO FORM worker_salary_report_form.scx
_SCREEN.ActiveForm.Width = 965
_SCREEN.ActiveForm.Height = 270
CLEAR
USE worker_salary_report_free_table
GOTO TOP

lengthLineInForm = 160
lengthLineInFormForWorker = 240
counterPage = 1
xPointer = 0
yPointer = 0
yFieldCodeWorker = 10
yFieldNumberWorker = 35 + yFieldCodeWorker 
yFieldFullnameWorker = 40 + yFieldNumberWorker
yFieldSalaryWorker = 70 + yFieldFullnameWorker 

createHeaderForReport()

countLinesForWorker = 5
counterLinesForWorker = 0
counterPages = 1

setCaptionForm(counterPages, "")

IF (NOT EOF()) THEN
	DO WHILE (.T.)
		@ xPointer, yFieldCodeWorker SAY code_w
		@ xPointer, yFieldNumberWorker SAY number_w
		@ xPointer, yFieldFullnameWorker SAY fullname_w
		@ xPointer, yFieldSalaryWorker SAY salary_w
		SKIP
		xPointer = xPointer + 1 
		@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForWorker)
		xPointer = xPointer + 1 
		counterLinesForWorker = counterLinesForWorker + 1 
		IF (counterLinesForWorker = countLinesForWorker OR EOF()) THEN
			startWaitWindow(counterPages, "") 
			CLEAR
			
			counterPages = counterPages + 1 
			counterLinesForWorker = 0 
			setCaptionForm(counterPages, "")
			
			createHeaderForReport()
		ENDIF
		
		* Вивід результатуючих даних
		IF (EOF()) THEN 	
			CLOSE TABLES ALL 
			CLEAR	
			createHeaderForResultReport()
			IF (counterLinesForWorker = countLinesForWorker) THEN
				counterPages = counterPages + 1
			ENDIF
			setCaptionForm(counterPages, "РЕЗУЛЬТАТ")
			
			yResultDataReport = 25
			yResultDataValueReport = 70
			@ xPointer, yResultDataReport SAY "Сума зарплат: "
			@ xPointer, yResultDataValueReport SAY STR(searchSummSalary(), lengthIntegerNumber(searchSummSalary()) + 3, 2)
			xPointer = xPointer + 1
			@ xPointer, yResultDataReport SAY "Середня зарплата: "
			@ xPointer, yResultDataValueReport SAY STR(searchAvarageSalary(), lengthIntegerNumber(searchAvarageSalary()) + 3, 2)
			xPointer = xPointer + 1
			@ xPointer, yResultDataReport SAY "Кількість працівників: "
			@ xPointer, yResultDataValueReport SAY STR(searchCountWorker(), lengthIntegerNumber(searchCountWorker()), 0)
			xPointer = xPointer + 1
			@ xPointer, yResultDataReport SAY "Найменша зарплата: "
			@ xPointer, yResultDataValueReport SAY STR(searchMinSalary(), lengthIntegerNumber(searchMinSalary()) + 3, 2)
			xPointer = xPointer + 1
			@ xPointer, yResultDataReport SAY "Найбільша зарплата: "
			@ xPointer, yResultDataValueReport SAY STR(searchMaxSalary(), lengthIntegerNumber(searchMaxSalary()) + 3, 2)
			xPointer = xPointer + 1
			@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForWorker)
			startWaitWindow(counterPages, "РЕЗУЛЬТАТ") 
			EXIT 
		ENDIF
	ENDDO
ELSE
	@ xPointer, yPointer SAY createStringSpace(100) + "НЕМАЄ ПРАЦІВНИКІВ - ЗАПОВНІТЬ ТАБЛИЦЮ"
	xPointer = xPointer + 1 
	@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForWorker)
	
	startWaitWindow(counterPages, "ВИХІД") 
	setCaptionForm(counterPages, "ВИХІД")
ENDIF

_SCREEN.ActiveForm.Release()
CLOSE TABLES ALL 

* ====================================================================================================
* ====================================================================================================
* ====================================================================================================

* Пошук мінімальної запралати працівника
FUNCTION searchMinSalary
	USE worker_salary_report_free_table
	GOTO TOP
	minSalary = salary_w
	DO WHILE NOT EOF() 
		SKIP
		IF ((NOT EOF()) AND (minSalary > salary_w) ) THEN
			minSalary = salary_w
		ENDIF
	ENDDO	
	CLOSE TABLES ALL
	RETURN ROUND(minSalary, 2)
ENDFUNC


* Пошук максимальної запралати працівника
FUNCTION searchMaxSalary
	USE worker_salary_report_free_table
	GOTO TOP
	maxSalary = salary_w
	DO WHILE NOT EOF() 
		SKIP
		IF ((NOT EOF()) AND (maxSalary < salary_w) ) THEN
			maxSalary = salary_w
		ENDIF
	ENDDO	
	CLOSE TABLES ALL
	RETURN ROUND(maxSalary, 2)
ENDFUNC

* Пошук кількості працівників
FUNCTION searchCountWorker
	countWorker = 0
	USE worker_table
	COUNT FOR a->code_w != "0000" TO countWorker
	CLOSE TABLES ALL
	RETURN countWorker
ENDFUNC

* Пошук суми зарплат
FUNCTION searchSummSalary
	summSalary = 0
	USE worker_salary_report_free_table
	GOTO TOP
	DO WHILE NOT EOF() 
		summSalary = summSalary + salary_w
		SKIP
	ENDDO	
	CLOSE TABLES ALL
	RETURN ROUND(summSalary, 2)
ENDFUNC

* Пошук середньої зарплати
FUNCTION searchAvarageSalary
	RETURN ROUND( (searchSummSalary() / searchCountWorker()), 2)
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

* Процедура створення шапки для звіту
PROCEDURE createHeaderForReport
	xCordinate = 0
	yCordinate = 0

	* Шапка звіту
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "ЗВІТ ЗАРПЛАТ ПРАЦІВНИКІВ" FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY "Дата створення звіту " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldCodeWorker SAY "Код працівника" FONT "" STYLE "B"
	@ xCordinate, yFieldNumberWorker SAY "Номер працівника" FONT "" STYLE "B"
	@ xCordinate, yFieldFullnameWorker SAY "ПІП працівника" FONT "" STYLE "B"
	@ xCordinate, yFieldSalaryWorker SAY "Зарплата працівника" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInFormForWorker)
	xCordinate = xCordinate + 1
	
	xPointer = xCordinate
ENDPROC

* Процедура створення шапки для звіту в результатах звіту
PROCEDURE createHeaderForResultReport
	xCordinate = 0
	yCordinate = 0

	* Шапка звіту
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "ЗВІТ ЗАРПЛАТ ПРАЦІВНИКІВ" FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY "Дата створення звіту " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldCodeWorker SAY createStringSpace(80) + "РЕЗУЛЬТАТИ ЗВІТУ" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInFormForWorker)
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
PARAMETERS numberPage, messageInEnd
	_SCREEN.ActiveForm.Caption = "ЗВІТ ЗАРПЛАТ ПРАЦІВНИКІВ - " + "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + "  " +  messageInEnd
ENDPROC

* Процедура запуску вікна очікування
PROCEDURE startWaitWindow
PARAMETERS numberPage, messageInEnd
	WAIT WINDOW "Сторінка № " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + "  " + messageInEnd
ENDPROC