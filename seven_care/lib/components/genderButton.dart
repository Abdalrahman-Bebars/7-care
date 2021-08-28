import 'package:flutter/material.dart';

class GenderDropDownButton extends StatefulWidget {
  @override
  _GenderDropDownButtonState createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderDropDownButton> {
  int _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.redAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            iconEnabledColor: Colors.red,
            value: _dropDownValue,
            items: [
              DropdownMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.male,
                      color: Colors.red,
                    ),
                    Text("Male",
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                  ],
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.female,
                      color: Colors.red,
                    ),
                    Text("Female",
                        style: TextStyle(fontSize: 20, color: Colors.red)),
                  ],
                ),
                value: 2,
              )
            ],
            onChanged: (int value) {
              setState(() {
                _dropDownValue = value;
              });
            },
            isExpanded: true,
            hint: Text(
              "Gender",
              style: TextStyle(fontSize: 20, color: Colors.red),
            )),
      ),
    );
  }
}
