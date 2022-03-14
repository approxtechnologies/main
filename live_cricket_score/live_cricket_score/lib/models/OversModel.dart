class OversModel {
  Miniscore? miniscore;
  List<OverSepList>? overSepList;
  MatchHeaders? matchHeaders;
  String? responseLastUpdated;

  OversModel(
      {this.miniscore,
      this.overSepList,
      this.matchHeaders,
      this.responseLastUpdated});

  OversModel.fromJson(Map<String, dynamic> json) {
    miniscore = json['miniscore'] != null
        ? new Miniscore.fromJson(json['miniscore'])
        : null;
    if (json['overSepList'] != null) {
      overSepList = <OverSepList>[];
      json['overSepList'].forEach((v) {
        overSepList!.add(new OverSepList.fromJson(v));
      });
    }
    matchHeaders = json['matchHeaders'] != null
        ? new MatchHeaders.fromJson(json['matchHeaders'])
        : null;
    responseLastUpdated = json['responseLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.miniscore != null) {
      data['miniscore'] = this.miniscore!.toJson();
    }
    if (this.overSepList != null) {
      data['overSepList'] = this.overSepList!.map((v) => v.toJson()).toList();
    }
    if (this.matchHeaders != null) {
      data['matchHeaders'] = this.matchHeaders!.toJson();
    }
    data['responseLastUpdated'] = this.responseLastUpdated;
    return data;
  }
}

class Miniscore {
  BatsmanStriker? batsmanStriker;
  BatsmanNonStriker? batsmanNonStriker;
  BowlerStriker? bowlerStriker;
  BowlerNonStriker? bowlerNonStriker;
  double? crr;
  String? inningsNbr;
  String? lastWkt;
  String? curOvsStats;
  List<InningsScores>? inningsScores;
  int? inningsId;
  List<Performance>? performance;
  String? partnership;
  List<Pp>? pp;
  int? target;
  String? custStatus;

  Miniscore(
      {this.batsmanStriker,
      this.batsmanNonStriker,
      this.bowlerStriker,
      this.bowlerNonStriker,
      this.crr,
      this.inningsNbr,
      this.lastWkt,
      this.curOvsStats,
      this.inningsScores,
      this.inningsId,
      this.performance,
      this.partnership,
      this.pp,
      this.target,
      this.custStatus});

  Miniscore.fromJson(Map<String, dynamic> json) {
    batsmanStriker = json['batsmanStriker'] != null
        ? new BatsmanStriker.fromJson(json['batsmanStriker'])
        : null;
    batsmanNonStriker = json['batsmanNonStriker'] != null
        ? new BatsmanNonStriker.fromJson(json['batsmanNonStriker'])
        : null;
    bowlerStriker = json['bowlerStriker'] != null
        ? new BowlerStriker.fromJson(json['bowlerStriker'])
        : null;
    bowlerNonStriker = json['bowlerNonStriker'] != null
        ? new BowlerNonStriker.fromJson(json['bowlerNonStriker'])
        : null;
    crr = json['crr'];
    inningsNbr = json['inningsNbr'];
    lastWkt = json['lastWkt'];
    curOvsStats = json['curOvsStats'];
    if (json['inningsScores'] != null) {
      inningsScores = <InningsScores>[];
      json['inningsScores'].forEach((v) {
        inningsScores!.add(new InningsScores.fromJson(v));
      });
    }
    inningsId = json['inningsId'];
    if (json['performance'] != null) {
      performance = <Performance>[];
      json['performance'].forEach((v) {
        performance!.add(new Performance.fromJson(v));
      });
    }
    partnership = json['partnership'];
    if (json['pp'] != null) {
      pp = <Pp>[];
      json['pp'].forEach((v) {
        pp!.add(new Pp.fromJson(v));
      });
    }
    target = json['target'];
    custStatus = json['custStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.batsmanStriker != null) {
      data['batsmanStriker'] = this.batsmanStriker!.toJson();
    }
    if (this.batsmanNonStriker != null) {
      data['batsmanNonStriker'] = this.batsmanNonStriker!.toJson();
    }
    if (this.bowlerStriker != null) {
      data['bowlerStriker'] = this.bowlerStriker!.toJson();
    }
    if (this.bowlerNonStriker != null) {
      data['bowlerNonStriker'] = this.bowlerNonStriker!.toJson();
    }
    data['crr'] = this.crr;
    data['inningsNbr'] = this.inningsNbr;
    data['lastWkt'] = this.lastWkt;
    data['curOvsStats'] = this.curOvsStats;
    if (this.inningsScores != null) {
      data['inningsScores'] =
          this.inningsScores!.map((v) => v.toJson()).toList();
    }
    data['inningsId'] = this.inningsId;
    if (this.performance != null) {
      data['performance'] = this.performance!.map((v) => v.toJson()).toList();
    }
    data['partnership'] = this.partnership;
    if (this.pp != null) {
      data['pp'] = this.pp!.map((v) => v.toJson()).toList();
    }
    data['target'] = this.target;
    data['custStatus'] = this.custStatus;
    return data;
  }
}

