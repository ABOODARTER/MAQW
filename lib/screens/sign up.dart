import 'package:flutter/material.dart';
import 'package:maqw/widget/formsignup.dart';
import 'package:maqw/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Stack(children: [
                Center(
                  child: Image.asset(
                    'assets/images/sign.jpg',
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.contain,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 220,
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: bluee,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 140,
                            top: 20,
                          ),
                          child: Text(
                            'Please Sign Up',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const FormSignUp(),
                      ]),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
        ));
  }
}
