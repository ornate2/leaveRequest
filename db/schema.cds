using {managed} from '@sap/cds/common';

namespace app.schema;

entity Employee : managed {
  key employeeId : UUID;
      firstName  : String;
      lastName   : String;
      email      : String;
      password: String;
      department : String;
      position   : String;
}

entity EmployeeonLeave : managed {
  key employeeid       : UUID;
      manager_approval : Association to Emp_leave;
      firstName        : Association to Employee;
      email            : Association to Employee;
      department       : Association to Employee;
      position         : Association to Employee;
}

entity EmpBirthday : managed {
  key employeeId : Association to Employee;
      Birth_date : String;
}

entity LeaveCalendar : managed {
  officeholiday : String;
  Holiday       : String;
}

entity Emp_Master : managed {
  employeeId : Association to Employee;
  emp_type   : String;
  manager_id : String;
  HR_id      : String;
}

entity Leave_Master : managed {
  Leave_type : String;
  no_of_days : Integer;
}

entity Year_master : managed {
  year : String;
}

entity LeaveBalance : managed {
  employeeId      : Association to Employee;
  Available_leave : Integer;
  leave_balance   : Integer;
  Leave_type      : Association to Leave_Master;
  year            : Association to Year_master;
}

entity Emp_leave : managed {
  employeeId       : Association to Employee;
  Leave_type       : Association to Leave_Master;
  startDate        : Date;
  endDate          : Date;
  approval         : String(20);
  year             : Association to Year_master;
  manager_approval : String;
  submission_date  : Date;
  hr_comment       : String;
  man_comment      : String;
  emp_comment      : String;
}
