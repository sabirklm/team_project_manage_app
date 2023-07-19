import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar getSnackBar({String? message, Icon? icon, Color? bgColor}) {
  var width = message?.length ?? 1;
  return SnackBar(
    width: width * 10,
    content: Row(
      children: [
        if (icon != null) icon,
        // const Icon(
        //   Icons.check_circle_outline,
        //   color: Colors.white,
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              message ?? "",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    ),
    //margin: EdgeInsets.only(right: 320, left: 320, bottom: 32),
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
    backgroundColor: bgColor ?? Colors.red,
    behavior: SnackBarBehavior.floating,
    elevation: 3,
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        4,
      ),
    ),
  );
}

showErrorSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(getSnackBar(message: "Somethings wents wrong. "));
}

showSuccessSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    getSnackBar(
      message: "Successfully completed.",
      bgColor: Colors.green,
    ),
  );
}
