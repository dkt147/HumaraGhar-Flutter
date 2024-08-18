
import 'package:HumaraGhar/API/Feedback/service.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitFeedback() async {
    // Validate the form when submitted
    if (_formKey.currentState!.validate()) {
      String userId = userIdController.text;
      int rating = int.tryParse(ratingController.text) ?? 0;

      // Call the service to submit the feedback
      try {
        var feedbackService = FeedbackService();
        var response = await feedbackService.submitFeedback(userId, rating);

        // Handle the response as needed
        print('Response Status: ${response.status}');
        print('Response Message: ${response.message}');
      } catch (e) {
        // Handle errors
        print('Error submitting feedback: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
                // Validators are only executed if the form is submitted
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter user ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                // Validators are only executed if the form is submitted
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter rating';
                  }
                  int? rating = int.tryParse(value ?? '');
                  if (
                      (rating == null || rating < 0 || rating > 5)) {
                    return 'Please enter a valid rating (0-5)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed:(){
                  print(userIdController.text);
                  print(ratingController.text);
                   _submitFeedback();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
