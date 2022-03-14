class ScoreBoardModel {
  List<Scorecard>? scorecard;
  bool? isMatchComplete;
  AppIndex? appIndex;
  String? status;
  String? responseLastUpdated;

  ScoreBoardModel(
      {this.scorecard,
      this.isMatchComplete,
      this.appIndex,
      this.status,
      this.responseLastUpdated});

  ScoreBoardModel.fromJson(Map<String, dynamic> json) {
    if (json['scorecard'] != null) {
      scorecard = <Scorecard>[];
      json['scorecard'].forEach((v) {
        scorecard!.add(new Scorecard.fromJson(v));
      });
    }
    isMatchComplete = json['isMatchComplete'];
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
    status = json['status'];
    responseLastUpdated = json['responseLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scorecard != null) {
      data['scorecard'] = this.scorecard!.map((v) => v.toJson()).toList();
    }
    data['isMatchComplete'] = this.isMatchComplete;
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    data['status'] = this.status;
    data['responseLastUpdated'] = this.responseLastUpdated;
    return data;
  }
}

class Scorecard {
  int? inningsId;
  List<Batsman>? batsman;
  List<Bowler>? bowler;
  List<Autogenerated>? fow;
  Extras? extras;
  List<Pp>? pp;
  int? score;
  int? wickets;
  double? overs;
  double? runRate;
  String? batTeamName;
  String? batTeamSName;
  int? ballNbr;
  double? rpb;

  Scorecard(
      {this.inningsId,
      this.batsman,
      this.bowler,
      this.fow,
      this.extras,
      this.pp,
      this.score,
      this.wickets,
      this.overs,
      this.runRate,
      this.batTeamName,
      this.batTeamSName,
      this.ballNbr,
      this.rpb});

  Scorecard.fromJson(Map<String, dynamic> json) {
    inningsId = json['inningsId'];
    if (json['batsman'] != null) {
      batsman = <Batsman>[];
      json['batsman'].forEach((v) {
        batsman!.add(new Batsman.fromJson(v));
      });
    }
    if (json['bowler'] != null) {
      bowler = <Bowler>[];
      json['bowler'].forEach((v) {
        bowler!.add(new Bowler.fromJson(v));
      });
    }
    if (json['fow'] != null) {
      fow = <Autogenerated>[];
      json['fow'].forEach((v) {
        fow!.add(new Autogenerated.fromJson(v));
      });
    }
    extras =
        json['extras'] != null ? new Extras.fromJson(json['extras']) : null;
    if (json['pp'] != null) {
      pp = <Pp>[];
      json['pp'].forEach((v) {
        pp!.add(new Pp.fromJson(v));
      });
    }
    score = json['score'];
    wickets = json['wickets'];
    overs = json['overs'];
    runRate = json['runRate'];
    batTeamName = json['batTeamName'];
    batTeamSName = json['batTeamSName'];
    ballNbr = json['ballNbr'];
    rpb = json['rpb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inningsId'] = this.inningsId;
    if (this.batsman != null) {
      data['batsman'] = this.batsman!.map((v) => v.toJson()).toList();
    }
    if (this.bowler != null) {
      data['bowler'] = this.bowler!.map((v) => v.toJson()).toList();
    }
    if (this.fow != null) {
      data['fow'] = this.fow!.map((v) => v.toJson()).toList();
    }
    if (this.extras != null) {
      data['extras'] = this.extras!.toJson();
    }
    if (this.pp != null) {
      data['pp'] = this.pp!.map((v) => v.toJson()).toList();
    }
    data['score'] = this.score;
    data['wickets'] = this.wickets;
    data['overs'] = this.overs;
    data['runRate'] = this.runRate;
    data['batTeamName'] = this.batTeamName;
    data['batTeamSName'] = this.batTeamSName;
    data['ballNbr'] = this.ballNbr;
    data['rpb'] = this.rpb;
    return data;
  }
}

class Batsman {
  int? id;
  int? balls;
  int? runs;
  int? fours;
  String? strkRate;
  String? name;
  String? outDec;
  bool? isCaptain;
  int? sixes;
  bool? isKeeper;
  String? nickName;

