class FeedbackResponse {
  final int status;
  final String message;

  FeedbackResponse({
    required this.status,
    required this.message,
  });

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) {
    return FeedbackResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}
