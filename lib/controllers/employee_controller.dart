import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app_service/models/employee.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';

class EmployeeController extends GetxController {
  final employeeScrollController = ScrollController();
  final _isEmployeeLoading = false.obs;
  final _employees = <Employee>[].obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final position = TextEditingController();
  final department = TextEditingController();
  final _employeedAddingStatus = LOADINGSTATUS.none.obs;

  @override
  void onInit() {
    _loadEmployees();
    employeeScrollController.addListener(_scrollListener);
    super.onInit();
  }

  bool get employeeLoadingStatus => _isEmployeeLoading.value;
  LOADINGSTATUS get employeeAddingStatus => _employeedAddingStatus.value;
  List<Employee> getEmployees() => _employees;
  Employee getEmployee(int index) => _employees[index];
  int get totalEmployee => _employees.length;
  void _scrollListener() async {
    if (employeeScrollController.offset >=
            employeeScrollController.position.maxScrollExtent &&
        !employeeScrollController.position.outOfRange) {
      if (!_isEmployeeLoading.value) {
        // _loadEmployees();
      }
    }
  }

  setEmployeeLoadingStatus(bool status) {
    _isEmployeeLoading.value = status;
  }

  void _loadEmployees() async {
    setEmployeeLoadingStatus(true);
    await Future.delayed(const Duration(seconds: 1));
    _employees.addAll(
      [
        ...List.generate(
          1,
          (index) => Employee(
            id: "id${index + 1}",
            name: "name ${index + 1}",
            email: "email${index + 1}",
            phoneNumber: "phoneNumber${index + 1}",
            position: "Associate Software Developer",
            department: "Information Technology",
            salary: index + 1,
          ),
        ),
      ],
    );

    setEmployeeLoadingStatus(false);
    await Future.delayed(const Duration(seconds: 2));
  }

  void openEmployeeAddForm() {
    var currentState = scaffoldKey.currentState;
    if (currentState != null) {
      currentState.openEndDrawer();
    }
  }

  void closeEmployeeAddForm() {
    var currentState = scaffoldKey.currentState;
    if (currentState != null) {
      currentState.closeDrawer();
    }
  }

  void addEmployee() async {
    _employeedAddingStatus.value = LOADINGSTATUS.loading;
    await Future.delayed(const Duration(seconds: 3));

    _employees.insert(
      0,
      Employee(
        id: "${name.text}",
        name: name.text,
        email: email.text,
        phoneNumber: phone.text,
        position: position.text,
        department: department.text,
        salary: 0.0,
      ),
    );
    _employeedAddingStatus.value = LOADINGSTATUS.loaded;
  }
}
