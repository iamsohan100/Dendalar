class LevelModel {
  bool? success;
  String? message;
  List<LevelData>? data;

  LevelModel({this.success, this.message, this.data});

  LevelModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LevelData>[];
      json['data'].forEach((v) {
        data!.add(LevelData.fromJson(v));
      });
    }
  }
}

class LevelData {
  String? id;
  String? name;
  int? index;
  String? createdAt;
  String? updatedAt;
  bool? isCompleted;
  bool? isLocked;

  LevelData({
    this.id,
    this.name,
    this.index,
    this.createdAt,
    this.updatedAt,
    this.isCompleted,
    this.isLocked,
  });

  LevelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    index = json['index'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isCompleted = json['isCompleted'];
    isCompleted = json['isLocked'];
  }
}
