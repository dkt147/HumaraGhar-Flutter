
import 'package:HumaraGhar/API/local%20db%20testing/user_service.dart';
import 'package:HumaraGhar/API/AuthServices/update_profile_services.dart';
import 'package:HumaraGhar/components/round_button.dart';
import 'package:HumaraGhar/model/user_model.dart';
import 'package:HumaraGhar/constants/background_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EditProfileScreen extends StatefulWidget {
 final String? id;
  final String? name;
  final String? contact;
  final String? email;
  final String? password;
  const EditProfileScreen({super.key, this.name, this.contact, this.email, this.password,this.id});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen> {
  

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameController.text = widget.name.toString() ;
    _contactController.text = widget.contact.toString() ;
    _emailController.text =widget.email.toString() ;
    _passwordController.text =widget.password.toString() ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BackgroundContainer(child: Scaffold(
      appBar: AppBar(
        title: Text('Edit profile Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
               
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * .07,),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/MenProfile.jpg') 
                        // Image.asset(),
                      ),
                  
                      SizedBox(height: height * .05,),
                // EditProfileTextField(width, 'ID', _nameController, Icons.person),
                // SizedBox(height: height * .03,),
                EditProfileTextField(width, 'Name', _nameController, Icons.person),
                SizedBox(height: height * .03,),
                EditProfileTextField(width, 'Phone No.', _contactController, Icons.call),
                SizedBox(height: height * .03,),
                EditProfileTextField(width, 'Email', _emailController, Icons.email),
                SizedBox(height: height * .03,),
                EditProfileTextField(width, 'Password', _passwordController, Icons.lock),
                SizedBox(height: height * .03,),
                RoundButton(title: 'Update', onTap: () {
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading = true;
                       });

                      //  final UpdateProfileModel response;
                        UpdateProfileServices().updateProfile(
                        user_id :widget.id,
                        name: _nameController.text,
                        phone: _contactController.text,
                        email: _emailController.text,
                        password: _passwordController.text
                      ).then((value){
                        if(value.status == 1){
                          
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.message.toString())));
                          Get.back();
                        // SharedPreferences sp = SharedPreferences.getInstance();
                        UserService().storeUserDataInPrefs(UserModel(userID: widget.id.toString(), userName: _nameController.text.toString(), email: _emailController.text.toString(),));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.message.toString())));
                        }
                        print(value.message.toString());
                        setState(() {
                        loading = false;
                       });
                      });
                   
                  }
                }, loading: loading)
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Container EditProfileTextField(double width , label , controller , IconData prefixIcon ) {
    return Container(
                width: width * .9,
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all()
                ),
              
            child: TextFormField(
              // readOnly: false,
              controller: controller,
              decoration: InputDecoration(
                label: Text(label , style: TextStyle(color:const Color.fromARGB(255, 23, 55, 82),),),
                prefixIcon: Icon(prefixIcon ,  color: const Color.fromARGB(255, 23, 55, 82),) ,
                border: InputBorder.none
              ),
            ),
          );
  }
}