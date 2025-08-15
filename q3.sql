

USE SQLAssignment;

DELIMITER $$
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE existing_count INT;
    DECLARE next_id INT;

    -- Check if subscriber already exists (case-insensitive)
    SELECT COUNT(*) INTO existing_count
    FROM Subscribers
    WHERE LOWER(SubscriberName) = LOWER(subName);

    IF existing_count = 0 THEN
        -- Generate next SubscriberID manually
        SELECT COALESCE(MAX(SubscriberID), 0) + 1 INTO next_id
        FROM Subscribers;

        -- Insert with manually generated ID
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (next_id, subName, CURDATE());

        SELECT CONCAT('Subscriber "', subName, '" added successfully.') AS Message;
    ELSE
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END$$
DELIMITER ;
