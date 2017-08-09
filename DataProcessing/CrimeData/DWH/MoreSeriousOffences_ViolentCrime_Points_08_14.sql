DROP TABLE X_MSO_Violent_Pts_08_14;

CREATE TABLE X_MSO_Violent_Pts_08_14
(
DATEOCC DATE, 
YEAR VARCHAR2(4),
MONTH VARCHAR2(2),
DAY VARCHAR2(2),
CURR_IUCR VARCHAR2(8),
FBI_CD VARCHAR2(3),
AREA VARCHAR2(1),
BEAT VARCHAR2(4),
DISTRICT VARCHAR2(2),
X_COORD VARCHAR2(8),
Y_COORD VARCHAR2(8),
LOCATION VARCHAR2(8),
INC_CNT NUMBER(1)
);

INSERT INTO X_MSO_Violent_Pts_08_14(DATEOCC,YEAR,MONTH,DAY,CURR_IUCR,FBI_CD,AREA,BEAT,DISTRICT,X_COORD,Y_COORD,LOCATION,INC_CNT)
SELECT DATEOCC, YEAR, MONTH, DAY, CURR_IUCR, FBI_CD, AREA, BEAT, DISTRICT, X_COORD, Y_COORD, LOCATION, INC_CNT
FROM CHRIS_DWH.CRIMES_POINTS_ALLV
WHERE (DATEOCC BETWEEN TO_DATE('2008/01/01 12:00:00AM', 'yyyy/mm/dd hh:mi:ssam') AND TO_DATE('2014/12/31 11:59:59PM', 'yyyy/mm/dd:hh:mi:ssam'))  
AND (CITY='CHICAGO') 
AND (CURR_IUCR IN ('0110','0130','0261','0262','0263','0264','0265','0266','0271','0272','0273','0274','0275','0281',
                   '0291','1753','1754','0312','0313','031A','031B','0320','0325','0326','0330','0331','0334','0337',
                   '033A','033B','0340','051A','051B','0520','0530','0550','0551','0552','0553','0555','0556','0557',
                   '0558','041A','041B','0420','0430','0450','0451','0452','0453','0461','0462','0479','0480','0480',
                   '0481','0482','0483','0485','0488','0489','0490','0491','0492','0493','0495','0496','0497','0498','0510')
    )
ORDER BY DATEOCC ASC;