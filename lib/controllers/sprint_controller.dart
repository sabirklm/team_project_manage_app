import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:management_app_service/models/issue.dart';
import '../widgets/application_snackbar.dart';
import '../widgets/issue_form.dart';

enum CRUDMODE {
  create,
  read,
  update,
  delete,
  translate,
}

class SprintController extends GetxController {
  final issues = <Issue>[].obs;
  final desc = TextEditingController();
  final progress = TextEditingController();
  final assignee = TextEditingController();
  final progresess = <String>['TODO', 'IN-PROGRESS', 'COMPLETED'].obs;
  final _sprintCount = 10.obs;

  int get sprintCount => _sprintCount.value;

  increamentSprintCount() {
    _sprintCount.value = _sprintCount.value + 1;
  }

  saveIssue(BuildContext context) async {
    //TODO:ISSUE
    issues.add(
      Issue(
        title: desc.text,
        assignee: {'name': assignee.text},
        progress: 'TODO',
      ),
    );
    showSuccessSnackbar(context);
  }

  translateIssue() async {
    //TODO:Translate
  }

  void openSprintForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const IssueForm();
      },
    );
  }
}
