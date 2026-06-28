class PrivacyAboutModel {
  bool? success;
  String? message;
  Data? data;

  PrivacyAboutModel({this.success, this.message, this.data});

  PrivacyAboutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  String? id;
  String? privacyPolicy;
  String? termsCondition;
  String? aboutUs;
  String? updatedAt;

  Data(
      {this.id,
      this.privacyPolicy,
      this.termsCondition,
      this.aboutUs,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    privacyPolicy = json['privacyPolicy'];
    termsCondition = json['termsCondition'];
    aboutUs = json['aboutUs'];
    updatedAt = json['updatedAt'];
  }

}
