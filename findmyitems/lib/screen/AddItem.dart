import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  DateTime dateTime = DateTime(
    2022,
    12,
    11,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
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
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                      onPressed: () async {
                        final date = await pickDate();
                        if (date == null) return;
                        final dateTime = DateTime(
                          date.day,
                          date.month,
                          date.year,
                        );
                        setState(() => this.dateTime = dateTime);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_alt_outlined),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200));
}
