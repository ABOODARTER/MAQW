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
  final String phone_id;

  const allPhone({Key? key,  this.phone_id='0'}) : super(key: key);

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

  //
  List allPhone = [];
  List searchList = [];
  bool loading = false;

  Future Api_call() async {
    setState((){
      loading = true;
    });
    http.Response response;
    //here i put request url
    response = await http
        .post(Uri.parse("http://10.2.0.2:48608/api/return_device_incostom_brand"),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer RXmKRnnKPdCIwZhwWoRrHDpGxbOgnbGJoRXqQrsq'
    },body: {
          'id':widget.phone_id
    });
    if (response.statusCode == 200) {
      setState(() {
        allPhone = json.decode(response.body)['device'];
        searchList = allPhone;
        loading = false;
      });
    }

  }

  @override
  void initState() {

    super.initState();
    Api_call();
    // dataphoneResponse['picture'].toString();
    // dataphoneResponse['name'].toString();
    // listphonessamsungResponse = [
    //   CardItem(
    //     assetImage: dataphoneResponse['picture'].toString(),
    //     title: dataphoneResponse['name'].toString(),
    //     subtitle: 'Iphone',
    //   ),
    // ];
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
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: Bluecolor),
            ),
            RaisedButton(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
    // Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    //   if (s == "ContatUs")
    //     return contact_Us();
    //   else if (s == 'Compartion')
    //     return compartion();
    //   else if (s == "allphone")
    //     return allPhone(phone_id: '1',);
    //   else
    //     return MyHomePage();
    // }));
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
      body: loading? const Center(child: CircularProgressIndicator(),):
      Column(
        children: [
      Container(
              decoration: BoxDecoration(
                border: Border.all(color: Greycolor),
                borderRadius: BorderRadius.circular(15.0),
                color: Greycolor,
                boxShadow: const [
                  BoxShadow(
                      color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                  BoxShadow(color: Greycolor, offset: Offset(-2, 0)),
                  BoxShadow(color: Greycolor, offset: Offset(1, 0)),
                  BoxShadow(color: Greycolor, offset: Offset(0, -0.5)),
                ],
              ),

                 child: TextFormField(
                   onChanged: (value){
                     if(value.isNotEmpty){
                       setState(() {
                         searchList = allPhone.where((element) => element['name'].toString().contains(value)).toList();
                       });
                     }else {
                       setState(() {
                         searchList = allPhone;
                       });
                     }
                   },
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
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Greycolor),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    keyboardType: TextInputType.text,
                  ),
            ),
          Expanded(
            child: SizedBox(
              // height: MediaQuery.of(context).size.height*0.7,
              child: GridView.builder(
                itemCount: searchList.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemBuilder: (context,index)=>Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      width:140,height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            searchList[index]['picture'],
                          )
                        )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                       child: Text(searchList[index]['name']),),
                    )
                  ],
                ),
                // children: [
                //   Container(
                //     padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                //     color: w,
                //     child:
                //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //       const SizedBox(
                //         height: 15,
                //       ),
                //
                //       //for headpage = Allphone & icon
                //       Row(
                //         children: const [
                //           Icon(
                //             Icons.phone_android_rounded,
                //             size: 20,
                //           ),
                //           SizedBox(
                //             width: 5,
                //           ),
                //           Text(
                //             'All phones',
                //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //           )
                //         ],
                //       ),
                //      const SizedBox(
                //         height: 30,
                //       ),
                //
                //       // for search box
                //       Container(
                //         decoration: BoxDecoration(
                //           border: Border.all(color: Greycolor),
                //           borderRadius: BorderRadius.circular(15.0),
                //           color: Greycolor,
                //           boxShadow: const [
                //             BoxShadow(
                //                 color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                //             BoxShadow(color: Greycolor, offset: Offset(-2, 0)),
                //             BoxShadow(color: Greycolor, offset: Offset(1, 0)),
                //             BoxShadow(color: Greycolor, offset: Offset(0, -0.5)),
                //           ],
                //         ),
                //
                //            child: TextFormField(
                //               textInputAction: TextInputAction.next,
                //               decoration: InputDecoration(
                //                 prefixIcon: GestureDetector(
                //                     child: Icon(Icons.search,),
                //                     onTap: () {
                //                       Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                               builder: (context) =>
                //                                   search()));
                //                     }
                //                 ),
                //                 enabledBorder: OutlineInputBorder(
                //                     borderSide: BorderSide(color: Greycolor),
                //                     borderRadius: BorderRadius.circular(15.0)),
                //               ),
                //               keyboardType: TextInputType.text,
                //             ),
                //       ),
                //       const SizedBox(
                //         height: 30,
                //       ),
                //
                //       // for head brand & i click in this to push to another screen has all phone in the same brand
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => allPhone_in_brand(
                //                       item: listphonessamsungResponse[0],
                //                     )),
                //           );
                //         },
                //         child:const Text(
                //           'Sumsang',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 20,
                //       ),
                //
                //       //scrolling between cards for view phone
                //       Container(
                //         height: 250,
                //         child: ListView.separated(
                //           scrollDirection: Axis.horizontal,
                //           padding: EdgeInsets.all(16),
                //           itemCount: 6,
                //           separatorBuilder: (context, _) =>const SizedBox(
                //             width: 12,
                //           ),
                //           itemBuilder: (context, index) =>
                //               Viewphone(item: listphonessamsungResponse[index]),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 30,
                //       ),
                //
                //       // for head brand & i click in this to push to another screen has all phone in the same brand
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => allPhone_in_brand(
                //                       item: listphonesredmiResponse[2],
                //                     )),
                //           );
                //         },
                //         child:const Text(
                //           'Redmi',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 20,
                //       ),
                //
                //       //scrolling between cards for view phone
                //       Container(
                //         height: 250,
                //         child: ListView.separated(
                //           scrollDirection: Axis.horizontal,
                //           padding: EdgeInsets.all(16),
                //           itemCount: 6,
                //           separatorBuilder: (context, _) => SizedBox(
                //             width: 12,
                //           ),
                //           itemBuilder: (context, index) =>
                //               Viewphone(item:listphonesredmiResponse[index]),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 30,
                //       ),
                //
                //       // for head brand & i click in this to push to another screen has all phone in the same brand
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => allPhone_in_brand(
                //                       item: listphoneshuaweiResponse[0],
                //                     )),
                //           );
                //         },
                //         child:const Text(
                //           'Huawei',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 20,
                //       ),
                //
                //       //scrolling between cards for view phone
                //       Container(
                //         height: 250,
                //         child: ListView.separated(
                //           scrollDirection: Axis.horizontal,
                //           padding: EdgeInsets.all(16),
                //           itemCount: 6,
                //           separatorBuilder: (context, _) =>const SizedBox(
                //             width: 12,
                //           ),
                //           itemBuilder: (context, index) =>
                //               Viewphone(item: listphoneshuaweiResponse[index]),
                //         ),
                //       ),
                //      const SizedBox(
                //         height: 30,
                //       ),
                //
                //       // for head brand & i click in this to push to another screen has all phone in the same brand
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => allPhone_in_brand(
                //                       item: listphonesiphoneResponse[0],
                //                     )),
                //           );
                //         },
                //         child:const Text(
                //           'Apple',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     const  SizedBox(
                //         height: 20,
                //       ),
                //
                //       //scrolling between cards for view phone
                //       Container(
                //         height: 250,
                //         child: ListView.separated(
                //           scrollDirection: Axis.horizontal,
                //           padding: EdgeInsets.all(16),
                //           itemCount: 6,
                //           separatorBuilder: (context, _) =>const SizedBox(
                //             width: 12,
                //           ),
                //           itemBuilder: (context, index) =>
                //               Viewphone(item: listphoneshuaweiResponse[index]),
                //         ),
                //       ),
                //     ]),
                //   ),
                // ],
              ),
            ),
          ),
        ],
      ),

      //list in appbar
      drawerScrimColor: Colors.black.withOpacity(0.4),
      // drawer: Drawer(
      //     child: ListView(
      //   children: [
      //    const ListTile(
      //       title: Text(
      //         'MAQW MOBIL ^_^',
      //         style: TextStyle(fontSize: 40, color: Bluecolor),
      //       ),
      //     ),
      //     ListTile(
      //       title:const Text(
      //         "Home",
      //         style: TextStyle(fontSize: 25, color: Bluecolor),
      //       ),
      //       trailing:const Icon(Icons.home),
      //       onTap: () => selectScreen(context, "home"),
      //     ),
      //     ListTile(
      //       title:const Text(
      //         "All Phone",
      //         style: TextStyle(fontSize: 25, color: Bluecolor),
      //       ),
      //       trailing:const Icon(Icons.phone_android_rounded),
      //       onTap: () => selectScreen(context, "allphone"),
      //     ),
      //     ListTile(
      //       title:const Text(
      //         "Compartion",
      //         style: TextStyle(fontSize: 25, color: Bluecolor),
      //       ),
      //       trailing:const Icon(Icons.phonelink_setup),
      //       onTap: () => selectScreen(context, "Compartion"),
      //     ),
      //     ListTile(
      //       title:const Text(
      //         "Contact Us",
      //         style: TextStyle(fontSize: 25, color: Bluecolor),
      //       ),
      //       trailing:const Icon(Icons.email_outlined),
      //       onTap: () => selectScreen(context, "ContatUs"),
      //     ),
      //   ],
      // ) // contact_Us(),
      //     ),
      // bottomNavigationBar:const NavigationB(),
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
