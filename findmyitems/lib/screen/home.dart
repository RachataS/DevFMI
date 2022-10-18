import 'package:findmyitems/screen/mainhome.dart';
import 'package:findmyitems/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          //Find My Items text
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/FMIslogo.png"),
                /*Text(
                  'Find My Items',
                  style: CustomTextStyle.nameOfTextStyle,
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: TextFormField(
                      validator:
                          RequiredValidator(errorText: 'กรุณากรอก Username'),
                      //keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Username',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: TextFormField(
                      validator:
                          RequiredValidator(errorText: 'กรุณากรอก Password'),
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Password',
                      )),
                ),

                //login button
                Column(
                  children: [
                    Center(
                      //padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return mainHomeScreen();
                              })));
                            },
                            icon: Icon(Icons.login),
                            label: Text("Login")),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }));
                        },
                        child: Text(
                          "Don't have an account? Register now!",
                          style: btTextStyle.nameOfTextStyle,
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

/*class CustomTextStyle {
  static const TextStyle nameOfTextStyle = TextStyle(
    fontSize: 40,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );
}*/

class btTextStyle {
  static const TextStyle nameOfTextStyle =
      TextStyle(fontSize: 12, color: Colors.black);
}
