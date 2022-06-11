class Rating {
  String? source;
  String? value;

  Rating({this.source, this.value});

  Rating.fromJson(Map<String, dynamic> json) {
    source = json.containsKey('Source') && json['Source'] != null
        ? json['Source']
        : null;
    value = json.containsKey('Value') && json['Value'] != null
        ? json['Value']
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Source'] = source;
    data['Value'] = value;
    return data;
  }
}
