class LoginResponse {
  final int status;
  final String message;
  final dynamic response; // Change the type to dynamic

  LoginResponse({
    required this.status,
    required this.message,
    required this.response,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      response: json['response'],
    );
  }
}