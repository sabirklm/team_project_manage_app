import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sprint_controller.dart';
import 'app_button.dart';
import 'app_input_field.dart';

class IssueForm extends StatelessWidget {
  const IssueForm({super.key});

  @override
  Widget build(BuildContext context) {
    SprintController spc = Get.find();
    return AlertDialog(
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppInputField(
              controller: spc.desc,
              heading: "Enter Details",
              hintText: "Details of the issue",
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        topLeft: Radius.circular(32),
                      ),
                      color: Colors.grey.shade300,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "TODO",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "IN-PROGRESS",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      color: Colors.blue,
                    ),
                    child: const Text(
                      "COMPLETED",
                    ),
                  ),
                ],
              ),
            ),
            AppInputField(
              controller: spc.assignee,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  onTap: () {
                    Get.back();
                  },
                  title: "Cancel",
                ),
                AppButton(
                  onTap: () {
                    spc.saveIssue(context);
                    Get.back();
                  },
                  title: "Save",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
