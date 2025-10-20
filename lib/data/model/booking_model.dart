import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String id;
  final String renterId;
  final String renterAvatar;
  final String renterFullName;
  final String authorId;
  final String listingId;
  final String listingTitle;
  final String listingPhoto;
  final String listingCategory;
  final DateTime startDate;
  final DateTime endDate;
  final int totalPrice;
  final String status;

  BookingModel({
    required this.id,
    required this.renterId,
    required this.renterAvatar,
    required this.renterFullName,
    required this.authorId,
    required this.listingId,
    required this.listingTitle,
    required this.listingPhoto,
    required this.listingCategory,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });

  factory BookingModel.initial() {
    return BookingModel(
      id: '',
      renterId: '',
      renterFullName: '',
      renterAvatar: '',
      authorId: '',
      listingId: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      totalPrice: 0,
      listingPhoto: '',
      listingTitle: '',
      listingCategory: '',
      status: 'Unconfirmed',
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'renterId': renterId,
      'renterFullName': renterFullName,
      'renterAvatar': renterAvatar,
      'authorId': authorId,
      'listingId': listingId,
      'listingTitle': listingTitle,
      'listingPhoto': listingPhoto,
      'listingCategory': listingCategory,
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
      renterFullName: data?['renterFullName'] as String,
      renterAvatar: data?['renterAvatar'] as String,
      authorId: data?['authorId'] as String,
      listingId: data?['listingId'] as String,
      listingTitle: data?['listingTitle'] as String,
      listingPhoto: data?['listingPhoto'] as String,
      listingCategory: data?['listingCategory'] as String,
      startDate: (data?['startDate'] as Timestamp).toDate(),
      endDate: (data?['endDate'] as Timestamp).toDate(),
      totalPrice: data?['totalPrice'] as int,
      status: data?['status'] as String,
    );
  }

  BookingModel copyWith({
    String? id,
    String? renterId,
    String? renterAvatar,
    String? renterFullName,
    String? authorId,
    String? listingId,
    String? listingTitle,
    String? listingPhoto,
    String? listingCategory,
    DateTime? startDate,
    DateTime? endDate,
    int? totalPrice,
    String? status,
  }) {
    return BookingModel(
      id: id ?? this.id,
      renterId: renterId ?? this.renterId,
      renterAvatar: renterAvatar ?? this.renterAvatar,
      renterFullName: renterFullName ?? this.renterFullName,
      authorId: authorId ?? this.authorId,
      listingId: listingId ?? this.listingId,
      listingTitle: listingTitle ?? this.listingTitle,
      listingPhoto: listingPhoto ?? this.listingPhoto,
      listingCategory: listingCategory ?? this.listingCategory,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }
}
