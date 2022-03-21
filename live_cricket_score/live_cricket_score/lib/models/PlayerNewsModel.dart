class PlayerNewsModel {
  List<NewsList>? newsList;
  String? lastUpdatedTime;
  AppIndex? appIndex;

  PlayerNewsModel({this.newsList, this.lastUpdatedTime, this.appIndex});

  PlayerNewsModel.fromJson(Map<String, dynamic> json) {
    if (json['newsList'] != null) {
      newsList = <NewsList>[];
      json['newsList'].forEach((v) {
        newsList!.add(new NewsList.fromJson(v));
      });
    }
    lastUpdatedTime = json['lastUpdatedTime'];
    appIndex = json['appIndex'] != null
        ? new AppIndex.fromJson(json['appIndex'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsList != null) {
      data['newsList'] = this.newsList!.map((v) => v.toJson()).toList();
    }
    data['lastUpdatedTime'] = this.lastUpdatedTime;
    if (this.appIndex != null) {
      data['appIndex'] = this.appIndex!.toJson();
    }
    return data;
  }
}

class NewsList {
  Story? story;
  Ad? ad;

  NewsList({this.story, this.ad});

  NewsList.fromJson(Map<String, dynamic> json) {
    story = json['story'] != null ? new Story.fromJson(json['story']) : null;
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    if (this.ad != null) {
      data['ad'] = this.ad!.toJson();
    }
    return data;
  }
}

class Story {
  int? id;
  String? hline;
  String? intro;
  String? pubTime;
  String? source;
  String? storyType;
  int? imageId;
  String? seoHeadline;
  String? context;
  CoverImage? coverImage;
  int? planId;

  Story(
      {this.id,
      this.hline,
      this.intro,
      this.pubTime,
      this.source,
      this.storyType,
      this.imageId,
      this.seoHeadline,
      this.context,
      this.coverImage,
      this.planId});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hline = json['hline'];
    intro = json['intro'];
    pubTime = json['pubTime'];
    source = json['source'];
    storyType = json['storyType'];
    imageId = json['imageId'];
    seoHeadline = json['seoHeadline'];
    context = json['context'];
    coverImage = json['coverImage'] != null
        ? new CoverImage.fromJson(json['coverImage'])
        : null;
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hline'] = this.hline;
    data['intro'] = this.intro;
    data['pubTime'] = this.pubTime;
    data['source'] = this.source;
    data['storyType'] = this.storyType;
    data['imageId'] = this.imageId;
    data['seoHeadline'] = this.seoHeadline;
    data['context'] = this.context;
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage!.toJson();
    }
    data['planId'] = this.planId;
    return data;
  }
}

class CoverImage {
  String? id;
  String? caption;
  String? source;

  CoverImage({this.id, this.caption, this.source});

  CoverImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['source'] = this.source;
    return data;
  }
}

class Ad {
  String? name;
  String? adLayout;
  int? position;

  Ad({this.name, this.adLayout, this.position});

  Ad.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    adLayout = json['adLayout'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['adLayout'] = this.adLayout;
    data['position'] = this.position;
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
