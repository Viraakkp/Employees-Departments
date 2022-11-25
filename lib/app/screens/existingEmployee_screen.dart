import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/models/employee_model.dart';
import '../../core/services/employee_network_helper.dart';
import 'newEmploy_screen.dart';

class ExistingEmployee extends StatefulWidget {
  final String id;
  const ExistingEmployee({Key? key, required this.id}) : super(key: key);

  @override
  State<ExistingEmployee> createState() => _ExistingEmployeeState();
}

class _ExistingEmployeeState extends State<ExistingEmployee> {
  late String _empNo;
  late String _empName;
  late String _empAddressLine1;
  late String _empAddressLine2;
  late String _empAddressLine3;
  late String _departmentCode;
  late String _dateOfJoin;
  late String _dateOfBirth;
  late double _basicSalary;
  late bool _isActive;

  late Future<Employee> _futureEmployee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureEmployee = getEmployee(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employee Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: FutureBuilder<Employee>(
            future: _futureEmployee,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                Employee? _employee = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Employee number:'), Text((_employee?.empNo)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Employee name:'), Text((_employee?.empName)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Employee address line 1:'), Text((_employee?.empAddressLine1)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Employee address line 2:'), Text((_employee?.empAddressLine2)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Employee address line 3:'), Text((_employee?.empAddressLine3)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Department code:'), Text((_employee?.departmentCode)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Department code:'), Text((_employee?.departmentCode)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Department code:'), Text((_employee?.departmentCode)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Date of join:'), Text((_employee?.dateOfJoin)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Date of birth:'), Text((_employee?.dateOfBirth)!),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Basic salary:'), Text((_employee?.basicSalary)!.toString()),],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Active or Not'), Text((_employee?.isActive)! ? 'Active' : 'Inactive')],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                          onPressed: () async {
                            await deleteEmployee(widget.id);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewEmployee(id: widget.id,)));
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        )
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
