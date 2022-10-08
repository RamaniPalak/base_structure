import 'package:base_structure/app/utils/api_response.dart';
import 'package:base_structure/app/utils/enums.dart';
import 'package:flutter/cupertino.dart';


class BaseNotifier extends ChangeNotifier {
  apiResIsLoading(ApiResponse res) {
    res.state = Status.LOADING;

    notifyListeners();
  }

  apiResIsSuccess<T>(ApiResponse res, T data) {
    res.state = Status.COMPLETED;

    res.data = data;

    notifyListeners();
  }

  apiResIsFailed(ApiResponse res, Object e) {
    res.state = Status.ERROR;

    res.msg = e.toString();

    notifyListeners();
  }

  apiResIsUnAuthorise(ApiResponse res, Object e) {
    res.state = Status.UNAUTHORISED;

    res.msg = e.toString();

    notifyListeners();
  }
}
