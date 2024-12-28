import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class QueryModel {
  final String category;
  final String image;
  final String query;
  final String resolvedBy;
  final String queryId;
  final String status;
  final String createdBy;
  final DateTime timestamp;
  QueryModel({
    required this.category,
    required this.image,
    required this.status,
    required this.query,
    required this.resolvedBy,
    required this.queryId,
    required this.createdBy,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'image': image,
      'query': query,
      'resolvedBy': resolvedBy,
      'queryId': queryId,
      'createdBy': createdBy,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory QueryModel.fromMap(Map<String, dynamic> map) {
    return QueryModel(
      category: map['category'] as String,
      image: map['image'] as String,
      query: map['query'] as String,
      status: map['status'] as String,
      resolvedBy: map['resolvedBy'] as String,
      queryId: map['queryId'] as String,
      createdBy: map['createdBy'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryModel.fromJson(String source) =>
      QueryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
