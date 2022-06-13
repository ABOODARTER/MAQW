import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                        try {
                          if (forKeyIn.currentState!.validate()) {
                            singin();
                          }
                        } on Exception catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error")));
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
  String roles = "";
  String urlU = "";
  String access_token ="";

  // Create function Api
  Future<void> singin() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {

      http.Response response =
          await http.post(Uri.parse("http://10.2.0.2:52192/api/login"),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer 13e2c5921a25d10095ff69c500de8bd2585fe34987b6186d3e392da6c1b7e1b1'
              },
              body: ({
                'user_name': usernameController.text,
                'password': passwordController.text,
              }));
      // http.Response responseU = await http.get(Uri.parse(urlU));

      Map responseCheck = jsonDecode(response.body);
      print(responseCheck);
      // if (response.statusCode == 200) {
      //   setState(() {
      //     // user = jsonDecode(responseCheck.body);
      //     roles = user['role'];
      //     access_token = user['access_token'];
      //   });
      // }
      if (response.statusCode == 200 && responseCheck['role'] == "5") {
        Navigator.of(context).pushReplacementNamed('mainscreen');
      }
      // else if (responseCheck.statusCode == 200 &&
      //     roles == "2" &&
      //     responseCheck['access_token) {
      //   Navigator.of(context).pushReplacementNamed("centerdata");
      // }
      else if (response.statusCode == 200 && responseCheck['role'].toString() == "3" &&
          responseCheck['access_token'].toString().isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('saleCenter');
      } else if (response.statusCode == 200 && responseCheck['role'] == "2" &&
          responseCheck['access_token'].toString().isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('screen_maintenance_center');
      }
      // else if (responseCheck.statusCode == 200 &&
      //     roles == "maintenance center" &&
      //     access_token == false) {
      //    Navigator.of(context).pushReplacementNamed("centerdata");
      // }
      else if (response.statusCode == 200 && responseCheck['role'] == "4"&&responseCheck['access_token'].toString().isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('screen_s_and_m_center');
      }
      // else if (responseCheck.statusCode == 200 && roles == "s_and_m_center"&&access_token==false) {
      //   Navigator.of(context).pushReplacementNamed("centerdata");
      // }
      else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Not Allow")));
      }
    }
  }
}
