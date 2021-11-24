// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:pkg_selfi/src/domains/models/SelphiFaceWidget.dart';
// import 'package:pkg_selfi/src/widgets/selphi/selphi-image.dart';
// import 'package:selphi_face_plugin/SelphiFaceFinishStatus.dart';

// class TakePictureView extends StatefulWidget {
//   @override
//   State<TakePictureView> createState() => _TakePictureViewState();
// }

// class _TakePictureViewState extends State<TakePictureView> {
//   SelphiFaceWidget _selphiFaceWidget = new SelphiFaceWidget();

//   String _resourcesPath = "fphi-selphi-widget-resources-selphi-live-1.2";

//   String _message = 'Preview selfie';

//   Uint8List? _bestImage;

//   Color _textColorMessage = Color(0xFF0099af);

//   void _launchSelphiAuthenticate() async {
//     final selphiFaceWidgetResult =
//         await _selphiFaceWidget.launchSelphiAuthenticate(_resourcesPath);
//     return selphiFaceWidgetResult.fold((l) {
//       setState(() {
//         _message = l.toString();
//         _bestImage = null;
//         _textColorMessage = Colors.red[800]!;
//       });
//     }, (r) {
//       final selphiFaceResult = r;
//       // Manage Plugin process Status
//       switch (selphiFaceResult.finishStatus) {
//         case SelphiFaceFinishStatus.STATUS_OK: // OK
//           setState(() {
//             _message = 'Preview Selfie';
//             _bestImage = base64Decode(selphiFaceResult.bestImage);
//             _textColorMessage = Color(0xFF0099af);
//           });
//           break;
//         case SelphiFaceFinishStatus.STATUS_ERROR: // Error
//           setState(() {
//             _message = selphiFaceResult.errorMessage!;
//             _bestImage = null;
//             _textColorMessage = Colors.red[800]!;
//           });
//           break;
//         case SelphiFaceFinishStatus.STATUS_CANCEL_BY_USER: // CancelByUser
//           setState(() {
//             _message = 'The user cancelled the process';
//             _bestImage = null;
//             _textColorMessage = Colors.amber[800]!;
//           });
//           break;
//         case SelphiFaceFinishStatus.STATUS_TIMEOUT: // Timeout
//           setState(() {
//             _message = 'Process finished by timeout';
//             _bestImage = null;
//             _textColorMessage = Colors.amber[800]!;
//           });
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(
//           'Prueba',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Row(
//           children: <Widget>[
//             Spacer(flex: 1),
//             Expanded(
//               flex: 8,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Text(
//                     _message,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 22, color: _textColorMessage),
//                   ),
//                   SelphiImage(_bestImage),
//                   SizedBox(
//                     width: double.infinity,
//                     child: FlatButton(
//                       onPressed: _launchSelphiAuthenticate,
//                       child: new Text("Start",
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               backgroundColor: Color(0xFF0099af))),
//                       shape: new RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(20.0)),
//                       color: Color(0xFF0099af),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Spacer(flex: 1),
//           ],
//         ),
//       ),
//     );
//   }
// }
