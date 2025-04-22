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

  dow (lexit = *off);
    exfmt newemp;

    select;
      when (*in12);
        lexit = *on;
      other;
        if (emp_validateinput());
          //create new employee
          emp_createrecord();
          lexit = *on;
        endif;
    endsl;
  enddo;

end-proc;

dcl-proc emp_validateinput;
  //returns true if valid.
  dcl-pi *n ind end-pi;

  emp_ds.empno = empno;
  emp_ds.firstname = %trim(firstname);
  emp_ds.midinit = middleinit;
  emp_ds.lastname = %trim(lastname);
  emp_ds.workdept = empdept;
  emp_ds.phoneext = empext;
  emp_ds.job = empjob;
  emp_ds.gender = newgender;
  
  emp_ds.salary = %dec(empbase:9:2);
  emp_ds.bonus = %dec(empbonus:9:2);
  emp_ds.comm = %dec(empcomm:9:2);

  emp_ds.hiredate = %date();
  emp_ds.dob = %date();

  return *on;
end-proc;

dcl-proc emp_createrecord;
  //insert data into sample/employee
end-proc;
