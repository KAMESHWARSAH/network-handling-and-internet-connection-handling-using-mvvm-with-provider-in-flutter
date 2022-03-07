import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:networ_connection_khendling/users_list/models/users_list_model.dart';
import 'package:networ_connection_khendling/users_list/repo/api_status.dart';

import '../../utils/constants.dart';
class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (SUCCESS == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE,
          errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET,
          errorResponse: 'No Internet          Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET,
          errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(
          code: INVALID_FORMAT,
          errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(
          code: UNKNOWN_ERROR,
          errorResponse: 'Unknown Error');
    }
  }}

