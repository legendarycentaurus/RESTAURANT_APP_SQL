	DELIMITER $$

	CREATE  FUNCTION `FN_GENERATE_ORDER`() RETURNS INT(11)
	BEGIN
	    DECLARE O_ORDERID INT;
		INSERT INTO order_status(STATUS) VALUES ('ORDERGENERATED');
		SELECT MAX(ID) INTO O_ORDERID FROM order_status;
		RETURN O_ORDERID;
	    END$$

	DELIMITER ;