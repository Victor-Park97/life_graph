import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:life_graph/core/routes/get_routes.dart';
import 'package:life_graph/data/view_model_bindings.dart';
import 'package:life_graph/util/theme.dart';
import 'package:life_graph/views/home/home_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAx3nAmgcNbDOoZqf0c76JSeYbBpcXawHo',
      appId: '1:66720124811:web:ce18b7cf9d902d1a5f698e',
      messagingSenderId: '66720124811',
      projectId: 'life-graph-92999',
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const HomePage(),
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialBinding: ViewModelBindings(),
      getPages: RoutesGenerator.routes,
    );
  }
}
