PARAMETERS codeSupplyProductNow 

CLOSE TABLES ALL

* ��������� ��������� ����� ��� ����, ��� �� ���� ����-������������ ���� ���������� ����� (���� ���� ���� �� �� ��� �������� �������)
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
		
		* ���� �������������� �����
		IF (EOF()) THEN 	
			CLOSE TABLES ALL 
			IF (countProductInSupplyProductNow != countLinesForProduct) THEN 
				startWaitWindow(codeSupplyProductNow, counterPages, "")
				counterPages = counterPages + 1 
			ENDIF
			
			CLEAR	
			createHeaderForResultReportOrder(codeSupplyProductNow)
			setCaptionForm(codeSupplyProductNow, counterPages, "���������� ����������")
			
			
			startWaitWindow(codeSupplyProductNow, counterPages, "��������� ����������")
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
	@ xPointer, yPointer SAY createStringSpace(100) + "����� ��������� - �����Ͳ�� �������"
	xPointer = xPointer + 1 
	@ xPointer, yPointer SAY createStringLine("-", lengthLineInFormForProduct)
	
	startWaitWindow("", "��ղ�") 
	setCaptionForm("", "��ղ�")
ENDIF

_SCREEN.ActiveForm.Release()
CLOSE TABLES ALL 

*!*	* ====================================================================================================
*!*	* ====================================================================================================
*!*	* ====================================================================================================

* ��������� ��������� ����� ��� ����
PROCEDURE createHeaderForReport
PARAMETERS codeOrderForReportInString
	xCordinate = 0
	yCordinate = 0

	* ����� ����
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "�������ֲ� ��� ���������� � " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "������ �� " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameProduct SAY "����� ��������" FONT "" STYLE "I"
	@ xCordinate, yFieldPriceProduct SAY "ֳ�� ��������" FONT "" STYLE "I"
	@ xCordinate, yFieldCodeProvider SAY "��� �������������" FONT "" STYLE "I"
	@ xCordinate, yFieldNameProvider SAY "����� �������������" FONT "" STYLE "I"
	@ xCordinate, yFieldDateSupplyProduct SAY "���� ����������" FONT "" STYLE "I"
	@ xCordinate, yFieldCountSupplyProduct SAY "ʳ������" FONT "" STYLE "I"
	@ xCordinate, yFieldCostSupplyProduct SAY "�������" FONT "" STYLE "I"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("*", lengthLineInFormForProduct)
	xCordinate = xCordinate + 1
	
	
	xPointer = xCordinate
ENDPROC

