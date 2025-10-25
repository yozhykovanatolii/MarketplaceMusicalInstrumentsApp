import 'dart:io';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';

class ListingStorage extends SupabaseStorage {
  @override
  Future<String> saveImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    await supabaseClient.storage
        .from('images')
        .upload('uploads/$fileName', imageFile);
    final imageUrl = supabaseClient.storage
        .from('images')
        .getPublicUrl('uploads/$fileName');
    return imageUrl;
  }
}
