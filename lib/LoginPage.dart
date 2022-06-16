import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatefulWidget {

  static const String routeName = '/login_screen';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userName =TextEditingController();
  final password =TextEditingController();
  late SharedPreferences logindata;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/download.png",fit:BoxFit.cover,color: Colors.black.withOpacity(0.4)
            ,colorBlendMode: BlendMode.darken,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  child:Column(
                    children: [
                      SizedBox(height: 15),
                      Form(child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: userName,
                              decoration: InputDecoration(labelText: "Enter User Name ",border: OutlineInputBorder()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(labelText: "Enter Password ",border: OutlineInputBorder()),
                            ),
                          )
                        ],
                      )),
                      RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child:Text('Log In'),
                          onPressed:(){
                            validateUser(userName.text,password.text);
                          } ),
                      SizedBox(height: 15)
                    ],
                  ) ,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> validateUser(String userName, String password) async {
    if(userName.isEmpty){
      Fluttertoast.showToast(
          msg: 'Enter User Name',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER
      );
    }else if(password.isEmpty){
      Fluttertoast.showToast(
          msg: 'Enter Password',
          toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER
      );
    }else{
      logindata = await SharedPreferences.getInstance();
      logindata.setBool('login', true);
      Navigator.pushReplacementNamed(context, "/dashboard_screen");
    }
  }
  static void displaySnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

}

