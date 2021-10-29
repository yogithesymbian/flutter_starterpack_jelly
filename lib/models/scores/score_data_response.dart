class ScoreDataResponse {
  bool? success;
  String? message;
  int? totalItems;
  List<Results>? results;
  int? totalPages;
  int? currentPage;

  ScoreDataResponse(
      {this.success,
      this.message,
      this.totalItems,
      this.results,
      this.totalPages,
      this.currentPage});

  ScoreDataResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["message"] is String) this.message = json["message"];
    if (json["total_items"] is int) this.totalItems = json["total_items"];
    if (json["results"] is List)
      this.results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    if (json["total_pages"] is int) this.totalPages = json["total_pages"];
    if (json["current_page"] is int) this.currentPage = json["current_page"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["message"] = this.message;
    data["total_items"] = this.totalItems;
    if (this.results != null)
      data["results"] = this.results?.map((e) => e.toJson()).toList();
    data["total_pages"] = this.totalPages;
    data["current_page"] = this.currentPage;
    return data;
  }
}

class Results {
  int? id;
  int? userId;
  int? questionId;
  double? score;
  String? deleteFlag;
  String? createdAt;
  String? updatedAt;
  User? user;

  Results(
      {this.id,
      this.userId,
      this.questionId,
      this.score,
      this.deleteFlag,
      this.createdAt,
      this.updatedAt,
      this.user});

  Results.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["user_id"] is int) this.userId = json["user_id"];
    if (json["question_id"] is int) this.questionId = json["question_id"];
    this.score = double.parse(json["score"].toString());
    if (json["delete_flag"] is String) this.deleteFlag = json["delete_flag"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
    if (json["user"] is Map)
      this.user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["question_id"] = this.questionId;
    data["score"] = this.score;
    data["delete_flag"] = this.deleteFlag;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    if (this.user != null) data["user"] = this.user?.toJson();
    return data;
  }

  // void update(data) {
  //   score = data.score;
  // }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? imageProfile;
  String? hit;
  String? deleteFlag;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.imageProfile,
      this.hit,
      this.deleteFlag,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["username"] is String) this.username = json["username"];
    if (json["first_name"] is String) this.firstName = json["first_name"];
    if (json["last_name"] is String) this.lastName = json["last_name"];
    if (json["email"] is String) this.email = json["email"];
    if (json["password"] is String) this.password = json["password"];
    if (json["image_profile"] is String)
      this.imageProfile = json["image_profile"];
    if (json["hit"] is String) this.hit = json["hit"];
    if (json["delete_flag"] is String) this.deleteFlag = json["delete_flag"];
    if (json["created_at"] is String) this.createdAt = json["created_at"];
    if (json["updated_at"] is String) this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["username"] = this.username;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["email"] = this.email;
    data["password"] = this.password;
    data["image_profile"] = this.imageProfile;
    data["hit"] = this.hit;
    data["delete_flag"] = this.deleteFlag;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}
