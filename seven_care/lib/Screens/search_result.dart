import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:seven_care/model/datacontroller.dart';

class SearchMenu extends StatefulWidget {
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  late QuerySnapshot snapshotData;
  var _speclist = [
    'Dentistry',
    'Urology',
    'Ear, nose and throat',
    'Surgery',
    ''
  ];
  var currentselected = '';
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search')),
      body: ListView(children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Select a speciality: ',
          textScaleFactor: 1.5,
        ),
        DropdownButton(
          items: _speclist.map((dropDownStringItem) {
            return DropdownMenuItem(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (newValueSelected) {
            setState(() {
              isExecuted = true;
              this.currentselected = newValueSelected.toString();
            });
          },
          value: currentselected,
        ),
        isExecuted
            ? StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Doctors')
                    .where('spec', isEqualTo: currentselected)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return new ListView(
                      children: snapshot.data!.docs
                          .map((doc) => new ListTile(
                              title: new Text(doc["name"]),
                              subtitle: new Text(doc["spec"].toString())))
                          .toList());
                })
            : Container(
                child: Center(
                  child: Text('select speciality'),
                ),
              ),
        Text('test text')
      ]),
    );
  }
}

// StreamBuilder<QuerySnapshot>(
// stream:
// FirebaseFirestore.instance.collection("Doctors").snapshots(),
// builder: (BuildContext context,
//     AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData) return new Text("There is no doctors");
// return new ListView(
// children: snapshot.data!.docs
//     .map((doc) => new ListTile(
// title: new Text(doc["name"]),
// subtitle: new Text(doc["spec"].toString())))
//     .toList());
// }),);

// class SearchResult extends StatefulWidget {
//
//   @override
//   _SearchResultState createState() => _SearchResultState();
// }
//
// class _SearchResultState extends State<SearchResult> {
//   var queryResultSet = [];
//   var tempSearchStore = [];
//
//   initiateSearch(value) {
//     if (value.length == 0) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }
//     var capitalizedValue =
//         value.subString(0, 1).toUpperCase() + value.subString(1);
//     if (queryResultSet.length == 0 && value.length == 1) {
//       SearchService().searchByName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i].data());
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       queryResultSet.forEach((element) {
//         if (element['spec'].startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       });
//     }
//     if (tempSearchStore.length == 0 && value.length > 1) {
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(title: Text('search')),
//         body: ListView(children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextField(
//               autofocus: true,
//               onChanged: (val) {
//                 initiateSearch(val);
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//                 hintText: "Search",
//                 hintStyle: TextStyle(
//                   color: kTextColor.withOpacity(.5),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           GridView.count(
//             crossAxisCount: 1,
//             mainAxisSpacing: 4,
//             primary: false,
//             shrinkWrap: true,
//             children: tempSearchStore.map((element) {
//               return buildResultCard(element);
//             }).toList(),
//           )
//         ]));
//   }
//
//   Widget buildResultCard(data) {
//     return ListTile(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       title: Text(data['name']),
//       subtitle: Text(data['spec']),
//     );
//   }
// }

// class DataSearch extends SearchDelegate<String> {
//
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, '');
//         },
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
//         builder:
//             (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return new Text("There is no Doctors");
//           return new ListView(
//               children: snapshot.data!.docs
//                   .map((doc) => new ListTile(
//                   title: new Text(doc["name"]),
//                   subtitle: new Text(doc["spec"].toString())))
//                   .toList());
//         });
//   }
// }
