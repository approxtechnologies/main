class TeamPlayerListModel {
  List<Player>? player;

  TeamPlayerListModel({this.player});

  TeamPlayerListModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? imageId;
  String? id;
  String? battingStyle;
  String? bowlingStyle;

  Player(
      {this.name, this.imageId, this.id, this.battingStyle, this.bowlingStyle});

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageId = json['imageId'];
    id = json['id'];
    battingStyle = json['battingStyle'];
    bowlingStyle = json['bowlingStyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageId'] = this.imageId;
    data['id'] = this.id;
    data['battingStyle'] = this.battingStyle;
    data['bowlingStyle'] = this.bowlingStyle;
    return data;
  }
}
