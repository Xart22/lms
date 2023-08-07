import 'dart:convert';

TugasResponseModel tugasResponseModelFromJson(String str) =>
    TugasResponseModel.fromJson(json.decode(str));

String tugasResponseModelToJson(TugasResponseModel data) =>
    json.encode(data.toJson());

class TugasResponseModel {
  List<Tugas>? data;

  TugasResponseModel({
    required this.data,
  });

  factory TugasResponseModel.fromJson(Map<String, dynamic> json) =>
      TugasResponseModel(
        data: List<Tugas>.from(json["data"].map((x) => Tugas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Tugas {
  int id;
  String name;
  String description;
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
  Subject subject;

  Tugas({
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

  factory Tugas.fromJson(Map<String, dynamic> json) => Tugas(
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
        subject: Subject.fromJson(json["subject"]),
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

class Subject {
  int id;
  String name;
  String slug;
  String subjectId;
  String institutionId;
  String isActive;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  Subject({
    required this.id,
    required this.name,
    required this.slug,
    required this.subjectId,
    required this.institutionId,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        subjectId: json["subject_id"],
        institutionId: json["institution_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
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
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
