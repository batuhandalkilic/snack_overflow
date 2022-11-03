import '../Base/models/base_model_user.dart';

abstract class ICacheManager {
  Future<void> initHive(String folderName);
  Future<void> hiveOpenBox(String name);
  Future<void> clearAll();
  List<T>? getValues<T>();
  List<T>? getKeys<T>();
  Future<void> putUser(User user);
  User? getUser(String id);
  void register<T>();
  Map<dynamic, dynamic>? toMap();
}
