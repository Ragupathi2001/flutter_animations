//


import 'package:flutter/material.dart';
import 'package:practice_project/gallery_navigation/gallery_menu.dart';
import 'package:practice_project/gallery_navigation/split_view.dart';
import 'package:practice_project/samples/settings/theming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

var selectedPageBuilder;
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch all application state variables
    final color = ref.watch(colorProvider);
     selectedPageBuilder = ref.watch(selectedPageBuilderProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: color,
      ),
      home: HomeScreen(),
    );
  }
}

//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:practice_project/animations/sample.dart';
//
// import 'animations/animation_widgets.dart';
// import 'animations/hero_animations.dart';
// import 'animations/radial_animation.dart';
// import 'custom_paint.dart';
// import 'home_screen.dart';
//
// /// Flutter code sample for [NestedScrollView].
//
// void main() => runApp( const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
//
// class NestedScrollViewExample extends StatelessWidget {
//   const NestedScrollViewExample({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> tabs = <String>['Tab 1', 'Tab 2'];
//     return DefaultTabController(
//       length: tabs.length, // This is the number of tabs.
//       child: Scaffold(
//         body: CustomScrollView(
//           slivers: <Widget>[
//             const SliverAppBar(
//               // pinned: true,
//               backgroundColor: Colors.red,
//               expandedHeight: 50.0,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text('first'),
//               ),
//             ),
//              SliverAppBar(
//               backgroundColor: Colors.orange,
//               pinned: true,
//               bottom:PreferredSize(
//                   child: Container(color: Colors.green,),
//                   preferredSize: Size.fromHeight(10)
//               ),
//             ),
//             SliverGrid(
//               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200.0,
//                 mainAxisSpacing: 10.0,
//                 crossAxisSpacing: 10.0,
//                 childAspectRatio: 4.0,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     color: Colors.teal[100 * (index % 9)],
//                     child: Text('Grid Item $index'),
//                   );
//                 },
//                 childCount: 20,
//               ),
//             ),
//             SliverFixedExtentList(
//               itemExtent: 50.0,
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     color: Colors.lightBlue[100 * (index % 9)],
//                     child: Text('List Item $index'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }
//
//
// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// // import 'package:zoom_widget/zoom_widget.dart';
// //
// //
// // void main() => runApp(const MyApp());
// //
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   // Future<void> _launchUrl() async {
// //   //   if (!await launchUrl(Uri.parse('https://cmwssb-3j8ds.kssmart.xyz/'),mode: LaunchMode.externalApplication)) {
// //   //     throw Exception('Could not launch ');
// //   //   }
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // final _controller = TransformationController();
// //
// //     // setPosition()async{
// //     //   var value= await _controller.future;
// //     //     int xx =await value.getScrollX();
// //     //     int yy =await value.getScrollY();
// //     //  value.scrollTo(300,-1750);
// //     //  print('object');
// //     // }
// //
// //     return ScreenUtilInit(
// //         designSize: const Size(200, 320),
// //         minTextAdapt: true,
// //         splitScreenMode: true,
// //         builder: (context, child) {
// //           SystemChrome.setPreferredOrientations([
// //             DeviceOrientation.landscapeLeft,
// //             DeviceOrientation.landscapeRight,
// //           ]);
// //           return MaterialApp(
// //             debugShowCheckedModeBanner: false,
// //             home: Scaffold(
// //               // appBar: AppBar(
// //               //   title: Text('WebView Example'),
// //               // ),
// //               body: Center(
// //                 child: Builder(
// //                     builder: (context) {
// //                       // _launchUrl();
// //                       return Zoom(
// //                         initPosition:Offset(-40,-20) ,
// //                         maxZoomHeight: 1500,
// //                         maxZoomWidth: 1500,
// //
// //                         child: Padding(
// //                           padding: const EdgeInsets.only(top: 60),
// //                           child: Container(
// //                             constraints: BoxConstraints(
// //                                 maxWidth: 1800
// //                             ),
// //
// //                             // width: MediaQuery.of(context).size.width,
// //                             // height: MediaQuery.of(context).size.height,
// //
// //                             child:  WebView(
// //                               initialUrl: 'https://cmwssb-3j8ds.kssmart.xyz/',
// //                               javascriptMode: JavascriptMode.unrestricted,
// //                               onWebViewCreated: (controller) {
// //                                 // _controller.complete(controller);
// //                                 // setPosition();
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                       );
// //                     }
// //                 ),
// //               ),
// //             ),
// //           );
// //         });
// //   }
// // }
