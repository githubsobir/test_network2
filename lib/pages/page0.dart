import 'package:flutter/material.dart';
import 'package:test_network2/models/emplist.dart';
import 'package:test_network2/models/employee.dart';
import 'package:test_network2/services/httpnetwork.dart';

class Page0 extends StatefulWidget {
  @override
  _Page0State createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  List<Employee> items = new List();

  void gethttp() {
    HttpNetwork.getAllMethod(HttpNetwork.getAllApiUrl, HttpNetwork.empPrams())
        .then((value) => {
              _showList(value),
            });
  }
  void _showList(String value) {
    EmpList empList = HttpNetwork.parseEmpList(value);
    setState(() {
      items = empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gethttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emp List"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemOfList(items[i]);
          },
        ),
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emp.employee_name + "(" + emp.employee_age.toString() + ")",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            emp.employee_salary.toString() + "\$",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
