import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/onboardingpage.dart';
import 'package:flutter_application_1/screens/documentupload.dart';
import 'package:flutter_application_1/screens/imageverificationpage.dart';
import 'package:camera/camera.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Text('Document Upload'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DocumentUploadPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Personal Details'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()),
                );
              },
            ),
            // ElevatedButton(
            //   child: Text('Image Verification'),
            //   onPressed: () async {
            //     final cameras = await availableCameras();
            //     final firstCamera = cameras.first;
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) =>
            //             ImageVerificationPage(camera: firstCamera),
            //       ),
            //     );
            //   },
            // ),

            ElevatedButton(
              child: Text('Image Verification'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageVerificationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Upload'),
      ),
      body: Center(
        child: Text('This is the Document Upload page.'),
      ),
    );
  }
}

class FormFilling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Filling'),
      ),
      body: Center(
        child: Text('This is the Form Filling page.'),
      ),
    );
  }
}

class VideoVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Verification'),
      ),
      body: Center(
        child: Text('This is the Video Verification page.'),
      ),
    );
  }
}
