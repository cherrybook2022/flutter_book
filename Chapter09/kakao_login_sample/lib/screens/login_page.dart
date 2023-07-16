import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_login_sample/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({Key? key}) : super(key: key);

    @override
    State<LoginPage> createState() => _LoginPageState();
}

// 로그인 페이지 상태 위젯
class _LoginPageState extends State<LoginPage> {
  // 로그인 화면 그리기
  @override
  Widget build(BuildContext context) {
    //  buttonArea 재사용메소드 정의
    Widget buttonArea = Center(
      child: ElevatedButton (
        //처음 로그인시는 'Kakao Login'버튼으로, 카카오로그인 된 경우 'Welcome' 으로 수정
        child: Consumer<UserProvider>(builder: (context, user, child) =>
              Text (!user.isLogined ? 'Kakao Login' : 'Welcome',
              style: GoogleFonts.acme (fontSize: 30, color: Colors.black87))
            ),

        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9)),
            elevation: 5
        ),
        autofocus: true,
        onPressed: () async {
          var user = context.read<UserProvider>();

          user.loginCheck();    // UserProvider의 loginCheck() 호출
          print('[login.dart] after logincheck ${user.isLogined}');

          if (!await user.isLogined) {
            // 카카오톡이 설치되어있으면 카카오톡 로그인, 설치되어있지 않는 경우 카카오계정 로그인
            await isKakaoTalkInstalled() ? user.loginTalk() : user.loginKakao();
          } else {
            Navigator.pushReplacementNamed(context, '/logout'); // 로그아웃 페이지로 이동
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Colors.orangeAccent,
          titleTextStyle:  GoogleFonts.zcoolXiaoWei(
            fontSize: 30,
            fontWeight:FontWeight.bold,
            color: Colors.black,
          )
      ),
      body:  buttonArea,
    );
  }
}



// // 로그인 페이스 상태 위젯
// class _LoginPageState extends State<LoginPage> {
//   // 로그인 화면 그리기
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserProvider>(builder: (context,user,child) {
//       // ElevatedButton Area
//       Widget buttonArea = Center(
//         child: ElevatedButton (
//           //처음 로그인시는 'Kakao Login'버튼으로, 카카오로그인 된 경우 'Welcome' 으로 수정
//           child:Text(!user.isLogined ? 'Kakao Login' : 'Welcome',
//               style: GoogleFonts.acme (fontSize: 30, color: Colors.black87)),
//
//           style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.amberAccent,
//               foregroundColor: Colors.black87,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(9)),
//               elevation: 5
//           ),
//           // autofocus: true,
//           onPressed: () async {
//             user.loginCheck();
//             if (!await user.isLogined) {
//               print('[login.dart] after logincheck ${user.isLogined}');
//               // 카카오톡이 설치되어있으면 카카오톡 로그인, 설치되어있지 않는 경우 카카오계정 로그인
//               await isKakaoTalkInstalled() ?  user.loginTalk() : user.loginKakao();
//             }
//             print('[login.dart] before logout page= ${user.isLogined}');
//             if (user.isLogined) {
//               // 로그아웃 페이지로 이동
//               await Navigator.pushReplacementNamed(context, '/logout');
//             }
//           },
//         ),
//       );
//
//       return Scaffold(
//         backgroundColor: Colors.yellow[50],
//         appBar: AppBar(
//             title: const Text('Login Page'),
//             backgroundColor: Colors.orangeAccent,
//             titleTextStyle:  GoogleFonts.zcoolXiaoWei(
//               fontSize: 30,
//               fontWeight:FontWeight.bold,
//               color: Colors.black,
//             )
//         ),
//         body:  buttonArea,
//       );
//     });
//   }
// }

