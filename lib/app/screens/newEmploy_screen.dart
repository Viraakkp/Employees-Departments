import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/models/employee_model.dart';
import '../../core/services/employee_network_helper.dart';

class NewEmployee extends StatefulWidget {
  final String? id;
  const NewEmployee({Key? key, required this.id}) : super(key: key);

  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final TextEditingController _empNoController = TextEditingController();
  final TextEditingController _empNameController = TextEditingController();
  final TextEditingController _addLn1Controller = TextEditingController();
  final TextEditingController _addLn2Controller = TextEditingController();
  final TextEditingController _addLn3Controller = TextEditingController();
  final TextEditingController _deptCodeController = TextEditingController();
  final TextEditingController _basicSalaryController = TextEditingController();

  late Future<Employee> _futureEmployee;

  late bool? saveButtonOn;
  late DateTime _dateOfJoin;
  late DateTime _dateOfBirth;
  late String _dateOfJoinString;
  late String _dateOfBirthString;
  late bool _isActive;

  late bool? _onceDateLoaded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureEmployee = getEmployee((widget.id) ?? "New");

    if (widget.id != null) {
      _onceDateLoaded = false;
    }

    _dateOfBirth = DateTime.now();
    _dateOfJoin = DateTime.now();
    _dateOfBirthString = _dateOfBirth.toString();
    _dateOfJoinString = _dateOfJoin.toString();
    saveButtonOn = true;
    _isActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.id == null ? "New Employee" : "Update Employee"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FutureBuilder<Employee>(
            future: _futureEmployee,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                if (_onceDateLoaded == false) {
                  Employee? _employee = snapshot.data;
                  _empNoController.text = (_employee?.empNo)!;
                  _empNameController.text = (_employee?.empName)!;
                  _addLn1Controller.text = (_employee?.empAddressLine1)!;
                  _addLn2Controller.text = (_employee?.empAddressLine2)!;
                  _addLn3Controller.text = (_employee?.empAddressLine3)!;
                  _deptCodeController.text = (_employee?.departmentCode)!;
                  _basicSalaryController.text =
                      (_employee?.basicSalary)!.toString();
                  _dateOfJoin = DateTime(
                      int.parse((_employee?.dateOfJoin)!.substring(0, 4)),
                      int.parse((_employee?.dateOfJoin)!.substring(5, 7)),
                      int.parse((_employee?.dateOfJoin)!.substring(8, 10)));
                  _dateOfBirth = DateTime(
                      int.parse((_employee?.dateOfBirth)!.substring(0, 4)),
                      int.parse((_employee?.dateOfBirth)!.substring(5, 7)),
                      int.parse((_employee?.dateOfBirth)!.substring(8, 10)));
                  _dateOfJoinString = _dateOfJoin.toString();
                  _dateOfBirthString = _dateOfBirth.toString();
                  _isActive = (_employee?.isActive)!;
                  _onceDateLoaded = true;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Employee number:'),
                    TextField(
                      controller: _empNoController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee name:'),
                    TextField(
                      controller: _empNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 1:'),
                    TextField(
                      controller: _addLn1Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 2:'),
                    TextField(
                      controller: _addLn2Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 3:'),
                    TextField(
                      controller: _addLn3Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Department code:'),
                    TextField(
                      controller: _deptCodeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Date of join:'),
                    RaisedButton(
                      color: Colors.blue[100],
                      textColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        showDatePicker(
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040),
                          initialDate:
                              widget.id != null ? _dateOfJoin : DateTime.now(),
                          context: context,
                        ).then((date) {
                          print(date);
                          int? year = date?.year;
                          int? month = date?.month;
                          int? day = date?.day;
                          setState(() {
                            _dateOfJoin = DateTime(year!, month!, day!);
                            _dateOfJoinString = _dateOfJoin.toString();
                          });
                        });
                      },
                      child: Text(
                        _dateOfJoinString,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const Text('Date of birth:'),
                    FlatButton(
                      color: Colors.blue[100],
                      textColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        showDatePicker(
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2040),
                          initialDate:
                              widget.id != null ? _dateOfBirth : DateTime.now(),
                          context: context,
                        ).then((date) {
                          print(date);
                          int? year = date?.year;
                          int? month = date?.month;
                          int? day = date?.day;
                          setState(() {
                            _dateOfBirth = DateTime(year!, month!, day!);
                            _dateOfBirthString = _dateOfBirth.toString();
                          });
                        });
                      },
                      child: Text(
                        _dateOfBirthString,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const Text('Basic salary:'),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _basicSalaryController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Active or Inactive'),
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                            value: _isActive,
                            onChanged: (val) {
                              setState(() {
                                _isActive = val!;
                              });
                            }),
                      ],
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        await updateEmployee(
                            _empNoController.text,
                            _empNameController.text,
                            _addLn1Controller.text,
                            _addLn2Controller.text,
                            _addLn3Controller.text,
                            _deptCodeController.text,
                            _dateOfJoinString,
                            _dateOfBirthString,
                            double.parse(_basicSalaryController.text),
                            true);

                        // Navigator.pop(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              } else if (!snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Employee number:'),
                    TextField(
                      controller: _empNoController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee name:'),
                    TextField(
                      controller: _empNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 1:'),
                    TextField(
                      controller: _addLn1Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 2:'),
                    TextField(
                      controller: _addLn2Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Employee address line 3:'),
                    TextField(
                      controller: _addLn3Controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Department code:'),
                    TextField(
                      controller: _deptCodeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    const Text('Date of join:'),
                    RaisedButton(
                      color: Colors.blue[100],
                      textColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        showDatePicker(
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040),
                          initialDate:
                              widget.id != null ? _dateOfJoin : DateTime.now(),
                          context: context,
                        ).then((date) {
                          print(date);
                          int? year = date?.year;
                          int? month = date?.month;
                          int? day = date?.day;
                          setState(() {
                            _dateOfJoin = DateTime(year!, month!, day!);
                            _dateOfJoinString = _dateOfJoin.toString();
                          });
                        });
                      },
                      child: Text(
                        _dateOfJoinString,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const Text('Date of birth:'),
                    FlatButton(
                      color: Colors.blue[100],
                      textColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        showDatePicker(
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2040),
                          initialDate:
                              widget.id != null ? _dateOfBirth : DateTime.now(),
                          context: context,
                        ).then((date) {
                          print(date);
                          int? year = date?.year;
                          int? month = date?.month;
                          int? day = date?.day;
                          setState(() {
                            _dateOfBirth = DateTime(year!, month!, day!);
                            _dateOfBirthString = _dateOfBirth.toString();
                          });
                        });
                      },
                      child: Text(
                        _dateOfBirthString,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const Text('Basic salary:'),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _basicSalaryController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            saveButtonOn = false;
                          });
                        } else if (saveButtonOn == false && val.isNotEmpty) {
                          setState(() {
                            saveButtonOn = true;
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Active or Inactive'),
                        Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                            value: _isActive,
                            onChanged: (val) {
                              setState(() {
                                _isActive = val!;
                              });
                            }),
                      ],
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () async {
                        await createEmployee(
                            _empNoController.text,
                            _empNameController.text,
                            _addLn1Controller.text,
                            _addLn2Controller.text,
                            _addLn3Controller.text,
                            _deptCodeController.text,
                            _dateOfJoinString,
                            _dateOfBirthString,
                            double.parse(_basicSalaryController.text),
                            true);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
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
