class SpannableItemList {
  SpannableItemList({
      this.mediaType, 
      this.mediaSource, 
      this.title, 
      this.deeplink, 
      this.rowSpan, 
      this.columnSpan,});

  SpannableItemList.fromJson(dynamic json) {
    mediaType = json['media_type'];
    mediaSource = json['media_source'];
    title = json['title'];
    deeplink = json['deeplink'];
    rowSpan = json['row_span'];
    columnSpan = json['column_span'];
  }
  String ?mediaType;
  String ?mediaSource;
  String ?title;
  String ?deeplink;
  int ?rowSpan;
  int ?columnSpan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['media_type'] = mediaType;
    map['media_source'] = mediaSource;
    map['title'] = title;
    map['deeplink'] = deeplink;
    map['row_span'] = rowSpan;
    map['column_span'] = columnSpan;
    return map;
  }

}