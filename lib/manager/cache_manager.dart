import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:testbank/manager/hive_constants.dart';
import 'package:testbank/modal/usermodal.dart';

abstract class ICacheManager<T> {
  late String key;
  ICacheManager(this.key);
  Future<void> init();

  void registerAdapters();

  Future<void> clearAll();

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  List<T>? getValues();

  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
}

class UserCacheManager extends ICacheManager<UserModel> {
  UserCacheManager(String key) : super(key);
  Box<UserModel>? _box;

  @override
  Future<void> addItems(List<UserModel> items) async {
    await _box?.addAll(items);
  }

  @override
  Future<void> putItems(List<UserModel> items) async {
    await _box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  UserModel? getItem(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putItem(String key, UserModel item) async {
    await _box?.put(key, item);
  }

  @override
  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }

  @override
  List<UserModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userTypeId)) {
      Hive.registerAdapter(UserModelAdapter());
      //Hive.registerAdapter(CompanyAdapter());
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
