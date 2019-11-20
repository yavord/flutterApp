import 'package:flutter/material.dart';


class PaddingRowTop extends Padding {
  PaddingRowTop({
    Key key,
    @required String localization,
    @required FormField formField,
  }) : super(
        key : key,
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
                child: formField,
              ),
            ),
          ],
        ),
    );
}

class PaddingRowBottom extends Padding {
  PaddingRowBottom({
    Key key,
    @required String localization,
    @required FormField formField,
  }) : super(
        key : key,
        padding: EdgeInsets.fromLTRB(20, 15, 65, 15),
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
                child: formField,
              ),
            ),
          ],
        ),
    );
}
