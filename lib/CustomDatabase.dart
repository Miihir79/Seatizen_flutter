import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import'package:flutter/material.dart';

class CustomData extends StatefulWidget {
  CustomData({this.app});
  final FirebaseApp app;
  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  final refrenceDatabase = FirebaseDatabase.instance;
  final Busname = 'Bus name';
  DatabaseReference _busref;

 @override
 void initState(){
  final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
  _busref = database.reference().child('bus');
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    final ref = refrenceDatabase.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text('Seatizen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text(
                      Busname,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),

                    /*FlatButton(color: Colors.grey,onPressed: (){
                      ref
                      .child('bus').push().child('bus_id').set('01').asStream();
                    }, child: null),*/
                    /*Flexible(
                      child: new FirebaseAnimatedList(
                        shrinkWrap: true,
                          query: _busref, itemBuilder: (BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index){
                          return new Text(snapshot.value['bus_id']);}),
                    )*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
