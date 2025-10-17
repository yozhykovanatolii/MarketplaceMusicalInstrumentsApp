import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserStorage {
  final _supabaseClient = Supabase.instance.client;

  Future<String> saveUserImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    await _supabaseClient.storage
        .from('images')
        .upload('users/$fileName', imageFile);
    final imageUrl = _supabaseClient.storage
        .from('images')
        .getPublicUrl('users/$fileName');
    return imageUrl;
  }
}
