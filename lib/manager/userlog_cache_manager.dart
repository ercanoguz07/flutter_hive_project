import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:testbank/modal/userlogmodal.dart';

import 'cache_manager.dart';
import 'hive_constants.dart';

class UserLogCacheManager extends ICacheManager<UserLogModel> {
  UserLogCacheManager(String key) : super(key);
  Box<UserLogModel>? _box;

  @override
  Future<void> addItems(List<UserLogModel> items) async {
    await _box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserLogModel> items) async {
    await _box
        ?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.userId, e))));
  }

  @override
  UserLogModel? getItem(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserLogModel item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<UserLogModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userLogTypeId)) {
      Hive.registerAdapter(UserLogModelAdapter());
    }
  }

  @override
  Future<void> clearAll() async {
    await _box?.clear();
  }

  @override
  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }
}
