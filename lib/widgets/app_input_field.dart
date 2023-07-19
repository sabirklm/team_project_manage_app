import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputField extends StatelessWidget {
  final String? heading;
  final String? hintText;
  final TextEditingController? controller;
  const AppInputField({
    super.key,
    this.heading,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (heading != null)
            Text(
              heading!,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: hintText,
            ),
          )
        ],
      ),
    );
  }
}
