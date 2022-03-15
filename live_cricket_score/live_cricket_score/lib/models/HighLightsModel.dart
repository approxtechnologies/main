class HighLightsModel {
  List<CommentaryLines>? commentaryLines;
  MatchHeaders? matchHeaders;
  AppIndex? appIndex;
  String? responseLastUpdated;

  HighLightsModel(
      {this.commentaryLines,
      this.matchHeaders,
      this.appIndex,
      this.responseLastUpdated});

  HighLightsModel.fromJson(Map<String, dynamic> json) {
    if (json['commentaryLines'] != null) {
      commentaryLines = <CommentaryLines>[];
      json['commentaryLines'].forEach((v) {
        commentaryLines!.add(new CommentaryLines.fromJson(v));
      });
    }
    matchHeaders = json['matchHeaders'] != null
        ? new MatchHeaders.fromJson(json['matchHeaders'])
        : null;
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
    responseLastUpdated = json['responseLastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commentaryLines != null) {
      data['commentaryLines'] =
          this.commentaryLines!.map((v) => v.toJson()).toList();
    }
    if (this.matchHeaders != null) {
      data['matchHeaders'] = this.matchHeaders!.toJson();
    }
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    data['responseLastUpdated'] = this.responseLastUpdated;
    return data;
  }
}

class CommentaryLines {
  Commentary? commentary;

  CommentaryLines({this.commentary});

  CommentaryLines.fromJson(Map<String, dynamic> json) {
    commentary = json['commentary'] != null
        ? new Commentary.fromJson(json['commentary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commentary != null) {
      data['commentary'] = this.commentary!.toJson();
    }
    return data;
  }
}

class Commentary {
  String? commtxt;
  String? timestamp;
  double? overNum;
  int? inningsId;
  String? eventType;
  List<CommentaryFormats>? commentaryFormats;
  int? ballNbr;
  OverSep? overSep;

  Commentary(
      {this.commtxt,
      this.timestamp,
      this.overNum,
      this.inningsId,
      this.eventType,
      this.commentaryFormats,
      this.ballNbr,
      this.overSep});

  Commentary.fromJson(Map<String, dynamic> json) {
    commtxt = json['commtxt'];
    timestamp = json['timestamp'];
    overNum = json['overNum'];
    inningsId = json['inningsId'];
    eventType = json['eventType'];
    if (json['commentaryFormats'] != null) {
      commentaryFormats = <CommentaryFormats>[];
      json['commentaryFormats'].forEach((v) {
        commentaryFormats!.add(new CommentaryFormats.fromJson(v));
      });
    }
    ballNbr = json['ballNbr'];
    overSep =
        json['overSep'] != null ? new OverSep.fromJson(json['overSep']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commtxt'] = this.commtxt;
    data['timestamp'] = this.timestamp;
    data['overNum'] = this.overNum;
    data['inningsId'] = this.inningsId;
    data['eventType'] = this.eventType;
    if (this.commentaryFormats != null) {
      data['commentaryFormats'] =
          this.commentaryFormats!.map((v) => v.toJson()).toList();
    }
    data['ballNbr'] = this.ballNbr;
    if (this.overSep != null) {
      data['overSep'] = this.overSep!.toJson();
    }
    return data;
  }
}

class CommentaryFormats {
  String? type;
  List<Value>? value;

  CommentaryFormats({this.type, this.value});

