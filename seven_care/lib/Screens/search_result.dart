import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Doctors").snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("There is no Doctors");
          return new ListView(
              children: snapshot.data!.docs
                  .map((doc) => new ListTile(
                  title: new Text(doc["name"]),
                  subtitle: new Text(doc["spec"].toString())))
                  .toList());
        });
  }
}

//unUsed Search Page
// class SearchResult extends StatefulWidget {
//   static late QuerySnapshot snapshotData;
//
//
//   @override
//   _SearchResultState createState() => _SearchResultState();
// }
//
// class _SearchResultState extends State<SearchResult> {
//   final TextEditingController searchController = TextEditingController();
//   bool isExecuted = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     Widget searcheddata() {
//       return ListView.builder(
//         itemCount: SearchResult.snapshotData.docs.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(
//               SearchResult.snapshotData.docs[index]['name'],
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
//             ),
//             subtitle: Text(
//               SearchResult.snapshotData.docs[index]['spec'],
//               style: TextStyle(fontSize: 16.0),
//             ),
//           );
//         },
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           GetBuilder<DataController>(
//             init: DataController(),
//             builder: (val) {
//               return IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     val.queryData(searchController.text).then((value) {
//                       SearchResult.snapshotData = value;
//                       setState(() {
//                         isExecuted = true;
//                       });
//                     });
//                   });
//             },
//           )
//         ],
//         title: TextFormField(
//           autofocus: true,
//           controller: searchController,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22),
//               borderSide: BorderSide(
//                 width: 0,
//                 style: BorderStyle.none,
//               ),
//             ),
//             fillColor: Colors.white,
//             filled: true,
//             hintText: "Search",
//             hintStyle: TextStyle(
//               color: kTextColor.withOpacity(.5),
//             ),
//           ),
//         ),
//       ),
//       body: isExecuted
//           ? searcheddata()
//           : Container(
//         child: Center(
//             child: Text(
//               'search any speciality',
//               style: TextStyle(fontSize: 30.0),
//             )),
//       ),
//     );
//   }
// }
