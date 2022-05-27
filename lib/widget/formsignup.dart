import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
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
  final TextEditingController userController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: forkeyup,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: userController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isNotEmpty && value.length > 4) {
                  return null;
                } else if (value.length < 4 && value.isNotEmpty) {
                  return "your username is that short";
                } else if (value.isEmpty) {
                  return "username required";
                }
                return null;
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
                  Icons.person,
                  size: 25,
                ),
                hintText: "Enter Username",
                hintStyle: Theme.of(context).textTheme.headline1,
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (value){
                isValid = EmailValidator.validate(emailController.text);
                if (emailController.text.isEmpty) {
                  return "email required";
                } else if (!isValid) {
                  return "Enter a Valid Email";
                }
                return null;
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
                  Icons.email,
                  size: 25,
                ),
                hintText: "Enter Email",
                hintStyle: Theme.of(context).textTheme.headline1,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isNotEmpty && value.length > 4) {
                  return null;
                } else if (value.length < 4 && value.isNotEmpty) {
                  return "your name is that short";
                } else if (value.isEmpty) {
                  return "name required";
                }
                return null;
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
                  Icons.edit,
                  size: 25,
                ),
                hintText: "Enter name",
                hintStyle: Theme.of(context).textTheme.headline1,
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 50,
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
                          Navigator.of(context).pushReplacementNamed('signin');
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
                          if (forkeyup.currentState!.validate()) {
                            signup();
                            Navigator.of(context)
                                .pushReplacementNamed('signup1');
                          }
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                        ))),
              ],
            )
          ]),
        ));
  }

  // Create Function api Sign up
   Future<void>signup() async{
    String Url="";
    Map MyData={
      'username':userController.text,
      'email':emailController.text,
      'name':nameController.text,
    };
    http.Response response= await http.post(Uri.parse(Url),body: MyData);
    var data = jsonEncode(response.body);

}
}
