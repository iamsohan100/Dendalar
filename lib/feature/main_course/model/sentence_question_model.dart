import 'package:dendalar/feature/main_course/model/question_model.dart';

class SentenceQuestionModel {
  bool? success;
  String? message;
  List<QuestionModel>? questionList;

  SentenceQuestionModel({this.success, this.message, this.questionList});

  SentenceQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null && json['data']['questions'] != null) {
      questionList = <QuestionModel>[];
      json['data']['questions'].forEach((v) {
        questionList!.add(QuestionModel.fromJson(v));
      });
    }
  }
}
