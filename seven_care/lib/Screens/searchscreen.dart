import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Clinic.dart';

class SecondResult extends StatelessWidget {
  var secondfilter;

  SecondResult({this.secondfilter = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('$secondfilter Doctors'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(36),
            ),
          )),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Doctors')
              .where('spec', isEqualTo: secondfilter)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: new Container(
                child: CircularProgressIndicator(),
              ));
            return new ListView(
                children: snapshot.data.docs
                    .map((doc) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Clinic(name:doc["name"]),
                                ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: new ListTile(
                              leading: Icon(
                                Icons.medical_services_outlined,
                              ),
                              trailing: Text(
                                'Rating' +
                                    '\n' +
                                    '    ' +
                                    doc['rating'].toString(),
                                textScaleFactor: 1.2,
                              ),
                              title: new Text('Dr.' + doc["name"]),
                              subtitle: new Text('Speciality: ' +
                                  doc["spec"] +
                                  '\n' +
                                  'Address: ' +
                                  doc['address']),
                              isThreeLine: true,
                            ),
                          ),
                        ))
                    .toList());
          }),
    );
  }
}
