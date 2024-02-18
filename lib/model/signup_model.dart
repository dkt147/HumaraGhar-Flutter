class SignupResponse {
  final int status;
  final String message;
  final Map<String, dynamic> response;

  SignupResponse({
    required this.status,
    required this.message,
    required this.response,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'],
      message: json['message'],
      response: json['response'],
    );
  }
}
