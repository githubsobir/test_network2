import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart';
import 'package:test_network2/models/emp_one.dart';
import 'package:test_network2/models/emp_post.dart';
import 'package:test_network2/models/emp_post_parse.dart';
import 'package:test_network2/models/emplist.dart';

class HttpNetwork {
  static String baseUrl = "dummy.restapiexample.com";
  static Map<String, String> header = {
    "Content-type": "application/json; charset=UTF-8"
  };
  static String getAllApiUrl = "/api/v1/employees";
  static String getOneApiUrl = "/api/v1/employee/1"; //id
  static String postAllApiUrl = "/api/v1/create";
  static String updateAllApiUrl = "/api/v1/update/21";
  static String deleteAllApiUrl = "/api/v1/delete/2";

  //http methods
  static Future<String> getAllMethod(
      String api, Map<String, String> params) async {
    var uri = Uri.http(baseUrl, api, params);
    var response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //http post
  static Future<String> postAllMethod(
      String api, Map<String, String> params) async {
    var uri = Uri.http(baseUrl, api);
    var response = await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
//http put
  static Future<String> putAllMethod(
      String api, Map<String, String> params) async {
    var uri = Uri.http(baseUrl, api);
    var response = await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
  //http delete
  static Future<String> deleteAllMethod(
      String api, Map<String, String> params) async {
    var uri = Uri.http(baseUrl, api, params);
    var response = await delete(uri, headers: header);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  // http params
  //get
  static Map<String, String> empPrams() {
    Map<String, String> mapss = new Map();
    return mapss;
  }

  //post
  static Map<String, String> postParams(EmployeePost employee) {
    Map<String, String> maps = {
      "name": employee.employee_name,
      "salary": employee.employee_salary,
      "age": employee.employee_age,
    };
    return maps;
  }

//  parse all
  static EmpList parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

//  parse one
  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }
  //  parse one
  static EmpOnePost parseEmpOnePost(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOnePost.fromJson(json);
    return data;
  }
}
