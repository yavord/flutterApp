import 'package:flutter/material.dart';


class PaddingRow extends Padding {
  PaddingRow({
    @required String localization,
    @required TextFormField textFormField,
  }) : super(
        padding: EdgeInsets.fromLTRB(20, 15, 65, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              localization,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Container(
              child: SizedBox(
                width: 150,
                child: textFormField,
              ),
            ),
          ],
        ),
    );
}