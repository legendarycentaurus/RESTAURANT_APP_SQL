DELIMITER $$

CREATE FUNCTION `FN_CHECK_SEAT`(I_SEAT_NOV INT) RETURNS TINYINT(1)
BEGIN
    DECLARE RESULT BOOLEAN;
	 IF EXISTS(SELECT ID FROM HOTEL_SEATS WHERE SEAT_NO=I_SEAT_NOV AND STATUS=0)THEN 
	 SET RESULT=TRUE;	
	ELSEIF EXISTS(SELECT ID FROM HOTEL_SEATS WHERE SEAT_NO=I_SEAT_NOV AND STATUS=1) THEN
	SET RESULT=FALSE;
	ELSE SET RESULT=FALSE;
	END IF;			
	RETURN RESULT;
    END$$

DELIMITER ;