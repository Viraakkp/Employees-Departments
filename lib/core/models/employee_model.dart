class Employee {
  final String? empNo;
  final String? empName;
  final String empAddressLine1;
  final String empAddressLine2;
  final String empAddressLine3;
  final String departmentCode;
  final String dateOfJoin;
  final String dateOfBirth;
  final double basicSalary;
  final bool isActive;

  const Employee({
    required this.empNo,
    required this.empName,
    required this.empAddressLine1,
    required this.empAddressLine2,
    required this.empAddressLine3,
    required this.departmentCode,
    required this.dateOfJoin,
    required this.dateOfBirth,
    required this.basicSalary,
    required this.isActive
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      empNo: json['empNo'],
      empName: json['empName'],
      empAddressLine1: json['empAddressLine1'],
      empAddressLine2: json['empAddressLine2'],
      empAddressLine3: json['empAddressLine3'],
      departmentCode: json['departmentCode'],
      dateOfJoin: json['dateOfJoin'],
      dateOfBirth: json['dateOfBirth'],
      basicSalary: json['basicSalary'].toDouble(),
      isActive: json['isActive']
    );
  }
}