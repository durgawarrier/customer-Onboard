// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:camera/camera.dart';

// class ImageVerificationPage extends StatefulWidget {
//   @override
//   _ImageVerificationPageState createState() => _ImageVerificationPageState();
// }

// class _ImageVerificationPageState extends State<ImageVerificationPage> {
//   File? _image;

//   final picker = ImagePicker();

//   Future getImage() async {
//     final pickedFile = await picker.getImage(
//         source: ImageSource.camera,
//         cameraDevice: CameraDevice.front // Use front camera
//         );

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Verification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null ? Text('No image selected.') : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Take Picture'),
//             ),
//             SizedBox(height: 20),
//             _image == null
//                 ? SizedBox()
//                 : ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _image = null;
//                       });
//                     },
//                     child: Text('Retake Picture'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageVerificationPage extends StatefulWidget {
  @override
  _ImageVerificationPageState createState() => _ImageVerificationPageState();
}

class _ImageVerificationPageState extends State<ImageVerificationPage> {
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Take Picture'),
            ),
            SizedBox(height: 20),
            _image == null
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    child: Text('Retake Picture'),
                  ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ImageVerificationPage extends StatefulWidget {
//   @override
//   _ImageVerificationPageState createState() => _ImageVerificationPageState();
// }

// class _ImageVerificationPageState extends State<ImageVerificationPage> {
//   File? _image;

//   final picker = ImagePicker();

//   Future getImage() async {
//     final PermissionStatus permissionStatus = await _getPermission();
//     if (permissionStatus == PermissionStatus.granted) {
//       final pickedFile = await picker.getImage(source: ImageSource.camera);

//       setState(() {
//         if (pickedFile != null) {
//           _image = File(pickedFile.path);
//         } else {
//           print('No image selected.');
//         }
//       });
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: Text('Camera Permission'),
//           content: Text('Please grant permission to access the camera.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   Future<PermissionStatus> _getPermission() async {
//     final PermissionStatus permission = await Permission.camera.request();
//     return permission;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Verification'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null ? Text('No image selected.') : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Take Picture'),
//             ),
//             SizedBox(height: 20),
//             _image == null
//                 ? SizedBox()
//                 : ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _image = null;
//                       });
//                     },
//                     child: Text('Retake Picture'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';

// class ImageVerificationPage extends StatefulWidget {
//   final CameraDescription camera;
//   ImageVerificationPage({required this.camera});

//   @override
//   _ImageVerificationPageState createState() => _ImageVerificationPageState();
// }

// class _ImageVerificationPageState extends State<ImageVerificationPage> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(widget.camera, ResolutionPreset.medium);
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Verification'),
//       ),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt),
//         onPressed: () async {
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Construct the path where the image will be saved.
//             final path = join(
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );

//             // Take the picture and save it to disk.
//             await _controller.takePicture();

//             // Navigate to the image verification screen.
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ImageVerificationScreen(path: path),
//               ),
//             );
//           } catch (e) {
//             print(e);
//           }
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// class ImageVerificationScreen extends StatelessWidget {
//   final String path;
//   ImageVerificationScreen({required this.path});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Verification'),
//       ),
//       body: Center(
//         child: Image.file(File(path)),
//       ),
//     );
//   }
// }
// }


