import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/styletextformfield.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FormSingIn extends StatefulWidget {
  const FormSingIn({Key? key}) : super(key: key);

  @override
  State<FormSingIn> createState() => _FormSingInState();
}

class _FormSingInState extends State<FormSingIn> {
  //form key
  final forKeyin = GlobalKey<FormState>();

  //editing controller
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // variable to obscureText
  bool passwordvisible = true;

  // Hide and show password
  Widget Vpass() {
    return IconButton(
      icon: Icon(
        passwordvisible ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          passwordvisible = !passwordvisible;
        });
      },
      color: bluee,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forKeyin,
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
                    obscuretext: passwordvisible,
                    icon: Vpass(),
                    hintText: "Enter Password",
                    textInputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                //create account
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
                    child: Builder(
                      builder: (ctx) => IconButton(
                          onPressed: () async {
                            // final SharedPreferences _pre =
                            //     await SharedPreferences.getInstance();
                            // _pre.setString(
                            //     "u", usernameController.text.toString());
                            // _pre.setString(
                            //     "p", passwordController.text.toString());
                            // Text(
                            //     "username:${_pre.get("u")} password:${_pre.get("p")}");
                            if (forKeyin.currentState!.validate()) {
                              singin();
                            }
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                          )),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Map user={};
  String type="";
  String urlu="";
  // Create function Api
  Future<void> singin() async {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      http.Response response = await http.post(Uri.parse(""),
          body: ({
            'username': usernameController.text,
            'password': passwordController.text,
          }));
      http.Response responseu=await http.get(Uri.parse(urlu));
      if(responseu.statusCode==200){
        setState(() {
          user=jsonDecode(responseu.body);
          type=user['type'];
        });
      }
      if (response.statusCode == 200 && type == "client") {
        Navigator.of(context).pushReplacementNamed('mainscreen');
      } else if (response.statusCode == 200 && type == "sale center") {
        // Navigator.of(context).pushReplacementNamed('screensalecenter');
      } else if (response.statusCode == 200 && type == "maintenance center") {
        // Navigator.of(context).pushReplacementNamed('screenmaintenancecenter');
      } else if (response.statusCode == 200 && type == "sandmcenter") {
        // Navigator.of(context).pushReplacementNamed('screensandmcenter');
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Not Allowd")));
      }
    }
  }
}
