import 'package:flutter/material.dart';
import 'package:maqw/widget/formsingin.dart';
import 'package:maqw/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:Center(
          child:SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                  child: Column(
                      children: [
                        //image
                        Image.asset(
                          'assets/images/sign.jpg',
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: BoxFit.contain,
                        ),
                        //container blue
                        Container(
                          width: 412,
                          height: MediaQuery.of(context).size.height * 0.5,
                          margin: const EdgeInsets.only(
                            bottom: 40,
                          ),
                          decoration: BoxDecoration(
                            color: bluee,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(70),
                            ),
                          ),
                          child:  SingleChildScrollView(
                            // Column in Container blue
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Padding to Text Please Sign in
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 140,
                                    top: 20,
                                  ),
                                  //please sign in
                                  child: Text(
                                    'Please Sign In',
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const FormSingIn(),

                              ],
                            ),
                          ),

                        ),
                      ]

                  ),





                ),

            ],

          )))));
  }
}
