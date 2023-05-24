import 'package:staggerd/Model/SpannableItemList.dart';

class JsonModel {
  JsonModel({
      this.type, 
      this.title, 
      this.totalRowSpan, 
      this.totalColumnSpan, 
      this.spannableItemList,});

  JsonModel.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
    totalRowSpan = json['total_row_span'];
    totalColumnSpan = json['total_column_span'];
    if (json['spannableItemList'] != null) {
      spannableItemList = [];
      json['spannableItemList'].forEach((v) {
        spannableItemList!.add(SpannableItemList.fromJson(v));
      });
    }
  }
  String ?type;
  String ?title;
  int ?totalRowSpan;
  int ?totalColumnSpan;
  List<SpannableItemList> ?spannableItemList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    map['total_row_span'] = totalRowSpan;
    map['total_column_span'] = totalColumnSpan;
    if (spannableItemList != null) {
      map['spannableItemList'] = spannableItemList!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}