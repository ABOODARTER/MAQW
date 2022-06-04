import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  final codecontroller = TextEditingController();
  final forkeycheck = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
   codecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/checkemail.png',
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.4,
                      ),
                    const  Text(
                        'Email Verificaiton',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const  SizedBox(
                        height: 15,
                      ),
                     const Text(
                        "please enter the 4 digit",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      //text form field
                     Padding(
                        padding:const  EdgeInsets.symmetric(vertical: 15),
                        child: Form(
                          key: forkeycheck,
                          child: TextFormField(
                            controller: codecontroller,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Enter code",
                              hintStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .headline1,

                            ),
                          ),
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(bluee),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                          ),
                        ),
                          onPressed: () {
                            if (forkeycheck.currentState!.validate()) {
                          checkemail();
                              Navigator.of(context).pushNamed('verification');
                            }
                          },
                          child:const Text(
                            "send Verificaiton code",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ]))));
  }

  Future<void> checkemail() async {
    String Url="";
    http.Response response = await http.post(Uri.parse(Url),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
       'code':codecontroller.text,
      }),
    );

    if (response.body == 'email already exists') {

      ScaffoldMessenger.of(context).showSnackBar(
        const  SnackBar(content: Text('Email already exists')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const  SnackBar(content: Text('Verification code has been sent')));
    }
  }
}