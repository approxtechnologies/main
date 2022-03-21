import 'dart:convert';

class PlayerInfoModel {
  String? id;
  String? bat;
  String? bowl;
  String? name;
  String? nickName;
  String? role;
  String? birthPlace;
  List<String>? intlTeam;
  List<String>? teams;
  String? doB;
  String? image;
  String? bio;
  CurrRank? currRank;
  AppIndex? appIndex;
  String? doBFormat;
  String? faceImageId;
  PlayerInfoModel({
    this.id,
    this.bat,
    this.bowl,
    this.name,
    this.nickName,
    this.role,
    this.birthPlace,
    this.intlTeam,
    this.teams,
    this.doB,
    this.image,
    this.bio,
    this.currRank,
    this.appIndex,
    this.doBFormat,
    this.faceImageId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bat': bat,
      'bowl': bowl,
      'name': name,
      'nickName': nickName,
      'role': role,
      'birthPlace': birthPlace,
      'intlTeam': intlTeam,
      'teams': teams,
      'doB': doB,
      'image': image,
      'bio': bio,
      'currRank': currRank?.toMap(),
      'appIndex': appIndex?.toMap(),
      'doBFormat': doBFormat,
      'faceImageId': faceImageId,
    };
  }

  factory PlayerInfoModel.fromMap(Map<String, dynamic> map) {
    return PlayerInfoModel(
      id: map['id'],
      bat: map['bat'],
      bowl: map['bowl'],
      name: map['name'],
      nickName: map['nickName'],
      role: map['role'],
      birthPlace: map['birthPlace'],
      intlTeam: List<String>.from(map['intlTeam']),
      teams: List<String>.from(map['teams']),
      doB: map['doB'],
      image: map['image'],
      bio: map['bio'],
      currRank:
          map['currRank'] != null ? CurrRank.fromMap(map['currRank']) : null,
      appIndex:
          map['appIndex'] != null ? AppIndex.fromMap(map['appIndex']) : null,
      doBFormat: map['doBFormat'],
      faceImageId: map['faceImageId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerInfoModel.fromJson(String source) =>
      PlayerInfoModel.fromMap(json.decode(source));
}

class CurrRank {
  Bat? bat;
  Bowl? bowl;
  All? all;
  CurrRank({
    this.bat,
    this.bowl,
    this.all,
  });

  Map<String, dynamic> toMap() {
    return {
      'bat': bat?.toMap(),
      'bowl': bowl?.toMap(),
      'all': all?.toMap(),
    };
  }

  factory CurrRank.fromMap(Map<String, dynamic> map) {
    return CurrRank(
      bat: map['bat'] != null ? Bat.fromMap(map['bat']) : null,
      bowl: map['bowl'] != null ? Bowl.fromMap(map['bowl']) : null,
      all: map['all'] != null ? All.fromMap(map['all']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrRank.fromJson(String source) =>
      CurrRank.fromMap(json.decode(source));
}

class Bat {
  String? testRank;
  String? odiRank;
  String? t20Rank;
  String? testBestRank;
  String? odiBestRank;
  String? t20BestRank;
  String? t20DiffRank;
  String? testDiffRank;
  String? odiDiffRank;
  Bat({
    this.testRank,
    this.odiRank,
    this.t20Rank,
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
    this.t20DiffRank,
    this.testDiffRank,
    this.odiDiffRank,
  });

  Map<String, dynamic> toMap() {
    return {
      'testRank': testRank,
      'odiRank': odiRank,
      't20Rank': t20Rank,
      'testBestRank': testBestRank,
      'odiBestRank': odiBestRank,
      't20BestRank': t20BestRank,
      't20DiffRank': t20DiffRank,
      'testDiffRank': testDiffRank,
      'odiDiffRank': odiDiffRank,
    };
  }

  factory Bat.fromMap(Map<String, dynamic> map) {
    return Bat(
      testRank: map['testRank'],
      odiRank: map['odiRank'],
      t20Rank: map['t20Rank'],
      testBestRank: map['testBestRank'],
      odiBestRank: map['odiBestRank'],
      t20BestRank: map['t20BestRank'],
      t20DiffRank: map['t20DiffRank'],
      testDiffRank: map['testDiffRank'],
      odiDiffRank: map['odiDiffRank'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Bat.fromJson(String source) => Bat.fromMap(json.decode(source));
}

class Bowl {
  String? testRank;
  String? odiRank;
  String? t20Rank;
  String? testBestRank;
  String? odiBestRank;
  String? t20BestRank;
  String? t20DiffRank;
  String? testDiffRank;
  String? odiDiffRank;
  Bowl({
    this.testRank,
    this.odiRank,
    this.t20Rank,
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
    this.t20DiffRank,
    this.testDiffRank,
    this.odiDiffRank,
  });

  Map<String, dynamic> toMap() {
    return {
      'testRank': testRank,
      'odiRank': odiRank,
      't20Rank': t20Rank,
      'testBestRank': testBestRank,
      'odiBestRank': odiBestRank,
      't20BestRank': t20BestRank,
      't20DiffRank': t20DiffRank,
      'testDiffRank': testDiffRank,
      'odiDiffRank': odiDiffRank,
    };
  }

  factory Bowl.fromMap(Map<String, dynamic> map) {
    return Bowl(
      testRank: map['testRank'],
      odiRank: map['odiRank'],
      t20Rank: map['t20Rank'],
      testBestRank: map['testBestRank'],
      odiBestRank: map['odiBestRank'],
      t20BestRank: map['t20BestRank'],
      t20DiffRank: map['t20DiffRank'],
      testDiffRank: map['testDiffRank'],
      odiDiffRank: map['odiDiffRank'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Bowl.fromJson(String source) => Bowl.fromMap(json.decode(source));
}

class All {
  String? testRank;
  String? odiRank;
  String? t20Rank;
  String? testBestRank;
  String? odiBestRank;
  String? t20BestRank;
  String? t20DiffRank;
  String? testDiffRank;
  String? odiDiffRank;
  All({
    this.testRank,
    this.odiRank,
    this.t20Rank,
    this.testBestRank,
    this.odiBestRank,
    this.t20BestRank,
    this.t20DiffRank,
    this.testDiffRank,
    this.odiDiffRank,
  });

  Map<String, dynamic> toMap() {
    return {
      'testRank': testRank,
      'odiRank': odiRank,
      't20Rank': t20Rank,
      'testBestRank': testBestRank,
      'odiBestRank': odiBestRank,
      't20BestRank': t20BestRank,
      't20DiffRank': t20DiffRank,
      'testDiffRank': testDiffRank,
      'odiDiffRank': odiDiffRank,
    };
  }

  factory All.fromMap(Map<String, dynamic> map) {
    return All(
      testRank: map['testRank'],
      odiRank: map['odiRank'],
      t20Rank: map['t20Rank'],
      testBestRank: map['testBestRank'],
      odiBestRank: map['odiBestRank'],
      t20BestRank: map['t20BestRank'],
      t20DiffRank: map['t20DiffRank'],
      testDiffRank: map['testDiffRank'],
      odiDiffRank: map['odiDiffRank'],
    );
  }

  String toJson() => json.encode(toMap());

  factory All.fromJson(String source) => All.fromMap(json.decode(source));
}

class AppIndex {
  String? seoTitle;
  String? webURL;
  AppIndex({
    this.seoTitle,
    this.webURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'seoTitle': seoTitle,
      'webURL': webURL,
    };
  }

  factory AppIndex.fromMap(Map<String, dynamic> map) {
    return AppIndex(
      seoTitle: map['seoTitle'],
      webURL: map['webURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppIndex.fromJson(String source) =>
      AppIndex.fromMap(json.decode(source));
}
