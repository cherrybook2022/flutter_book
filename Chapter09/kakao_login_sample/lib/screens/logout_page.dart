import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_login_sample/provider/user_provider.dart';
import 'package:provider/provider.dart';


class LogoutPage extends StatefulWidget {
const LogoutPage({Key? key}) : super(key: key);

@override
State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],     // 화면 배경색
      appBar: AppBar(
        title: const Text('Logout Page'),
        backgroundColor: Colors.orangeAccent, // 앱바 바탕색
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 수직방향 가운데 정렬
          children: [
            // 아웃라인버튼
            OutlinedButton(
              child: Text('Kakao Logout',
                           style: GoogleFonts.acme(fontSize: 24, color: Colors.white)),
              // 버튼 스타일 설정
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,    // 배경색
                shadowColor: Colors.blueGrey,     // 그림자 색상
                elevation: 10,                    // 입체감
                side: BorderSide(
                    color:Colors.black12,           // 테두리 색상
                    style: BorderStyle.solid,       // 테두리 스타일
                    width: 2,                       // 테두리 두께
                    strokeAlign: StrokeAlign.inside //테두리 안쪽선
                )
              ),
              // 버튼 클릭 시 로그인화면으로 돌아가기
              onPressed: () async {
                var user = context.read<UserProvider>();
                if (user.isLogined) {
                  user.logoutKakao();
                  print('카카오계정로그아웃완료');
                }
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            const SizedBox(height: 5),
            // 사용자 로그인 정보 display
            Consumer<UserProvider>(builder: (context, user, child) =>
             Text('${user.userInfo.kakaoAccount?.profile?.nickname} Loggined',
               style: GoogleFonts.roboto(
                 fontSize: 20,                // 글자크기
                 fontStyle: FontStyle.italic, // 글자스타일
                 fontWeight: FontWeight.bold, // 글자굵기
                 color: Colors.black38)       // 글자색
              ),
             ),
            ], // children
          ),
      ),
    );
  }
}