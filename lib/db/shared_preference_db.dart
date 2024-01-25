import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
Provider<SharedPreferences>((_) => throw UnimplementedError());

final libraryIdProvider = StateProvider((ref) =>  ref.watch(sharedPreferencesProvider).getInt("libraryId"));