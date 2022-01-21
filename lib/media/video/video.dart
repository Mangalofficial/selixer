import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoRecorder extends StatefulWidget {
  @override
  _VideoRecorderState createState() {
    return _VideoRecorderState();
  }
}

class _VideoRecorderState extends State<VideoRecorder> {
  CameraController controller;
  String videoPath;

  List<CameraDescription> cameras;
  int selectedCameraIdx;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Get the listonNewCameraSelected of available cameras.
    // Then set the first camera as selected.
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //trigger leaving and use own data
        Navigator.pop(context, false);

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   title: const Text('Record & Upload'),
        // ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: _cameraPreviewWidget(),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color:
                    controller != null && controller.value.isRecordingVideo
                        ? Colors.redAccent
                        : Colors.grey,
                    width: 3.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _cameraTogglesRowWidget(),
                  _captureControlRowWidget(),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.flip_camera_ios_rounded;
      case CameraLensDirection.front:
        return Icons.flip_camera_ios_rounded;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio * 0.35,
      child: CameraPreview(controller),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).
  Widget _cameraTogglesRowWidget() {
    if (cameras == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
      );
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: FlatButton.icon(
        padding: EdgeInsets.only(left: 65),
        onPressed: _onSwitchCamera,
        icon: Icon(_getCameraLensIcon(lensDirection)), label: Text(''),
        // label: Text(
        //     "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}"),
      ),
    );
  }

  /// Display the control bar with buttons to record videos.
  Widget _captureControlRowWidget() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            color: Colors.blue,
            onPressed: controller != null &&
                controller.value.isInitialized &&
                !controller.value.isRecordingVideo
                ? _onRecordButtonPressed
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.stop),
            color: Colors.red,
            onPressed: controller != null &&
                controller.value.isInitialized &&
                controller.value.isRecordingVideo
                ? _onStopButtonPressed
                : null,
          )
        ],
      ),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        Fluttertoast.showToast(
            msg: 'Camera error ${controller.value.errorDescription}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            // timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
    selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        Fluttertoast.showToast(
            msg: 'Recording video started',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            // timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white);
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      Fluttertoast.showToast(
          msg: 'Video recorded to $videoPath',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(
          msg: 'Please wait',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);

      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    // final Directory appDirectory = await getApplicationDocumentsDirectory();
    var temp =
    await getExternalStorageDirectories(type: StorageDirectory.downloads);
    var downloadPath = temp[0].path.split("Android")[0] + "Selixer/Videos";
    if (await Directory(downloadPath).exists() == false) {
      Directory(downloadPath).create(recursive: true);
    }
    // final String videoDirectory = '${appDirectory.path}/Videos';
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$downloadPath/${currentTime}.mp4';
    try {
      await controller.startVideoRecording();
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    Fluttertoast.showToast(
        msg: 'Error: ${e.code}\n${e.description}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        // timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
