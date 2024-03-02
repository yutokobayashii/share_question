
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../usecase/storage_firestore/storage_firestore_usecase.dart';

final storageFireStoreNotifierProvider = NotifierProvider<StorageFireStoreNotifier, void>(StorageFireStoreNotifier.new);

class StorageFireStoreNotifier extends Notifier<void> {
  @override
  void build() {
    return;
  }

  Future<String> uploadImage(XFile imageFile,ValueNotifier<bool> isUploadDone) async {
    isUploadDone.value = false;
    return await ref.read(storageFireStoreUseCaseProvider).uploadImage(imageFile);
  }
}
