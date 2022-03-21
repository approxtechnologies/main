class PlayerBattingInfoModel {
  List<String>? headers;
  List<Values>? values;
  AppIndex? appIndex;
  List<SeriesSpinner>? seriesSpinner;

  PlayerBattingInfoModel(
      {this.headers, this.values, this.appIndex, this.seriesSpinner});

  PlayerBattingInfoModel.fromJson(Map<String, dynamic> json) {
    headers = json['headers'].cast<String>();
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
    if (json['seriesSpinner'] != null) {
      seriesSpinner = <SeriesSpinner>[];
      json['seriesSpinner'].forEach((v) {
        seriesSpinner!.add(new SeriesSpinner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headers'] = this.headers;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    if (this.seriesSpinner != null) {
      data['seriesSpinner'] =
          this.seriesSpinner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  List<String>? values;

  Values({this.values});

  Values.fromJson(Map<String, dynamic> json) {
    values = json['values'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    return data;
  }
}

class AppIndex {
  String? seoTitle;
  String? webURL;

  AppIndex({this.seoTitle, this.webURL});

  AppIndex.fromJson(Map<String, dynamic> json) {
    seoTitle = json['seoTitle'];
    webURL = json['webURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seoTitle'] = this.seoTitle;
    data['webURL'] = this.webURL;
    return data;
  }
}

class SeriesSpinner {
  String? seriesName;
  int? seriesId;

  SeriesSpinner({this.seriesName, this.seriesId});

  SeriesSpinner.fromJson(Map<String, dynamic> json) {
    seriesName = json['seriesName'];
    seriesId = json['seriesId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriesName'] = this.seriesName;
    data['seriesId'] = this.seriesId;
    return data;
  }
}
