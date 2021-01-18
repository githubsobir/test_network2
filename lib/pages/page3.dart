import 'package:flutter/material.dart';
import 'package:test_network2/models/emp_post.dart';
import 'package:test_network2/models/emp_post_parse.dart';
import 'package:test_network2/services/httpnetwork.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  EmployeePostParse empOne;

  String b = "con";
  String a1 = "try";

  String b1 = "again";

  void getOne() async {
    print("1><><><><><><>");
    EmployeePost employeePost = new EmployeePost(
        employee_name: "test", employee_age: "123", employee_salary: "5000");
    b = await HttpNetwork.putAllMethod(
        HttpNetwork.updateAllApiUrl, HttpNetwork.postParams(employeePost));
    print("--->>>>>. " + b);
    showGetOne(b);
  }

  void showGetOne(String message) {
    EmpOnePost empOne1 = HttpNetwork.parseEmpOnePost(message);
    setState(() {

      a1 = empOne1.message;
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
        title: Text("update"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            a1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Text("${empOne.employee_salary + " \$"}"),
        ],
      )),
    );
  }
}
