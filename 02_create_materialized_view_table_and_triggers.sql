drop table if exists fine_dates_mv;
CREATE TABLE fine_dates_mv AS SELECT * FROM
    fine_dates_view;   
  
 drop trigger if exists finedates_mv_insert;
 drop trigger if exists finedates_mv_update;
 drop trigger if exists finedates_mv_delete;

CREATE 
    TRIGGER  `finedate_mv_insert`
 AFTER INSERT ON `messy_dates` FOR EACH ROW 
    REPLACE INTO fine_dates_mv SELECT DISTINCT * FROM
        fine_dates_view
    WHERE
        ID = NEW.ID;
CREATE 
    TRIGGER  `finedate_mv_update`
 AFTER UPDATE ON `messy_dates` FOR EACH ROW 
    REPLACE INTO fine_dates_mv SELECT DISTINCT * FROM
        fine_dates_view
    WHERE
        ID = NEW.ID;
CREATE 
    TRIGGER  `finedate_mv_delete`
 BEFORE DELETE ON `messy_dates` FOR EACH ROW 
    DELETE FROM fine_dates_mv WHERE
        ID = old.ID; 
