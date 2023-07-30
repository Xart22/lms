// To parse this JSON data, do
//
//     final mapelResponseModel = mapelResponseModelFromJson(jsonString);

import 'dart:convert';

MapelResponseModel mapelResponseModelFromJson(String str) =>
    MapelResponseModel.fromJson(json.decode(str));

String mapelResponseModelToJson(MapelResponseModel data) =>
    json.encode(data.toJson());

class MapelResponseModel {
  String message;
  bool success;
  List<Datum> data;

  MapelResponseModel({
    required this.message,
    required this.success,
    required this.data,
  });

  factory MapelResponseModel.fromJson(Map<String, dynamic> json) =>
      MapelResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
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
  Subject subject;

  Datum({
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
    required this.subject,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        subject: Subject.fromJson(json["subject"]),
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
        "subject": subject.toJson(),
      };
}

class Subject {
  int id;
  String name;
  String code;
  String jp;
  String jpMax;
  String meetMax;
  String userId;
  String institutionSubjectId;
  String subjectId;
  String institutionId;
  String isGradeDetail;
  String isDayDetail;
  String isActive;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  Subject({
    required this.id,
    required this.name,
    required this.code,
    required this.jp,
    required this.jpMax,
    required this.meetMax,
    required this.userId,
    required this.institutionSubjectId,
    required this.subjectId,
    required this.institutionId,
    required this.isGradeDetail,
    required this.isDayDetail,
    required this.isActive,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        jp: json["jp"],
        jpMax: json["jp_max"],
        meetMax: json["meet_max"],
        userId: json["user_id"],
        institutionSubjectId: json["institution_subject_id"],
        subjectId: json["subject_id"],
        institutionId: json["institution_id"],
        isGradeDetail: json["is_grade_detail"],
        isDayDetail: json["is_day_detail"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "jp": jp,
        "jp_max": jpMax,
        "meet_max": meetMax,
        "user_id": userId,
        "institution_subject_id": institutionSubjectId,
        "subject_id": subjectId,
        "institution_id": institutionId,
        "is_grade_detail": isGradeDetail,
        "is_day_detail": isDayDetail,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
