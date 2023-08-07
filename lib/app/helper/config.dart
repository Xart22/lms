class Config {
  static const String baseUrl = "https://lms.official.biz.id/api";
  static Uri loginUrl = Uri.parse("$baseUrl/login");
  static Uri homeUrl = Uri.parse("$baseUrl/user/detail");
  static String detailMapelUrl = "$baseUrl/subject/show/";
  static String checkIn = "$baseUrl/subject/checkin/";
  static Uri tugasUrl = Uri.parse("$baseUrl/assignment");
  static String tugasDetailUrl = "$baseUrl/assignment/show/";
  static String uploadTugasUrl = "$baseUrl/assignment/store/";
  static String getListSiswa = "$baseUrl/subject/get-student/";
}
