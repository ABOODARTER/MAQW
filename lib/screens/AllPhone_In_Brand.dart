import 'package:flutter/material.dart';
import '../main.dart';
import 'AllPhone.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'PagePhone.dart';

class allPhone_in_brand extends StatefulWidget {
  final CardItem item;
  allPhone_in_brand ({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return allPhone_in_brandState(item: item);
  }
}

class allPhone_in_brandState extends State<allPhone_in_brand> {
  final CardItem item;
  allPhone_in_brandState ({
    Key? key,
    required this.item,
  }) : super();

  Widget SelectBrand({required String item_subtitle}){
    item_subtitle=item.subtitle;
    if(item_subtitle =='Samsung'){
      return
        Container(
          width: 360,
          height: double.infinity,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(16),
              itemCount: 6,
              separatorBuilder: (context, _) => SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                return Row(children: [
                  Viewphone(item: itemSumsang[index]),
                  SizedBox(width: 25,),
                  Viewphone(item: itemSumsang[index]),
                ],);
              }
          ),
        );
    }
    else if(item_subtitle =='Redmi'){
      return Container(
        width: 360,
        height: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(16),
            itemCount: 6,
            separatorBuilder: (context, _) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return Row(children: [
                Viewphone(item: itemRedmi[index]),
                SizedBox(width: 25,),
                Viewphone(item: itemRedmi[index]),
              ],);
            }
        ),
      );
    }
    else if(item_subtitle =='Huawi'){
     return Container(
        width: 360,
        height: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(16),
            itemCount: 6,
            separatorBuilder: (context, _) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return Row(children: [
                Viewphone(item: itemHuawei[index]),
                SizedBox(width: 25,),
                Viewphone(item: itemHuawei[index]),
              ],);
            }
        ),
      );
    }
    else if(item_subtitle =='Apple'){
      return Container(
        width: 360,
        height: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(16),
            itemCount: 6,
            separatorBuilder: (context, _) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return Row(children: [
                Viewphone(item: itemApple[index]),
                SizedBox(width: 25,),
                Viewphone(item: itemApple[index]),
              ],);
            }
        ),
      );
    }
    else{return Container(  width: 360,
      height: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16),
          itemCount: 6,
          separatorBuilder: (context, _) => SizedBox(
            height: 12,
          ),
          itemBuilder: (context, index) {
            return Row(children: [
              Viewphone(item: itemApple[index]),
              SizedBox(width: 25,),
              Viewphone(item: itemApple[index]),
            ],);
          }
      ),);
    }
  }
  List<CardItem> itemSumsang = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Samsung Not 9 pro',
        subtitle: 'Samsung'),
  ];
  List<CardItem> itemRedmi = [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Redmi Not 9 pro',
        subtitle: 'Redmi'),
  ];

  List<CardItem> itemApple= [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Apple Not 9 pro',
        subtitle: 'Apple'),
  ];

  List<CardItem> itemHuawei= [
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
    CardItem(
        assetImage: 'assets/images/compartion/screen (1).png',
        title: 'Huawi Not 9 pro',
        subtitle: 'Huawi'),
  ];

  Widget Viewphone({
    required CardItem item,
  }) =>
      Container(
        width: 150,
        height: 210,
        padding: EdgeInsets.all(5),
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
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 3/ 3,
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
                                builder: (context) =>
                                    pagephone(item: item))),
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
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Bluecolor,
        title: Text(
          item.subtitle,
          style: TextStyle(color: w),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SelectBrand(item_subtitle: item.subtitle),
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
                onTap: () {}
              ),
              ListTile(
                title: Text(
                  "All Phone",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phone_android_rounded),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Compartion",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.phonelink_setup),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.email_outlined),
                onTap: (){},
              ),
              ListTile(
                title: Text(
                  "Map",
                  style: TextStyle(fontSize: 25, color: Bluecolor),
                ),
                trailing: Icon(Icons.location_searching_outlined),
                onTap: () {},
              ),
            ],
          ) // contact_Us(),
      ),
    );
  }

}
