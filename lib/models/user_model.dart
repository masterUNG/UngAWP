class UserModel {
  String name;
  String path;
  String position;
  String lat;
  String lng;

  UserModel({this.name, this.path, this.position, this.lat, this.lng});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    path = json['Path'];
    position = json['Position'];
    lat = json['Lat'];
    lng = json['Lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Path'] = this.path;
    data['Position'] = this.position;
    data['Lat'] = this.lat;
    data['Lng'] = this.lng;
    return data;
  }
}
