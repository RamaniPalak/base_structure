import 'package:base_structure/app/utils/api_response.dart';
import 'package:base_structure/app/utils/constants.dart';
import 'package:base_structure/app/utils/enums.dart';
import 'package:base_structure/app/utils/show_snack_bar.dart';
import 'package:base_structure/app/views/loading_small.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../providers/auth_provider.dart';
import '../../views/custom_popup_view.dart';

abstract class BaseScreen {
  showLogoutPopup(BuildContext context) {
    CustomPopup(context,
        title: 'LOGOUT',
        message: 'Are you sure you want to logout?',
        primaryBtnTxt: 'YES', primaryAction: () {
      logoutUser(context);
    }, secondaryBtnTxt: 'NO');
  }

  Future logoutUser(BuildContext context) async {
    try {
      final auth = Provider.of<AuthProviderImpl>(context, listen: false);
      await auth.logOutUser();

      final res = handleRes(res: auth.logoutRes!, context: context);

      if(res){
        RestartWidget.restartApp(context);
      }

    } catch (e) {
    }
  }

  Future unAuthUser(BuildContext context) async {
    await Provider.of<AuthProviderImpl>(context, listen: false).unAuthorizeUser();
    RestartWidget.restartApp(context);
  }

  bool handleRes(
      {required ApiResponse res,
      required BuildContext context,
      Function? retryCall}) {
    if (res.state == Status.UNAUTHORISED) {
      CustomPopup(context,
          title: 'Un-Authorised',
          message: '${res.msg}',
          primaryBtnTxt: 'Re-try', primaryAction: () {
            unAuthUser(context);
      });
      return false;
    } else if (res.state == Status.ERROR) {
      // if(retryCall == null){
      //   CustomPopup(context, title: 'Sorry!', message: '${res.msg}', primaryBtnTxt: 'OK');
      // }else{
      //   CustomPopup(context, title: 'Sorry!', message: '${res.msg}', primaryBtnTxt: 'Re-try',secondaryBtnTxt: 'Cancel',primaryAction: retryCall);
      // }

      ShowSnackBar(context: context, message: '${res.msg ?? ''}');

      return false;
    } else {
      return true;
    }
  }

  Widget resContainer(
      { ApiResponse? res,
      required Widget successWidget,
      Function? retryCall,
      required BuildContext context}) {
    switch (res?.state) {
      case Status.LOADING:
        return Center(
            child: LoadingSmall(
          color: kPrimaryColor,
          size: 44,
        ));
      case Status.COMPLETED:
        return successWidget;
      case Status.ERROR:
        return Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(res?.msg ?? ""),
              TextButton(
                  onPressed: () {
                    if (retryCall != null) {
                      retryCall();
                    }
                  },
                  child: Text('Re Try'))
            ],
          )),
        );
      case Status.UNAUTHORISED:
        return Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(res?.msg ?? ""),
              TextButton(
                  onPressed: () async {
                    await Provider.of<AuthProviderImpl>(context)
                        .unAuthorizeUser();

                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text('Logout'))
            ],
          )),
        );
      default:
        return Container(
          child: Text('Something Went Wrong.'),
        );
    }
  }
}
