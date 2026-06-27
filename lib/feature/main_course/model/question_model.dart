import 'package:dendalar/feature/main_course/model/lesson_model.dart';

class QuestionModel {
  String? id;
  String? chapterId;
  String? lessonId;
  String? sentenceInEnglish;
  String? sentenceInLearningLanguage;
  String? hint;
  // Null? fullSentence;
  // Null? missingWord;
  int? index;
  String? type;
  String? createdAt;
  String? updatedAt;
  LessonModel? lesson;
  bool? isCompleted;

  QuestionModel({
    this.id,
    this.chapterId,
    this.lessonId,
    this.sentenceInEnglish,
    this.sentenceInLearningLanguage,
    this.hint,
    // this.fullSentence,
    // this.missingWord,
    this.index,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.lesson,
    this.isCompleted,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapterId'];
    lessonId = json['lessonId'];
    sentenceInEnglish = json['sentenceInEnglish'];
    sentenceInLearningLanguage = json['sentenceInLearningLanguage'];
    hint = json['hint'];
    // fullSentence = json['fullSentence'];
    // missingWord = json['missingWord'];
    index = json['index'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    lesson = json['lesson'] != null
        ? LessonModel.fromJson(json['lesson'])
        : null;
    isCompleted = json['isCompleted'];
  }
}
