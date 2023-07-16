import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class UserProvider extends ChangeNotifier {

  late User _userInfo;              // 로그인 정보 : Private 상태 데이터로 선언
  bool _loginStat = false;          // 로그인 상태 : Private 상태 데이터

  User get userInfo => _userInfo;    // 전역변수 userInfo : _userInfo를 get
  bool get isLogined => _loginStat;  // 전역변수 isLogined : _loginStat를 get

  // set loginStat (bool loginStatus) {
  //   _loginStat = loginStatus;
  //
  //   notifyListeners();
  // }
  // 카카오계정으로 로그인
  Future<void> loginKakao() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('[user.dart]loginKakao 카카오계정으로 로그인 성공 ${token.accessToken}');

      _loginStat = true;    // 카카오계정으로 로그인성공 시 로그인상태를 true로 변경
      getUserInfo();        // 사용자정보 가져오기

      print('[user.dart]_loginStat = ${_loginStat}');
    } catch (error) {

      _loginStat = false;   // 카카오계정으로 로그인실패 시 로그인상태를 false로 변경

      print('카카오계정으로 로그인 실패 $error');
    }

    notifyListeners();
  }
  // 카카오톡으로 로그인
  Future<void> loginTalk() async {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('[user.dart]카카오톡으로 로그인 성공');

      getUserInfo();
      _loginStat = true;

    } catch (error) {

      print('[user.dart]카카오톡으로 로그인 실패 $error');
      _loginStat = false;
    }
    notifyListeners();
  }

  // 카카오로그인 토큰 존재여부 체크
  Future<void> loginCheck() async {
    if (!_loginStat) {
      return;
    }

    if (await AuthApi.instance.hasToken()) {
      try {
        // 토큰 유효성 체크
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        _loginStat = true;    // 토큰유효성성공 시 로그인상태를 true로 변경

      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }
        _loginStat = false;   // 토큰정보조회가 실패된 경우 로그인상태를 false로 변경
      }
    } else {
      print('발급된 토큰 없음');
      _loginStat = false;    // 발급된 토큰이 없으므로 로그인상태를 false로 변경
    }

    notifyListeners();
  }

  // 사용자 정보 가져오기
  Future<void> getUserInfo() async {
    try {
      _userInfo = await UserApi.instance.me();
      print('[user.dart] 사용자 정보 요청 성공'
          '\n회원번호: ${_userInfo.id}'
          '\n닉네임: ${_userInfo.kakaoAccount?.profile?.nickname}'
          '\n네임: ${_userInfo.kakaoAccount?.name}'
          '\n이메일: ${_userInfo.kakaoAccount?.email.toString()}');

    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
    notifyListeners();
  }


  // 카카오 로그아웃
  Future<void> logoutKakao() async  {
    try {
      await UserApi.instance.logout();     // 로그아웃
      print('로그아웃 성공, SDK에서 토큰 삭제');

      _loginStat = false;                  // 로그인상태를 false로 변경

    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
    notifyListeners();
  }
}
