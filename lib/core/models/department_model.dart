class Department {
  final String? departmentCode;
  final String? departmentName;
  final bool isActive;

  Department(
      {required this.departmentCode,
      required this.departmentName,
      required this.isActive});

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
        departmentCode: json['departmentCode'],
        departmentName: json['departmentName'],
        isActive: json['isActive']);
  }
}
