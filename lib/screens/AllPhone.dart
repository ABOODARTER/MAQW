import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maqw/widget/navigationbottom.dart';
import 'package:maqw/widget/searchwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../main.dart';
import 'AllPhone_In_Brand.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Sale_Center_personalty.dart';
import 'salecenter.dart';

class allPhone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allPhoneState();
  }
}

class allPhoneState extends State<allPhone> {
  List<CardItem> listphonessamsungResponse = [];
  List<CardItem> listphonesredmiResponse= [];
  List<CardItem> listphoneshuaweiResponse= [];
  List<CardItem> listphonesiphoneResponse= [];
  Map bodyResponse = {};
  Map dataphoneResponse = {};
  final controller = TextEditingController();

  Future apicall() async {
    http.Response response;
    //here i put request url
    response = await http
        .get(Uri.parse("http://localhost:8000/api/search_on_material_device"));
    if (response.statusCode == 200) {
      setState(() {
        bodyResponse = json.decode(response.body);
        dataphoneResponse = bodyResponse['body'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
    dataphoneResponse['picture'].toString();
    dataphoneResponse['name'].toString();
    listphonessamsungResponse = [
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Sumsang',
      ),
    ];
    listphonesredmiResponse=[
    CardItem(
      assetImage: dataphoneResponse['picture'].toString(),
      title: dataphoneResponse['name'].toString(),
      subtitle: 'Redmi',
    ),
    CardItem(
    assetImage: dataphoneResponse['picture'].toString(),
    title: dataphoneResponse['name'].toString(),
    subtitle: 'Redmi',
    ),
    CardItem(
    assetImage: dataphoneResponse['picture'].toString(),
    title: dataphoneResponse['name'].toString(),
    subtitle: 'Redmi',
    ),
    CardItem(
    assetImage: dataphoneResponse['picture'].toString(),
    title: dataphoneResponse['name'].toString(),
    subtitle: 'Redmi',
    ),
    CardItem(
    assetImage: dataphoneResponse['picture'].toString(),
    title: dataphoneResponse['name'].toString(),
    subtitle: 'Redmi',
    ),
    CardItem(
    assetImage: dataphoneResponse['picture'].toString(),
    title: dataphoneResponse['name'].toString(),
    subtitle: 'Redmi',
    ),
    ];
    listphoneshuaweiResponse=[
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Huawei',
      ),
    ];
    listphonesiphoneResponse= [
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
      CardItem(
        assetImage: dataphoneResponse['picture'].toString(),
        title: dataphoneResponse['name'].toString(),
        subtitle: 'Iphone',
      ),
    ];
  }

  Widget Viewphone({
    required CardItem item,
  }) =>
      Container(
        width: 150,
        height: 100,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color:Bluecolor),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(color: Greycolor, blurRadius: 4.0, offset: Offset(0, 3)),
            BoxShadow(color: w, offset: Offset(-2, 0)),
            BoxShadow(color: w, offset: Offset(1, 0)),
            BoxShadow(color: w, offset: Offset(0, -0.5)),
          ],
          gradient: LinearGradient(
            colors: [w, w.withOpacity(0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Material(
                    child: Ink.image(
                      image: AssetImage(item.assetImage),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pagephone(item: item))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: Bluecolor),
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Bluecolor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => allPhone_in_brand(item: item,))),
              child: Text(
                item.subtitle,
                style: TextStyle(
                    fontSize: 10, color: w, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  //list for cards view phone


  //to move between screen
  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else
        return MyHomePage();
    }));
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),

              //for headpage = Allphone & icon
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

              // for search box
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

                   child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                            child: Icon(Icons.search,),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          search()));
                            }
                        ),
                        suffixIcon:
                        GestureDetector(
                          child: Icon(Icons.close,),
                          onTap: (){
                            controller.clear();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Greycolor),
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      keyboardType: TextInputType.text,
                    ),
              ),
              SizedBox(
                height: 30,
              ),

              // for head brand & i click in this to push to another screen has all phone in the same brand
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => allPhone_in_brand(
                              item: listphonessamsungResponse[0],
                            )),
                  );
                },
                child: Text(
                  'Sumsang',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //scrolling between cards for view phone
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      Viewphone(item: listphonessamsungResponse[index]),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // for head brand & i click in this to push to another screen has all phone in the same brand
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => allPhone_in_brand(
                              item: listphonesredmiResponse[2],
                            )),
                  );
                },
                child: Text(
                  'Redmi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //scrolling between cards for view phone
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      Viewphone(item:listphonesredmiResponse[index]),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // for head brand & i click in this to push to another screen has all phone in the same brand
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => allPhone_in_brand(
                              item: listphoneshuaweiResponse[0],
                            )),
                  );
                },
                child: Text(
                  'Huawei',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //scrolling between cards for view phone
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      Viewphone(item: listphoneshuaweiResponse[index]),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // for head brand & i click in this to push to another screen has all phone in the same brand
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => allPhone_in_brand(
                              item: listphonesiphoneResponse[0],
                            )),
                  );
                },
                child: Text(
                  'Apple',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //scrolling between cards for view phone
              Container(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(
                    width: 12,
                  ),
                  itemBuilder: (context, index) =>
                      Viewphone(item: listphoneshuaweiResponse[index]),
                ),
              ),
            ]),
          ),
        ],
      ),

      //list in appbar
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
        ],
      ) // contact_Us(),
          ),
      bottomNavigationBar: NavigationB(),
    );
  }
}

class ShoePage extends StatelessWidget {
  final CardItem item;

  const ShoePage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 3,
              child: Image.asset(item.assetImage, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              item.title,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}

// class CardItem {
//   final String assetImage;
//   final String title;
//   final String subtitle;
//
//   const CardItem({
//     required this.assetImage,
//     required this.title,
//     required this.subtitle,
//   });
// }
//allphone
//itemCount:listResponse==null?0:listResponse.length
//phonepage&allphone
//Image.assets(listResponse[index]['phoneimage'])
