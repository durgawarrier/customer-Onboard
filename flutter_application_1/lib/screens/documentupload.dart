import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class DocumentUploadPage extends StatefulWidget {
  @override
  _DocumentUploadPageState createState() => _DocumentUploadPageState();
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
  late File _imageFile;
  bool _isImageLoaded = false;
  String _extractedText = '';

  Future<void> _getImageAndExtractText() async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
          _isImageLoaded = true;
        });

        final inputImage = InputImage.fromFile(_imageFile);
        final textDetector = GoogleMlKit.vision.textDetector();
        final visionText = await textDetector.processImage(inputImage);
        final extractedText = visionText.text;

        setState(() {
          _extractedText = extractedText;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Upload Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _isImageLoaded
                ? Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(_imageFile),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Text('No image selected'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _getImageAndExtractText,
            child: Text('Select Image'),
          ),
          SizedBox(height: 20),
          Text(_extractedText),
        ],
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker/file_picker.dart';

// class DocumentUploadPage extends StatefulWidget {
//   @override
//   _DocumentUploadPageState createState() => _DocumentUploadPageState();
// }

// class _DocumentUploadPageState extends State<DocumentUploadPage> {
//   File? selectedFile;
//   bool _isUploading = false;
//   bool _uploadSuccess = false;

//   Future selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//         _isUploading = true;
//         _uploadSuccess = false;
//       });
//       await uploadFile(selectedFile!);
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }

//   Future uploadFile(File file) async {
//     var url = 'https://example.com/upload';
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('document', file.path));
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       setState(() {
//         _uploadSuccess = true;
//       });
//     } else {
//       print('Error uploading file: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Document Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Select Document'),
//               onPressed: selectFile,
//             ),
//             SizedBox(height: 20),
//             _isUploading
//                 ? CircularProgressIndicator()
//                 : selectedFile != null
//                     ? _uploadSuccess
//                         ? Icon(
//                             Icons.check_circle,
//                             color: Colors.green,
//                             size: 50,
//                           )
//                         : Text('File uploaded successfully!')
//                     : Text('No document selected.'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker/file_picker.dart';

// class DocumentUploadPage extends StatefulWidget {
//   @override
//   _DocumentUploadPageState createState() => _DocumentUploadPageState();
// }

// class _DocumentUploadPageState extends State<DocumentUploadPage> {
//   File? selectedFile;

//   Future selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//       });
//       await uploadFile(selectedFile!);
//     }
//   }

//   Future uploadFile(File file) async {
//     var url = 'https://example.com/upload';
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('document', file.path));
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('File uploaded!');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('File uploaded successfully!'),
//         ),
//       );
//     } else {
//       print('Error uploading file: ${response.statusCode}');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error uploading file: ${response.statusCode}'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Document Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Select Document'),
//               onPressed: selectFile,
//             ),
//             SizedBox(height: 20),
//             selectedFile != null
//                 ? Text(selectedFile!.path)
//                 : Text('No document selected.'),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_ocr/flutter_ocr.dart';

// class DocumentUploadPage extends StatefulWidget {
//   @override
//   _DocumentUploadPageState createState() => _DocumentUploadPageState();
// }

// class _DocumentUploadPageState extends State<DocumentUploadPage> {
//   File _imageFile;
//   bool _isImageLoaded = false;
//   String _extractedText = '';

//   Future<void> _getImageAndExtractText() async {
//     try {
//       final imagePicker = ImagePicker();
//       final pickedFile =
//           await imagePicker.getImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         setState(() {
//           _imageFile = File(pickedFile.path);
//           _isImageLoaded = true;
//         });

//         final extractedText = await FlutterOcr.extractText(_imageFile.path);

//         setState(() {
//           _extractedText = extractedText;
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Document Upload Page'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: _isImageLoaded
//                 ? Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: FileImage(_imageFile),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )
//                 : Text('No image selected'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _getImageAndExtractText,
//             child: Text('Select Image'),
//           ),
//           SizedBox(height: 20),
//           Text(_extractedText),
//         ],
//       ),
//     );
//   }
// }



// //ignore: null_safety
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';

// class DocumentUploadPage extends StatefulWidget {
//   @override
//   _DocumentUploadPageState createState() => _DocumentUploadPageState();
// }

// class _DocumentUploadPageState extends State<DocumentUploadPage> {
//   late File _imageFile;
//   bool _isImageLoaded = false;
//   String _extractedText = '';

//   Future<void> _getImageAndExtractText() async {
//     try {
//       final imagePicker = ImagePicker();
//       final pickedFile =
//           await imagePicker.getImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         setState(() {
//           _imageFile = File(pickedFile.path);
//           _isImageLoaded = true;
//         });

//         final firebaseStorageRef = FirebaseStorage.instance
//             .ref()
//             .child('documents/${DateTime.now().toString()}');
//         await firebaseStorageRef.putFile(_imageFile);
//         final imageUrl = await firebaseStorageRef.getDownloadURL();

//         final firebaseVisionImage = FirebaseVisionImage.fromFile(_imageFile);
//         final textRecognizer = FirebaseVision.instance.textRecognizer();
//         final visionText =
//             await textRecognizer.processImage(firebaseVisionImage);
//         final extractedText = visionText.text;

//         setState(() {
//           _extractedText = extractedText;
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Document Upload Page'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: _isImageLoaded
//                 ? Container(
//                     height: 200,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: FileImage(_imageFile),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )
//                 : Text('No image selected'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _getImageAndExtractText,
//             child: Text('Select Image'),
//           ),
//           SizedBox(height: 20),
//           Text(_extractedText),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:file_picker/file_picker.dart';

// class DocumentUploadPage extends StatefulWidget {
//   @override
//   _DocumentUploadPageState createState() => _DocumentUploadPageState();
// }

// class _DocumentUploadPageState extends State<DocumentUploadPage> {
//   File? selectedFile;

//   Future selectFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//       });
//       await uploadFile(selectedFile!);
//     }
//   }

//   Future uploadFile(File file) async {
//     var url = 'https://example.com/upload';
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('document', file.path));
//     var response = await request.send();
//     if (response.statusCode == 200) {
//       print('File uploaded!');
//     } else {
//       print('Error uploading file: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Document Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text('Select Document'),
//               onPressed: selectFile,
//             ),
//             SizedBox(height: 20),
//             selectedFile != null
//                 ? Text(selectedFile!.path)
//                 : Text('No document selected.'),
//           ],
//         ),
//       ),
//     );
//   }
// }
