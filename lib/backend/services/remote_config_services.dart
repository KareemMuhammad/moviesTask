import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String _KEY = "fcmKey";

class RemoteConfigService {
  final FirebaseRemoteConfig? _remoteConfig;
  RemoteConfigService({FirebaseRemoteConfig? remoteConfig}) : _remoteConfig = remoteConfig;

  final defaults = <String, dynamic>{
    _KEY: 1,
  };

  static RemoteConfigService? _instance;
  static Future<RemoteConfigService> getInstance() async {
    _instance ??= RemoteConfigService(
        remoteConfig: FirebaseRemoteConfig.instance,
      );
    return _instance!;
  }

  Future initialize() async {
    try {
      await _remoteConfig!.setDefaults(defaults);
      await _fetchAndActivate();
    } on PlatformException  catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig!.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await _remoteConfig!.fetchAndActivate();
  }

  String get getKey => _remoteConfig!.getString(_KEY);

}