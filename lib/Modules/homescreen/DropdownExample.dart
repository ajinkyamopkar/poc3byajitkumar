// import 'package:flutter/material.dart';

// class DropdownExample extends StatefulWidget {
//   @override
//   _DropdownExampleState createState() => _DropdownExampleState();
// }

// class _DropdownExampleState extends State<DropdownExample> {
//   String? _selectedItem;

//   // List of items to show in the dropdown
//   final List<String> _items = ['Apple', 'Banana', 'Orange', 'Mango'];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: _selectedItem,
//       hint: Text("Select a fruit"),
//       items: _items.map((String item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         setState(() {
//           _selectedItem = newValue;
//         });
//       },
//     );
//   }
// }
