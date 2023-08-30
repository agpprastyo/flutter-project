import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/hotel.dart';

class HotelSource {
  static Future<List<Hotel>> getHotel() async {
    var result = await FirebaseFirestore.instance.collection('Hotel').get();
    return result.docs.map((e) => Hotel.fromJson(e.data())).toList();
  }
}
