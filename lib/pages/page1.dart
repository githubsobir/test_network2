import 'package:flutter/material.dart';
import 'package:test_network2/models/emp_one.dart';
import 'package:test_network2/models/employee.dart';
import 'package:test_network2/services/httpnetwork.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Employee empOne;
  String a;

  String b = "con";
  String a1 = "try";

  String b1 = "again";

  void getOne() async {
    print("1><><><><><><>");
    b = await HttpNetwork.getAllMethod(
        HttpNetwork.getOneApiUrl, HttpNetwork.empPrams());
    showGetOne(b);
  }

  void showGetOne(String message) {
    EmpOne empOne1 = HttpNetwork.parseEmpOne(message);
    setState(() {
      empOne = empOne1.data;
      a1 = empOne.employee_name + "(${empOne.employee_age})";
      b1 = "${empOne.employee_salary} \$";
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    getOne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get one"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            a1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            b1,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Text("${empOne.employee_salary + " \$"}"),
        ],
      )),
    );
  }
}
