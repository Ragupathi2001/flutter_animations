

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zoom_widget/zoom_widget.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(200, 320),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              // appBar: AppBar(
              //   title: Text('WebView Example'),
              // ),
              body: Zoom(
                maxZoomWidth: 1800,
                maxZoomHeight: 1800,


                initTotalZoomOut: true,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: 1800
                      ),


                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,


                      child: WebView(
                        initialUrl: 'https://cmwssb-3j8ds.kssmart.xyz/',
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
