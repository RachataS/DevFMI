class ItemsModel {
  var name, detail, date_time, image;

  ItemsModel({this.name, this.date_time, this.detail, this.image});

  ItemsModel.fromMap(Map<String, dynamic> map) {
    name = map['Name'];
    detail = map['Detail'];
    date_time = map['date_time'];
    image = map['imagelocate'];
  }
}
