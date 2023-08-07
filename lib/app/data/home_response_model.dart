// To parse this JSON data, do
//
//     final homeResponseModel = homeResponseModelFromJson(jsonString);

import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) =>
    HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) =>
    json.encode(data.toJson());

class HomeResponseModel {
  bool? success;
  Data? data;

  HomeResponseModel({
    required this.success,
    required this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };

  static empty() {}
}

class Data {
  User user;
  Kelas kelas;
  List<SubjectElement> subject;
  List<Assignment> assignment;

  Data({
    required this.user,
    required this.kelas,
    required this.subject,
    required this.assignment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        kelas: Kelas.fromJson(json["kelas"]),
        subject: List<SubjectElement>.from(
            json["subject"].map((x) => SubjectElement.fromJson(x))),
        assignment: List<Assignment>.from(
            json["assignment"].map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "kelas": kelas.toJson(),
        "subject": List<dynamic>.from(subject.map((x) => x.toJson())),
        "assignment": List<dynamic>.from(assignment.map((x) => x)),
      };
}

class Institution {
  int id;
  String name;
  String slug;
  String? image;
  String phone;
  String email;
  String provinceId;
  String cityId;
  String address;
  String postalCode;
  dynamic description;
  String lat;
  String long;
  String radius;
  dynamic userId;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? path;
  String educationalLevelId;
  String isEducationalDepartment;
  String timeOfJp;

  Institution({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.phone,
    required this.email,
    required this.provinceId,
    required this.cityId,
    required this.address,
    required this.postalCode,
    this.description,
    required this.lat,
    required this.long,
    required this.radius,
    this.userId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.path,
    required this.educationalLevelId,
    required this.isEducationalDepartment,
    required this.timeOfJp,
  });

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        phone: json["phone"],
        email: json["email"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        address: json["address"],
        postalCode: json["postal_code"],
        description: json["description"],
        lat: json["lat"],
        long: json["long"],
        radius: json["radius"],
        userId: json["user_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        path: json["path"],
        educationalLevelId: json["educational_level_id"],
        isEducationalDepartment: json["is_educational_department"],
        timeOfJp: json["time_of_jp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "phone": phone,
        "email": email,
        "province_id": provinceId,
        "city_id": cityId,
        "address": address,
        "postal_code": postalCode,
        "description": description,
        "lat": lat,
        "long": long,
        "radius": radius,
        "user_id": userId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "path": path,
        "educational_level_id": educationalLevelId,
        "is_educational_department": isEducationalDepartment,
        "time_of_jp": timeOfJp,
      };
}

class Kelas {
  String? description;

  Kelas({
    this.description,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}

class SubjectElement {
  int id;
  String name;
  dynamic information;
  DateTime date;
  String startTime;
  String endTime;
  String minutes;
  String jp;
  dynamic status;
  String description;
  String isFileDetail;
  String pointer;
  String institutionGradeId;
  String institutionSubjectTeacherId;
  dynamic schedulerId;
  String institutionId;
  String dayId;
  String semesterId;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  SubjectSubject? subject;

  SubjectElement({
    required this.id,
    required this.name,
    this.information,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.minutes,
    required this.jp,
    this.status,
    required this.description,
    required this.isFileDetail,
    required this.pointer,
    required this.institutionGradeId,
    required this.institutionSubjectTeacherId,
    this.schedulerId,
    required this.institutionId,
    required this.dayId,
    required this.semesterId,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.subject,
  });

  factory SubjectElement.fromJson(Map<String, dynamic> json) => SubjectElement(
        id: json["id"],
        name: json["name"],
        information: json["information"],
        date: DateTime.parse(json["date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        minutes: json["minutes"],
        jp: json["jp"],
        status: json["status"],
        description: json["description"],
        isFileDetail: json["is_file_detail"],
        pointer: json["pointer"],
        institutionGradeId: json["institution_grade_id"],
        institutionSubjectTeacherId: json["institution_subject_teacher_id"],
        schedulerId: json["scheduler_id"],
        institutionId: json["institution_id"],
        dayId: json["day_id"],
        semesterId: json["semester_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subject: json["subject"] == null
            ? null
            : SubjectSubject.fromJson(json["subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "information": information,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "minutes": minutes,
        "jp": jp,
        "status": status,
        "description": description,
        "is_file_detail": isFileDetail,
        "pointer": pointer,
        "institution_grade_id": institutionGradeId,
        "institution_subject_teacher_id": institutionSubjectTeacherId,
        "scheduler_id": schedulerId,
        "institution_id": institutionId,
        "day_id": dayId,
        "semester_id": semesterId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject": subject?.toJson(),
      };
}

class SubjectSubject {
  int id;
  String name;

  SubjectSubject({
    required this.id,
    required this.name,
  });

  factory SubjectSubject.fromJson(Map<String, dynamic> json) => SubjectSubject(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Assignment {
  int id;
  String name;
  dynamic description;
  DateTime startDate;
  DateTime endDate;
  String isFileDetail;
  String isTopicDetail;
  String institutionGradeId;
  String schedulerDetailSubjectMeetId;
  String institutionId;
  String institutionSubjectId;
  String institutionSubjectTeacherId;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String subjectId;
  AssignmentSubject subject;

  Assignment({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isFileDetail,
    required this.isTopicDetail,
    required this.institutionGradeId,
    required this.schedulerDetailSubjectMeetId,
    required this.institutionId,
    required this.institutionSubjectId,
    required this.institutionSubjectTeacherId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.subjectId,
    required this.subject,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        isFileDetail: json["is_file_detail"],
        isTopicDetail: json["is_topic_detail"],
        institutionGradeId: json["institution_grade_id"],
        schedulerDetailSubjectMeetId: json["scheduler_detail_subject_meet_id"],
        institutionId: json["institution_id"],
        institutionSubjectId: json["institution_subject_id"],
        institutionSubjectTeacherId: json["institution_subject_teacher_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subjectId: json["subject_id"],
        subject: AssignmentSubject.fromJson(json["subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "is_file_detail": isFileDetail,
        "is_topic_detail": isTopicDetail,
        "institution_grade_id": institutionGradeId,
        "scheduler_detail_subject_meet_id": schedulerDetailSubjectMeetId,
        "institution_id": institutionId,
        "institution_subject_id": institutionSubjectId,
        "institution_subject_teacher_id": institutionSubjectTeacherId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject_id": subjectId,
        "subject": subject.toJson(),
      };
}

class AssignmentSubject {
  int id;
  String name;
  String slug;
  String subjectId;
  String institutionId;
  String isActive;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  AssignmentSubject({
    required this.id,
    required this.name,
    required this.slug,
    required this.subjectId,
    required this.institutionId,
    required this.isActive,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignmentSubject.fromJson(Map<String, dynamic> json) =>
      AssignmentSubject(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        subjectId: json["subject_id"],
        institutionId: json["institution_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "subject_id": subjectId,
        "institution_id": institutionId,
        "is_active": isActive,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
