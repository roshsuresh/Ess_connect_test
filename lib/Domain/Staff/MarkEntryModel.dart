// class MarkEntryInitialValuesModel {
//   List<MarkEntryInitialValues>? markEntryInitialValues;

//   MarkEntryInitialValuesModel({this.markEntryInitialValues});

//   MarkEntryInitialValuesModel.fromJson(Map<String, dynamic> json) {
//     if (json['markEntryInitialValues'] != null) {
//       markEntryInitialValues = [];
//       json['markEntryInitialValues'].forEach((v) {
//         markEntryInitialValues!.add(new MarkEntryInitialValues.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.markEntryInitialValues != null) {
//       data['markEntryInitialValues'] =
//           this.markEntryInitialValues!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class MarkEntryInitialValues {
  String? id;
  String? courseName;
  int? sortOrder;

  MarkEntryInitialValues({this.id, this.courseName, this.sortOrder});

  MarkEntryInitialValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    data['sortOrder'] = this.sortOrder;
    return data;
  }
}

class MarkEntryDivisionList {
  String? value;
  String? text;
  Null selected;
  Null active;
  int? order;

  MarkEntryDivisionList(
      {this.value, this.text, this.selected, this.active, this.order});

  MarkEntryDivisionList.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    selected = json['selected'];
    active = json['active'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['selected'] = this.selected;
    data['active'] = this.active;
    data['order'] = this.order;
    return data;
  }
}
