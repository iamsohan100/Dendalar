import 'package:dendalar/feature/main_course/model/question_model.dart';

class DialogQuestionModel {
  bool? success;
  String? message;
  Question? questionData;

  DialogQuestionModel({this.success, this.message, this.questionData});

  DialogQuestionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    questionData = json['data'] != null ? Question.fromJson(json['data']) : null;
  }
}

class Question {
  Meta? meta;
  List<QuestionModel>? questionList;

  Question({this.meta, this.questionList});

  Question.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['questions'] != null) {
      questionList = <QuestionModel>[];
      json['questions'].forEach((v) {
        questionList!.add(QuestionModel.fromJson(v));
      });
    }
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;

  Meta({this.page, this.limit, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
  }
}
