import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/styletextformfield.dart';

class FormSingIn extends StatefulWidget {
  const FormSingIn({Key? key}) : super(key: key);

  @override
  State<FormSingIn> createState() => _FormSingInState();
}

class _FormSingInState extends State<FormSingIn> {
  //form key
  final forKeyIn = GlobalKey<FormState>();

  //editing controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // variable to obscureText
  bool passWordVisible = true;

  // Hide and show password
  Widget Vpass() {
    return IconButton(
      icon: Icon(
        passWordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          passWordVisible = !passWordVisible;
        });
      },
      color: bluee,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forKeyIn,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyleTextFormField(
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    formFieldValidator: (value) {
                      if (value!.isNotEmpty && value.length > 4) {
                        return null;
                      } else if (value.length < 4 && value.isNotEmpty) {
                        return "your username is that short";
                      } else if (value.isEmpty) {
                        return "username required";
                      }
                      return null;
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    hintText: "Enter Username",
                    textInputType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                StyleTextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    formFieldValidator: (value) {
                      if (value!.isNotEmpty && value.length > 6) {
                        return null;
                      } else if (value.length < 6 && value.isNotEmpty) {
                        return "your password must be lager than characters";
                      } else {
                        return "password required";
                      }
                    },
                    obscuretext: passWordVisible,
                    icon: Vpass(),
                    hintText: "Enter Password",
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('signup');
                  },
                  child: const Text(
                    "Create Account ? ",
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: orangee,
                    shape: const CircleBorder(),
                  ),
                  child: IconButton(
                      onPressed: () async {
                        if (forKeyIn.currentState!.validate()) {
                          singin();
                        }
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map user = {};
  String type = "";
  String urlU = "";
  bool disabled = false;

  // Create function Api
  Future<void> singin() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      http.Response responseCheck =
          await http.post(Uri.parse("http://mobile.test:400/api/login"),
              body: ({
                'username': usernameController.text,
                'password': passwordController.text,
              }));
      http.Response responseU = await http.get(Uri.parse(urlU));
      if (responseU.statusCode == 200) {
        setState(() {
          user = jsonDecode(responseU.body);
          type = user['type'];
          disabled = user['disabled'];
        });
      }
      if (responseCheck.statusCode == 200 && type == "client") {
        Navigator.of(context).pushReplacementNamed('mainscreen');
      } else if (responseCheck.statusCode == 200 &&
          type == "sale center" &&
          disabled == false) {
        Navigator.of(context).pushReplacementNamed("centerdata");
      }
      else if (responseCheck.statusCode == 200 &&
          type == "sale center" &&
          disabled == true) {
        Navigator.of(context).pushReplacementNamed('salcenter');
      } else if (responseCheck.statusCode == 200 &&
          type == "maintenance center" &&
          disabled == true) {
        // Navigator.of(context).pushReplacementNamed('screen_maintenance_center');
      }else if (responseCheck.statusCode == 200 &&
          type == "maintenance center" &&
          disabled == false) {
         Navigator.of(context).pushReplacementNamed("centerdata");
      } else if (responseCheck.statusCode == 200 && type == "s_and_m_center"&&disabled==true) {
        // Navigator.of(context).pushReplacementNamed('screen_s_and_m_center');
      }else if (responseCheck.statusCode == 200 && type == "s_and_m_center"&&disabled==false) {
        Navigator.of(context).pushReplacementNamed("centerdata");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Not Allow")));
      }
    }
  }
}
