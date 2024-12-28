import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  final String title;
  final String timestamp;
  final String content;
  final String thumburl;
  final String createdby;
  final String status;
  ArticleModel({
    required this.title,
    required this.timestamp,
    required this.content,
    required this.thumburl,
    required this.createdby,
    required this.status,
  });

  ArticleModel copyWith({
    String? title,
    String? timestamp,
    String? content,
    String? thumburl,
    String? createdby,
    String? status,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      timestamp: timestamp ?? this.timestamp,
      content: content ?? this.content,
      thumburl: thumburl ?? this.thumburl,
      createdby: createdby ?? this.createdby,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'timestamp': timestamp,
      'content': content,
      'thumburl': thumburl,
      'createdby': createdby,
      'status': status,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] as String,
      timestamp: map['timestamp'] as String,
      content: map['content'] as String,
      thumburl: map['thumburl'] as String,
      createdby: map['createdby'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleModel(title: $title, timestamp: $timestamp, content: $content, thumburl: $thumburl, createdby: $createdby, status: $status)';
  }

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.timestamp == timestamp &&
        other.content == content &&
        other.thumburl == thumburl &&
        other.createdby == createdby &&
        other.status == status;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        timestamp.hashCode ^
        content.hashCode ^
        thumburl.hashCode ^
        createdby.hashCode ^
        status.hashCode;
  }
}
