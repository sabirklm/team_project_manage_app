import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management_app_service/models/issue.dart';

class SprintCard extends StatelessWidget {
  final Issue issue;

  final void Function()? onPressedEdit;
  const SprintCard({
    super.key,
    this.onPressedEdit,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 3.0,
          color: Colors.grey.shade100,
        ),
      ),
      child: width < 620
          ? Column(
              children: _getItems(context),
            )
          : Row(
              children: _getItems(context),
            ),
    );
  }

  List<Widget> _getItems(BuildContext context) {
    return [
      const SizedBox(
        width: 8,
      ),
      SizedBox(
        width: 420,
        child: Tooltip(
          message: issue.title ?? "",
          child: Text(
            issue.title ?? "Creating the new attendance management system.",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        child: Text(
          issue.progress ?? "TODO",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Container(
        width: 120,
        color: Theme.of(context).primaryColor.withGreen(1),
        padding: const EdgeInsets.all(8.0),
        child: Tooltip(
          message: issue.assignee?['name'] ?? "" ,
          child: Text(
            issue.assignee?['name'] ?? "Assignee",
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      const Spacer(
        flex: 3,
      ),
      IconButton(
        onPressed: onPressedEdit,
        icon: const Icon(
          Icons.edit,
        ),
      ),
    ];
  }
}
