import 'package:dendalar/feature/main_course/model/lesson_model.dart';

class ChapterModel {
  bool? success;
  String? message;
  List<ChapterData>? chapterList;

  ChapterModel({this.success, this.message, this.chapterList});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      chapterList = <ChapterData>[];
      json['data'].forEach((v) {
        chapterList!.add(ChapterData.fromJson(v));
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
  List<LessonModel>? lessonList;

  ChapterData({
    this.id,
    this.name,
    this.index,
    this.levelId,
    this.createdAt,
    this.updatedAt,
    this.level,
    this.lessonList,
  });

  ChapterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    index = json['index'];
    levelId = json['levelId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
    if (json['lessons'] != null) {
      lessonList = <LessonModel>[];
      json['lessons'].forEach((v) {
        lessonList!.add(LessonModel.fromJson(v));
      });
    }
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
