

import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const OtpScreen(),
    );
  }
}
class OtpScreen extends StatefulWidget {

  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}
class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //

      body:  SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child:  Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/a.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Passcode',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your Passcode number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Color(0xFF512DA8),
                  focusedBorderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  obscureText: true,
                  borderWidth: 4.0,
                  fieldWidth: 40,

                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),

                Container(
                  padding: EdgeInsets.only(top: 200),
                  width: double.infinity,
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),


              ],
            ),
          ),

        ),
      ),
    );
  }

}
