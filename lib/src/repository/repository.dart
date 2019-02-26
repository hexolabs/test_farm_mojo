import 'dart:async';

import 'package:FarmMojo/src/repository/beans/user.dart';
import 'package:FarmMojo/src/repository/db_storage.dart';
import 'package:FarmMojo/src/repository/models/estimated_stocking.dart';
import 'package:FarmMojo/src/repository/models/farm.dart';
import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:FarmMojo/src/repository/models/pond.dart';
import 'package:FarmMojo/src/repository/models/stock_details.dart';
import 'package:FarmMojo/src/repository/web_client.dart';
import 'package:FarmMojo/src/utils/constants.dart';

class Repository {
  static final WebClient _webClient = WebClient(ApiEndPoint);
  static final DbStorage _dbStorage = DbStorage();

  const Repository();

  Future<User> login({LoginUserModel userModel}) => _webClient.login(userModel);

  Future<void> logout() => _dbStorage.removeUser();

  Future<User> passReset({LoginUserModel loginUser}) =>
      _webClient.passReset(loginUser);

  Future<void> saveUser(User user) => _dbStorage.saveUser(user);

  Future<User> getUser() => _dbStorage.getUser();

  Future<List<Farm>> loadFarms(User user) => _webClient.getFarms(user);

  Future<String> createNewPond(Pond pond) => _webClient.createNewPond(pond);

  Future<EstimatedStocking> updateEstStocking(EstimatedStocking stocking) =>
      _webClient.updateEstStocking(stocking);

  Future<StockDetails> getStockingDetails(String pondId) =>
      _webClient.getStockingDetails(pondId);

  Future<Stocking> updateStock(Stocking stocking) =>
      _webClient.updateStocking(stocking);

  Future<String> uploadPhoto(imageFile) => _webClient.uploadImage(imageFile);
}
