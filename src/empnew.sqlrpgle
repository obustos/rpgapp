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

Dcl-Proc EMP_Create;
  Dcl-S lExit Ind Inz(*Off);

  Dow (lExit = *Off);
    Exfmt NEWEMP;

    Select;
      When (*In12);
        lExit = *On;
      Other;
        If (EMP_ValidateInput());
          //Create new Employee
          EMP_CreateRecord();
          lExit = *On;
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
  Monitor;
    Emp_Ds.Salary = %Dec(EMPBASE:9:2);
    Emp_Ds.Bonus = %Dec(EMPBONUS:9:2);
    Emp_Ds.Comm = %Dec(EMPCOMM:9:2);
  On-Error *All;
    Return *Off;
  Endmon;

  Emp_Ds.hiredate = %Date();
  Emp_Ds.DOB = %Date();

  Return *On;
END-PROC;

Dcl-Proc EMP_CreateRecord;
  monitor;
    EXEC SQL
      INSERT INTO
        SAMPLE/EMPLOYEE (
          EMPNO,
          FIRSTNME,
          MIDINIT,
          LASTNAME,
          WORKDEPT,
          PHONENO,
          HIREDATE,
          JOB,
          EDLEVEL,
          SEX,
          BIRTHDATE,
          SALARY,
          BONUS,
          COMM
        ) VALUES (
          :Emp_Ds.EMPNO,
          :Emp_Ds.FirstName,
          :Emp_Ds.MidInit,
          :Emp_Ds.LastName,
          :Emp_Ds.WorkDept,
          :Emp_Ds.PhoneExt,
          :Emp_Ds.hiredate,
          :Emp_Ds.Job,
          :Emp_Ds.EdlLvl,
          :Emp_Ds.Gender,
          :Emp_Ds.DOB,
          :Emp_Ds.Salary,
          :Emp_Ds.Bonus,
          :Emp_Ds.Comm
        );
  on-error *all;
    dsply 'err';
  endmon;
END-PROC;
