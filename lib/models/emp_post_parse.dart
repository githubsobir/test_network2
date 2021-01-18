import 'employee.dart';

class EmpOnePost {
  dynamic status;
  dynamic message;
  EmployeePostParse data;

  EmpOnePost.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = EmployeePostParse.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };

}
class EmployeePostParse {

  dynamic id;
  dynamic  employee_name;
  dynamic employee_salary;
  dynamic employee_age;
  dynamic profile_image;

  EmployeePostParse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        employee_name = json["name"],
        employee_salary = json["salary"],
        employee_age = json["age"];

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": employee_name,
    "salary": employee_salary,
    "age": employee_age,
  };
}
