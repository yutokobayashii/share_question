


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../pages/make_question_pages/make_question_page.dart';

Future<void> pickImage(ImageSource source,WidgetRef ref) async {
  final ImagePicker picker = ImagePicker();
  final XFile? selected = await picker.pickImage(source: source);

  ref.watch(imageFileProvider.notifier).update((state) => selected);
}