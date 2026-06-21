class LessonModel {
  bool? success;
  String? message;
  List<LessonData>? data;

  LessonModel({this.success, this.message, this.data});

  LessonModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LessonData>[];
      json['data'].forEach((v) {
        data!.add(LessonData.fromJson(v));
      });
    }
  }
}

class LessonData {
  String? id;
  String? name;
  String? icon;
  int? index;
  String? createdAt;
  String? updatedAt;

  LessonData({
    this.id,
    this.name,
    this.icon,
    this.index,
    this.createdAt,
    this.updatedAt,
  });

  LessonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    index = json['index'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
