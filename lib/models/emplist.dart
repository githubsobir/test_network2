import 'dart:core';

import 'package:test_network2/models/employee.dart';

class EmpList {
  String status;
  String meassage;
  List<Employee> data;

  EmpList.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        meassage = json["message"],
        data =
            List<Employee>.from(json["data"].map((x) => Employee.fromJson(x)));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": meassage,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
