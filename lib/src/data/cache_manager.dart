import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CustomCacheManager extends BaseCacheManager{
  static const key = "qeCache";
  static const int maxNumberOfFiles = 10;
  static const Duration cacheTimeout = Duration(hours: 1);

  static CustomCacheManager _instance;

  factory CustomCacheManager() {
    if (_instance == null) {
      _instance = new CustomCacheManager._();
    }
    return _instance;
  }

  CustomCacheManager._() : super(key,maxNrOfCacheObjects: maxNumberOfFiles,
        maxAgeCacheObject: cacheTimeout);

  @override
  Future<String> getFilePath() async{
    var dir = await getTemporaryDirectory();
    return path.join(dir.path,key);
  }
}