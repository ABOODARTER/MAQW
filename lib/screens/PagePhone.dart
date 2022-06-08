import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import '../main.dart';
import 'AllPhone.dart';
import 'Sale_Center_personalty.dart';
import 'mainscreen.dart';
import 'salecenter.dart';
import 'package:http/http.dart' as http;
class pagephone extends StatefulWidget {
  final CardItem item;
  pagephone({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return pagephone_(item: item);
  }
}

class pagephone_ extends State<pagephone> {
  final CardItem item;
  pagephone_({
    Key? key,
    required this.item,
  }) : super();
  String? stringResponse;
  List listResponse = [];
  Map  bodyResponse={};
  Map dataphoneResponse={};

  Future apicall() async{
    http.Response response;
    //here i put request url
    response=await http.get(Uri.parse("http://mobile.test:400/api/search_on_material_device"));
    if(response.statusCode==200){
      setState((){
       bodyResponse=json.decode(response.body);
        dataphoneResponse=  bodyResponse['body'];

      });
    }
  }
  @override
  void initState(){
    apicall();
    super.initState();
  }
  //  final CardItem item;
  final controller = CarouselController();
  int activeIndex = 0;
  //Images defualt
  final Images = <String>[
    'assets/images/compartion/screen (1).png',
    'assets/images/compartion/battery (1).png',
  ];

  //Images from data phone
  // final Images=[
  //   listResponse[0]['picture'].toString(),
  //   listResponse[0]['picture'].toString()
  //
  // ];


  void previous() =>
      controller.previousPage(duration: Duration(milliseconds: 500));

  void next() => controller.nextPage(duration: Duration(milliseconds: 500));

