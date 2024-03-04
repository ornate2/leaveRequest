using app.schema from '../db/schema';

service LeaveManagementService {
  @requires: 'authenticated-user'

  @restrict: {
    grant: [
      'admin',
      'hr'
    ],
    on   : 'Employees'
  }
  entity Employees as projection on schema.Employee;

  @restrict: {
    grant: [
      'admin',
      'manager'
    ],
    on   : 'EmployeeonLeave'
  }
  entity EmployeeonLeave as projection on schema.EmployeeonLeave {
    key employeeid,
  };

  @restrict: {
    grant: [
      'admin',
      'hr'
    ],
    on   : 'EmpBirthday'
  }
  entity EmpBirthday as projection on schema.EmpBirthday {
    key employeeId,
  };

  @restrict: {
    grant: [
      'admin',
      'manager'
    ],
    on   : 'LeaveCalendar'
  }
  entity LeaveCalendar as projection on schema.LeaveCalendar {
    key officeholiday,
  };

  @restrict: {
    grant: ['admin'],
    on   : 'Year_master'
  }
  entity Year_master as projection on schema.Year_master {
    key year,
  };

  @restrict: {
    grant: [
      'admin',
      'hr'
    ],
    on   : 'Leave_Master'
  }
  entity Leave_Master as projection on schema.Leave_Master {
    key Leave_type,
  };

  @restrict: {
    grant: [
      'admin',
      'manager'
    ],
    on   : 'LeaveBalance'
  }
  entity LeaveBalance as projection on schema.LeaveBalance {
    key employeeId,
    key Leave_type,
    key year
  };

  @restrict: {
    grant: [
      'admin',
      'manager'
    ],
    on   : 'Emp_leave'
  }
  entity Emp_leave as projection on schema.Emp_leave {
    key employeeId,
    key Leave_type,
    key startDate,
  };

  @restrict: {
    grant: [
      'admin',
      'hr'
    ],
    on   : 'Emp_Master'
  }
  entity Emp_Master as projection on schema.Emp_Master {
    key employeeId,
  };
}