class BatsmanStriker {
  int? id;
  int? balls;
  int? runs;
  int? fours;
  int? sixes;
  String? strkRate;
  String? name;
  String? nickName;

  BatsmanStriker(
      {this.id,
      this.balls,
      this.runs,
      this.fours,
      this.sixes,
      this.strkRate,
      this.name,
      this.nickName});

  BatsmanStriker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balls = json['balls'];
    runs = json['runs'];
    fours = json['fours'];
    sixes = json['sixes'];
    strkRate = json['strkRate'];
    name = json['name'];
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balls'] = this.balls;
    data['runs'] = this.runs;
    data['fours'] = this.fours;
    data['sixes'] = this.sixes;
    data['strkRate'] = this.strkRate;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    return data;
  }
}

class BatsmanNonStriker {
  int? id;
  int? balls;
  int? runs;
  int? fours;
  String? strkRate;
  String? name;
  String? nickName;

  BatsmanNonStriker(
      {this.id,
      this.balls,
      this.runs,
      this.fours,
      this.strkRate,
      this.name,
      this.nickName});

  BatsmanNonStriker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balls = json['balls'];
    runs = json['runs'];
    fours = json['fours'];
    strkRate = json['strkRate'];
    name = json['name'];
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
    data['nickName'] = this.nickName;
    return data;
  }
}

class BowlerStriker {
  int? id;
  String? overs;
  int? wickets;
  int? runs;
  String? economy;
  String? name;

  BowlerStriker(
      {this.id, this.overs, this.wickets, this.runs, this.economy, this.name});

  BowlerStriker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overs = json['overs'];
    wickets = json['wickets'];
    runs = json['runs'];
    economy = json['economy'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overs'] = this.overs;
    data['wickets'] = this.wickets;
    data['runs'] = this.runs;
    data['economy'] = this.economy;
    data['name'] = this.name;
    return data;
  }
}

class BowlerNonStriker {
  int? id;
  String? overs;
  int? runs;
  String? economy;
  String? name;

  BowlerNonStriker({this.id, this.overs, this.runs, this.economy, this.name});

  BowlerNonStriker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overs = json['overs'];
    runs = json['runs'];
    economy = json['economy'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overs'] = this.overs;
    data['runs'] = this.runs;
    data['economy'] = this.economy;
    data['name'] = this.name;
    return data;
  }
}

class InningsScores {
  List<InningsScore>? inningsScore;

  InningsScores({this.inningsScore});

