

import 'package:base_structure/app/data/data_service/server_configs.dart';
import 'package:base_structure/app/utils/messages.dart';

import '../../utils/user_prefs.dart';
import '../data_service/web_service.dart';
import '../entity/req_entity/req_reservation.dart';
import '../entity/req_entity/req_user_logout.dart';
import '../entity/res_entity/res_empty.dart';
import '../entity/res_entity/res_reservation.dart';
import '../entity/res_entity/res_user_login.dart';

abstract class AuthData {
  Future<ResLogin> userLogin({required String mobile});

  Future<ResReservation> userReservation();

  Future<ResEmpty> userLogout({required int id});
}

class AuthDataImpl implements AuthData {

  @override
  Future<ResLogin> userLogin({required String mobile}) async {
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.userLogin, queryParameters: {'mobileNo': mobile,});

    print('login ${mobile}');


    try {
      return ResLogin.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> userLogout({required int id}) async {
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.userLogout,
        data: ReqUserLogout(userId: id).toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResReservation> userReservation() async {
    final user = await UserPrefs.shared.getUser;

    final req = ReqReservation(memberId: user.memberID);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.userReservation, data: req);

    try {
      return ResReservation.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
