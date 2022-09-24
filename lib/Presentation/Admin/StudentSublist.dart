import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../../utils/constants.dart';
import '../../Application/AdminProviders/Student_list_provider.dart';
import '../../Domain/Admin/StudentListModel.dart';



class StudentListItem extends StatelessWidget {
  final StudentListModel model;

  const StudentListItem({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentNotification>(builder: (context, snapshot, child) {
      return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ListTile(
          tileColor: model.selected == null || !model.selected!
              ? Colors.transparent
              : model.selected != null && model.selected == true
              ? UIGuide.PRIMARY2
              : Colors.transparent,
          //selected: snapshot.isSelected(model),
          onTap: () => snapshot.selectItem(model),
          leading: Text(model.rollNo == null ? '0' : model.rollNo.toString()),
          title: Text(model.name),
          subtitle: Text(model.admissionNo ?? ""),
          trailing: model.selected != null && model.selected!
              ? SvgPicture.asset(UIGuide.check)
              : SvgPicture.asset(UIGuide.notcheck),
        ),
      );
    });
  }
}
