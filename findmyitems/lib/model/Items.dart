import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsModel {
  var name, detail, date_time, image;

  ItemsModel({this.name, this.date_time, this.detail, this.image});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    name:
    json['Name'];
    detail:
    json['Detail'];
    date_time:
    (json['date_time'] as Timestamp).toDate();
    image:
    json['imagelocate'];
  }
}
