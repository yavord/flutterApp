import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:patients_platform/widgets/circle_timer.dart';


class MedicTiles extends StatefulWidget {
  final String name;
  final String icon;
  final String dose;
  final String form;
  final String doses;
  final String schedule;

  MedicTiles({
    Key key,
    this.name, this.icon, this.dose, this.form, this.doses, this.schedule 
  }) : super(key: key);


  @override
  _MedicTilesState createState() => _MedicTilesState();
}



class _MedicTilesState extends State<MedicTiles> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    /*Icon.asset(
                      "${widget.icon}",
                      height: 25,
                      width: 25,
                    ),*/
                   new Container(
                      child: new Icon(FontAwesomeIcons.pills, size: 20,),
                    
                    ),
                    SizedBox(width: 13),
                    Text(
                      "${widget.name}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),


                Text(
                  "Take ${widget.dose} ${widget.form}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Text(" "),

                                Text(
                  "${widget.doses} ${widget.form}s left",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.cyan[400],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: Row(children: <Widget>[
              
                Circle(schedule: widget.schedule),
              
            ],),
          )
          
        ],
      ),
    );
  }
}
