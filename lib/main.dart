import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ic_creame_app/core/Responsive/sizeconfig.dart';
import 'package:ic_creame_app/core/constants/app_color.dart';
import 'package:ic_creame_app/core/constants/static_constants.dart';
import 'package:ic_creame_app/core/hive.dart';
import 'package:ic_creame_app/features/authentication%20/log_in.dart';
import 'package:ic_creame_app/features/catalouge/main_catalouge.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "2180291628837945",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(providers: Constants.providers, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: ScreenUtil.defaultSize,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  title: 'Whoop Cream',
                  theme: ThemeData(),
                  debugShowCheckedModeBanner: false,
                  home: const MyHomePage(),
                );
              });
            },
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? token;

  @override
  void initState() {
    super.initState();
    LocalStorageHive.getStoredToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF,
      body: Constants.authToken == null
          ? SignInForm()
          : const CatalougeScreen(
              title: 'Catalouge',
            ),
    );
  }
}
