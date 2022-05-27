import "package:flutter/material.dart";
import '../main.dart';
import 'Compartion.dart';
import 'Colors.dart';
import 'AllPhone.dart';
class contact_Us extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return contactUsState ();
  }
}
class contactUsState extends State<contact_Us >{
  List<String> options = ['Enquiry', 'Note', 'Suggestion', 'Problem'];
  String? selectedItem='Enquiry';

  void selectScreen(BuildContext ctx, String s) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (s == "ContatUs") return contact_Us();
      else if(s=='Compartion')
        return compartion();
      else if(s=="allphone")
        return allPhone();
      else
        return MyHomePage();
    }));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Bluecolor,
        title: Text(
        'Contact Us',
        style: TextStyle(color: w),
    ),
    ),
        body:Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            Text(
              'Your Name',
              style: TextStyle(color:Bluecolor, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: w),
                borderRadius: BorderRadius.circular(10.0),
                color: w,
                boxShadow: [
                  BoxShadow(
                      color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                  BoxShadow(color: w, offset: Offset(-2, 0)),
                  BoxShadow(color: w, offset: Offset(1, 0)),
                  BoxShadow(color: w, offset: Offset(0, -0.5)),
                ],
              ),
              child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:w),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                  keyboardType: TextInputType.text),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: TextStyle(color: Bluecolor, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color:w),
                borderRadius: BorderRadius.circular(10.0),
                color: w,
                boxShadow: [
                  BoxShadow(
                      color:verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                  BoxShadow(color:w, offset: Offset(-2, 0)),
                  BoxShadow(color: w, offset: Offset(1, 0)),
                  BoxShadow(color: w, offset: Offset(0, -0.5)),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: w),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Subject',
              style: TextStyle(color: Bluecolor, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 5, 1, 5),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: w),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                  BoxShadow(color: w, offset: Offset(-2, 0)),
                  BoxShadow(color:w, offset: Offset(1, 0)),
                  BoxShadow(color:w, offset: Offset(0, -0.5)),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 36,
                  icon: Icon(Icons.keyboard_arrow_down, color: Bluecolor),
                  isExpanded: true,
                  items: options.map(buildMenuItem).toList(),
                  onChanged: (item) => setState(()=>selectedItem = item),
                  value: selectedItem,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Message',
              style: TextStyle(color: Bluecolor, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color:w),
                borderRadius: BorderRadius.circular(10.0),
                color: w,
                boxShadow: [
                  BoxShadow(
                      color: verygrey, blurRadius: 4.0, offset: Offset(0, 3)),
                  BoxShadow(color:w, offset: Offset(-2, 0)),
                  BoxShadow(color: w, offset: Offset(1, 0)),
                  BoxShadow(color: w, offset: Offset(0, -0.5)),
                ],
              ),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:w),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                color: Bluecolor,
                onPressed: () {},
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 20, color: w),
                ),
              ),
            )
          ],
        )),
      drawerScrimColor: Colors.black.withOpacity(0.4),
      drawer: Drawer(
          child:ListView(
            children: [
              ListTile(
                title: Text('MAQW MOBIL ^_^',style:TextStyle(fontSize: 40,color:Bluecolor,),
              ),),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 25,color:Bluecolor),
                ),
                trailing:Icon(Icons.home),
                onTap: () => selectScreen(context,"home"),
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
                  style: TextStyle(fontSize: 25,color:Bluecolor),
                ),
                trailing:Icon(Icons.phonelink_setup),

                onTap: () => selectScreen(context, "Compartion"),
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25,color:Bluecolor),
                ),
                trailing: Icon(Icons.email_outlined),
                onTap: () => selectScreen(context, "ContatUs"),
              ),
            ],
          ) // contact_Us(),
      ),
    );
  }

}