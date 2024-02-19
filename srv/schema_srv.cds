using app.schema from '../db/schema';
service LeaveManagementService {

    entity Employee as projection on schema.Employee;
    entity LeaveType as projection on schema.LeaveType;
    entity LeaveRequest as projection on schema.LeaveRequest;
    entity LeaveBalance as projection on schema.LeaveBalance;
}
