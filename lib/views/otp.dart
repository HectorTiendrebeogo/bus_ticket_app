import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _otpController = TextEditingController();

  // if you want an otp_text_field with different
  // styles for each field

  Color accentPurpleColor = const Color(0xFF6A53A1);
  Color primaryColor = Color(0xFF121212);
  Color accentPinkColor = Color(0xFFF99BBD);
  Color accentDarkGreenColor = Color(0xFF115C49);
  Color accentYellowColor = Color(0xFFFFB612);
  Color accentOrangeColor = Color(0xFFEA7A3B);


  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headline3?.copyWith(color: color);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(onPressed: (){
          if (Navigator.canPop(context)){
            Navigator.pop(context);
          }
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SizedBox(height: 150,),
                  const Text(
                    "Entrer le code OTP envoyé au +226 ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2),
                  ),
                  const SizedBox(height: 20,),
                  OtpTextField(
                    numberOfFields: 4,
                    showFieldAsBox: false,
                    borderWidth: 2.0,
                    focusedBorderColor: const Color.fromRGBO(0, 0, 0, 1),
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here if necessary
                      setState(() {
                        _otpController.text = code;
                      });
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {

                    },
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: (){
                          /*Navigator.push(context, MaterialPageRoute(builder: (context){
                            return OtpScreen();
                          }));*/
                        }, child: const Text("Valider",style: TextStyle(fontSize: 20,letterSpacing: 2),)
                    ),
                  ),
                  //inLoginProcess? Center(child: CircularProgressIndicator()):
                ],
              ),
          ),
        ),
      ),
    );
  }
}
