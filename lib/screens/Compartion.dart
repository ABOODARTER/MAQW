import "package:flutter/material.dart";
import 'package:maqw/widget/navigationbottom.dart';
import 'package:maqw/widget/searchwidget.dart';
import '../main.dart';
import 'ContactUs.dart';
import 'Colors.dart';
import 'AllPhone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class compartion extends StatefulWidget {
  final String phoneid1;
  final String phoneid2;

  compartion({this.phoneid1 = '', this.phoneid2 = ''});

  @override
  State<StatefulWidget> createState() {
    return compartionState();
  }
}

class compartionState extends State<compartion> {
  String? stringResponse;
  List listResponse = [];
  Map bodyResponse = {};
  Map dataphoneResponse = {};

  //
  String phoneName1 = '';
  String phoneName2 = '';
  Map phone1 = {};
  Map phone2 = {};
  bool loading = false;

  Future<void> compair() async {
    setState(() {
      loading = true;
    });
    if (phoneName1.isNotEmpty) {
      phone1 = await getDevice(phoneName1) ?? {};
      phone1 = phone1['device1'];
      print(phone1);
    }
    if (phoneName2.isNotEmpty) {
      phone2 = await getDevice(phoneName2) ?? {};
      phone2 = phone2['device1'];
    }
    setState(() {
      loading = false;
    });
  }

  @override
  initState() {
    super.initState;
    phoneName1 = widget.phoneid1;
    phoneName2 = widget.phoneid2;
    compair();
  }

  Future<Map?> getDevice(String phoneName) async {
    Map<String, String>? headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer GSo8LL92AmqcdkhB3JwjGxdD9D7G6yQJ96BVQKWm'
    };
    http.Response response;
    //here i put request url
    response = await http.post(Uri.parse("http://10.2.0.2:24437/api/compare"),
        headers: headers, body: {"device1": phoneName});

