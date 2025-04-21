**FREE

Ctl-Opt DftActGrp(*No) ActGrp(*NEW);

Dcl-F EMPLOYEE WorkStn;

Dcl-Ds Emp_Ds Qualified;
  EMPNO     Char(6);
  FirstName Varchar(12);
  MidInit   Char(1);
  LastName  Varchar(15);
  WorkDept  Char(3);
  PhoneExt  Char(4);
  hiredate  Date;
  Job       Char(8);
  EdlLvl    Bindec(2) Inz(0); //ignore
  Gender    Char(1);
  DOB       Date;
  Salary    Zoned(9:2);
  Bonus     Zoned(9:2);
  Comm      Zoned(9:2); //Commission
End-Ds;

EMP_Create();

*InLR = *On;
Return;

dcl-proc emp_create;
  dcl-s lexit ind inz(*off);

  DOW (LEXIT = *OFF);
    EXFMT NEWEMP;

    SELECT;
      WHEN (*IN12);
        LEXIT = *ON;
      OTHER;
        IF (EMP_VALIDATEINPUT());
          //CREATE NEW EMPLOYEE
          EMP_CREATERECORD();
          LEXIT = *ON;
        ENDIF;
    ENDSL;
  ENDDO;

END-PROC;

Dcl-Proc EMP_ValidateInput;
  //Returns true if valid.
  Dcl-Pi *N Ind End-Pi;

  Emp_Ds.EMPNO = EMPNO;
  Emp_Ds.FirstName = %Trim(FIRSTNAME);
  Emp_Ds.MidInit = MIDDLEINIT;
  Emp_Ds.LastName = %Trim(LASTNAME);
  Emp_Ds.WorkDept = EMPDEPT;
  Emp_Ds.PhoneExt = EMPEXT;
  Emp_Ds.Job = EMPJOB;
  Emp_Ds.Gender = NEWGENDER;
  
  Emp_Ds.Salary = %Dec(EMPBASE:9:2);
  Emp_Ds.Bonus = %Dec(EMPBONUS:9:2);
  Emp_Ds.Comm = %Dec(EMPCOMM:9:2);

  Emp_Ds.hiredate = %Date();
  Emp_Ds.DOB = %Date();

  Return *On;
END-PROC;

Dcl-Proc EMP_CreateRecord;
  //Insert data into SAMPLE/EMPLOYEE
END-PROC;
