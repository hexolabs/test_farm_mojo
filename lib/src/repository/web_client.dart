import 'dart:io';
import 'dart:async';
import 'package:FarmMojo/src/utils/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:FarmMojo/src/utils/api_routes.dart';
import 'package:FarmMojo/src/repository/beans/user.dart';
import 'package:FarmMojo/src/repository/models/pond.dart';
import 'package:FarmMojo/src/repository/models/farm.dart';
import 'package:FarmMojo/src/repository/models/stock_details.dart';
import 'package:FarmMojo/src/repository/models/login_user_model.dart';
import 'package:FarmMojo/src/repository/models/estimated_stocking.dart';

class WebClient {
  CookieJar cj;

  final Dio dio = new Dio(BaseOptions(
      connectTimeout: 20000,
      receiveTimeout: 20000,
      contentType: ContentType.json,
      responseType: ResponseType.json));

  WebClient(String endPoint) {
    dio.options.baseUrl = endPoint;
    _setCookie();
  }

  Future<Null> _setCookie() async {
    if (cj == null) {
      Directory tempDir = await getTemporaryDirectory();
      String dirPath = tempDir.path;
      cj = PersistCookieJar(dir: dirPath);
      dio.interceptors..add(CookieManager(cj));
    }
  }

  Future<User> login(LoginUserModel loginUser) async {
/*    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return dio.resolve({
          "username": "venkat",
          "password": "venkat123",
          "challenge": "authchallenge",
          "session": "12344566"
        });
      },
    ));*/


    final Response response =
        await dio.post(ApiRoutes.login, data: loginUser.toJsonLogin());

    print(response);

    if (response.data.toString().toLowerCase().contains("challenge")) {
      throw PasswordResetException(
          loginUser: loginUser.copyWith(session: response.data['session']));
    }

    var cookies = cj
        .loadForRequest(Uri.parse('${dio.options.baseUrl}${ApiRoutes.login}'));
    cj.saveFromResponse(Uri.parse(dio.options.baseUrl), cookies);

    return User.fromJson(response.data);
  }

  Future<User> passReset(LoginUserModel loginUser) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return dio.resolve({
          "name": "venkat",
          "role": "RA",
          "mobile": "9677012480",
          "email": "venkat@hexolabs.com",
          "sid": "sdfsdfsdflkjsdfljldf"
        });
      },
    ));


    final Response response =
        await dio.post(ApiRoutes.reset, data: loginUser.toJsonChallenge());

    print(response.data);

    var cookies = cj
        .loadForRequest(Uri.parse('${dio.options.baseUrl}${ApiRoutes.reset}'));
    cj.saveFromResponse(Uri.parse(dio.options.baseUrl), cookies);

    return User.fromJson(response.data);
  }

  Future<List<Farm>> getFarms(User user) async {
/*    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (response) {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      // Do something with response error
      return e; //continue
    }));

    await _setCookie();
    final Response response =
        await dio.get(ApiRoutes.raGetFarms.replaceFirst("{id}", '${user.id}'));

    var _farms = response.data as List;
    return _farms.map((farm) => Farm.fromJson(farm)).toList();*/
  }

  Future<String> createNewPond(Pond pond) async {
    final Response response = await dio.post(ApiRoutes.raCreateNewPond,
        data: pond.toJsonForCreatePond());
    return response.data['pond_id'];
  }

  Future<EstimatedStocking> updateEstStocking(
      EstimatedStocking stocking) async {
    if (stocking.id == null) {
      final response = await dio.post(ApiRoutes.raEstimatedStocking,
          data: stocking.toJsonAddEst());
      stocking = stocking.copyWith(id: response.data['estimated_stocking_id']);
    } else {
      await dio.put(ApiRoutes.raEstimatedStocking,
          data: stocking.toJsonUpdateEst());
    }
    return stocking;
  }

  Future<StockDetails> getStockingDetails(String pondId) async {
    final response =
        await dio.get(ApiRoutes.raGetStocking.replaceFirst("{id}", '$pondId'));

    return StockDetails.fromJson(response.data);
  }

  Future<Stocking> updateStocking(Stocking stocking) async {
    if (stocking.id == null) {
      final Response response = await dio.post(ApiRoutes.raAddOrUpdateStocking,
          data: stocking.toJsonAddStocking());
      stocking = stocking.copyWith(id: response.data['stocking_id']);
    } else {
      await dio.put(ApiRoutes.raAddOrUpdateStocking,
          data: stocking.toJsonUpdateStocking());
    }
    return stocking;
  }

  Future<String> uploadImage(imageFile) async {
    return "";
  }
}
