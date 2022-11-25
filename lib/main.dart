import 'package:employees_in_departments/core/models/department_model.dart';
import 'package:employees_in_departments/core/services/department_network_helper.dart';
import 'package:flutter/material.dart';
import 'app/screens/existingEmployee_screen.dart';
import 'app/screens/newEmploy_screen.dart';
import 'core/models/employee_model.dart';
import 'core/services/employee_network_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '    All Employees'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Employee>> _futureEmployee;
  late Future<List<Department>> _futureDepartment;

  late bool _departmentsDisplayed;

  @override
  void initState() {
    super.initState();
    _futureEmployee = fetchEmployees();
    _futureDepartment = fetchDepartments();
    _departmentsDisplayed = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          FlatButton(
            color: Colors.blue[900],
            onPressed: () {
              setState(() {
                _departmentsDisplayed = !_departmentsDisplayed;
              });
            },
            child: Text(_departmentsDisplayed ? "Employees" : "Departments"),
          )
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: _departmentsDisplayed
            ? FutureBuilder<List<Department>>(
                future: _futureDepartment,
                builder: (context, snap) {
                  print(snap.data);
                  if (snap.hasData &&
                      snap.connectionState == ConnectionState.done) {
                    return ListView.separated(
                        itemCount: (snap.data?.length)!,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text((snap.data?[index].departmentName)!),
                            trailing:
                                Text((snap.data?[index].departmentCode)!),
                          );
                        });
                  } else if (snap.hasError) {
                    return Text('${snap.error}');
                  }

                  return const CircularProgressIndicator();
                },
              )
            : FutureBuilder<List<Employee>>(
                future: _futureEmployee,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return ListView.separated(
                      itemCount: (snapshot.data?.length)!,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text((snapshot.data?[index].empName)!),
                          trailing:
                              Text((snapshot.data?[index].departmentCode)!),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExistingEmployee(
                                          id: (snapshot.data?[index].empNo)!,
                                        )));
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewEmployee(
                        id: null,
                      )));
        },
        tooltip: 'New employee',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