  void selectScreen(BuildContext ctx, String s ) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else
        return MainScreen ();
    }));
  }

  Widget phoneimage(Image phoneimage) {
    return Container(
      height: 400,
      width: 200,
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Container(height: 200, width: 300, child: phoneimage),
      ]),
    );
  }

  Widget phonename(String brand, ) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Text(brand, style: TextStyle(fontSize: 25)),
      ]),
    );
  }


  Widget slidimagephone(String Imgeasset, int index) =>
      Container(
       // margin: EdgeInsets.symmetric(horizontal: 12),
        height: 200,
        width: 200,
        child: Image.asset(
          Imgeasset,
          fit: BoxFit.cover,
        ),
      );

  // Widget buildImageSlider() => CarouselSlider.builder(
  //       carouselController: controller,
  //       options: CarouselOptions(
  //         height: 400,
  //         initialPage: 0,
  //       ),
  //       itemCount: Images.length,
  //       itemBuilder: (BuildContext context, int index, int realIndex) {
  //         return slidimagephone(
  //            'assets/images/compartion/screen (1).png', index);
  //       },
  //     );

  Widget buildIndicater() =>
      AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: Images.length,
        effect: JumpingDotEffect(
          dotWidth: 15,
          dotHeight: 15,
          activeDotColor: b,
          dotColor: Greycolor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu_rounded),
              color: b,
            );
          }),
          title: Text(item.subtitle,style: TextStyle(color: b),),
          centerTitle: true,
          backgroundColor: w,
        ),
        body: Container(
            child: ListView(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    //container blue to show image phone
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 35, 0, 100),
                      alignment: AlignmentDirectional.topCenter,
                      height: 2000,
                      width: 400,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Bluecolor,
                            Bluecolor.withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child:Column(
                          children: [
                            //for slide phoneback & phonefront image
                            Center(
                              child:
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 200,
                                  onPageChanged: (index, rfeason) =>
                                      setState(() => activeIndex = index),
                                  enlargeCenterPage: true,
                                 enableInfiniteScroll: false,
                                ),
                                itemCount: Images.length,
                                itemBuilder: (context, index, realIndex) {
                                  final Image = Images[index];
                                  return slidimagephone(Image, index);
                                },
                              ),
                            ),
                          ],
                        ),
                    ),

                    //container white for data phone
                    Container(
                        height:1653,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color: Greycolor),
                          borderRadius: BorderRadius.circular(15.0),
                          color: w,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            //for slide move
                            SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    buildIndicater(),
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            //for phone name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:10,),
                                phonename(dataphoneResponse['name'].toString(),),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Container(
                              child:Stack(
                           children:[

                             //for Lines to organize the data
                             Lines(),

                            //for image phone's data
                            Column(
                              children:[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/compartion/screen (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/cpu (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height:50,),
                            Image.asset(
                              'assets/images/compartion/ram.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/images/compartion/gpu.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/selfie-stick (2).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 55,
                            ),
                            Image.asset(
                              'assets/images/compartion/selfie-stick (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/images/compartion/battery (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/lighting.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/images/compartion/memory-card.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/plus-button.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/color-palette.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/compartion/price-tag.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                                ],),

                             //for text phone's data
                             Column(
                               children: [
                                 SizedBox(
                                   height: 90,
                                 ),
                                 Text(
                                   'Screen',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 100,
                                 ),
                                 Text(
                                   'Processor',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 105,
                                 ),
                                 Text(
                                   'RAM',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 90,
                                 ),
                                 Text(
                                   'Image ',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 Text(
                                   'Processor',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 90,
                                 ),
                                 Text(
                                   'Back',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 Text(
                                   'Camera',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 85,
                                 ),
                                 Text(
                                   'Selfie',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 Text(
                                   'Camera',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 85,
                                 ),
                                 Text(
                                   'Operating',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 Text(
                                   'System',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 90,
                                 ),
                                 Text(
                                   'Battery',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 100,
                                 ),
                                 Text(
                                   'Storage',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 Text(
                                   'Capacity',
                                   style: TextStyle(fontSize: 15, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 90,
                                 ),
                                 Text(
                                   'Other',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 110,
                                 ),
                                 Text(
                                   'Colors',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                                 SizedBox(
                                   height: 110,
                                 ),
                                 Text(
                                   'Price',
                                   style: TextStyle(fontSize: 20, color: Greycolor),
                                 ),
                               ],
                             ),
                                SizedBox(
                                  width: 50,
                                ),

                                //All text from database
                                Row(
                                  children: [
                                  SizedBox(
                                  width:92,
                                ),
                                //database
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    //screen data
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['display_size'].toString(),
                                      style:
                                      TextStyle(fontSize: 20, color: Greycolor),),
                                    SizedBox(height: 5,),
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['display_resolution'].toString(),
                                      style:
                                      TextStyle(fontSize: 20, color: Greycolor),),
                                    SizedBox(
                                      height: 90,
                                    ),
                                    //prosser
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['chipset'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 110,
                                    ),
                                    //ram
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['ram'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    //Gpu
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['chipset'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 90,
                                    ),
                                    //camera back
                                    Column(
                                      children: [
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['camera_pixels'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                        SizedBox(height: 5,),
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['video_pixels'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    //camera selfi
                                    Column(
                                      children: [
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['camera_pixels'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                        SizedBox(height: 5,),
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['video_pixels'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    //opretaing system
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['os'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    //battery
                                    Column(
                                      children: [
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['battery_size'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                        SizedBox(height: 5,),
                                        dataphoneResponse==null?Text('Data is loading'):Text(
                                          dataphoneResponse['battery_type'].toString(),
                                          style:
                                          TextStyle(fontSize: 20, color: Greycolor),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    //storage capacity
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['storage'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    //other
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['body'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    //colors&body
                                    dataphoneResponse==null?Text('Data is loading'):Text(
                                      dataphoneResponse['body'].toString(),
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      '2000\$',
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                  ],
                                ),

                                ],),],),
                            ),
                        ]),),
                  ],
                ),
              ],
            )),

        //list in appbar
        drawerScrimColor: b.withOpacity(0.4),
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
                  trailing: Icon(Icons.email_outlined),
                  onTap: () => selectScreen(context, "test"),
                ),
              ],
            ) // contact_Us(),
        ),
      ),

    );
  }

  //for excute class lines in this class
  Widget Lines() {
    return Container(
      color: Colors.white,
      width: 392,
      height: 1500,
      child: CustomPaint(
        foregroundPainter: LinePainter(),
      ),
    );
  }
}

//class for lines in width & height
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Greycolor
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(size.width * 2 / 8, size.height * 0 / 6),
      Offset(size.width * 2 / 8, size.height * 6 / 6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 2 / 24),
      Offset(size.width * 0 / 6, size.height * 2 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 4 / 24),
      Offset(size.width * 0 / 6, size.height * 4 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 6 / 24),
      Offset(size.width * 0 / 6, size.height * 6 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 8 / 24),
      Offset(size.width * 0 / 6, size.height * 8 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 10 / 24),
      Offset(size.width * 0 / 6, size.height * 10 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 12 / 24),
      Offset(size.width * 0 / 6, size.height * 12 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 14 / 24),
      Offset(size.width * 0 / 6, size.height * 14 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 16 / 24),
      Offset(size.width * 0 / 6, size.height * 16 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 18 / 24),
      Offset(size.width * 0 / 6, size.height * 18 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 20 / 24),
      Offset(size.width * 0 / 6, size.height * 20 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 22 / 24),
      Offset(size.width * 0 / 6, size.height * 22 / 24),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 6 / 6, size.height * 24 / 24),
      Offset(size.width * 0 / 6, size.height * 24 / 24),
      paint,
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }}
