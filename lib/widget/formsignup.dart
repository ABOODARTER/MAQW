import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'package:maqw/widget/styletextformfield.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({Key? key}) : super(key: key);

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  // key
  final forkeyup = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValid = true;

  //for loader
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: forkeyup,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Container(

              child: Column(
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
                      height: 10,
                    ),
                    StyleTextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        formFieldValidator: (value) {
                          isValid =
                              EmailValidator.validate(emailController.text);
                          if (emailController.text.isEmpty) {
                            return "email required";
                          } else if (!isValid) {
                            return "Enter a Valid Email";
                          }
                          return null;
                        },
                        icon: const Icon(
                          Icons.email,
                          size: 25,
                        ),
                        hintText: "Enter Email",
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 10,
                    ),
                    StyleTextFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.done,
                        formFieldValidator: (value) {
                          if (value!.isNotEmpty && value.length > 4) {
                            return null;
                          } else if (value.length < 4 && value.isNotEmpty) {
                            return "your name is that short";
                          } else if (value.isEmpty) {
                            return "name required";
                          }
                          return null;
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 25,
                        ),
                        hintText: "Enter Name",
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 10,
                    ),
                    StyleTextFormField(
                        controller: passwordController,
                        textInputAction: TextInputAction.done,
                        formFieldValidator: (value) {
                          if (value!.isNotEmpty && value.length > 8) {
                            return null;
                          } else if (value.length < 8 && value.isNotEmpty) {
                            return "your password is that short";
                          } else if (value.isEmpty) {
                            return "password required";
                          }
                          return null;
                        },
                        icon: const Icon(
                          Icons.password,
                          size: 25,
                        ),
                        hintText: "Enter password",
                        textInputType: TextInputType.visiblePassword),
                    const SizedBox(
                      height: 10,
                    ),
                    StyleTextFormField(
                        controller: phoneNumberController,
                        textInputAction: TextInputAction.done,
                        formFieldValidator: (value) {
                          if (value!.isNotEmpty && value.length == 10) {
                            return null;
                          } else if (value.length < 10 || value.length > 10) {
                            return "your phone number must be only ten characters";
                          } else if (value.isEmpty) {
                            return "phone number required";
                          }
                          return null;
                        },
                        icon: const Icon(
                          Icons.phone,
                          size: 25,
                        ),
                        hintText: "Enter Phone number",
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height:10,
                    ),
                    !loading
                        ? Container(
                            decoration: ShapeDecoration(
                              color: orangee,
                              shape: const CircleBorder(),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  try {
                                    if (forkeyup.currentState?.validate() ??
                                        false) signup();
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(
                                            content: Text(e.toString())));
                                  }
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                )))
                        : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //         decoration: ShapeDecoration(
                    //           color: orangee,
                    //           shape: const CircleBorder(),
                    //         ),
                    //         child: IconButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pushReplacementNamed('signin');
                    //             },
                    //             icon: const Icon(
                    //               Icons.keyboard_arrow_left_rounded,
                    //               color: Colors.white,
                    //             ))),
                    //     const SizedBox(
                    //       width: 70,
                    //     ),
                    //     Container(
                    //         decoration: ShapeDecoration(
                    //           color: orangee,
                    //           shape: const CircleBorder(),
                    //         ),
                    //         child: IconButton(
                    //             onPressed: () {
                    //               if (forkeyup.currentState!.validate()) {
                    //                 signup();
                    //                 Navigator.of(context)
                    //                     .pushReplacementNamed('signup1');
                    //               }
                    //             },
                    //             icon: const Icon(
                    //               Icons.keyboard_arrow_right_rounded,
                    //               color: Colors.white,
                    //             ))),
                    //   ],
                    // )
                  ]),
            ),
          ),
        );
  }

  // Function api Sign up
  Future<void> signup() async {
    setState((){
      loading = true;
    });
    String Url = "http://10.2.0.2:43026/api/register";
    var headers = {'Accept': 'application/json'};
    print(emailController.text);
    Map MyData = {
      'user_name': usernameController.text,
      'email': emailController.text,
      'name': nameController.text,
      'password': passwordController.text,
      'phone_number': phoneNumberController.text,
    };
    print(emailController.text);
    http.Response response =
        await http.post(Uri.parse(Url), body: MyData, headers: headers);
    print(response.body);
    Map responseMap = jsonDecode(response.body);
    if (response.statusCode == 200 ) {
      setState((){
        loading = false;
      });
      Navigator.of(context).pushReplacementNamed('mainScreen');
    } else {
      setState((){
        loading = false;
      });
      if(responseMap['message'].toString().isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    responseMap['message'].toString() + "\n" + responseMap['errors'].toString())));
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('errors ')));
      }
    }
  }
}
