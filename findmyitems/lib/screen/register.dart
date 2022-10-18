import 'package:findmyitems/model/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var password1, password2;
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
            appBar: AppBar(title: Text("Register")),
            body: Container(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: TextFormField(
                              validator: RequiredValidator(
                                  errorText: 'กรุณากรอก Username'),
                              onSaved: (var username) {
                                profile.username = username;
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter Username',
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'กรุณากรอก Email'),
                                EmailValidator(
                                    errorText:
                                        'รูปแบบ Email ไม่ถูกตต้อง กรุณากรอกอีกครั้ง')
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: TextFormField(
                              validator: ((password2) {
                                if (password2!.isEmpty) {
                                  return 'โปรดยืนยันรหัสผ่าน';
                                } else if (password2.length < 8) {
                                  return 'รหัสผ่านต้องยาวกว่า 8 ตัวอักษร';
                                } else if (profile.password !=
                                    profile.password) {
                                  return 'รหัสผ่านไม่ตรงกัน';
                                }
                              }),
                              onSaved: (password2) {
                                profile.conpassword = password2;
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Confirm Password',
                              )),
                        ),
                        Center(
                          child: SizedBox(
                            width: 300,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    print(
                                        "Username = ${profile.username}\nEmail = ${profile.email}\npassword1 = ${profile.password}\npass2 = ${profile.conpassword}");
                                    formKey.currentState?.reset();
                                  }
                                },
                                icon: Icon(Icons.add),
                                label: Text("Register")),
                          ),
                        ),
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
