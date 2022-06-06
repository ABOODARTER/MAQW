import 'package:flutter/material.dart';
import '../main.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/correct.png"),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Successfully Verified",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 250,
              ),
              Container(
                decoration: ShapeDecoration(
                  color: orangee,
                  shape: const CircleBorder(),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('mainscreen');
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
