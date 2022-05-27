import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Colors.dart';
import 'ContactUs.dart';
import 'Compartion.dart';
import 'AllPhone.dart';
import'../main.dart';

class sale_center_personalty extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _salecenter();
  }
}

class _salecenter extends State<sale_center_personalty> {
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
              'Sale Center',
              style: TextStyle(color: b),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person_pin,
                  size: 30,
                  color: b,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: w,
          ),
          body: SafeArea(
            child: Container(
              child: ListView(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Stack(
                    alignment: AlignmentDirectional.topStart,
                    children:[
                      Container(
                        height: 638,
                        width:360,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(0.6),
                          borderRadius:BorderRadius.only(bottomLeft:Radius.circular(300))
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.fromLTRB(60, 30, 60, 70),
                      alignment: AlignmentDirectional.topCenter,
                      height:598,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(bottomLeft:Radius.circular(290)),
                        gradient: LinearGradient(
                          colors: [
                            Bluecolor.withOpacity(0.6),
                            Bluecolor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              Container(
                                height:100,
                                width:100 ,
                                child: Icon(
                                Icons.person_pin,
                                size: 100,
                                color: b,
                            ),
                              ),
                              Container(
                                height:30,
                                width:30 ,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.add_a_photo_outlined, size: 20,
                                    color: w,),
                                ),
                              )

                            ],
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                              label: Text('Name:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Time Open:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.datetime,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Time Close:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.datetime,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Address:',style:TextStyle(color: w)),
                                  suffixIcon: Icon(Icons.edit,color: Colors.white,),
                              ),
                              keyboardType: TextInputType.url,
                              style: TextStyle(color: w),
                            ),
                          ),
                          Container(
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text('Land Line:',style:TextStyle(color: w)),
                                suffixIcon: Icon(Icons.phone,color: Colors.white,)
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: w),
                            ),
                          ),
                          SizedBox(height: 30,),
                          RaisedButton(
                            color: w,
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child:Text('Edit Phone',style: TextStyle(color:b,fontSize: 20,fontWeight: FontWeight.w300),),
                              onPressed: (){}),
                        ],
                      ),
                    ),
                    ],
                  ),),
              ]),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {  },
            icon:Icon(Icons.add_rounded,size: 35,),
            label: Text('Add Phone'),
            backgroundColor: Bluecolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
          ),

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
            ],
          ) // contact_Us(),
              ),
        ));
  }
}
