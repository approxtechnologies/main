class PlayerCarrerInfoModel {
  List<Values>? values;

  PlayerCarrerInfoModel({this.values});

  PlayerCarrerInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? name;
  String? debut;
  String? lastPlayed;

  Values({this.name, this.debut, this.lastPlayed});

  Values.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    debut = json['debut'];
    lastPlayed = json['lastPlayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['debut'] = this.debut;
    data['lastPlayed'] = this.lastPlayed;
    return data;
  }
}
