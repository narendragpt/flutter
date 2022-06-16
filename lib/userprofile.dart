import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
   TextEditingController textname = TextEditingController();
   late SharedPreferences logindata;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      child:SingleChildScrollView(
        child: Card(
          elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Stack(
                 fit: StackFit.passthrough,
                 children: [
                   Image.asset("assets/download.png",fit:BoxFit.cover,height: 300,),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Align(
                       alignment: Alignment.topRight,
                       child: ElevatedButton(
                         onPressed: () async {
                           logindata = await SharedPreferences.getInstance();
                           logindata.setBool('login',false);
                           Navigator.pop(context);
                           Navigator.pushNamed(context, "/login_screen");
                         },
                         child: Text('Sign Out',style: TextStyle(color: Colors.white),),
                         style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                           ),
                         ),
                     ),
                   ))
                 ],
               ),
               const SizedBox(height:12),
               Padding(padding: const EdgeInsets.all(8.0),
               child: TextField(
                 controller: textname,
                 keyboardType: TextInputType.text,
                 decoration: const InputDecoration(labelText: "Enter Full Name",border: OutlineInputBorder(),
                     suffixIcon: Icon(Icons.toggle_on)),
               )),
               const Padding(padding: EdgeInsets.all(8.0),
                   child: TextField(
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(labelText: "Enter Mobile",border: OutlineInputBorder()),
                   )),
               const Padding(padding: EdgeInsets.all(8.0),
                   child: TextField(
                     keyboardType: TextInputType.emailAddress,
                     decoration: InputDecoration(labelText: "Enter Email",border: OutlineInputBorder()),
                   )),
               const Padding(padding: EdgeInsets.all(8.0),
                   child: TextField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(labelText: "Enter date of birth",border: OutlineInputBorder()),
                   )),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: RaisedButton(
                   color: Colors.blue,
                     child:Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16),),
                     onPressed:(){
                       Fluttertoast.showToast(
                         msg: textname.text,
                         toastLength: Toast.LENGTH_LONG
                       );
                 } ),
               )


          ],
        )),
      ),
    );
  }
}