  CommentaryFormats.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value {
  String? id;
  String? value;

  Value({this.id, this.value});

  Value.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class OverSep {
  int? score;
  int? wickets;
  int? inningsId;
  String? overSummary;
  int? runs;
  String? batStrikerDetails;
  String? batNonStrikerDetails;
  String? bowlDetails;
  String? timestamp;
  double? overNum;
  String? batStrikerName;
  String? batNonStrikerName;
  String? bowlName;
  String? batTeamName;

  OverSep(
      {this.score,
      this.wickets,
      this.inningsId,
      this.overSummary,
      this.runs,
      this.batStrikerDetails,
      this.batNonStrikerDetails,
      this.bowlDetails,
      this.timestamp,
      this.overNum,
      this.batStrikerName,
      this.batNonStrikerName,
      this.bowlName,
      this.batTeamName});

  OverSep.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    wickets = json['wickets'];
    inningsId = json['inningsId'];
    overSummary = json['overSummary'];
    runs = json['runs'];
    batStrikerDetails = json['batStrikerDetails'];
    batNonStrikerDetails = json['batNonStrikerDetails'];
    bowlDetails = json['bowlDetails'];
    timestamp = json['timestamp'];
    overNum = json['overNum'];
    batStrikerName = json['batStrikerName'];
    batNonStrikerName = json['batNonStrikerName'];
    bowlName = json['bowlName'];
    batTeamName = json['batTeamName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['wickets'] = this.wickets;
    data['inningsId'] = this.inningsId;
    data['overSummary'] = this.overSummary;
    data['runs'] = this.runs;
    data['batStrikerDetails'] = this.batStrikerDetails;
    data['batNonStrikerDetails'] = this.batNonStrikerDetails;
    data['bowlDetails'] = this.bowlDetails;
    data['timestamp'] = this.timestamp;
    data['overNum'] = this.overNum;
    data['batStrikerName'] = this.batStrikerName;
    data['batNonStrikerName'] = this.batNonStrikerName;
    data['bowlName'] = this.bowlName;
    data['batTeamName'] = this.batTeamName;
    return data;
  }
}

class MatchHeaders {
  String? state;
  String? status;
  String? matchFormat;
  String? matchStartTimestamp;
  TeamDetails? teamDetails;
  MomPlayers? momPlayers;
  MomPlayers? mosPlayers;
  int? winningTeamId;
  String? matchEndTimeStamp;
  int? seriesId;
  String? matchDesc;
  String? seriesName;

  MatchHeaders(
      {this.state,
      this.status,
      this.matchFormat,
      this.matchStartTimestamp,
      this.teamDetails,
      this.momPlayers,
      this.mosPlayers,
      this.winningTeamId,
      this.matchEndTimeStamp,
      this.seriesId,
      this.matchDesc,
      this.seriesName});

  MatchHeaders.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    status = json['status'];
    matchFormat = json['matchFormat'];
    matchStartTimestamp = json['matchStartTimestamp'];
    teamDetails = json['teamDetails'] != null
        ? new TeamDetails.fromJson(json['teamDetails'])
        : null;
    momPlayers = json['momPlayers'] != null
        ? new MomPlayers.fromJson(json['momPlayers'])
        : null;
    mosPlayers = json['mosPlayers'] != null
        ? new MomPlayers.fromJson(json['mosPlayers'])
        : null;
    winningTeamId = json['winningTeamId'];
    matchEndTimeStamp = json['matchEndTimeStamp'];
    seriesId = json['seriesId'];
    matchDesc = json['matchDesc'];
    seriesName = json['seriesName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['status'] = this.status;
    data['matchFormat'] = this.matchFormat;
    data['matchStartTimestamp'] = this.matchStartTimestamp;
    if (this.teamDetails != null) {
      data['teamDetails'] = this.teamDetails!.toJson();
    }
    if (this.momPlayers != null) {
      data['momPlayers'] = this.momPlayers!.toJson();
    }
    if (this.mosPlayers != null) {
      data['mosPlayers'] = this.mosPlayers!.toJson();
    }
    data['winningTeamId'] = this.winningTeamId;
    data['matchEndTimeStamp'] = this.matchEndTimeStamp;
    data['seriesId'] = this.seriesId;
    data['matchDesc'] = this.matchDesc;
    data['seriesName'] = this.seriesName;
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

class MomPlayers {
  List<Player>? player;

  MomPlayers({this.player});

  MomPlayers.fromJson(Map<String, dynamic> json) {
    if (json['player'] != null) {
      player = <Player>[];
      json['player'].forEach((v) {
        player!.add(new Player.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  String? id;
  String? name;
  String? role;
  String? teamName;
  String? faceImageId;

  Player({this.id, this.name, this.role, this.teamName, this.faceImageId});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    teamName = json['teamName'];
    faceImageId = json['faceImageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['role'] = this.role;
    data['teamName'] = this.teamName;
    data['faceImageId'] = this.faceImageId;
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
