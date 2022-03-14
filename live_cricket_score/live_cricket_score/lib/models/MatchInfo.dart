class MatchInfoModel {
  int? matchId;
  int? seriesId;
  String? seriesName;
  String? matchDesc;
  String? matchFormat;
  String? startDate;
  String? endDate;
  String? state;
  String? status;
  Team1? team1;
  Team1? team2;
  Umpire1? umpire1;
  Umpire1? umpire2;
  Umpire1? umpire3;
  Umpire1? referee;
  VenueInfo? venueInfo;
  AppIndex? appIndex;
  String? toss;
  String? seriesStartDt;
  String? seriesEndDt;

  MatchInfoModel(
      {this.matchId,
      this.seriesId,
      this.seriesName,
      this.matchDesc,
      this.matchFormat,
      this.startDate,
      this.endDate,
      this.state,
      this.status,
      this.team1,
      this.team2,
      this.umpire1,
      this.umpire2,
      this.umpire3,
      this.referee,
      this.venueInfo,
      this.appIndex,
      this.toss,
      this.seriesStartDt,
      this.seriesEndDt});

  MatchInfoModel.fromJson(Map<String, dynamic> json) {
    matchId = json['matchId'];
    seriesId = json['seriesId'];
    seriesName = json['seriesName'];
    matchDesc = json['matchDesc'];
    matchFormat = json['matchFormat'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    state = json['state'];
    status = json['status'];
    team1 = json['team1'] != null ? new Team1.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? new Team1.fromJson(json['team2']) : null;
    umpire1 =
        json['umpire1'] != null ? new Umpire1.fromJson(json['umpire1']) : null;
    umpire2 =
        json['umpire2'] != null ? new Umpire1.fromJson(json['umpire2']) : null;
    umpire3 =
        json['umpire3'] != null ? new Umpire1.fromJson(json['umpire3']) : null;
    referee =
        json['referee'] != null ? new Umpire1.fromJson(json['referee']) : null;
    venueInfo = json['venueInfo'] != null
        ? new VenueInfo.fromJson(json['venueInfo'])
        : null;
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
    toss = json['toss'];
    seriesStartDt = json['seriesStartDt'];
    seriesEndDt = json['seriesEndDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matchId'] = this.matchId;
    data['seriesId'] = this.seriesId;
    data['seriesName'] = this.seriesName;
    data['matchDesc'] = this.matchDesc;
    data['matchFormat'] = this.matchFormat;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['state'] = this.state;
    data['status'] = this.status;
    if (this.team1 != null) {
      data['team1'] = this.team1!.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2!.toJson();
    }
    if (this.umpire1 != null) {
      data['umpire1'] = this.umpire1!.toJson();
    }
    if (this.umpire2 != null) {
      data['umpire2'] = this.umpire2!.toJson();
    }
    if (this.umpire3 != null) {
      data['umpire3'] = this.umpire3!.toJson();
    }
    if (this.referee != null) {
      data['referee'] = this.referee!.toJson();
    }
    if (this.venueInfo != null) {
      data['venueInfo'] = this.venueInfo!.toJson();
    }
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    data['toss'] = this.toss;
    data['seriesStartDt'] = this.seriesStartDt;
    data['seriesEndDt'] = this.seriesEndDt;
    return data;
  }
}

class Team1 {
  int? teamId;
  String? teamName;
  String? teamSName;

  Team1({this.teamId, this.teamName, this.teamSName});

  Team1.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    teamName = json['teamName'];
    teamSName = json['teamSName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamId'] = this.teamId;
    data['teamName'] = this.teamName;
    data['teamSName'] = this.teamSName;
    return data;
  }
}

class Umpire1 {
  int? id;
  String? name;

  Umpire1({this.id, this.name});

  Umpire1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class VenueInfo {
  int? id;
  String? ground;
  String? city;
  String? country;
  String? timezone;
  int? established;
  String? capacity;
  String? ends;
  String? homeTeam;

  VenueInfo(
      {this.id,
      this.ground,
      this.city,
      this.country,
      this.timezone,
      this.established,
      this.capacity,
      this.ends,
      this.homeTeam});

  VenueInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ground = json['ground'];
    city = json['city'];
    country = json['country'];
    timezone = json['timezone'];
    established = json['established'];
    capacity = json['capacity'];
    ends = json['ends'];
    homeTeam = json['homeTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ground'] = this.ground;
    data['city'] = this.city;
    data['country'] = this.country;
    data['timezone'] = this.timezone;
    data['established'] = this.established;
    data['capacity'] = this.capacity;
    data['ends'] = this.ends;
    data['homeTeam'] = this.homeTeam;
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
