
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/remote/storage_dao.dart';

final storageFireStoreRepositoryProvider =
    Provider<StorageFireStoreRepository>((ref) {
  return StorageFireStoreRepositoryImp();
});

abstract class StorageFireStoreRepository {
  Future<String> uploadImage(XFile imageFile);
}

class StorageFireStoreRepositoryImp implements StorageFireStoreRepository {

  @override
  Future<String> uploadImage(XFile imageFile) async {

    return await StorageDao.uploadImageToFirebase(imageFile);
  }
}
