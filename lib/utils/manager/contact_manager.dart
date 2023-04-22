import '../../request/config.dart';
import '../../request/request/request.dart';

class ContactManager {
  static Future<dynamic> getContactList() async {
    var res =  await Request().post(Contact.FriendList);
    return res;
  }
}