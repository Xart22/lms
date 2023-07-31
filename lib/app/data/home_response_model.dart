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
  Institution institution;
  Kelas kelas;
  List<SubjectElement> subject;
  List<dynamic> assignment;

  Data({
    required this.user,
    required this.institution,
    required this.kelas,
    required this.subject,
    required this.assignment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        institution: Institution.fromJson(json["institution"]),
        kelas: Kelas.fromJson(json["kelas"]),
        subject: List<SubjectElement>.from(
            json["subject"].map((x) => SubjectElement.fromJson(x))),
        assignment: List<dynamic>.from(json["assignment"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "institution": institution.toJson(),
        "kelas": kelas.toJson(),
        "subject": List<dynamic>.from(subject.map((x) => x.toJson())),
        "assignment": List<dynamic>.from(assignment.map((x) => x)),
      };
}

class Institution {
  int id;
  String name;
  String slug;
  String image;
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
  String path;
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
  int id;
  String? name;
  String? slug;
  String? description;
  String createdBy;
  dynamic updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String institutionId;
  String gradeId;
  String userId;
  String isActive;
  String institutionEducationalDepartmentId;
  String educationalDepartmentId;
  String semesterId;
  List<SubjectElement>? scheduleDetailToday;
  String? institutionGradeId;
  Kelas? institutionGrade;

  Kelas({
    required this.id,
    this.name,
    this.slug,
    this.description,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.institutionId,
    required this.gradeId,
    required this.userId,
    required this.isActive,
    required this.institutionEducationalDepartmentId,
    required this.educationalDepartmentId,
    required this.semesterId,
    this.scheduleDetailToday,
    this.institutionGradeId,
    this.institutionGrade,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        institutionId: json["institution_id"],
        gradeId: json["grade_id"],
        userId: json["user_id"],
        isActive: json["is_active"],
        institutionEducationalDepartmentId:
            json["institution_educational_department_id"],
        educationalDepartmentId: json["educational_department_id"],
        semesterId: json["semester_id"],
        scheduleDetailToday: json["schedule_detail_today"] == null
            ? []
            : List<SubjectElement>.from(json["schedule_detail_today"]!
                .map((x) => SubjectElement.fromJson(x))),
        institutionGradeId: json["institution_grade_id"],
        institutionGrade: json["institution_grade"] == null
            ? null
            : Kelas.fromJson(json["institution_grade"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "institution_id": institutionId,
        "grade_id": gradeId,
        "user_id": userId,
        "is_active": isActive,
        "institution_educational_department_id":
            institutionEducationalDepartmentId,
        "educational_department_id": educationalDepartmentId,
        "semester_id": semesterId,
        "schedule_detail_today": scheduleDetailToday == null
            ? []
            : List<dynamic>.from(scheduleDetailToday!.map((x) => x.toJson())),
        "institution_grade_id": institutionGradeId,
        "institution_grade": institutionGrade?.toJson(),
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
  Pointer pointer;
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
        pointer: pointerValues.map[json["pointer"]]!,
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
        "pointer": pointerValues.reverse[pointer],
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

enum Pointer {
  S07251040_JRL21_NT,
  S0725115653_O9732,
  S07251156_WIEV64_H,
  S07271110_L34_K44_A,
  S0729114701_JZ4_OG,
  S072911510_G4_NJ5_S
}

final pointerValues = EnumValues({
  "S07251040JRL21NT": Pointer.S07251040_JRL21_NT,
  "S0725115653O9732": Pointer.S0725115653_O9732,
  "S07251156WIEV64H": Pointer.S07251156_WIEV64_H,
  "S07271110L34K44A": Pointer.S07271110_L34_K44_A,
  "S0729114701JZ4OG": Pointer.S0729114701_JZ4_OG,
  "S072911510G4NJ5S": Pointer.S072911510_G4_NJ5_S
});

class SubjectSubject {
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
  String? updatedBy;
  DateTime createdAt;
  DateTime updatedAt;

  SubjectSubject({
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

  factory SubjectSubject.fromJson(Map<String, dynamic> json) => SubjectSubject(
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

class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String calibrationStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String institutionId;
  dynamic isTeacher;
  String isStudent;
  dynamic createdBy;
  dynamic updatedBy;
  String identityNumber;
  String categoryIdentityNumber;
  String phoneNumber;
  String gender;
  Institution institution;
  Kelas institutionGradeStudent;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.calibrationStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.institutionId,
    this.isTeacher,
    required this.isStudent,
    this.createdBy,
    this.updatedBy,
    required this.identityNumber,
    required this.categoryIdentityNumber,
    required this.phoneNumber,
    required this.gender,
    required this.institution,
    required this.institutionGradeStudent,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        calibrationStatus: json["calibration_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        institutionId: json["institution_id"],
        isTeacher: json["is_teacher"],
        isStudent: json["is_student"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        identityNumber: json["identity_number"],
        categoryIdentityNumber: json["category_identity_number"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        institution: Institution.fromJson(json["institution"]),
        institutionGradeStudent:
            Kelas.fromJson(json["institution_grade_student"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "calibration_status": calibrationStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "institution_id": institutionId,
        "is_teacher": isTeacher,
        "is_student": isStudent,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "identity_number": identityNumber,
        "category_identity_number": categoryIdentityNumber,
        "phone_number": phoneNumber,
        "gender": gender,
        "institution": institution.toJson(),
        "institution_grade_student": institutionGradeStudent.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
