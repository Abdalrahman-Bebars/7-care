import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seven_care/model/datacontroller.dart';

class SearchResult extends StatefulWidget {

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExecuted = false;


  @override
  Widget build(BuildContext context) {
    Widget searcheddata() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              snapshotData.docs[index]['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            subtitle: Text(
              snapshotData.docs[index]['spec'],
              style: TextStyle(fontSize: 16.0),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExecuted = true;
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.black54),
          decoration: InputDecoration(
              hintText: 'Search', hintStyle: TextStyle(color: Colors.white24)),
          controller: searchController,
        ),
      ),
      body: isExecuted
          ? searcheddata()
          : Container(
              child: Center(
                  child: Text(
                'search any speciality',
                style: TextStyle(fontSize: 30.0),
              )),
            ),
    );
  }
}
