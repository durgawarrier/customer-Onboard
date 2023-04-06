import 'package:flutter/material.dart';
//import 'package:flutter_application_1/screens/onboardingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/landingpage.dart';
import 'package:flutter_sms/flutter_sms.dart';

// void main() {
//   runApp(const MyApp());
// }
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
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
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: OtpVerificationPage(),
    );
  }
}

class OtpVerificationPage extends StatefulWidget {
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String _expectedOtp = '1234';

  void _sendOtp(String phoneNumber) async {
    try {
      String message = 'Your OTP is $_expectedOtp';
      List<String> recipients = [phoneNumber];
      await sendSMS(message: message, recipients: recipients);
    } catch (error) {
      print('Failed to send SMS: $error');
    }
  }

  void _verifyOtp(String otp) {
    if (otp == _expectedOtp) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LandingPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Invalid OTP'),
          content: Text('Please enter the correct OTP.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone number',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _sendOtp(_phoneNumberController.text),
              child: Text('Send OTP'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _verifyOtp(_otpController.text),
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Text('OTP verification successful!'),
      ),
    );
  }
}
