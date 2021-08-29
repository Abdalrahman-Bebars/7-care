import 'package:flutter/material.dart';
import 'package:seven_care/Screens/searchscreen.dart';

class SearchDropDownButton extends StatefulWidget {
  @override
  _SearchDropDownButtonState createState() => _SearchDropDownButtonState();
}

class _SearchDropDownButtonState extends State<SearchDropDownButton> {
  var _speclist = [
    'Dentistry',
    'Urology',
    'Ear, nose and throat',
    'Surgery',
    ''
  ];
  var currentselected = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.redAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: currentselected,
            items: _speclist.map((dropDownStringItem) {
              return DropdownMenuItem(
                value: dropDownStringItem,
                child: Text(dropDownStringItem, style: TextStyle(fontSize: 20, color: Colors.red)),
              );
            }).toList(),
            onChanged: (newValueSelected) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SecondResult(secondfilter: currentselected)),
              );
              setState(() {
                this.currentselected = newValueSelected.toString();
              });
            },
            isExpanded: true,
            hint: Text(
              "Specialities",
              style: TextStyle(fontSize: 20, color: Colors.red),
            )),
      ),
    );
  }
}