class ChapterModel {
  bool? success;
  String? message;
  List<ChapterData>? data;

  ChapterModel({this.success, this.message, this.data});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChapterData>[];
      json['data'].forEach((v) {
        data!.add(ChapterData.fromJson(v));
      });
    }
  }
}

class ChapterData {
  String? id;
  String? name;
  int? index;
  String? levelId;
  String? createdAt;
  String? updatedAt;
  Level? level;

  ChapterData({
    this.id,
    this.name,
    this.index,
    this.levelId,
    this.createdAt,
    this.updatedAt,
    this.level,
  });

  ChapterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    index = json['index'];
    levelId = json['levelId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }
}

class Level {
  String? id;
  String? name;
  int? index;

  Level({this.id, this.name, this.index});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    index = json['index'];
  }
}
