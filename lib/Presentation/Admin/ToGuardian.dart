import 'dart:collection';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import '../../Application/Staff_Providers/StudListProvider.dart';
import '../../Constants.dart';
import '../../Domain/Staff/StudentReport_staff.dart';
import '../../utils/constants.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
class DemoPage extends StatefulWidget {
  const DemoPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: TaskCheckBox(
          checkBoxState: isChecked, toggleCheckBoxState:  (bool? newCheckBoxState) {
        setState(() {
          isChecked = newCheckBoxState ?? isChecked;
        });
      }),
      title: Text(
        'Task ${widget.index}',
        style: TextStyle(
          decoration:
          isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?)? toggleCheckBoxState;

  const TaskCheckBox(
      {Key? key,
        required this.checkBoxState,
        required this.toggleCheckBoxState})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        fillColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
        value: checkBoxState,
        onChanged: toggleCheckBoxState);
  }
}
