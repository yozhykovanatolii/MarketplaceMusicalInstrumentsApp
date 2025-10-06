import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String id;
  final String renterId;
  final String authorId;
  final String listingId;
  final DateTime startDate;
  final DateTime endDate;
  final int totalPrice;
  final String status;

  BookingModel({
    required this.id,
    required this.renterId,
    required this.authorId,
    required this.listingId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });

  factory BookingModel.initial() {
    return BookingModel(
      id: '',
      renterId: '',
      authorId: '',
      listingId: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      totalPrice: 0,
      status: 'Unconfirmed',
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'renterId': renterId,
      'authorId': authorId,
      'listingId': listingId,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'totalPrice': totalPrice,
      'status': status,
    };
  }

  factory BookingModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return BookingModel(
      id: data?['id'] as String,
      renterId: data?['renterId'] as String,
      authorId: data?['authorId'] as String,
      listingId: data?['listingId'] as String,
      startDate: (data?['startDate'] as Timestamp).toDate(),
      endDate: (data?['endDate'] as Timestamp).toDate(),
      totalPrice: data?['totalPrice'] as int,
      status: data?['status'] as String,
    );
  }

  BookingModel copyWith({
    String? id,
    String? renterId,
    String? authorId,
    String? listingId,
    DateTime? startDate,
    DateTime? endDate,
    int? totalPrice,
    String? status,
  }) {
    return BookingModel(
      id: id ?? this.id,
      renterId: renterId ?? this.renterId,
      authorId: authorId ?? this.authorId,
      listingId: listingId ?? this.listingId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
