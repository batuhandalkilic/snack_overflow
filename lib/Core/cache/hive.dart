import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cache_manager.dart';

import '../Base/models/base_model_user.dart';

final cacheProvider = Provider<CacheManager>((ref) {
  return CacheManager();
});

class CacheManager implements ICacheManager {
  Box? _box;

  @override
  Future<void> initHive(String folderName) async {
    await Hive.initFlutter(folderName);
  }

  @override
  Future<void> hiveOpenBox(String name) async {
    register();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(name);
    }
  }

  @override
  Future<void> putUser(User user) async {
    await _box?.put(user.id, user);
  }

  @override
  User? getUser(String id) {
    return _box?.get(id);
  }

  @override
  List<User>? getValues<User>() {
    return _box?.values.toList().cast<User>();
  }

  @override
  void register<T>() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
  }

  @override
  Future<void> clearAll() async {
    await _box?.clear();
  }

  @override
  Map<dynamic, dynamic>? toMap() {
    return _box?.toMap();
  }

  @override
  List<String>? getKeys<String>() {
    return _box?.keys.toList().cast<String>();
  }
}
