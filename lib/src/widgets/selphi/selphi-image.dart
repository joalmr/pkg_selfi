import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelphiImage extends StatelessWidget {
  final Uint8List? _bestImage;
  SelphiImage(this._bestImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (_bestImage != null)
            CircleAvatar(
              backgroundImage: MemoryImage(_bestImage!),
              radius: 125,
            )
          else
            CircleAvatar(
              backgroundColor: Colors.blueGrey[100],
              radius: 125,
              child: Icon(
                Icons.photo_outlined,
                color: Colors.white,
                size: 64,
              ),
            ),
        ],
      ),
    );
  }
}