  InningsScores.fromJson(Map<String, dynamic> json) {
    if (json['inningsScore'] != null) {
      inningsScore = <InningsScore>[];
      json['inningsScore'].forEach((v) {
        inningsScore!.add(new InningsScore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inningsScore != null) {
      data['inningsScore'] = this.inningsScore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InningsScore {
  int? inningsId;
  int? batTeamId;
  String? batTeamShortName;
  int? runs;
  int? wickets;
  double? overs;
  int? target;
  int? balls;

  InningsScore(
      {this.inningsId,
      this.batTeamId,
      this.batTeamShortName,
      this.runs,
      this.wickets,
      this.overs,
      this.target,
      this.balls});

  InningsScore.fromJson(Map<String, dynamic> json) {
    inningsId = json['inningsId'];
    batTeamId = json['batTeamId'];
    batTeamShortName = json['batTeamShortName'];
    runs = json['runs'];
    wickets = json['wickets'];
    overs = json['overs'];
    target = json['target'];
    balls = json['balls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inningsId'] = this.inningsId;
    data['batTeamId'] = this.batTeamId;
    data['batTeamShortName'] = this.batTeamShortName;
    data['runs'] = this.runs;
    data['wickets'] = this.wickets;
    data['overs'] = this.overs;
    data['target'] = this.target;
    data['balls'] = this.balls;
    return data;
  }
}

class Performance {
  int? runs;
  int? wickets;
  String? label;

  Performance({this.runs, this.wickets, this.label});

  Performance.fromJson(Map<String, dynamic> json) {
    runs = json['runs'];
    wickets = json['wickets'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['runs'] = this.runs;
    data['wickets'] = this.wickets;
    data['label'] = this.label;
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

class OverSepList {
  List<OverSep>? overSep;

  OverSepList({this.overSep});

  OverSepList.fromJson(Map<String, dynamic> json) {
    if (json['overSep'] != null) {
      overSep = <OverSep>[];
      json['overSep'].forEach((v) {
        overSep!.add(new OverSep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overSep != null) {
      data['overSep'] = this.overSep!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OverSep {
  int? score;
  int? wickets;
  int? inningsId;
  String? overSummary;
  int? runs;
  String? timestamp;
  double? overNum;
  List<String>? ovrBatNames;
  List<String>? ovrBowlNames;
  String? batTeamName;

  OverSep(
      {this.score,
      this.wickets,
      this.inningsId,
      this.overSummary,
      this.runs,
      this.timestamp,
      this.overNum,
      this.ovrBatNames,
      this.ovrBowlNames,
      this.batTeamName});

  OverSep.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    wickets = json['wickets'];
    inningsId = json['inningsId'];
    overSummary = json['overSummary'];
    runs = json['runs'];
    timestamp = json['timestamp'];
    overNum = json['overNum'];
    ovrBatNames = json['ovrBatNames'].cast<String>();
    ovrBowlNames = json['ovrBowlNames'].cast<String>();
    batTeamName = json['batTeamName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['wickets'] = this.wickets;
    data['inningsId'] = this.inningsId;
    data['overSummary'] = this.overSummary;
    data['runs'] = this.runs;
    data['timestamp'] = this.timestamp;
    data['overNum'] = this.overNum;
    data['ovrBatNames'] = this.ovrBatNames;
    data['ovrBowlNames'] = this.ovrBowlNames;
    data['batTeamName'] = this.batTeamName;
    return data;
  }
}

class MatchHeaders {
  String? state;
  String? status;
  String? matchFormat;
  TeamDetails? teamDetails;

  MatchHeaders({this.state, this.status, this.matchFormat, this.teamDetails});

  MatchHeaders.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    status = json['status'];
    matchFormat = json['matchFormat'];
    teamDetails = json['teamDetails'] != null
        ? new TeamDetails.fromJson(json['teamDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['status'] = this.status;
    data['matchFormat'] = this.matchFormat;
    if (this.teamDetails != null) {
      data['teamDetails'] = this.teamDetails!.toJson();
    }
    return data;
  }
}

class TeamDetails {
  int? batTeamId;
  String? batTeamName;
  int? bowlTeamId;
  String? bowlTeamName;

  TeamDetails(
      {this.batTeamId, this.batTeamName, this.bowlTeamId, this.bowlTeamName});

  TeamDetails.fromJson(Map<String, dynamic> json) {
    batTeamId = json['batTeamId'];
    batTeamName = json['batTeamName'];
    bowlTeamId = json['bowlTeamId'];
    bowlTeamName = json['bowlTeamName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batTeamId'] = this.batTeamId;
    data['batTeamName'] = this.batTeamName;
    data['bowlTeamId'] = this.bowlTeamId;
    data['bowlTeamName'] = this.bowlTeamName;
    return data;
  }
}
