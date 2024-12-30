import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class QueryModel {
  final String category;
  final String image;
  final String query;
  final String assignedTo;
  final String queryId;
  final String status;
  final String createdBy;
  final DateTime timestamp;
  QueryModel({
    required this.category,
    required this.image,
    required this.status,
    required this.query,
    required this.assignedTo,
    required this.queryId,
    required this.createdBy,
    required this.timestamp,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'category': category,
      'image': image,
      'query': query,
      'assignedTo': assignedTo,
      'queryId': queryId,
      'createdBy': createdBy,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory QueryModel.fromMap(Map<dynamic, dynamic> map) {
    return QueryModel(
      category: map['category'] ?? "",
      image: map['image'] ?? "",
      query: map['query'] ?? "",
      status: map['status'] ?? "",
      assignedTo: map['assignedTo'] ?? "",
      queryId: map['queryId'] ?? "",
      createdBy: map['createdBy'] ?? "",
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryModel.fromJson(String source) =>
      QueryModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}
