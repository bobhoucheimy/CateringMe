class  ProfileResponse {
  int? id;
  String? name;
  String? phoneNumber;
  String? birthDate;
  int? roleId;
  String? role;
  String? token;
  String? gender;
  int? genderId;

  ProfileResponse(
      {this.id,
        this.name,
        this.phoneNumber,
        this.roleId,
        this.role,
        this.token , this.birthDate , this.gender , this.genderId});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    roleId = json['roleId'];
    role = json['role'];
    token = json['token'];
    gender = json['gender'];
    genderId = json['genderId'];
    birthDate = json['birthDate'];
  }
}
