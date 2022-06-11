import 'package:docter_admin_app_bima/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  var _loginController = Get.put(LoginController());

  TextEditingController textEditingController = TextEditingController();

  Widget _mobileNumberTextField(_themeData){
    return TextFormField(
      controller: textEditingController,
      maxLength: 10,
      onChanged: (text) {
        print('jjkjkj ${text}');
      },
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              child: Text(
                '+91',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoCondensed(
                    textStyle: TextStyle(
                        color: _themeData.accentColor, fontSize: 16)),
              )),
        ),
        suffixIcon: GestureDetector(
          onTap:(){
            textEditingController.clear();
          },
          child: Icon(
            Icons.close,
            color: Colors.orange,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),

      style: TextStyle(color: Colors.white),
    );
  }

  Widget _otpField(_themeData){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
           child: _otpTextField(_themeData),
        ),
        Expanded(
           child: _otpTextField(_themeData),
        ),Expanded(
           child: _otpTextField(_themeData),
        ),Expanded(
           child: _otpTextField(_themeData),
        ),Expanded(
           child: _otpTextField(_themeData),
        ),Expanded(
           child: _otpTextField(_themeData),
        ),
      ]
    );
  }

  Widget _otpTextField(ThemeData _themeData){
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          color: _themeData.primaryColorDark,
        ),
        SizedBox(width: 12,)
      ],
    );
  }


  void _validateMobileNumberAndSendOTP(String mobileNumber){
    if(mobileNumber.length == 10){
      _loginController.isOtpSent=true;
      _loginController.update();
    }else{
      Get.snackbar("", "In-valid mobile number",snackPosition: SnackPosition.TOP,colorText: Colors.white);
    }
  }


  @override
  Widget build(BuildContext context) {
    var _themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'ENTER YOUR MOBILE NUMBER',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  (_loginController.isOtpSent)?_otpField(_themeData): _mobileNumberTextField(_themeData),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    _loginController.isOtpSent?"Please enter the verification code that was sent to ${textEditingController.text}": 'We will send you an SMS with the verfication code to the number',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                _validateMobileNumberAndSendOTP(textEditingController.text);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: _themeData.accentColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(_loginController.isOtpSent?"Login":'Continue',style:GoogleFonts.robotoCondensed(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)) ,
                ),
              ),
            ),
            (_loginController.isOtpSent)? Row(
              children: [
                Checkbox(
                  value: false,
                ),
                Expanded(
                    child: Text(
                  'I agree to the Terms Condiion and Preivacy Policy',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ))
              ],
            ):SizedBox()
          ],
        ),
      ),
    );
  }
}
