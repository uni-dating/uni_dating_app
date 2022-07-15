import 'package:collection/collection.dart';
import 'package:uni_dating_app/models/profile/user.info.model.dart';
import 'package:uni_dating_app/repositories/base/remote_static.repository.dart';

class NetworkUsersRepository {
  final _repo = RemoteStaticRepository();

  Future<UserInfoModel?> getUser(String? id) async {
    final response = await _repo.getCollection('users').get();

    final result = response.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .firstWhereOrNull((element) => element.id == id);

    return result;
  }

  Future<bool> addUser(UserInfoModel model) async {
    final response = await _repo.getCollection('users').add(model.toJson());

    return true;
  }

  Future<bool> isUserAlreadyExists(String email) async {
    final response = await _repo
        .getCollection('users')
        .where('email', isEqualTo: email)
        .get();

    return response.docs.isNotEmpty;
  }
}
