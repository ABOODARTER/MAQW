import 'package:flutter/material.dart';
import 'package:maqw/widget/formsignup1.dart';
import 'package:maqw/main.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/sign.jpg',
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      margin: const EdgeInsets.only(
                        bottom: 10,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 140,
                              top: 20,
                            ),
                            child: Text(
                              'Please Sign up',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const FormSignUp1(),
                        ],
                      ),
                    ),
                  ]),
            ]),
          ),
        ),
      ),
    );
  }
}
