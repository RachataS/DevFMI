import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/profile.dart';
import 'package:findmyitems/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var password1;
  var password2;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _notgoogleprofileCollection =
      FirebaseFirestore.instance.collection("Profile");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error!"),
              centerTitle: true,
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Register"),
              centerTitle: true,
            ),
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
                                  errorText: '??????????????????????????? Username'),
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
                                RequiredValidator(errorText: '??????????????????????????? Email'),
                                EmailValidator(
                                    errorText:
                                        '?????????????????? Email ?????????????????????????????? ???????????????????????????????????????????????????')
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
                                  return '????????????????????????????????????????????????';
                                } else if (password1.length < 8) {
                                  return '????????????????????????????????????????????????????????? 8 ????????????????????????';
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
                              controller: password2,
                              validator: ((password2) {
                                if (password2!.isEmpty) {
                                  return '??????????????????????????????????????????????????????';
                                } else if (password2.length < 8) {
                                  return '????????????????????????????????????????????????????????? 8 ????????????????????????';
                                } /*else if (profile.password != password2) {
                                  return '???????????????????????????????????????????????????';
                                }*/
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
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password);
                                      await _notgoogleprofileCollection.add({
                                        "Username": profile.username,
                                        "Email": profile.email,
                                        "password": profile.password,
                                      });
                                      Fluttertoast.showToast(
                                          msg: "??????????????????????????????????????????????????????????????????",
                                          gravity: ToastGravity.TOP);
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return HomeScreen();
                                      }));
                                    } on FirebaseAuthException catch (e) {
                                      var message;
                                      if (e.code == "email-already-in-use") {
                                        message =
                                            "?????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????????????????";
                                      } else if (e.code == "weak-password") {
                                        message =
                                            "???????????????????????????????????????????????????????????????????????????????????? 8 ????????????????????????";
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
