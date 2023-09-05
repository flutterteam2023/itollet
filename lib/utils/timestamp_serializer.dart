import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();
  @override
  
  DateTime fromJson(dynamic timestamp) { 
    if (timestamp!=null) {
      return timestamp.toDate();
    }else{
      return DateTime.now();
    }
   }
  @override
  
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}