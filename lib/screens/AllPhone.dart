import 'package:flutter/material.dart';
import 'package:maqw/widget/navigationbottom.dart';
import '../main.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';


class allPhone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPhoneState();
  }
}

class allPhoneState extends State<allPhone> {
  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else if (s == "pagephone")
        return pagephone();
      else
        return MyHomePage();
    }));
  }

  Widget viewphones(String brand, String name, String phonepictuer) {
    return Container(
      width: 150,
      height: 250,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Bluecolor),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(color: Greycolor, blurRadius: 4.0, offset: Offset(0, 3)),
          BoxShadow(color: Bluecolor, offset: Offset(-2, 0)),
          BoxShadow(color: Bluecolor, offset: Offset(1, 0)),
          BoxShadow(color: Bluecolor, offset: Offset(0, -0.5)),
        ],
        gradient: LinearGradient(
          colors: [Bluecolor, Bluecolor.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: () => selectScreen(context, 'pagephone'),
                icon: Icon(Icons.compare_arrows),
                iconSize: 25,
                color: w,
              )),
          Container(height: 130, width: 130, child: Image.asset(phonepictuer)),
          SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 15, color: w),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            brand,
            style: TextStyle(
              fontSize: 12,
              color: w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Bluecolor,
        title: Text(
          'All Phone',
          style: TextStyle(color: w),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            color: w,
            child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_android_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'All phones',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Greycolor),
                  borderRadius: BorderRadius.circular(15.0),
                  color: Greycolor,
                  boxShadow: [
                    BoxShadow(
                        color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                    BoxShadow(color: Greycolor, offset: Offset(-2, 0)),
                    BoxShadow(color: Greycolor, offset: Offset(1, 0)),
                    BoxShadow(color: Greycolor, offset: Offset(0, -0.5)),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          highlightColor: Colors.white60,
                        ),
                        SizedBox(
                          width: 220,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Greycolor),
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Samsung',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  viewphones('samsung', 'Samsung Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('samsung', 'Samsung Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('samsung', 'Samsung Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('samsung', 'Samsung Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('samsung', 'Samsung Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Redmi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  viewphones('Redmi', 'Redmi Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Redmi', 'Redmi Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Redmi', 'Redmi Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Redmi', 'Redmi Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Redmi', 'Redmi Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Huawei',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  viewphones('Huawei', 'Huawei Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Huawei', 'Huawei Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Huawei', 'Huawei Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Huawei', 'Huawei Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Huawei', 'Huawei Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Apple',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  viewphones('Apple', 'Apple Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Apple', 'Apple Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Apple', 'Apple Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Apple', 'Apple Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                  SizedBox(
                    width: 12,
                  ),
                  viewphones('Apple', 'Apple Note 1 pro',
                      'assets/images/compartion/screen (1).png'),
                ]),
              ),
            ]),
          ),
        ],
      ),
      drawerScrimColor: Colors.black.withOpacity(0.4),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: Text(
              'MAQW MOBIL ^_^',
              style: TextStyle(fontSize: 40, color: Bluecolor),
            ),
          ),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: 25, color: Bluecolor),
            ),
            trailing: Icon(Icons.home),
            onTap: () => selectScreen(context, "home"),
          ),
          ListTile(
            title: Text(
              "All Phone",
              style: TextStyle(fontSize: 25, color: Bluecolor),
            ),
            trailing: Icon(Icons.phone_android_rounded),
            onTap: () => selectScreen(context, "allphone"),
          ),
          ListTile(
            title: Text(
              "Compartion",
              style: TextStyle(fontSize: 25, color: Bluecolor),
            ),
            trailing: Icon(Icons.phonelink_setup),
            onTap: () => selectScreen(context, "Compartion"),
          ),
          ListTile(
            title: Text(
              "Contact Us",
              style: TextStyle(fontSize: 25, color: Bluecolor),
            ),
            trailing: Icon(Icons.email_outlined),
            onTap: () => selectScreen(context, "ContatUs"),
          ),
          ListTile(
            title: Text(
              "test",
              style: TextStyle(fontSize: 25, color: Bluecolor),
            ),
            trailing: Icon(Icons.home),
            onTap: () => selectScreen(context, "pagephone"),
          ),
        ],
      ) // contact_Us(),
          ),
      bottomNavigationBar: NavigationB(),
    );
  }
}
