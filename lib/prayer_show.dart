import 'package:flutter/material.dart';

class PryS extends StatefulWidget {

  final String prayername;
  final String prayertime;
  final Color c;
  const PryS({Key? key ,  required this.prayername, required this.prayertime, required this.c}) : super(key: key);

  @override
  State<PryS> createState() => _PrySState();
}

class _PrySState extends State<PryS> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(widget.prayertime, style: TextStyle(fontSize:  20, fontWeight: FontWeight.bold , color: widget.c)),
          Text(widget.prayername, style: TextStyle(fontSize:  20, fontWeight: FontWeight.bold, color: widget.c),textAlign: TextAlign.right,),


        ],),
    );
  }
}