* ��������� ��������� ����� ��� ���� � ����������� ����
PROCEDURE createHeaderForResultReportOrder
PARAMETERS codeOrderForReportInString
	xCordinate = 0
	yCordinate = 0

	* ����� ����
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY "���������� ���������� � " + codeOrderForReportInString FONT "", 20 STYLE "B"
	xCordinate = xCordinate + 2
	@ xCordinate, yCordinate SAY createStringSpace(4) + "������ �� " + TRANSFORM(DATE())
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yFieldNameProduct SAY createStringSpace(110) + "���������� ����������" FONT "" STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("-", lengthLineInForm) FONT "", 13 STYLE "B"
	xCordinate = xCordinate + 1
	@ xCordinate, yCordinate SAY createStringLine("*", lengthLineInFormForProduct)
	xCordinate = xCordinate + 1	
	
	yResultDataReport = 25
	yResultDataValueReport = 160
	
	@ xCordinate, yResultDataReport SAY "���� ����������: "
	@ xCordinate, yResultDataValueReport SAY STR(getSummCostInSP(codeOrderForReportInString), lengthIntegerNumber(INT(getSummCostInSP(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "������� ������� ����������: "
	@ xCordinate, yResultDataValueReport SAY STR(getAvarageCostInSP(codeOrderForReportInString), lengthIntegerNumber(INT(getAvarageCostInSP(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "ʳ������ �������� � ���������: "
	@ xCordinate, yResultDataValueReport SAY STR(getCountOfProductInSP(codeOrderForReportInString), lengthIntegerNumber(getCountOfProductInSP(codeOrderForReportInString)), 0)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "̳������� ������� ����������: "
	@ xCordinate, yResultDataValueReport SAY STR(getMinCostOfProductInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMinCostOfProductInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	@ xCordinate, yResultDataReport SAY "����������� ������� ����������: "
	@ xCordinate, yResultDataValueReport SAY STR(getMaxCostOfProductInOrder(codeOrderForReportInString), lengthIntegerNumber(INT(getMaxCostOfProductInOrder(codeOrderForReportInString))) + 3, 2)
	xCordinate = xCordinate + 1	
	
	@ xCordinate, yPointer SAY createStringLine("*", lengthLineInFormForProduct)
	xCordinate = xCordinate + 1	
	
	xPointer = xCordinate
ENDPROC

* ������� ���������� ������� �����: 100 - 3; -100 - 4; 0 - 1 � �. �.
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

* ��������� ���� ��������� ��� �����
PROCEDURE setCaptionForm
PARAMETERS numberOrder, numberPage, messageInEnd
	_SCREEN.ActiveForm.Caption = "���������� � " + numberOrder + " | " + "������� � " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd
ENDPROC

* ��������� ������� ���� ����������
PROCEDURE startWaitWindow
PARAMETERS numberOrder, numberPage, messageInEnd
	WAIT WINDOW "���������� � " + numberOrder + " | " + "������� � " + STR(numberPage, lengthIntegerNumber(numberPage), 0) + " | " + messageInEnd 
ENDPROC

* ���������� ���� ���������� �������� � ������ ������
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

* ��������� ������� ���������
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

* ��������� ��
FUNCTION createStringLine
PARAMETERS symbolLine, lengthLine
	stringLine = ""
	FOR i = 1 TO lengthLine STEP 1
		stringLine = stringLine + symbolLine
	ENDFOR
	RETURN stringLine
ENDFUNC

* ��������� ������ � ��������
FUNCTION createStringSpace
PARAMETERS lengthLine
	stringLine = ""
	FOR i = 1 TO lengthLine STEP 1
		stringLine = stringLine + " "
	ENDFOR
	RETURN stringLine
ENDFUNC

* ���������� ���� ������� ����������
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

* ���������� ������� �������� � ���������
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

* ���������� ������� ������� ����������
FUNCTION getAvarageCostInSP
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	RETURN ROUND(getSummCostInSP(codeSPInString) / getCountOfProductInSP(codeSPInString), 2)
ENDFUNC

* ���������� ������� ������� ����������
FUNCTION getMinCostOfProductInOrder
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	minCostOfProductInSP = 0
	
	* ����� ���� ��� ����������� ����� ���� ����������
	DO WHILE (NOT EOF()) 
		IF (codeSPInString == code_sp) THEN
			minCostOfProductInSP = minCostOfProductInSP + price_p * count_sp
			DO WHILE (NOT EOF())
				IF ( (codeSPInString == code_sp) AND (minCostOfProductInSP > price_p * count_sp) )
					minCostOfProductInSP = price_p * count_sp
				ENDIF
				SKIP
			ENDDO
			
			* ����� � ������� �����
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN minCostOfProductInSP 
ENDFUNC

* ���������� ����������� ������� ����������
FUNCTION getMaxCostOfProductInOrder
PARAMETERS codeSPInString
	CLOSE TABLES ALL 
	USE supply_product_info_program_free_table
	GOTO TOP
	maxCostOfProductInSP = 0
	
	* ����� ���� ��� ����������� ����� ���� ����������
	DO WHILE (NOT EOF()) 
		IF (codeSPInString == code_sp) THEN
			maxCostOfProductInSP = maxCostOfProductInSP + price_p * count_sp
			DO WHILE (NOT EOF())
				IF ( (codeSPInString == code_sp) AND (maxCostOfProductInSP < price_p * count_sp) )
					maxCostOfProductInSP = price_p * count_sp
				ENDIF
				SKIP
			ENDDO
			
			* ����� � ������� �����
			EXIT
		ENDIF
		SKIP
	ENDDO
	
	CLOSE TABLES ALL 
	RETURN maxCostOfProductInSP
ENDFUNC