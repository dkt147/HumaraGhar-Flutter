
import 'package:HumaraGhar/model/contactus_form_model.dart';
import 'package:HumaraGhar/API/ContactUsForm/service.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
 
 final TextEditingController phoneController = TextEditingController();
 final TextEditingController nameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController subjectController = TextEditingController();
 final TextEditingController messageController = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitForm({userName , userEmail  , userPhone , userSubject , userMessage}) async {
    if (_formKey.currentState!.validate()) {
      String name = userName;
      String email = userEmail;
      String phone = userPhone;
      String subject = userSubject;
      String message = userMessage;
      // String name = nameController.text;
      // String email = emailController.text;
      // String phone = phoneController.text;
      // String subject = subjectController.text;
      // String message = messageController.text;

      final contactHandler = ContactUsService();

      try {
        // ContactResponse response = await contactHandler.submitContactForm(
        //     name: name,email: email,phone: phone, subject:subject,message: message);
        ContactResponse response = await contactHandler.submitContactForm(
         name,email,phone,subject,message);
        // Handle success response
        print('Status: ${response.status}, Message: ${response.message}');
        if (response.status == 1) {
            print('Status: ${response.status}, Message: ${response.message}');
          print('Successfully submitted');
          // Clear form fields after successful submission
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          subjectController.clear();
          messageController.clear();
        }
      } catch (e) {
        print('Error: $e');
        // Handle error
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Form'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController ,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Name Required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                controller: emailController ,
                decoration: InputDecoration(labelText: 'Email'),
                 validator: (value){
                  if(value!.isEmpty){
                    return 'Email Required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                controller: phoneController ,
                decoration: InputDecoration(labelText: 'Phone'),
                 validator: (value){
                  if(value!.isEmpty){
                    return 'Phone Required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                controller: subjectController ,
                decoration: InputDecoration(labelText: 'Subject'),
                 validator: (value){
                  if(value!.isEmpty){
                    return 'Subject Required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 12,),
              TextFormField(
                controller: messageController ,
                decoration: InputDecoration(labelText: 'Message'),
                 validator: (value){
                  if(value!.isEmpty){
                    return 'Message Required';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 12,),
              ElevatedButton(onPressed: ()async{
                  print(nameController.text);
                    //  _submitForm(nameController.text, emailController.text, phoneController.text, subjectController.text, messageController.text);
              _submitForm(
                userName: nameController.text,
                userEmail: emailController.text,
                userPhone: phoneController.text,
                userSubject: subjectController.text,
                userMessage: messageController.text

              );
              //  ContactUsModel response = await ContactServices().submitForm(nameController.text, emailController.text, phoneController.text, subjectController.text, messageController.text);
              //           print('Status: ${response.status}, Message: ${response.message}');
              }, child: Text('Submit'))
          
            ],),
        ),
      ),

    );
  }
}

/*
import 'package:HumaraGhar/API%20testing/ContactUsForm/service.dart';
import 'package:flutter/material.dart';
 // Import your ApiResponse and ContactUsService

class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  final _formKey = GlobalKey<FormState>();
  final _service = ContactUsService();
  late String _name;
  late String _email;
  late String _phone;
  late String _subject;
  late String _message;
  late bool _isLoading = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        final response = await _service.submitContactForm(
          name: _name,
          email: _email,
          phone: _phone,
          subject: _subject,
          message: _message,
        );
        // Handle the response
        print(response.message);
        // Clear the form fields
        _formKey.currentState!.reset();
      } catch (e) {
        // Handle error
        print('Error: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subject'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
                onSaved: (value) => _subject = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Message'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
                onSaved: (value) => _message = value!,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
*/