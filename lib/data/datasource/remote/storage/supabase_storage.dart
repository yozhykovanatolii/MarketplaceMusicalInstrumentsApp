import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseStorage {
  final supabaseClient = Supabase.instance.client;

  Future<String> saveImage(File imageFile);
}
