

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../repository/storage_firestaore/storage_firestore_repository.dart';

final storageFireStoreUseCaseProvider = Provider<StorageFireStoreUSeCase>((ref) {
  return StorageFireStoreUSeCaseImp(repository: ref.read(storageFireStoreRepositoryProvider));
});

abstract class StorageFireStoreUSeCase {
  Future<String> uploadImage(XFile imageFile);
}

class StorageFireStoreUSeCaseImp implements StorageFireStoreUSeCase {

  @visibleForTesting
  StorageFireStoreUSeCaseImp({
    required StorageFireStoreRepository repository,
  }) : _repository = repository;

  final StorageFireStoreRepository _repository;


  @override
  Future<String> uploadImage(XFile imageFile) async {
    return await _repository.uploadImage(imageFile);
  }

}

