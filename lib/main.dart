import 'package:flutter/material.dart';
import 'package:maqw/screens/AllPhone.dart';
import 'package:maqw/screens/Compartion.dart';
import 'package:maqw/screens/Sale_Center_personalty.dart';
import 'package:maqw/screens/enter%20phone.dart';
import 'package:maqw/screens/enterphone1.dart';
import 'package:maqw/screens/mainscreen.dart';
import 'package:maqw/screens/map.dart' as map;
import 'package:maqw/screens/salecenter.dart';
import 'package:maqw/screens/sign%20in.dart';
import 'package:maqw/screens/sign%20up.dart';
import 'package:maqw/screens/sign%20up1.dart';
import 'package:maqw/screens/check_email.dart';
import 'package:maqw/screens/center data.dart';
import 'package:maqw/screens/center data1.dart';
import 'package:maqw/screens/verification.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

final Color bluee = Color(0xff007AFF);
final Color orangee = Color(0xffF87700);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: bluee,
        ),
        primaryColor: bluee,
        textTheme: const TextTheme(
            // style sign
            headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 25,
              letterSpacing: 2,
            ),
            // style hinttext
            headline1: const TextStyle(
              fontSize: 20,
              color: Colors.black45,
              fontWeight: FontWeight.w400,
            ),
            // style font please enter the center data
            headline3: TextStyle(
              fontSize: 21,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              wordSpacing: 5,
              letterSpacing: 2,
            )),
      ),
      routes: {
        '/': (context) => const SignIn(),
        "mainScreen":(context) => const MainScreen(),
        // هاد الصفحة الرئيسة لحساب المركز
        'saleCenter':(context) =>  sale_center(),
        'signup': (context) => const SignUp(),
        'signup1': (context) => const SignUp1(),
        'checkemail': (context) => const CheckEmail(),
        'verification': (context) => const Verification(),
        "centerdata": (context) => const CenterData(),
        'centerdata1': (context) => const CenterData1(),
        // 'map2': (context) => const Map2(),
        "map": (context) => const map.MainMap(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void test() async {
    try {
      await http
          .get(Uri.parse("http://127.0.0.1:8000/api/centers/"))
          .then((value) {
        print('************************************');
        print(value.body);
        print('************************************');
      });
    } on Exception catch (e) {
      print('+++++++++++++++++++++++=');
      print(e.toString());
    }
  }

  @override
  initState() {
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Center());
  }
}
