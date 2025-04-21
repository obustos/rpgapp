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
  Job       Char(8);
  Gender    Char(1);
  Salary    Zoned(9:2);
  Bonus     Zoned(9:2);
  Comm      Zoned(9:2); //Commission
End-Ds;

//***********************

Dcl-Pi EMPDSP;
  gEmp Char(6);
End-Pi;

If (EMP_Load(gEmp));
  EMP_MapData();
  EMP_Display();
Endif;

*InLR = *On;
Return;

//*****************************

Dcl-Proc EMP_Load;
  //Return *ON if successful
  Dcl-Pi *N Ind;
    pEmp Char(6) Const;
  End-Pi;

  Dcl-S lSuccess Ind Inz(*On);

  EXEC SQL
    SELECT
      EMPNO,
      FIRSTNME,
      MIDINIT,
      LASTNAME,
      WORKDEPT,
      PHONENO,
      JOB,
      SEX,
      SALARY,
      BONUS,
      COMM
    INTO :EMP_DS
    FROM SAMPLE/EMPLOYEE
    WHERE EMPNO = :PEMP;

  lSuccess = (SQLSTATE = '00000');

  Return lSuccess;
End-Proc;

//*****************************

Dcl-Proc EMP_MapData;
  Dcl-S lName  Varchar(30);
  Dcl-S lTotal Packed(9:2);

  EMPNO = Emp_Ds.EMPNO;

  lName = %TrimR(Emp_Ds.FirstName);
  If (Emp_Ds.MidInit = *Blank);
    lName += ' ';
  Else;
    lName += ' ' + Emp_Ds.MidInit + ' ';
  Endif;
  lName += %TrimR(Emp_Ds.LastName);

  EMPNAME = lName;

  Select;
    When (Emp_Ds.Gender = 'M');
      GENDER = 'Male';
    When (Emp_Ds.Gender = 'F');
      GENDER = 'Female';
  Endsl;

  EMPDEPT = Emp_Ds.WorkDept;
  EMPEXT  = Emp_Ds.PhoneExt;
  EMPJOB  = Emp_Ds.Job;

  EMPBASE  = %Char(Emp_Ds.Salary);
  EMPBONUS = %Char(Emp_Ds.Bonus);
  EMPCOMM  = %Char(Emp_Ds.Comm);

  lTotal = Emp_Ds.Salary
         + Emp_Ds.Bonus
         + Emp_Ds.Comm;

  EMPPAY = %Char(lTotal);
End-Proc;

//*****************************

Dcl-Proc EMP_Display;
  Dcl-S lExit   Ind Inz(*Off);
  Dcl-S lCurEmp Char(6);

  Dow (lExit = *Off);
    lCurEmp = EMPNO;
    Exfmt EMP;

    Select;
      When (*In12); //F12
        lExit = *On;

      Other; //Enter
        If (EMPNO <> lCurEmp);
          If (EMP_Load(EMPNO));
            EMP_MapData();
          Endif;
        ENDIF;
    Endsl;
  Enddo;

End-Proc;
