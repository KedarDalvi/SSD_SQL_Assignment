
USE SQLAssignment; 

DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT 
        s.Title AS ShowTitle,
        s.Genre,
        s.ReleaseYear,
        w.WatchTime
    FROM 
        WatchHistory w
    INNER JOIN 
        Shows s ON w.ShowID = s.ShowID
    WHERE 
        w.SubscriberID = sub_id;
END$$

DELIMITER ;
