import 'dart:io';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';

class UserStorage extends SupabaseStorage {
  @override
  Future<String> saveImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    await supabaseClient.storage
        .from('images')
        .upload('users/$fileName', imageFile);
    final imageUrl = supabaseClient.storage
        .from('images')
        .getPublicUrl('users/$fileName');
    return imageUrl;
  }
}
