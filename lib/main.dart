import 'package:flutter/material.dart';
import 'package:maqw/provider.dart';
import 'package:maqw/screens/AllPhone.dart';
import 'package:maqw/screens/Compartion.dart';
import 'package:maqw/screens/ContactUs.dart';
import 'package:maqw/screens/Sale_Center_personalty.dart';
import 'package:maqw/screens/brand_screen.dart';
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
import 'package:maqw/widget/mainmap.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'screens/empty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  requestPermission();
  runApp(const MyApp());
}

requestPermission()async{
  bool granted = await Permission.storage.isGranted;
  if(!granted) {
   await Permission.storage.request();
  }
}

final Color bluee = Color(0xff007AFF);
final Color orangee = Color(0xffF87700);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>NBProvider(),
      child: MaterialApp(
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
              // style hint_text
              headline1: TextStyle(
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
        home: SignIn(),
        routes: {
          'signin': (context) => const SignIn(),
          'signup': (context) => const SignUp(),
          'signup1': (context) => const SignUp1(),
          'checkemail': (context) => const CheckEmail(),
          'verification': (context) => const Verification(),
          "centerdata": (context) => const CenterData(),
          'centerdata1': (context) => const CenterData1(),
          'allphone': (context) =>  BrandScreen(),
          'phone_by_brand': (context) =>  allPhone(),
          'compartion': (context) => compartion(),
          'empty': (context) => const Empty(),
          'map': (context) => const MainMap(),
          'contact_us': (context) => contact_Us(),
          'mainscreen': (context) => const MainScreen(),
          'enterphone': (context) => const EnterPhone(),
          'enterphone1': (context) => const EnterPhone1(),
          'salcenter': (context) => sale_center(),
        },
      ),
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
          .get(Uri.parse(""))
          .then((value) {

      });
    } on Exception catch (e) {

    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Center());
  }
}
