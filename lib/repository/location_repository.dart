import 'package:onspace_assessment/models/recent_model.dart';
import 'package:onspace_assessment/repository/repository_helpers.dart';

import '../models/user_model.dart';

abstract class LocationRepository {
  Future<List<User>> fetchUser();
  Future<List<RecentModel>> fetchRecents();
}

class FetchUsersRepository implements LocationRepository {
  @override
  Future<List<User>> fetchUser() async {
    var response = await getRequest(endpoint: 'storeuser');
    if (response['status'] == 200) {
      List userListMap = response['data'];
      final users = userListMap.map((e) => User.fromMap(e)).toList();
      return users;
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<List<RecentModel>> fetchRecents() async {
    var response = await getRequest(endpoint: 'recents');
    if (response['status'] == 200) {
      List recentsListMap = response['data'];
      final recents =
          recentsListMap.map((e) => RecentModel.fromMap(e)).toList();
      return recents;
    } else {
      throw NetworkException();
    }
  }
}

class NetworkException implements Exception {}
