import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test3/Maxlook/providers/products_provider.dart';
import 'package:test3/Maxlook/screens/cart.dart';
import 'package:test3/Maxlook/screens/product_datails.dart';
import 'package:test3/Maxlook/utils/constants.dart';
import 'package:test3/date_picker/date_picker.dart';
import 'package:test3/render_object_test.dart';
import 'package:test3/table_view/table_explore.dart';
import 'package:test3/tree_view/tree_explore.dart';

import 'Maxlook/app_layout.dart';
import 'Maxlook/maxlook_theme.dart';
import 'Maxlook/navigation_bar.dart';
import 'Maxlook/utils/custom_page_route.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: darkColor,
      systemNavigationBarColor: darkColor,
    ),
  );
  runApp(MyApp());
}

///Date Picker
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date Picker',
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
        Locale('he', ''),
        Locale('es', ''),
        Locale('ru', ''),
        Locale('ko', ''),
        Locale('hi', ''),
        Locale('ar', ''),
      ],
      home: DatePicker(),
    );
  }
}

//TableView and TreeView
/// A sample application that utilizes the TableView and TreeView APIs.
// class MyApp extends StatelessWidget {
//   /// Creates an instance of the example app.
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '2D Scrolling Examples',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
//         appBarTheme: AppBarTheme(backgroundColor: Colors.purple[50]),
//       ),
//       home: const ExampleHome(),
//       routes: <String, WidgetBuilder>{
//         '/table': (BuildContext context) => const TableExplorer(),
//         '/tree': (BuildContext context) => const TreeExplorer(),
//       },
//     );
//   }
// }

// /// The home page of the application, which directs to the tree or table
// /// explorer.
// class ExampleHome extends StatelessWidget {
//   /// Creates a screen that demonstrates the TableView widget.
//   const ExampleHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tables & Trees'),
//       ),
//       body: Center(
//         child: Column(children: <Widget>[
//           const Spacer(flex: 3),
//           FilledButton(
//             onPressed: () {
//               // Go to table explorer
//               Navigator.of(context).pushNamed('/table');
//             },
//             child: const Text('TableView Explorer'),
//           ),
//           const Spacer(),
//           FilledButton(
//             onPressed: () {
//               // Go to tree explorer
//               Navigator.of(context).pushNamed('/tree');
//             },
//             child: const Text('TreeView Explorer'),
//           ),
//           const Spacer(flex: 3),
//         ]),
//       ),
//     );
//   }
// }

///Render Object
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Chat message RenderBox',
//       home: ChatAppConversationView(),
//     );
//   }
// }

///Maxlook
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     Map<String, Widget Function(BuildContext)> _routes = {
//       AppLayout.id: (context) => AppLayout(),
//       MaklookApp.id: (context) => MaklookApp(),
//       // MaxlookHome.id: (context) => MaxlookHome(),
//       ProductDetails.id: (context) => ProductDetails(),
//       CartPage.id: (context) => CartPage(),
//     };
//     return ChangeNotifierProvider(
//       create: (BuildContext context) => ProductsProvider(),
//       child: MaterialApp(
//           title: 'Maxlook',
//           debugShowCheckedModeBanner: false,
//           color: orangeColor,
//           themeMode: ThemeMode.light, //or ThemeMode.dark
//           theme: GlobalThemData.lightThemeData,
//           routes: _routes,
//           initialRoute: AppLayout.id,
//           // routes: _routes,
//           onGenerateRoute: (settings) {
//             // print(settings.name);
//             if (_routes.containsKey(settings.name)) {
//               return CustomMaterialPageRoute(
//                 settings: settings,
//                 builder: _routes[settings.name]!,
//               );
//             }
//             return null;
//           },
//           onUnknownRoute: (settings) {
//             return CustomMaterialPageRoute(
//               settings: settings,
//               builder: (BuildContext context) => MaklookApp(),
//             );
//           },
//           home: AppLayout()),
//     );
//   }
// }
