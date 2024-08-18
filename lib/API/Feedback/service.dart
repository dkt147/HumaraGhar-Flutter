import 'dart:convert';
import 'package:HumaraGhar/model/feedback_model.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  Future<FeedbackResponse> submitFeedback(String userId, int rating) async {
    final url = Uri.parse('https://cybernsoft.com/hg/app_feedback.php');
    final Map<String, dynamic> body = {
      'user_id': userId,
      'rating': rating.toString(),
    };

    try {
      final response = await http.post(
        url,
        body: body,

      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var feedbackResponse = FeedbackResponse.fromJson(jsonData[0]);
        return feedbackResponse;
      } else {
        throw Exception('Failed to submit feedback: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to submit feedback: $e');
    }
  }
}
