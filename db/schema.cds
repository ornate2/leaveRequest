using { managed } from '@sap/cds/common';
namespace app.schema;

entity Employee : managed {
  key employeeId  : UUID;
  firstName   : String;
  lastName    : String;
  email       : String;
  department  : String;
  position    : String;
}

entity LeaveType : managed {
  key leaveTypeId  : UUID;
  typeName      : String(50);
  description   : String(255);
}

entity LeaveRequest : managed {
  key leaveRequestId  : UUID;
  employee        : Association to Employee;
  leaveType       : Association to LeaveType;
  startDate       : Date;
  endDate         : Date;
  status          : String(20);
  reason          : String(255);
}

entity LeaveBalance : managed {
  key leaveBalanceId  : UUID;
  employee        : Association to Employee;
  leaveType       : Association to LeaveType;
  balance         : Integer;
}
