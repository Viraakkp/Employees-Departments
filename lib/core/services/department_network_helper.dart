import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:employees_in_departments/core/models/employee_model.dart';
// ignore: library_prefixes
import 'package:employees_in_departments/core/constants/constants.dart'
as Constants;

import '../models/department_model.dart';

Future<List<Department>> fetchDepartments() async {
  final response = await http.get(
    Uri.parse(Constants.DEPARTMENT_URL),
    headers: <String, String>{
      'apiToken': Constants.API_KEY,
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> listOfDepartmentRaw = jsonDecode(response.body);
    List<Department> listOfDepartments = [];

    for (Map<String, dynamic> mapData in listOfDepartmentRaw) {
      listOfDepartments.add(Department.fromJson(mapData));
    }

    return listOfDepartments;
  } else {
    throw Exception('Failed to load album');
  }
}

List departmentList = [];