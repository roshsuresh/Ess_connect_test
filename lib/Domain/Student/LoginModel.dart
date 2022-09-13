class LoginModel {
  LoginModel({
    required this.accessToken,
  });

  String accessToken;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
