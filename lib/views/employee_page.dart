import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project_manage_app/controllers/employee_controller.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';
import 'package:team_project_manage_app/widgets/employee_add_form.dart';
import 'package:team_project_manage_app/widgets/employee_card.dart';
import 'package:team_project_manage_app/widgets/loading_indicator.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ec = Get.put(EmployeeController());
    return Scaffold(
      key: ec.scaffoldKey,
      endDrawer: const EmployeeAddForm(),
      body: Obx(() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(
                  onTap: () {
                    ec.openEmployeeAddForm();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                controller: ec.employeeScrollController,
                children: [
                  Align(
                    alignment: ec.totalEmployee < 5
                        ? Alignment.topLeft
                        : Alignment.center,
                    child: Wrap(
                      children: [
                        if (!ec.employeeLoadingStatus)
                          ...List.generate(
                            ec.totalEmployee,
                            (index) => EmployeeCard(
                              employee: ec.getEmployee(index),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (ec.employeeLoadingStatus) const LoadingIndicator()
          ],
        );
      }),
    );
  }
}
