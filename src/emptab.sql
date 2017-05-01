CREATE OR REPLACE TABLE SAMPLE.EMPLOYEE
             (EMPNO CHAR(6) NOT NULL,
              FIRSTNME VARCHAR(12) NOT NULL,
              MIDINIT CHAR(1) NOT NULL,
              LASTNAME VARCHAR(15) NOT NULL,
              WORKDEPT CHAR(3) NOT NULL,
              PHONENO CHAR(4) NOT NULL,
              HIREDATE DATE NOT NULL,
              JOB CHAR(8) NOT NULL,
              EDLEVEL SMALLINT NOT NULL,
              SEX CHAR(1) NOT NULL,
              BIRTHDATE DATE NOT NULL,
              SALARY DECIMAL(9,2) NOT NULL,
              BONUS DECIMAL(9,2) NOT NULL,
              COMM DECIMAL(9,2) NOT NULL);
              
-- /**************************************************************/
-- /*                                                            */
-- /* POPULATE TABLE EMPLOYEE                                    */
-- /*                                                            */
-- /**************************************************************/

     INSERT INTO SAMPLE.EMPLOYEE VALUES('000010','CHRISTINE',     'I',  'HAAS',           'A00',  '3978',
 '1965-01-01','PRES' ,     18 , 'F', '1933-08-24',  52750.00,
1000,4220);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000020','MICHAEL',       'L',  'THOMPSON',       'B01',  '3476',
'1973-10-10','MANAGER',    18 , 'M', '1948-02-02',  41250.00,
800,3300);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000030','SALLY',         'A',  'KWAN',           'C01',  '4738',
'1975-04-05', 'MANAGER',   20, 'F', '1941-05-11',  38250.00,
800,3060);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000050','JOHN',          'B',  'GEYER',          'E01',  '6789',
 '1949-08-17','MANAGER',      16,  'M', '1925-09-15',  40175.00,
800,3214);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000060','IRVING',        'F',  'STERN',          'D11',  '6423',
 '1973-09-14','MANAGER',     16,  'M', '1945-07-07',  32250.00,
500,2580);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000070','EVA',           'D',  'PULASKI',        'D21',  '7831',
 '1980-09-30','MANAGER',     16,  'F', '1953-05-26',  36170.00,
700,2893);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000090','EILEEN',        'W',  'HENDERSON',      'E11',  '5498',
 '1970-08-15','MANAGER',   16,  'F', '1941-05-15',  29750.00,
600,2380);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000100','THEODORE',      'Q',  'SPENSER',        'E21',  '0972',
 '1980-06-19','MANAGER',     14 , 'M', '1956-12-18',  26150.00,
500,2092);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000110','VICENZO',       'G',  'LUCCHESSI',      'A00',  '3490',
 '1958-05-16','SALESREP',    19,  'M', '1929-11-05',  46500.00,
900,3720);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000120','SEAN',        ' ',    'O''CONNELL',      'A00',  '2167',
 '1963-12-05','CLERK',       14,  'M', '1942-10-18',  29250.00,
600,2340);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000130','DELORES',       'M',  'QUINTANA',       'C01',  '4578',
 '1971-07-28','ANALYST',     16,  'F', '1925-09-15',  23800.00,
500,1904);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000140','HEATHER',       'A',  'NICHOLLS',       'C01',  '1793',
 '1976-12-15','ANALYST',     18,  'F', '1946-01-19',  28420.00,
600,2274);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000150','BRUCE',        ' ',   'ADAMSON',        'D11',  '4510',
 '1972-02-12','DESIGNER',    16,  'M', '1947-05-17',  25280.00,
500,2022);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000160','ELIZABETH',     'R',  'PIANKA',         'D11',  '3782',
 '1977-10-11','DESIGNER',    17,  'F', '1955-04-12',  22250.00,
400,1780);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000170','MASATOSHI',     'J',  'YOSHIMURA',      'D11',  '2890',
 '1978-09-15','DESIGNER',    16,  'M', '1951-01-05',  24680.00,
500,1974);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000180','MARILYN',       'S',  'SCOUTTEN',       'D11',  '1682',
'1973-07-07','DESIGNER',    17,  'F', '1949-02-21',  21340.00,
500,1707);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000190','JAMES',         'H',  'WALKER',         'D11',  '2986',
'1974-07-26','DESIGNER',    16,  'M', '1952-06-25',  20450.00,
400,1636);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000200','DAVID',        ' ',   'BROWN',          'D11',  '4501',
'1966-03-03','DESIGNER',    16,  'M', '1941-05-29',  27740.00,
600,2217);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000210','WILLIAM',       'T',  'JONES',          'D11',  '0942',
'1979-04-11','DESIGNER',    17,  'M', '1953-02-23',  18270.00,
400,1462);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000220','JENNIFER',      'K',  'LUTZ',           'D11',  '0672',
'1968-08-29','DESIGNER',    18,  'F', '1948-03-19',  29840.00,
600,2387);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000230','JAMES',         'J',  'JEFFERSON',      'D21',  '2094',
'1966-11-21','CLERK',       14,  'M', '1935-05-30',  22180.00,
400,1774);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000240', 'SALVATORE',     'M',  'MARINO',         'D21',  '3780',
'1979-12-05','CLERK',       17,  'M', '1954-03-31',  28760.00,
600,2301);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000250', 'DANIEL',        'S',  'SMITH',          'D21',  '0961',
'1969-10-30','CLERK',       15,  'M', '1939-11-12',  19180.00,
400,1534);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000260', 'SYBIL',         'P',  'JOHNSON',        'D21',  '8953',
'1975-09-11','CLERK',       16,  'F', '1936-10-05',  17250.00,
300,1380);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000270', 'MARIA',         'L',  'PEREZ',          'D21',  '9001',
'1980-09-30','CLERK',       15,  'F', '1953-05-26',  27380.00,
500,2190);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000280', 'ETHEL',         'R',  'SCHNEIDER',      'E11',  '8997',
'1967-03-24','OPERATOR',    17,  'F', '1936-03-28',  26250.00,
500,2100);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000290', 'JOHN',          'R',  'PARKER',         'E11',  '4502',
'1980-05-30','OPERATOR',    12,  'M', '1946-07-09',  15340.00,
300,1227);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000300', 'PHILIP',        'X',  'SMITH',          'E11',  '2095',
'1972-06-19','OPERATOR',    14,  'M', '1936-10-27',  17750.00,
400,1420);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000310', 'MAUDE',         'F',  'SETRIGHT',       'E11',  '3332',
'1964-09-12','OPERATOR',    12,  'F', '1931-04-21',  15900.00,
300,1272);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000320', 'RAMLAL',        'V',  'MEHTA',          'E21',  '9990',
'1965-07-07','FILEREP',     16,  'M', '1932-08-11',  19950.00,
400,1596);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000330', 'WING',          ' ',  'LEE',            'E21',  '2103',
'1976-02-23','FILEREP',     14,  'M', '1941-07-18',  25370.00,
500,2030);
     INSERT INTO SAMPLE.EMPLOYEE VALUES(
'000340', 'JASON',         'R',  'GOUNOT',      'E21',  '5698',
'1947-05-05','FILEREP',    16,  'M', '1926-05-17',  23840.00,
500,1907);