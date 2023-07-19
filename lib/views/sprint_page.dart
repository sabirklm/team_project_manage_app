import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project_manage_app/controllers/sprint_controller.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';

import '../widgets/sprint_card.dart';

class SprintPage extends StatelessWidget {
  const SprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Get.put(SprintController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ...List.generate(
                    spc.issues.length,
                    (index) => SprintCard(
                      issue: spc.issues[index],
                      onPressedEdit: () {
                        spc.openSprintForm(context);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      AppButton(
                        onTap: () {
                          spc.openSprintForm(context);
                        },
                        icon: const Icon(
                          Icons.add,
                        ),
                        title: "Add New",
                        background: Colors.blueAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
