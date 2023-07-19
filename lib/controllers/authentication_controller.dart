// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/employee_page.dart';

enum AuthStatus {
  authenticated,
  authenticating,
  expired,
  failed,
  loggedIn,
  none,
}

class AuthenticationController extends GetxController {
  final _authStatus = AuthStatus.none.obs;
  AuthStatus get authStatus => _authStatus.value;

  loginUser(BuildContext context) async {
    _authStatus.value = AuthStatus.authenticating;
    await Future.delayed(const Duration(seconds: 2));
    _authStatus.value = AuthStatus.authenticated;
    var route = MaterialPageRoute(
      builder: (context) => const EmployeePage(),
    );
    Navigator.push(context, route);
  }
}
