import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropdownValue = 'ECL';

  List<String> spinnerItems = ['ECL', 'ECS', 'ECC'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      elevation: 16,
      underline: Container(),
      onChanged: (String? data) {
        setState(() {
          dropdownValue = data!;
        });
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}