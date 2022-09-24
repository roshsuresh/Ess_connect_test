
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';

class FeeReport extends StatefulWidget {
  const FeeReport({Key? key}) : super(key: key);

  @override
  State<FeeReport> createState() => _FeeReportState();
}

class _FeeReportState extends State<FeeReport> {
  List<String> _selectedItems = [];
  DateTime? _mydatetimeFrom;
  DateTime? _mydatetimeTo;

  String time = '--';
  String timeNow = '--';
  bool isselectAll = false;
  bool? selected;
  final List<String> _items = [
    'LP',
    'HS',
    'HSS',
  ];
  void selectAll() {
    if (_items.first == true) {
      _items.forEach((element) {});
      isselectAll = false;
    } else {
      _items.forEach((element) {
        ;
      });
      isselectAll = true;
    }
  }

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        // _selectedItems.addAll(_items);
        _selectedItems = results;
        print(results);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Collection Report'),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: UIGuide.light_Purple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // use this button to open the multi-select dialog
            Row(
              children: [
                MaterialButton(
                  minWidth: size.width - 200,
                  child: Row(
                    children: [
                      Text('Select Section'),
                      Icon(Icons.arrow_downward_outlined)
                    ],
                  ),
                  color: Colors.white70,
                  onPressed: _showMultiSelect,
                ),
                Spacer(),
                MaterialButton(
                  minWidth: size.width - 200,
                  child: Row(
                    children: [
                      const Text('Select Course'),
                      Icon(Icons.arrow_downward_outlined)
                    ],
                  ),
                  color: Colors.white70,
                  onPressed: _showMultiSelect,
                ),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  minWidth: size.width - 200,
                  child: Center(child: Text('From ${time}')),
                  color: Colors.white,
                  onPressed: (() async {
                    _mydatetimeFrom = await showDatePicker(
                        context: context,
                        initialDate: _mydatetimeFrom ?? DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030));
                    setState(() {
                      time = DateFormat('dd-MM-yy').format(_mydatetimeFrom!);
                      print(_mydatetimeFrom);
                    });
                  }),
                ),
                Spacer(),
                MaterialButton(
                  minWidth: size.width - 200,
                  child: Center(child: Text('To ${timeNow}')),
                  color: Colors.white,
                  onPressed: (() async {
                    _mydatetimeTo = await showDatePicker(
                        context: context,
                        initialDate: _mydatetimeTo ?? DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030));
                    setState(() {
                      timeNow = DateFormat('dd-MM-yy').format(_mydatetimeTo!);
                      print(_mydatetimeTo);
                    });
                  }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'View',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: UIGuide.light_Purple),
                  onPressed: (() {
                    setState(() {
                      showFee();
                    });
                  }),
                ),
              ],
            ),

            // display selected items
            // Wrap(
            //   children: _selectedItems
            //       .map((e) => Chip(
            //             label: Text(e),
            //           ))
            //       .toList(),
            // )
            // ListView(
            //   children: [Text('data')],
            // )
          ],
        ),
      ),
    );
  }

  Widget showFee() {
    return Text('data');
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        var a = _selectedItems.add(itemValue);
        print('Added');
      } else {
        _selectedItems.remove(itemValue);
        print(_selectedItems.remove(itemValue));
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  final List<String> _items = [
    'LP',
    'HS',
    'HSS',
  ];
  bool isselectAll = false;
  void selectAll() {
    if (_items.first == true) {
      _items.forEach((element) {});
      isselectAll = false;
    } else {
      _items.forEach((element) {});
      isselectAll = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Section'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('Select all'),
            ListBody(
              children: widget.items
                  .map((item) => CheckboxListTile(
                      value: _selectedItems.contains(item),
                      title: Text(item),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (isChecked) {
                        _itemChange(item, isChecked!);
                        print(item);
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
