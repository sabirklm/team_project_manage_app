import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_project_manage_app/controllers/employee_controller.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';
import 'package:team_project_manage_app/widgets/app_input_field.dart';

class EmployeeAddForm extends StatelessWidget {
  const EmployeeAddForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EmployeeController employeeController = Get.find();
    var width = MediaQuery.of(context).size.width;
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: width * .45,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Obx(() {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add New Employee ",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      employeeController.closeEmployeeAddForm();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  AppInputField(
                    heading: "FULL NAME",
                    hintText: 'SABIR MONDAL',
                    controller: employeeController.name,
                  ),
                  AppInputField(
                    heading: "EMAIL",
                    hintText: 'mondal.sabir.com97@gmail.com',
                    controller: employeeController.email,
                  ),
                  AppInputField(
                    heading: "PHONE NUMBER",
                    hintText: '8617418378 ',
                    controller: employeeController.phone,
                  ),
                  AppInputField(
                    heading: "POSITION",
                    hintText: 'Associate Software Developer',
                    controller: employeeController.position,
                  ),
                  AppInputField(
                    heading: "DEPARTMENT",
                    hintText: 'Information Technology',
                    controller: employeeController.department,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                AppButton(
                  onTap: () {},
                  title: "Cancel",
                ),
                AppButton(
                  onTap: () {
                    //TODO:
                    employeeController.addEmployee();
                  },
                  loadingstatus: employeeController.employeeAddingStatus,
                  title: "Save",
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
