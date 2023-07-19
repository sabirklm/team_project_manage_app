import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_project_manage_app/controllers/authentication_controller.dart';
import 'package:team_project_manage_app/widgets/application_snackbar.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';
import 'package:team_project_manage_app/widgets/app_input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final ac = Get.put(AuthenticationController());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Obx(() {
        return Center(
          // alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  alignment: Alignment.center,
                  width: 430,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logos/Union.png",
                        width: 100,
                        height: 100,
                      ),
                      AppInputField(
                        heading: 'EMAIL',
                        controller: TextEditingController(),
                        hintText: "example@email.com",
                      ),
                      AppInputField(
                        heading: 'PASSWORD',
                        controller: TextEditingController(),
                        hintText: "*********",
                      ),
                      AppButton(
                        onTap: () {
                          ac.loginUser(context);
                        },
                        title: "Login",
                        loadingstatus:
                            ac.authStatus == AuthStatus.authenticating
                                ? LOADINGSTATUS.loading
                                : LOADINGSTATUS.loaded,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              showErrorSnackbar(context);
                            },
                            icon: const Icon(
                              Icons.apple,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showErrorSnackbar(context);
                            },
                            icon: const Icon(
                              Icons.facebook,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
