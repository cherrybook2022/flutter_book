import 'package:flutter/material.dart';
import 'package:kakao_login_sample/screens/login_page.dart';
import 'package:kakao_login_sample/screens/logout_page.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:kakao_login_sample/provider/user_provider.dart';
import 'package:provider/provider.dart';
void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '63c163399768dddefa6293308875e969',    // 앱키 설정
    javaScriptAppKey: '147bc7c579b1d37b8a59f004b562a051',// 자바스크립트 앱키 설정
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child : const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/logout': (context) => const LogoutPage(),
      },
    );
  }
}
