class Feedback {
  String? id;
  String? content;
  bool? status;
  Feedback({
    this.id,
    this.content,
    this.status,});

  Feedback.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    status = json['status'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['status'] = status;
    return map;
  }

}