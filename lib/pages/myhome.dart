import 'package:flutter/material.dart';
import 'package:test_network2/models/emp_post.dart';
import 'package:test_network2/pages/page0.dart';
import 'package:test_network2/pages/page1.dart';
import 'package:test_network2/pages/page2.dart';
import 'package:test_network2/pages/page3.dart';
import 'package:test_network2/pages/page4.dart';
import 'package:test_network2/services/httpnetwork.dart';

class MyHome extends StatefulWidget {
  static final String id = "myhome";

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String data;
  int indexPage = 0;
  var pages = [
    Page0(),
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  //Http methods
  //get
  void getHttp() {
    HttpNetwork.getAllMethod(HttpNetwork.getAllApiUrl, HttpNetwork.empPrams())
        .then((value) => {
              print(value),
              showData(value),
            });
  }

  //post
  void postHttp() {
    EmployeePost employeePost = new EmployeePost(
        id: "1",
        employee_name: "faa",
        employee_salary: "1000",
        employee_age: "20",
        profile_image: "image");
    HttpNetwork.postAllMethod(
            HttpNetwork.postAllApiUrl, HttpNetwork.postParams(employeePost))
        .then((value) => {
              print(value),
            });
  }

  showData(String value) {
    setState(() {
      data = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        showUnselectedLabels: true,
        currentIndex: indexPage,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              label: "get all",
              icon: Icon(Icons.api),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              label: "get id",
              icon: Icon(Icons.api),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              label: "create",
              icon: Icon(Icons.api),
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              label: "update",
              icon: Icon(Icons.api),
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              label: "delete",
              icon: Icon(Icons.api),
              backgroundColor: Colors.brown),
        ],
      ),
    );
  }
}
