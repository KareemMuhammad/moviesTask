import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:movies_task/helpers/my_constants.dart';

class DeepLinkService{
  void handleDynamicLinks() async {
    ///To bring INTO FOREGROUND FROM DYNAMIC LINK.
    FirebaseDynamicLinks.instance.onLink.listen(
       (PendingDynamicLinkData dynamicLinkData) async {
        await _handleDeepLink(dynamicLinkData);
      },
      onError: (e) async {
        debugPrint('DynamicLink Failed: ${e.message}');
        return e.message;
      },
    );

    final PendingDynamicLinkData? data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    _handleDeepLink(data!);
  }

  // bool _deeplink = true;
  _handleDeepLink(PendingDynamicLinkData data) async {

    final Uri? deeplink = data.link;
    if (deeplink != null) {
      if(!kReleaseMode){
        log(deeplink.toString());
      }
      var isDetails = deeplink.pathSegments.contains('details');
      if(isDetails){
        MyConstants.navigatorKey.currentState!.pushNamed(MyConstants.deepDetailsRoute,
            arguments: deeplink.queryParameters['id']);
      }
    }
  }
}