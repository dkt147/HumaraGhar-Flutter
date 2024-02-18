
import 'package:HumaraGhar/utils/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class EmailField extends StatefulWidget {
 
  final Function()? onTap;
  TextEditingController textController;
  
  EmailField({
    super.key,
     this.onTap,
    required this.textController,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}



class _EmailFieldState extends State<EmailField> {
 

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.textController.addListener(onListen);
  }

  @override
  void dispose() {
    // TODO: implement dispose

        widget.textController.removeListener(onListen);

    super.dispose();

  }

  void onListen () => setState(() { });
  @override
  Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width * 1;
    
   return  Padding(
       padding: EdgeInsets.symmetric(horizontal : width * .035),
     child: TextFormField(
          autofocus: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
          decoration: InputDecoration(
            enabled: true,
            hintText: 'Enter Email',
            hintStyle: TextStyle(color : AppColors.textHintColor),
            labelText: 'Email',
            labelStyle:  TextStyle(color : AppColors.blueColor),
            prefixIcon: Icon(Icons.email, color: AppColors.blueColor,),
            // suffixIcon: widget.textController.text.isNotEmpty 
            // ? Container(width: 0,)
            // :  IconButton(onPressed: (){
            //   setState(() {
            //     widget.textController.clear();  
            //   });
              
            //   },
            //   icon: Icon(Icons.close , color: AppColors.blueColor,)),
           

           
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),

    
          ),
          onChanged: (value) {
            setState(() {
               widget.textController.text = value;
              
            });
          },
                  validator: (email) {
                    if (email!.trim().isEmpty){
                      return 'Email Required';
                    }else if(EmailValidator.validate(email)){
                      // print(email);
                      return null;
                    }else{
                      return 'Enter a valid email';
                    }
                  
                     
                  },
                ),
   );
            
  }
}