  Batsman(
      {this.id,
      this.balls,
      this.runs,
      this.fours,
      this.strkRate,
      this.name,
      this.outDec,
      this.isCaptain,
      this.sixes,
      this.isKeeper,
      this.nickName});

  Batsman.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balls = json['balls'];
    runs = json['runs'];
    fours = json['fours'];
    strkRate = json['strkRate'];
    name = json['name'];
    outDec = json['outDec'];
    isCaptain = json['isCaptain'];
    sixes = json['sixes'];
    isKeeper = json['isKeeper'];
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balls'] = this.balls;
    data['runs'] = this.runs;
    data['fours'] = this.fours;
    data['strkRate'] = this.strkRate;
    data['name'] = this.name;
    data['outDec'] = this.outDec;
    data['isCaptain'] = this.isCaptain;
    data['sixes'] = this.sixes;
    data['isKeeper'] = this.isKeeper;
    data['nickName'] = this.nickName;
    return data;
  }
}

class Bowler {
  int? id;
  String? overs;
  int? wickets;
  int? runs;
  String? economy;
  String? name;
  String? nickName;
  int? maidens;

  Bowler(
      {this.id,
      this.overs,
      this.wickets,
      this.runs,
      this.economy,
      this.name,
      this.nickName,
      this.maidens});

  Bowler.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overs = json['overs'];
    wickets = json['wickets'];
    runs = json['runs'];
    economy = json['economy'];
    name = json['name'];
    nickName = json['nickName'];
    maidens = json['maidens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overs'] = this.overs;
    data['wickets'] = this.wickets;
    data['runs'] = this.runs;
    data['economy'] = this.economy;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['maidens'] = this.maidens;
    return data;
  }
}

class Autogenerated {
  List<Fow>? fow;

  Autogenerated({this.fow});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['fow'] != null) {
      fow = <Fow>[];
      json['fow'].forEach((v) {
        fow!.add(new Fow.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fow != null) {
      data['fow'] = this.fow!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fow {
  int? batsmanId;
  String? batsmanName;
  double? overNbr;
  int? runs;
  int? ballNbr;

  Fow(
      {this.batsmanId,
      this.batsmanName,
      this.overNbr,
      this.runs,
      this.ballNbr});

  Fow.fromJson(Map<String, dynamic> json) {
    batsmanId = json['batsmanId'];
    batsmanName = json['batsmanName'];
    overNbr = json['overNbr'];
    runs = json['runs'];
    ballNbr = json['ballNbr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batsmanId'] = this.batsmanId;
    data['batsmanName'] = this.batsmanName;
    data['overNbr'] = this.overNbr;
    data['runs'] = this.runs;
    data['ballNbr'] = this.ballNbr;
    return data;
  }
}

class Extras {
  int? legByes;
  int? wides;
  int? total;
  int? byes;
  int? noBalls;

  Extras({this.legByes, this.wides, this.total, this.byes, this.noBalls});

  Extras.fromJson(Map<String, dynamic> json) {
    legByes = json['legByes'];
    wides = json['wides'];
    total = json['total'];
    byes = json['byes'];
    noBalls = json['noBalls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legByes'] = this.legByes;
    data['wides'] = this.wides;
    data['total'] = this.total;
    data['byes'] = this.byes;
    data['noBalls'] = this.noBalls;
    return data;
  }
}

class Pp {
  List<PowerPlay>? powerPlay;

  Pp({this.powerPlay});

  Pp.fromJson(Map<String, dynamic> json) {
    if (json['powerPlay'] != null) {
      powerPlay = <PowerPlay>[];
      json['powerPlay'].forEach((v) {
        powerPlay!.add(new PowerPlay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.powerPlay != null) {
      data['powerPlay'] = this.powerPlay!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PowerPlay {
  int? id;
  double? ovrFrom;
  int? ovrTo;
  String? ppType;
  int? run;

  PowerPlay({this.id, this.ovrFrom, this.ovrTo, this.ppType, this.run});

  PowerPlay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ovrFrom = json['ovrFrom'];
    ovrTo = json['ovrTo'];
    ppType = json['ppType'];
    run = json['run'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ovrFrom'] = this.ovrFrom;
    data['ovrTo'] = this.ovrTo;
    data['ppType'] = this.ppType;
    data['run'] = this.run;
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