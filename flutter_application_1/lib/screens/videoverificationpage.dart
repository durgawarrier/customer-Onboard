// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';

// class VideoVerificationPage extends StatefulWidget {
//   @override
//   _VideoVerificationPageState createState() => _VideoVerificationPageState();
// }

// class _VideoVerificationPageState extends State<VideoVerificationPage> {
//   late CameraController _cameraController;
//   late List<CameraDescription> _cameras;
//   bool _isRecording = false;
//   late String _videoPath;
//   late VideoPlayerController _videoPlayerController;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
//     await _cameraController.initialize();
//     setState(() {});
//   }

//   Future<void> _startRecording() async {
//     if (!_cameraController.value.isInitialized) {
//       return;
//     }

//     final videoPath = '${DateTime.now().millisecondsSinceEpoch}.mp4';

//     setState(() {
//       _isRecording = true;
//       _videoPath = videoPath;
//     });

//     await _cameraController.startVideoRecording(videoPath);

//     _timer = Timer(Duration(seconds: 10), () async {
//       await _stopRecording();
//     });
//   }

//   Future<void> _stopRecording() async {
//     if (!_cameraController.value.isRecordingVideo) {
//       return;
//     }

//     setState(() {
//       _isRecording = false;
//       _timer?.cancel();
//     });

//     await _cameraController.stopVideoRecording();

//     _videoPlayerController = VideoPlayerController.file(File(_videoPath));
//     await _videoPlayerController.initialize();

//     setState(() {});
//   }

//   void _retakeVideo() {
//     File(_videoPath).deleteSync();
//     _videoPlayerController?.dispose();
//     _videoPlayerController = null;
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     _videoPlayerController?.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_cameraController == null || !_cameraController.value.isInitialized) {
//       return Container();
//     }

//     final cameraPreview = AspectRatio(
//       aspectRatio: _cameraController.value.aspectRatio,
//       child: CameraPreview(_cameraController),
//     );

//     final actionButtons = Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.videocam),
//           onPressed: _isRecording ? null : _startRecording,
//         ),
//         IconButton(
//           icon: Icon(Icons.stop),
//           onPressed: _isRecording ? _stopRecording : null,
//         ),
//         IconButton(
//           icon: Icon(Icons.refresh),
//           onPressed: _videoPath != null ? _retakeVideo : null,
//         ),
//       ],
//     );

//     final videoPlayer = _videoPlayerController != null
//         ? AspectRatio(
//             aspectRatio: _videoPlayerController.value.aspectRatio,
//             child: VideoPlayer(_videoPlayerController),
//           )
//         : Container();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Verification'),
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   cameraPreview,
//                   Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ],
//               ),
//             ),
//             actionButtons,
//             videoPlayer,
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:video_player/video_player.dart';

// class VideoVerificationPage extends StatefulWidget {
//   @override
//   _VideoVerificationPageState createState() => _VideoVerificationPageState();
// }

// class _VideoVerificationPageState extends State<VideoVerificationPage> {
//   late CameraController _cameraController;
//   late List<CameraDescription> _cameras;
//   bool _isRecording = false;
//   late String _videoPath;
//   late VideoPlayerController _videoPlayerController;
//   late Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
//     await _cameraController.initialize();
//     setState(() {});
//   }

//   Future<void> _startRecording() async {
//     if (!_cameraController.value.isInitialized) {
//       return;
//     }

//     final videoPath = '${DateTime.now().millisecondsSinceEpoch}.mp4';

//     setState(() {
//       _isRecording = true;
//       _videoPath = videoPath;
//     });

//     await _cameraController.startVideoRecording(videoPath);

//     _timer = Timer(Duration(seconds: 10), () async {
//       await _stopRecording();
//     });
//   }

//   Future<void> _stopRecording() async {
//     if (!_cameraController.value.isRecordingVideo) {
//       return;
//     }

//     setState(() {
//       _isRecording = false;
//       _timer.cancel();
//     });

//     await _cameraController.stopVideoRecording();

//     _videoPlayerController = VideoPlayerController.file(File(_videoPath));
//     await _videoPlayerController.initialize();

//     setState(() {});
//   }

//   void _retakeVideo() {
//     File(_videoPath).deleteSync();
//     _videoPlayerController.dispose();
//     _videoPlayerController = null;
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     _videoPlayerController.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_cameraController == null || !_cameraController.value.isInitialized) {
//       return Container();
//     }

//     final cameraPreview = AspectRatio(
//       aspectRatio: _cameraController.value.aspectRatio,
//       child: CameraPreview(_cameraController),
//     );

//     final actionButtons = Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.videocam),
//           onPressed: _isRecording ? null : _startRecording,
//         ),
//         IconButton(
//           icon: Icon(Icons.stop),
//           onPressed: _isRecording ? _stopRecording : null,
//         ),
//         IconButton(
//           icon: Icon(Icons.refresh),
//           onPressed: _videoPath != null ? _retakeVideo : null,
//         ),
//       ],
//     );

//     final videoPlayer = _videoPlayerController != null
//         ? AspectRatio(
//             aspectRatio: _videoPlayerController.value.aspectRatio,
//             child: VideoPlayer(_videoPlayerController),
//           )
//         : Container();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Verification'),
//       ),
//       body: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   cameraPreview,
//                   Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ],
//               ),
//             ),
//             actionButtons,
//             videoPlayer,
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoVerificationPage extends StatefulWidget {
  @override
  _VideoVerificationPageState createState() => _VideoVerificationPageState();
}

class _VideoVerificationPageState extends State<VideoVerificationPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isRecording = false;
  late String _videoPath;
  VideoPlayerController? _videoPlayerController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high);
    await _cameraController.initialize();
    setState(() {});
  }

  Future<void> _startRecording() async {
    if (!_cameraController.value.isInitialized) {
      return;
    }

    late final videoPath = '${DateTime.now().millisecondsSinceEpoch}.mp4';

    setState(() {
      _isRecording = true;
      _videoPath = videoPath;
    });

    await _cameraController.startVideoRecording();

    _timer = Timer(Duration(seconds: 10), () async {
      await _stopRecording();
    });
  }

  Future<void> _stopRecording() async {
    if (!_cameraController.value.isRecordingVideo) {
      return;
    }

    setState(() {
      _isRecording = false;
      _timer?.cancel();
    });

    await _cameraController.stopVideoRecording();

    _videoPlayerController = VideoPlayerController.file(File(_videoPath));
    await _videoPlayerController!.initialize();

    setState(() {});
  }

  void _retakeVideo() {
    File(_videoPath).deleteSync();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    //setState(() {});
    setState(() {
      _videoPath = '';
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _videoPlayerController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Container();
    }

    final cameraPreview = AspectRatio(
      aspectRatio: _cameraController.value.aspectRatio,
      child: CameraPreview(_cameraController),
    );

    final actionButtons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: _isRecording ? null : _startRecording,
        ),
        IconButton(
          icon: Icon(Icons.stop),
          onPressed: _isRecording ? _stopRecording : null,
        ),
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _videoPath != null ? _retakeVideo : null,
        ),
      ],
    );

    final videoPlayer = _videoPlayerController != null
        ? AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController!),
          )
        : Container();

    return Scaffold(
      appBar: AppBar(
        title: Text('Video Verification'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  cameraPreview,
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
            actionButtons,
            videoPlayer,
          ],
        ),
      ),
    );
  }
}
