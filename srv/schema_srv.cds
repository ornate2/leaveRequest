using app.schema from '../db/schema';
service LeaveManagementService {
  @requires: 'authenticated-user'


  entity Employees as projection on schema.Employee;

  entity LeaveTypes as projection on schema.LeaveType;

  entity LeaveRequests as projection on schema.LeaveRequest;

  entity LeaveBalances as projection on schema.LeaveBalance;

  entity WorkflowStages as projection on schema.WorkflowStage;

  entity LeaveWorkflows as projection on schema.LeaveWorkflow;

  entity LeaveApprovals as projection on schema.LeaveApproval;

  entity LeaveDeductions as projection on schema.LeaveDeduction;


}