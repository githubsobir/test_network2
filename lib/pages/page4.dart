import 'package:flutter/material.dart';
import 'package:test_network2/services/httpnetwork.dart';

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String a;

  String b = "con";
  String a1 = "try";
  String b1 = "again";

  void getOne() async {

    b = await HttpNetwork.deleteAllMethod(
        HttpNetwork.deleteAllApiUrl, HttpNetwork.empPrams());
    showGetOne(b);
  }

  void showGetOne(String message) {
    var empOne1 = HttpNetwork.parseEmpOne(message);
    setState(() {
      a1 = empOne1.message;
    });
  }

  @override
  
  void initState() {
    // TODO: implement initState
    getOne();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("delete"),
        backgroundColor: Colors.brown,
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
