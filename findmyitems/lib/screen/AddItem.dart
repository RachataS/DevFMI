import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmyitems/model/Items.dart';
import 'package:findmyitems/screen/ListItems.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final formKey = GlobalKey<FormState>();
  ItemsModel _itemsModel = ItemsModel();
  DateTime dateTime = DateTime(2022, 12, 11, 19, 20);
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _notgoogleprofileCollection =
      FirebaseFirestore.instance.collection("Items");

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
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
                            errorText: 'กรุณากรอกชื่อสิ่งของ'),
                        onSaved: (var username) {},
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Item name',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: TextFormField(
                        validator: RequiredValidator(
                            errorText: 'กรุณากรอกรายละเอียดสถานที่เก็บ'),
                        onSaved: (var email) {},
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Detail',
                        )),
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      child: Text(
                          'date : ${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                      onPressed: () async {
                        final date = await pickDate();
                        if (date == null) return;
                        final dateTime = DateTime(
                          date.day,
                          date.month,
                          date.year,
                        );
                        setState(() => this.dateTime = dateTime);
                        setState(
                          () => this.dateTime = _itemsModel.date_time,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      child: Text('Time : ${hours}:${minutes}'),
                      onPressed: () async {
                        final time = await pickTime();
                        if (time == null) return;

                        final newDateTime = DateTime(
                          dateTime.day,
                          dateTime.month,
                          dateTime.year,
                          time.hour,
                          time.minute,
                        );
                        setState((() => dateTime = newDateTime));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();

            Fluttertoast.showToast(
                msg: "บันทึกข้อมูลสำเร็จ", gravity: ToastGravity.TOP);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ListItemsScreen();
            }));
          }
          formKey.currentState?.reset();
        },
        child: const Icon(Icons.save_alt_outlined),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
