import 'package:coffee_shop_app/components/list_of_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String dropdownValue = "";

class DropdownCategories extends StatefulWidget {

  DropdownCategories({Key? key, String? defaultValue}) : super(key: key) {
    if (defaultValue != null) {
      dropdownValue = defaultValue;
    }else {
      dropdownValue = listOfCategories.first;
    }
  }

  @override
  _DropdownCategoriesState createState() => _DropdownCategoriesState();
  
  String getDropdownValue() {
    return dropdownValue;
  }
}

class _DropdownCategoriesState extends State<DropdownCategories> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 104, 71, 44), fontSize: 16),
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 104, 71, 44),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: listOfCategories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
