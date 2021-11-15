import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelphiImage extends StatelessWidget {
  final Uint8List? _bestImage;
  SelphiImage(this._bestImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Spacer(flex: 1),
        if (_bestImage != null)
          Expanded(
            flex: 8,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: MemoryImage(_bestImage!)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.blueGrey[100],
                ),
              ),
            ),
          )
        else
          Expanded(
            flex: 9,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.blueGrey[100],
                  ),
                )),
          ),
        Spacer(flex: 1)
      ]),
    );
  }
}
