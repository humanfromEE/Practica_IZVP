CLOSE TABLES ALL

* Отримав кількість працівників
countProvider = 0
SELECT a
USE provider_table
COUNT FOR a->code_pv != "0000" TO countProvider

* Отримав кількість страв
countProduct = 0
SELECT b
USE product_table
COUNT FOR b->code_p != "0000" TO countProduct

* Очистив таблицю перед новим перезаписом
SELECT c
USE supply_product_table
DELETE ALL 
PACK 

CLOSE TABLES ALL 

IF ( (countProvider != 0).and.(countProduct != 0) ) THEN 
	countSupplyProduct = 30
	minCountSupplyProduct = 1
	maxCountSupplyProduct = 5
	minCountNowSupplyProduct = 1
	maxCountNowSupplyProduct = 5
	stepDateOfSupplyProduct = 4
	
	countSupplyProductInDay = getRandomPositiveIntNumberInRange(minCountSupplyProduct, maxCountSupplyProduct)
	counterSupplyProductInDay = 1
	dateOfSupplyProduct = DATE(2023, 1, 23)
	
	FOR i = 1 TO countSupplyProduct STEP 1
		
		numberProvider = getRandomPositiveIntNumberInRange(1, countProvider)
		countNowSupplyProduct = getRandomPositiveIntNumberInRange(minCountNowSupplyProduct , maxCountNowSupplyProduct)
		
		IF (counterSupplyProductInDay = countSupplyProductInDay) THEN
			dateOfSupplyProduct = dateOfSupplyProduct + stepDateOfSupplyProduct 
			countNowSupplyProduct = getRandomPositiveIntNumberInRange(minCountSupplyProduct, maxCountSupplyProduct)
			counterSupplyProductInDay = 1		
		ENDIF
		
		FOR j = 1 TO countNowSupplyProduct STEP 1
			INSERT INTO supply_product_table (code_sp, code_pv_sp, code_p_sp, date_sp, count_sp);
				VALUES;
					(getCodeSupplyProduct(i),;
					getCodeProviderOrProduct(numberProvider, "pv"),;
					getCodeProviderOrProduct(getRandomPositiveIntNumberInRange(1, countProduct), "p"),;
					dateOfSupplyProduct,;
					(getRandomPositiveIntNumberInRange(1, 99) + RAND()))
		ENDFOR 
		
		counterSupplyProductInDay = counterSupplyProductInDay + 1
	ENDFOR
ENDIF

CLOSE TABLES ALL 

* =================================================================================
* =================================================================================
* =================================================================================

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

* Повернення коду постачальника чи продукту у вигляді строки
FUNCTION getCodeProviderOrProduct
PARAMETERS codeProviderOrProduct, tableLastSymol
	lengthCodeProviderOrProduct = lengthIntegerNumber(codeProviderOrProduct)
	IF (tableLastSymol == "p") THEN
		DO CASE
	   		CASE lengthCodeProviderOrProduct = 1
	      		RETURN ( "00" + STR(codeProviderOrProduct, lengthCodeProviderOrProduct, 0) + tableLastSymol) 
	   		CASE lengthCodeProviderOrProduct = 2
	   			RETURN ( "0" + STR(codeProviderOrProduct, lengthCodeProviderOrProduct, 0) + tableLastSymol)
	      	CASE lengthCodeProviderOrProduct = 3
	      		RETURN ( STR(codeProviderOrProduct, lengthCodeProviderOrProduct, 0) + tableLastSymol)
	      	OTHERWISE
	      		RETURN ""
		ENDCASE
	ENDIF
	IF (tableLastSymol == "pv") THEN 
		DO CASE
	   		CASE lengthCodeProviderOrProduct = 1
	      		RETURN ( "0" + STR(codeProviderOrProduct, lengthCodeProviderOrProduct, 0) + tableLastSymol) 
	   		CASE lengthCodeProviderOrProduct = 2
	      		RETURN ( STR(codeProviderOrProduct, lengthCodeProviderOrProduct, 0) + tableLastSymol)
	      	OTHERWISE
	      		RETURN ""
		ENDCASE
	ENDIF
	RETURN ""
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