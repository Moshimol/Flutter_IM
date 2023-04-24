import '../../constant/cache_key.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../utils/storage/storage_shared.dart';

// 全局参数
class GlobalParams {
  static GlobalParams instance = GlobalParams._internal();
  
  String accountId = "";
  UserData currentuser = UserData.new();

  factory GlobalParams() => instance;
  
  GlobalParams._internal() {
    // 初始化变量
     StorageShared().getStorage(CacheKey.accountId).then((value) {
      accountId = value;
      StorageShared().getStorage(CacheKey.appUserInfo(accountId)).then((user){
        currentuser = UserData.fromJson(user);
      });
    });
  }
}
