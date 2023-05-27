import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:management_app_service/models/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  const EmployeeCard({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      width: 340,
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.dividerColor.withOpacity(0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  border: Border.all(
                    width: 2.0,
                    color: theme.dividerColor,
                  ),
                ),
                child: Image.asset(
                  "assets/logos/Union.png",
                  width: 55,
                  height: 55,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${employee.name} ".capitalizeFirst ?? "",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${employee.email} ",
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "${employee.phoneNumber} ",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${employee.position} ",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
