import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:employees_in_departments/core/models/employee_model.dart';
// ignore: library_prefixes
import 'package:employees_in_departments/core/constants/constants.dart'
    as Constants;

// Future<http.Response> createEmployee(
//     String empNo,
//     String empName,
//     String empAddressLine1,
//     String empAddressLine2,
//     String empAddressLine3,
//     String departmentCode,
//     String dateOfJoin,
//     String dateOfBirth,
//     double basicSalary,
//     bool isActive) {
//   return http.post(
//     Uri.parse(Constants.EMPLOYEE_URL),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'apiToken': Constants.API_KEY,
//     },
//     body: jsonEncode(<String, dynamic>{
//       'empNo': empNo,
//       'empName': empName,
//       'empAddressLine1': empAddressLine1,
//       'empAddressLine2': empAddressLine2,
//       'empAddressLine3': empAddressLine3,
//       'departmentCode': departmentCode,
//       'dateOfJoin': dateOfJoin,
//       'dateOfBirth': dateOfBirth,
//       'basicSalary': basicSalary,
//       'isActive': isActive
//     }),
//   );
// }

Future<Employee> createEmployee(
    String empNo,
    String empName,
    String empAddressLine1,
    String empAddressLine2,
    String empAddressLine3,
    String departmentCode,
    String dateOfJoin,
    String dateOfBirth,
    double basicSalary,
    bool isActive) async {
  final response = await http.post(
    Uri.parse(Constants.EMPLOYEE_URL),
    headers: <String, String>{
      "Content-Type": "application/x-www-form-urlencoded",
      'apiToken': Constants.API_KEY,
    },
    body: jsonEncode(<String, dynamic>{
      'empNo': empNo,
      'empName': empName,
      'empAddressLine1': empAddressLine1,
      'empAddressLine2': empAddressLine2,
      'empAddressLine3': empAddressLine3,
      'departmentCode': departmentCode,
      'dateOfJoin': dateOfJoin,
      'dateOfBirth': dateOfBirth,
      'basicSalary': basicSalary,
      'isActive': isActive
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create Employee.');
  }
}

Future<http.Response> updateEmployee(
    String empNo,
    String empName,
    String empAddressLine1,
    String empAddressLine2,
    String empAddressLine3,
    String departmentCode,
    String dateOfJoin,
    String dateOfBirth,
    double basicSalary,
    bool isActive) {
  return http.put(
    Uri.parse(Constants.EMPLOYEE_URL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'apiToken': Constants.API_KEY,
    },
    body: jsonEncode(<String, dynamic>{
      'empNo': empNo,
      'empName': empName,
      'empAddressLine1': empAddressLine1,
      'empAddressLine2': empAddressLine2,
      'empAddressLine3': empAddressLine3,
      'departmentCode': departmentCode,
      'dateOfJoin': dateOfJoin,
      'dateOfBirth': dateOfBirth,
      'basicSalary': basicSalary,
      'isActive': isActive
    }),
  );
}

Future<Employee> getEmployee(String id) async {
  final response = await http.get(
    Uri.parse(Constants.EMPLOYEE_URL + "/$id"),
    headers: <String, String>{
      'apiToken': Constants.API_KEY,
    },
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Employee>> fetchEmployees() async {
  final response = await http.get(
    Uri.parse(Constants.ALL_EMPLOYEES_URL),
    headers: <String, String>{
      'apiToken': Constants.API_KEY,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> listOfEmployeesRaw = jsonDecode(response.body);
    print(listOfEmployeesRaw);
    List<Employee> listOfEmployees = [];

    for (Map<String, dynamic> mapData in listOfEmployeesRaw) {
      listOfEmployees.add(Employee.fromJson(mapData));
    }

    return listOfEmployees;
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Employee> deleteEmployee(String id) async {
  final http.Response response = await http.delete(
    Uri.parse(Constants.EMPLOYEE_URL + "/$id"),
    headers: <String, String>{
      'apiToken': Constants.API_KEY,
    },
  );

  if (response.statusCode == 200) {
    return Employee.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}
