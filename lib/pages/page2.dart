import 'package:flutter/material.dart';
import 'package:test_network2/models/emp_one.dart';
import 'package:test_network2/models/emp_post.dart';
import 'package:test_network2/models/emp_post_parse.dart';
import 'package:test_network2/models/employee.dart';
import 'package:test_network2/services/httpnetwork.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  EmployeePostParse empOne;
  String a;

  String b = "con";
  String a1 = "try";

  String b1 = "again";

  void getOne() async {
    print("1><><><><><><>");
    EmployeePost employeePost = new EmployeePost(employee_name: "test", employee_age: "123", employee_salary: "5000" );
    b = await HttpNetwork.postAllMethod(
        HttpNetwork.postAllApiUrl, HttpNetwork.postParams(employeePost));
    print("--->>>>>. "+b);
    showGetOne(b);
  }

  void showGetOne(String message) {
    EmpOnePost empOne1 = HttpNetwork.parseEmpOnePost(message);
    setState(() {
      empOne = empOne1.data;
      a1 = empOne.employee_name + " ${empOne.employee_age} " + " ${empOne.employee_salary} \$";
      b1 = "${empOne1.message}";
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
        title: Text("create"),
        backgroundColor: Colors.yellow,
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
