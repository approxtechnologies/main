class Model {
  String? success;
  List<Data>? data;
  String? msg;

  Model({this.success, this.data, this.msg});

  Model.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  String? id;
  String? image;
  String? des;

  Data({this.id, this.image, this.des});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'].toString().replaceAll("\n", "");
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['des'] = this.des;
    return data;
  }
}
