import 'package:marketplace_musical_instruments_app/data/datasource/local/camera/camera_picker.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/listing/listing_storage.dart';

class ListingRepository {
  final _cameraPicker = CameraPicker();
  final _listingStorage = ListingStorage();

  Future<String> getListingPhotoUrl() async {
    final imageFile = await _cameraPicker.pickImageFileFromGallery();
    final imageUrl = await _listingStorage.saveListingImage(imageFile);
    return imageUrl;
  }
}