    return jsonDecode(response.body);
  }

  // Future apicall() async{
  //   http.Response response;
  //   //here i put request url
  //   response=await http.get(Uri.parse("http://10.2.0.2:48608/api/search_on_material_device"));
  //   if(response.statusCode==200){
  //      setState((){
  //        bodyResponse=json.decode(response.body);
  //        dataphoneResponse=  bodyResponse['body'];
  //
  //      });
  //   }

  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == 'Compartion')
        return compartion();
      else if (s == "allphone")
        return allPhone();
      else
        return MyHomePage();
    }));
  }

  Widget addPhone(double getFrom) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          width: 150,
          height: 230,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: w),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
              BoxShadow(color: w, offset: Offset(-2, 0)),
              BoxShadow(color: w, offset: Offset(1, 0)),
              BoxShadow(color: w, offset: Offset(0, -0.5)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                      child:
                          Image.asset('assets/images/compartion/add (1).png')),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      splashColor: b,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => search(
                                      getFrom: getFrom,
                                      oldId: getFrom == 1
                                          ? phoneName2
                                          : phoneName1,
                                    )));
                      },
                      child: const Text(
                        'Add Phone',
                        style: TextStyle(fontSize: 17, color: Bluecolor),
                        textAlign: TextAlign.start,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          print(getFrom);
          if (getFrom == 1) {
            setState(() {
              phone1 = {};
            });
          }
          if (getFrom == 2) {
            setState(() {
              phone2 = {};
            });
          }
        },
        child: const Positioned(
          right: 0,
          height: 0,
          child:Icon(
            Icons.close,
            size: 25,
            color: Colors.red,
          ),
        ),
      ),

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Bluecolor,
        title: Text(
          'Compartion',
          style: TextStyle(color: w),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  color: w,
                  padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // phoneName1.isNotEmpty ?
                      addPhone(1),
                      // : SizedBox(),
                      // phoneName1.isNotEmpty
                      //     ?
                      // SizedBox(
                      //         width: 20,
                      //       )
                      //     :
                      const SizedBox(
                        width: 20,
                      ),
                      // phoneName2.isNotEmpty ?
                      addPhone(2)
                      // : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    //for All Lines
                    Lines(),
                    //All Image for data
                    Column(
                      children: [
                        const SizedBox(
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
                        SizedBox(
                          height: 50,
                        ),
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
                      ],
                    ),
                    //All image for text data
                    Column(
                      children: const [
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'name',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Processor',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 105,
                        ),
                        Text(
                          'RAM',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Image ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          'Processor',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 85,
                        ),
                        Text(
                          'Selfie',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 85,
                        ),
                        Text(
                          'Operating',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          'System',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Battery',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          'Storage',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          'Capacity',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          'Other',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        Text(
                          'Colors',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 110,
                        ),
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //All text from database
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          //database from left
                          SizedBox(
                            width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                //screen data
                                phone1['name'] == null ||
                                        phone1['name'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['name'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                phone1['display_resolution'] == null ||
                                        phone1['display_resolution']
                                            .toString()
                                            .isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['display_resolution'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                const SizedBox(
                                  height: 90,
                                ),
                                //prosser
                                phone1['chipset'] == null ||
                                        phone1['chipset'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['chipset'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                const SizedBox(
                                  height: 110,
                                ),
                                //ram
                                phone1['ram'] == null ||
                                        phone1['ram'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['ram'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                const SizedBox(
                                  height: 100,
                                ),
                                //Gpu
                                phone1['chipset'] == null ||
                                        phone1['chipset'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['chipset'].toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                const SizedBox(
                                  height: 90,
                                ),
                                //camera back
                                Column(
                                  children: [
                                    phone1['camera_pixels'] == null ||
                                            phone1['camera_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['camera_pixels'].toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    phone1['video_pixels'] == null ||
                                            phone1['video_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['video_pixels'].toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                //camera selfi
                                Column(
                                  children: [
                                    phone1['camera_pixels'] == null ||
                                            phone1['camera_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['camera_pixels'].toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    phone1['video_pixels'] == null ||
                                            phone1['video_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['video_pixels'].toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                //opretaing system
                                phone1['os'] == null ||
                                        phone1['os'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['os'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //battery
                                Column(
                                  children: [
                                    phone1['battery_size'] == null ||
                                            phone1['battery_size']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['battery_size'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    phone1['battery_type'] == null ||
                                            phone1['battery_type']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone1['battery_type'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                //storage capacity
                                phone1['storage'] == null ||
                                        phone1['storage'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['storage'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //other
                                phone1['body'] == null ||
                                        phone1['body'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['body'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //colors&body
                                phone1['body'] == null ||
                                        phone1['body'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['body'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                phone1['price'] == null ||
                                        phone1['price'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone1['price'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          //database from right
                          SizedBox(
                            width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                //screen data
                                phone2['name'] == null ||
                                        phone2['name'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['name'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 5,
                                ),
                                phone2['display_resolution'] == null ||
                                        phone2['display_resolution']
                                            .toString()
                                            .isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['display_resolution'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 90,
                                ),
                                //prosser
                                phone2['chipset'] == null ||
                                        phone1['chipset'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['chipset'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 110,
                                ),
                                //ram
                                phone2['ram'] == null ||
                                        phone2['ram'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['ram'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //Gpu
                                phone2['chipset'] == null ||
                                        phone2['chipset'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['chipset'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 90,
                                ),
                                //camera back
                                Column(
                                  children: [
                                    phone2['camera_pixels'] == null ||
                                            phone2['camera_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['camera_pixels'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    phone2['video_pixels'] == null ||
                                            phone2['video_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['video_pixels'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                //camera selfi
                                Column(
                                  children: [
                                    phone2['camera_pixels'] == null ||
                                            phone2['camera_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['camera_pixels'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    phone2['video_pixels'] == null ||
                                            phone2['video_pixels']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['video_pixels'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                //opretaing system
                                phone2['os'] == null ||
                                        phone2['os'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['os'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //battery
                                Column(
                                  children: [
                                    phone2['battery_size'] == null ||
                                            phone2['battery_size']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['battery_size'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    phone2['battery_type'] == null ||
                                            phone2['battery_type']
                                                .toString()
                                                .isEmpty
                                        ? Text('Data is loading')
                                        : Text(
                                            phone2['battery_type'].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                //storage capacity
                                phone2['storage'] == null ||
                                        phone2['storage'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['storage'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //other
                                phone2['body'] == null ||
                                        phone2['body'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['body'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                //colors&body
                                phone2['body'] == null ||
                                        phone2['body'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['body'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                SizedBox(
                                  height: 100,
                                ),
                                phone2['price'] == null ||
                                        phone2['price'].toString().isEmpty
                                    ? Text('Data is loading')
                                    : Text(
                                        phone2['price'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
      drawerScrimColor: Colors.blue.withOpacity(0.4),
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
            trailing: Icon(Icons.phone_android_rounded),
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

  Widget bulidPhone(Phone phone) => ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(phone.imagephone,
            width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(
        phone.name,
        style: TextStyle(fontSize: 24),
      ));
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(size.width * 3 / 8, size.height * 0 / 6),
      Offset(size.width * 3 / 8, size.height * 6 / 6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 5 / 8, size.height * 6 / 6),
      Offset(size.width * 5 / 8, size.height * 0 / 6),
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
  }
}

class Phone {
  final String imagephone;
  final String name;

  const Phone({required this.name, required this.imagephone});
}
