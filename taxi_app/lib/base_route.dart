import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

mixin AppData {
 /* NetworkUtil networkUtil = NetworkUtil();

  DatabaseHelper databaseHelper = DatabaseHelper();

  SessionManager sessionManager = SessionManager();*/
}

class BaseRoute<T extends StatefulWidget> extends State<T> {
  static AppLifecycleState? appState;

  @override
  void initState() {
    super.initState();
    appState = baseLifeCycle();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  AppLifecycleState? baseLifeCycle() {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      switch (msg) {
        case "AppLifecycleState.paused":
          appState = AppLifecycleState.paused;
          // print('AppLifecycleState.paused');
          break;
        case "AppLifecycleState.resumed":
          appState = AppLifecycleState.resumed;
          // print('AppLifecycleState.resumed');
          // if(await Utils.checkNetworkStatus()) {
          //   if(routeSyncTimer != null && routeSyncTimer.) {
          //     checkAndUpdateRouteSync();
          //   }
          // }
          break;
        case "AppLifecycleState.inactive":
          appState = AppLifecycleState.inactive;
          // print('AppLifecycleState.inactive');
          break;
        case "AppLifecycleState.detached":
          appState = AppLifecycleState.detached;
          // print('AppLifecycleState.detached');
          break;
        default:
          return;
      }
      return;
    });
    return appState;
  }

  double getMediaQueryHeight(BuildContext context, double px) {
    return MediaQuery.of(context).size.height * px;
  }

  double mqHeight(double px) {
    return MediaQuery.of(context).size.height * px;
  }

  double mqWidth(double px) {
    return MediaQuery.of(context).size.width * px;
  }

  double getMediaQueryWidth(BuildContext context, double px) {
    return MediaQuery.of(context).size.width * px;
  }

  double getFontSize(BuildContext context, double px) {
    return MediaQuery.of(context).size.shortestSide * px;
  }

  double mqFont(double px) {
    return MediaQuery.of(context).size.shortestSide * px;
  }

  // Color setStopStatusColor(String stop) {
  //   switch (stop) {
  //     case RouteConstants.STATUS_COMPLETED:
  //       return Utils.hexColor(AppColor.success);
  //     case RouteConstants.STATUS_ARRIVED:
  //       return Utils.hexColor(AppColor.arrived);
  //     case RouteConstants.STATUS_IN_COMPLETE:
  //       return Utils.hexColor(AppColor.inComplete);
  //     case RouteConstants.STATUS_CANCELLED:
  //       return Utils.hexColor(AppColor.attention);
  //     case RouteConstants.STATUS_EXCEPTION:
  //       return Colors.red.shade100;
  //     default:
  //       return Colors.black54;
  //   }
  // }
}

// mixin MediaQueryMethods {
//   Color setStopStatusColor(String stop) {
//     switch (stop) {
//       case RouteConstants.STATUS_COMPLETED:
//         return Utils.hexColor(AppColor.success);
//       case RouteConstants.STATUS_ARRIVED:
//         return Utils.hexColor(AppColor.arrived);
//       case RouteConstants.STATUS_IN_COMPLETE:
//         return Utils.hexColor(AppColor.inComplete);
//       case RouteConstants.STATUS_CANCELLED:
//         return Utils.hexColor(AppColor.attention);
//       case RouteConstants.STATUS_EXCEPTION:
//         return Colors.red.shade100;
//       default:
//         return Colors.black54;
//     }
//   }
//
//   double getMediaQueryHeight(BuildContext context, double px) {
//     return MediaQuery.of(context).size.height * px;
//   }
//
//   double getMediaQueryWidth(BuildContext context, double px) {
//     return MediaQuery.of(context).size.width * px;
//   }
//
//   double getFontSize(BuildContext context, double px) {
//     return MediaQuery.of(context).size.shortestSide * px;
//   }
//
//   double mqFont(BuildContext context, double px) {
//     return MediaQuery.of(context).size.shortestSide * px;
//   }
// }