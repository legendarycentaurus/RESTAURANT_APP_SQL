DELIMITER $$

CREATE FUNCTION `FN_CHECK_ITEM`(I_ITEMNAME VARCHAR(20)) RETURNS TEXT CHARSET latin1
BEGIN
    DECLARE L_SESSIONID INT;
    DECLARE O_RESULT TEXT;
    #SELECT ID INTO L_SESSIONID FROM TIMESCHEDULE WHERE STARTTIME<=CURRENT_TIME AND ENDTIME>=CURRENT_TIME;
  IF (EXISTS(SELECT ITEM_ID,TOTAL_QTY_PRODUCED FROM food_schedule WHERE ITEM_ID IN 
 (SELECT ID FROM food_items WHERE ITEM_NAME=I_ITEMNAME) AND SESSION_ID IN (
 SELECT ID  FROM TIME_SCHEDULE WHERE START_TIME<=CURRENT_TIME AND END_TIME>=CURRENT_TIME)
 )) THEN
        SET O_RESULT='TRUE';
    ELSEIF NOT EXISTS(SELECT ID FROM food_items WHERE ITEM_NAME=I_ITEMNAME) THEN
    SET O_RESULT='INVALID ITEM NAME';
    ELSE 
    SET O_RESULT='THE REQUESTED ITEM IS NOT SERVED AT THIS CURRENT TIME';
    END IF;  
    RETURN O_RESULT;  
    END$$

DELIMITER ;