class LessonModel {
  String? id;
  String? lessonType;
  String? chapterId;
  bool? isLocked;
  bool? isCompleted;
  int? index;
  String? createdAt;
  String? updatedAt;

  LessonModel({
    this.id,
    this.lessonType,
    this.chapterId,
    this.index,
    this.isLocked,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lessonType = json['lessonType'];
    chapterId = json['chapterId'];
    index = json['index'];
    isLocked = json['isLocked'];
    isCompleted = json['isCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
