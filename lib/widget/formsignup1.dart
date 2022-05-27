import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormSignUp1 extends StatefulWidget {
  const FormSignUp1({Key? key}) : super(key: key);

  @override
  State<FormSignUp1> createState() => _FormSignUp1State();
}

class _FormSignUp1State extends State<FormSignUp1> {
  final forkeyup1 = GlobalKey<FormState>();

  //editing controller
  final TextEditingController phoneController =  TextEditingController();
  final TextEditingController passwordController =  TextEditingController();

  // variable to obscureText
  bool passwordvisible = false;

  // Hide and show password
  Widget Vpass() {
    return IconButton(
      icon: Icon(
        passwordvisible ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          passwordvisible = !passwordvisible;
          print("we");
        });
      },
      color: bluee,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: forkeyup1,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "value required";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    iconColor: Colors.blue,
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 25,
                    ),
                    hintText: "Enter Phone",
                    hintStyle: Theme.of(context).textTheme.headline1,
                    border: Theme.of(context).inputDecorationTheme.border,
                  ),
                  keyboardType: TextInputType.phone,
                ),
            const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 6) {
                      return null;
                    } else if (value.length < 6 && value.isNotEmpty) {
                      return "your password must be lager than characters";
                    } else {
                      return "password required";
                    }
                  },
                  obscureText: passwordvisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    iconColor: Colors.blue,
                    suffixIcon: Vpass(),
                    hintText: "Enter Password",
                    hintStyle: Theme.of(context).textTheme.headline1,
                    border: Theme.of(context).inputDecorationTheme.border,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: ShapeDecoration(
                          color: orangee,
                          shape: const CircleBorder(),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('signup');
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Colors.white,
                            ))),
                    const SizedBox(
                      width: 70,
                    ),
                    Container(
                        decoration: ShapeDecoration(
                          color: orangee,
                          shape: const CircleBorder(),
                        ),
                        child: IconButton(
                            onPressed: () {
                              if (forkeyup1.currentState!.validate()) {
                                signUp1();
                                Navigator.of(context).pushNamed('checkemail');
                              }
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                            ))),
                  ],
                )
              ],
            )));

  }
  // Create Function api Sign up
  Future<void>signUp1() async{
    Map myData={
      'phone':phoneController.text,
      'password':passwordController.text,
    };
    http.Response response= await http.post(Uri.parse(""),body: myData);
    var data = jsonEncode(response.body);
}}
