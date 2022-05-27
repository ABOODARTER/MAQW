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

class pagephone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _pagephone();
  }
}

class _pagephone extends State<pagephone> {
  final controller = CarouselController();
  int activeIndex = 0;
  final Images = <String>[
    'assets/image/compartion/screen (1).png',
    'assets/image/compartion/battery (1).png',
  ];
  String textdata='data';

  void previous() =>
      controller.previousPage(duration: Duration(milliseconds: 500));

  void next() => controller.nextPage(duration: Duration(milliseconds: 500));

  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs")
        return contact_Us();
      else if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else if (s == "test")
        return sale_center_personalty();
      else
        return MyHomePage();
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

  Widget phonename(String brand, String name) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(children: [
        Text(brand, style: TextStyle(fontSize: 30)),
        Text(name, style: TextStyle(fontSize: 30)),
      ]),
    );
  }
  Widget pricephone(String price)=>Container(
    child: Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
  );

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
  //            'assets/image/compartion/screen (1).png', index);
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

  // Widget buildButtons({bool strech = false}) =>
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
  //             ),
  //             onPressed: previous,
  //             child: Icon(Icons.arrow_back_ios, size: 35, color: w,)),
  //         strech ? Spacer() : SizedBox(width: 50,),
  //         ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
  //             ),
  //             onPressed: next,
  //             child: Icon(Icons.arrow_forward_ios, size: 35, color: w,)),
  //       ],
  //     );

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
          title: Text(
            'brand',
            style: TextStyle(color: b),
          ),
          centerTitle: true,
          backgroundColor: w,
        ),
        body: Container(
            child: ListView(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
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
                            Center(
                              child:
                              CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 200,
                                  onPageChanged: (index, reason) =>
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width:10,),
                                phonename('brand','Name'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               pricephone('2000.00 s.p'),
                                SizedBox(width:10,),
                              ],
                            ),
                            Container(
                              child:Stack(
                           children:[
                             Lines(),
                            Column(
                              children:[
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/image/compartion/screen (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/cpu (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/image/compartion/ram.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/image/compartion/gpu.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/selfie-stick (2).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 55,
                            ),
                            Image.asset(
                              'assets/image/compartion/selfie-stick (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/image/compartion/battery (1).png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/lighting.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(
                              'assets/image/compartion/memory-card.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/plus-button.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/color-palette.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/image/compartion/price-tag.png',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                                ],),
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
                                  width: 100,
                                ),
                                //database
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 110,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 110,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      textdata,
                                      style: TextStyle(fontSize: 20, color: Greycolor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 125,
                                )
                                ],),],),
                            ),
                        ]),),
                  ],
                ),
              ],
            )),
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
