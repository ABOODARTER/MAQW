import 'package:flutter/material.dart';
import 'package:maqw/main.dart';
import 'package:http/http.dart' as http;


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
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

 // variable to obscureText
 bool passwordvisible = true;

 // Hide and show password
Widget Vpass(){
 return IconButton(
    icon: Icon(
      passwordvisible ? Icons.visibility:Icons.visibility_off,
    ),
    onPressed: () {
      setState(() {
        passwordvisible=!passwordvisible;
      });
    },

    color: bluee,
  );
}
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: forKeyin,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //user name
              TextFormField(
                controller: usernameController,
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
                    borderSide:  const BorderSide(
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
                  border:Theme.of(context).inputDecorationTheme.border,
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 15,
              ),
              //password
              TextFormField(

                style: TextStyle(fontSize:20,),
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
                    borderSide:  const BorderSide(
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

                  suffixIcon: Vpass(),

                  hintText: "Enter Password",
                    hintStyle: Theme.of(context).textTheme.headline1,
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            const  SizedBox(
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
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
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
                    builder: (ctx)=>
                    IconButton(
                        onPressed: ()async {
                          // SharedPreferences _pre= await SharedPreferences.getInstance();
                          // _pre.setString("u", usernameController.text);
                          // _pre.setString("p", passwordController.text);

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
        ),
      ),
    );

  }
  // Create function Api
  Future<void>singin()async{
 if( usernameController.text.isNotEmpty&&passwordController.text.isNotEmpty){
   var response=await http.post(Uri.parse(""),
   body:({
     'username':usernameController.text,
      'password':passwordController.text,
   }));
   if(response.statusCode==200){
     // main screen
    //   Navigator.of(ctx).pushReplacementNamed(routeName)
    }else{
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not Allowd")));
    }
 }
  }
}
