import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_project_manage_app/widgets/loading_indicator.dart';

enum LOADINGSTATUS {
  loading,
  loaded,
  none,
}

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? background;
  final String? title;
  final Icon? icon;
  final LOADINGSTATUS loadingstatus;
  const AppButton({
    super.key,
    this.onTap,
    this.background,
    this.title,
    this.icon,
    this.loadingstatus = LOADINGSTATUS.loaded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Container(
            width: 130,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: background ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 2.0,
                color: Colors.grey,
              ),
            ),
            child: loadingstatus == LOADINGSTATUS.loading
                ? const LoadingIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null)
                        Icon(
                          Icons.add,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        title ?? "Add New",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
