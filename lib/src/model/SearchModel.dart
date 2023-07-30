class SearchModel {
  SearchModel({
      this.makes, 
      this.models, 
      this.message,});

  SearchModel.fromJson(dynamic json) {
    makes = json['makes'] != null ? json['makes'].cast<String>() : [];
    models = json['models'] != null ? json['models'].cast<String>() : [];
    message = json['message'];
  }
  List<String>? makes;
  List<String>? models;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['makes'] = makes;
    map['models'] = models;
    map['message'] = message;
    return map;
  }

}