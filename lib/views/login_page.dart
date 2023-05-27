import 'package:flutter/material.dart';
import 'package:team_project_manage_app/views/employee_page.dart';
import 'package:team_project_manage_app/views/home_page.dart';
import 'package:team_project_manage_app/widgets/app_button.dart';
import 'package:team_project_manage_app/widgets/app_input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 420,
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
                      var route = MaterialPageRoute(
                        builder: (context) => const EmployeePage(),
                      );
                      Navigator.push(context, route);
                    },
                    title: "Login",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.apple,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
