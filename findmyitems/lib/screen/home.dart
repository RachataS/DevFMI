import 'package:findmyitems/model/profile.dart';
import 'package:findmyitems/screen/mainhome.dart';
import 'package:findmyitems/screen/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text("Error!")),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: Text("Login")),
            body: Container(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset("assets/images/FMIslogo.png"),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'กรุณากรอก Email'),
                                EmailValidator(
                                    errorText:
                                        'รูปแบบ Email ไม่ถูกต้อง กรุณากรอกอีกครั้ง')
                              ]),
                              onSaved: (var email) {
                                profile.email = email;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter Email',
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: TextFormField(
                              validator: ((password1) {
                                if (password1!.isEmpty) {
                                  return 'โปรดกรอกรหัสผ่าน';
                                } else if (password1.length < 8) {
                                  return 'รหัสผ่านต้องยาวกว่า 8 ตัวอักษร';
                                }
                              }),
                              onSaved: (password1) {
                                profile.password = password1;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Password',
                              )),
                        ),
                        Center(
                          child: SizedBox(
                            width: 300,
                            child: ElevatedButton.icon(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password);
                                      Fluttertoast.showToast(
                                          msg: "เข้าสู่ระบบสำเร็จ",
                                          gravity: ToastGravity.TOP);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return mainHomeScreen();
                                      }));
                                    } on FirebaseAuthException catch (e) {
                                      var message;
                                      if (e.code == "email-already-in-use") {
                                        message =
                                            "อีเมลนี้เคยถูกใช้ลงทะเบียนแล้ว โปรดใช้อีเมลอื่นหรือเข้าสู่ระบบ";
                                      } else if (e.code == "weak-password") {
                                        message =
                                            "รหัสผ่านต้องมีความยาวมากกว่า 8 ตัวอักษร";
                                      } else {
                                        message == e.code;
                                      }
                                      Fluttertoast.showToast(
                                          msg: message,
                                          gravity: ToastGravity.TOP);
                                    }
                                    formKey.currentState?.reset();
                                  }
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
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class btTextStyle {
  static const TextStyle nameOfTextStyle =
      TextStyle(fontSize: 12, color: Colors.black);
}
