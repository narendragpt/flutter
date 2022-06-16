import 'package:flutter/material.dart';



class sortby extends StatefulWidget {
  const sortby({Key? key}) : super(key: key);

  @override
  _sortbyState createState() => _sortbyState();
}

class _sortbyState extends State<sortby> {
  String dropdownValue = 'Highest Score';

  List<String> spinnerItems = ['Highest Score', 'Most runs', 'Most fifty','Most hundred'];
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
