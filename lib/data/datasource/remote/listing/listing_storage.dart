import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListingStorage {
  final _supabaseClient = Supabase.instance.client;

  Future<String> saveListingImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    await _supabaseClient.storage
        .from('images')
        .upload('uploads/$fileName', imageFile);
    final imageUrl = _supabaseClient.storage
        .from('images')
        .getPublicUrl('uploads/$fileName');
    print(imageUrl);
    return imageUrl;
  }
}
