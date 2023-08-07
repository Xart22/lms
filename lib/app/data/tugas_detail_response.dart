import 'dart:convert';

TugasDetailResponseModel tugasDetailResponseModelFromJson(String str) =>
    TugasDetailResponseModel.fromJson(json.decode(str));

String tugasDetailResponseModelToJson(TugasDetailResponseModel data) =>
    json.encode(data.toJson());

class TugasDetailResponseModel {
  Data? data;

  TugasDetailResponseModel({
    required this.data,
  });

  factory TugasDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      TugasDetailResponseModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
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
  TugasAnda? tugasAnda;
  List<Topic>? topics;
  List<FileElement>? files;
  List<TugasAnda> studentJobs;

  Data({
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
    required this.tugasAnda,
    required this.topics,
    required this.files,
    required this.studentJobs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        tugasAnda: json["tugas_anda"] == null
            ? null
            : json['tugas_anda']['id'] == null
                ? null
                : TugasAnda.fromJson(json["tugas_anda"]),
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        studentJobs: List<TugasAnda>.from(
            json["student_jobs"].map((x) => TugasAnda.fromJson(x))),
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
        "tugas_anda": tugasAnda?.toJson(),
        "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
        "files": List<dynamic>.from(files!.map((x) => x.toJson())),
        "student_jobs": List<dynamic>.from(studentJobs.map((x) => x.toJson())),
      };
}

class FileElement {
  int id;
  String name;
  String path;
  String assignmentId;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  FileElement({
    required this.id,
    required this.name,
    required this.path,
    required this.assignmentId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        assignmentId: json["assignment_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "assignment_id": assignmentId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class TugasAnda {
  int id;
  String description;
  DateTime datetime;
  String file;
  String? path;
  String userId;
  String assignmentId;
  String institutionGradeId;
  String schedulerDetailSubjectMeetId;
  String institutionId;
  String institutionSubjectId;
  String institutionSubjectTeacherId;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  TugasAnda({
    required this.id,
    required this.description,
    required this.datetime,
    required this.file,
    required this.path,
    required this.userId,
    required this.assignmentId,
    required this.institutionGradeId,
    required this.schedulerDetailSubjectMeetId,
    required this.institutionId,
    required this.institutionSubjectId,
    required this.institutionSubjectTeacherId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TugasAnda.fromJson(Map<String, dynamic> json) => TugasAnda(
        id: json["id"],
        description: json["description"],
        datetime: DateTime.parse(json["datetime"]),
        file: json["file"],
        path: json["path"],
        userId: json["user_id"],
        assignmentId: json["assignment_id"],
        institutionGradeId: json["institution_grade_id"],
        schedulerDetailSubjectMeetId: json["scheduler_detail_subject_meet_id"],
        institutionId: json["institution_id"],
        institutionSubjectId: json["institution_subject_id"],
        institutionSubjectTeacherId: json["institution_subject_teacher_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "datetime": datetime.toIso8601String(),
        "file": file,
        "path": path,
        "user_id": userId,
        "assignment_id": assignmentId,
        "institution_grade_id": institutionGradeId,
        "scheduler_detail_subject_meet_id": schedulerDetailSubjectMeetId,
        "institution_id": institutionId,
        "institution_subject_id": institutionSubjectId,
        "institution_subject_teacher_id": institutionSubjectTeacherId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Topic {
  int id;
  String name;
  String? description;
  String institutionSubjectTeacherId;
  String institutionSubjectId;
  String subjectId;
  String institutionId;
  String isActive;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  Topic({
    required this.id,
    required this.name,
    required this.description,
    required this.institutionSubjectTeacherId,
    required this.institutionSubjectId,
    required this.subjectId,
    required this.institutionId,
    required this.isActive,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        institutionSubjectTeacherId: json["institution_subject_teacher_id"],
        institutionSubjectId: json["institution_subject_id"],
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
        "description": description,
        "institution_subject_teacher_id": institutionSubjectTeacherId,
        "institution_subject_id": institutionSubjectId,
        "subject_id": subjectId,
        "institution_id": institutionId,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
