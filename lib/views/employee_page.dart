import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_project_manage_app/controllers/employee_controller.dart';
import 'package:team_project_manage_app/views/sprint_page.dart';
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
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              width: 180,
              // margin: const EdgeInsets.only(
              //     left: 16, right: 16, top: 16, bottom: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/logos/Union.png",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ...List.generate(
                    4,
                    (index) => InkWell(
                      onTap: () {
                        Get.to(SprintPage());
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: index == 1
                              ? Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.4)
                              : null,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.abc_sharp,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Google ${index + 1}",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
