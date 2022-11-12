class TimeTableViewModel {
  String? value;
  String? text;
  String? fileId;
  String? classTTUploadId;

  TimeTableViewModel(
      {this.value, this.text, this.fileId, this.classTTUploadId});

  TimeTableViewModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
    fileId = json['fileId'];
    classTTUploadId = json['classTTUploadId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    data['fileId'] = this.fileId;
    data['classTTUploadId'] = this.classTTUploadId;
    return data;
  }
}
