**free

ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f employee workstn;

dcl-ds emp_ds qualified;
  empno     char(6);
  firstname varchar(12);
  midinit   char(1);
  lastname  varchar(15);
  workdept  char(3);
  phoneext  char(4);
  hiredate  date;
  job       char(8);
  edllvl    bindec(2) inz(0); //ignore
  gender    char(1);
  dob       date;
  salary    zoned(9:2);
  bonus     zoned(9:2);
  comm      zoned(9:2); //commission
end-ds;

emp_create();

*inlr = *on;
return;

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
