// To parse this JSON data, do
//
//     final detailMapelResponseModel = detailMapelResponseModelFromJson(jsonString);

import 'dart:convert';

DetailMapelResponseModel detailMapelResponseModelFromJson(String str) =>
    DetailMapelResponseModel.fromJson(json.decode(str));

String detailMapelResponseModelToJson(DetailMapelResponseModel data) =>
    json.encode(data.toJson());

class DetailMapelResponseModel {
  bool? success;
  Data? data;

  DetailMapelResponseModel({
    required this.success,
    required this.data,
  });

  factory DetailMapelResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailMapelResponseModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  int id;
  String name;
  String? information;
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
  StatusAbsen? statusAbsen;
  List<StatusAbsen> presences;
  Subject subject;
  List<Topic>? topics;
  List<FileElement>? files;

  Data({
    required this.id,
    required this.name,
    required this.information,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.minutes,
    required this.jp,
    required this.status,
    required this.description,
    required this.isFileDetail,
    required this.pointer,
    required this.institutionGradeId,
    required this.institutionSubjectTeacherId,
    required this.schedulerId,
    required this.institutionId,
    required this.dayId,
    required this.semesterId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.statusAbsen,
    required this.presences,
    required this.subject,
    required this.topics,
    required this.files,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        statusAbsen: json['status_absen'] == null
            ? null
            : json["status_absen"]['id'] != null
                ? StatusAbsen.fromJson(json["status_absen"])
                : null,
        presences: List<StatusAbsen>.from(
            json["presences"].map((x) => StatusAbsen.fromJson(x))),
        subject: Subject.fromJson(json["subject"]),
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
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
        "status_absen": statusAbsen?.toJson(),
        "presences": List<dynamic>.from(presences.map((x) => x.toJson())),
        "subject": subject.toJson(),
      };
}

class FileElement {
  int id;
  String name;
  String path;
  String schedulerDetailSubjectMeetId;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  FileElement({
    required this.id,
    required this.name,
    required this.path,
    required this.schedulerDetailSubjectMeetId,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        schedulerDetailSubjectMeetId: json["scheduler_detail_subject_meet_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "scheduler_detail_subject_meet_id": schedulerDetailSubjectMeetId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class StatusAbsen {
  int id;
  String image;
  String? path;
  String lat;
  String long;
  String? device;
  String location;
  DateTime datetime;
  dynamic status;
  String userId;
  String schedulerDetailSubjectMeetId;
  String institutionGradeId;
  String institutionSubjectTeacherId;
  String institutionId;
  String pointer;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  StatusAbsen({
    required this.id,
    required this.image,
    required this.path,
    required this.lat,
    required this.long,
    required this.device,
    required this.location,
    required this.datetime,
    required this.status,
    required this.userId,
    required this.schedulerDetailSubjectMeetId,
    required this.institutionGradeId,
    required this.institutionSubjectTeacherId,
    required this.institutionId,
    required this.pointer,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StatusAbsen.fromJson(Map<String, dynamic> json) => StatusAbsen(
        id: json["id"],
        image: json["image"],
        path: json["path"],
        lat: json["lat"],
        long: json["long"],
        device: json["device"],
        location: json["location"],
        datetime: DateTime.parse(json["datetime"]),
        status: json["status"],
        userId: json["user_id"],
        schedulerDetailSubjectMeetId: json["scheduler_detail_subject_meet_id"],
        institutionGradeId: json["institution_grade_id"],
        institutionSubjectTeacherId: json["institution_subject_teacher_id"],
        institutionId: json["institution_id"],
        pointer: json["pointer"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "path": path,
        "lat": lat,
        "long": long,
        "device": device,
        "location": location,
        "datetime": datetime.toIso8601String(),
        "status": status,
        "user_id": userId,
        "scheduler_detail_subject_meet_id": schedulerDetailSubjectMeetId,
        "institution_grade_id": institutionGradeId,
        "institution_subject_teacher_id": institutionSubjectTeacherId,
        "institution_id": institutionId,
        "pointer": pointer,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
    required this.updatedBy,
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

class Topic {
  int id;
  String name;
  String description;
  String institutionSubjectTeacherId;
  String institutionSubjectId;
  String subjectId;
  String institutionId;
  String isActive;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

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
    required this.pivot,
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
        pivot: Pivot.fromJson(json["pivot"]),
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
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  String schedulerDetailSubjectMeetId;
  String institutionSubjectTeacherTopicId;

  Pivot({
    required this.schedulerDetailSubjectMeetId,
    required this.institutionSubjectTeacherTopicId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        schedulerDetailSubjectMeetId: json["scheduler_detail_subject_meet_id"],
        institutionSubjectTeacherTopicId:
            json["institution_subject_teacher_topic_id"],
      );

  Map<String, dynamic> toJson() => {
        "scheduler_detail_subject_meet_id": schedulerDetailSubjectMeetId,
        "institution_subject_teacher_topic_id":
            institutionSubjectTeacherTopicId,
      };
}
