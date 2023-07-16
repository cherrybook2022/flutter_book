import 'package:flutter/material.dart';
import 'package:twosome_example/screens/menu/coffee_menu_screen.dart';
import 'package:twosome_example/widgets/banner_widget.dart';
import 'package:twosome_example/widgets/today_menu_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. 메뉴 아이템 리스트 생성
    List<String> menuItems = [
      "New",
      "커피&음료",
      "아이스크림&빙수",
      "케이크",
    ];

    List<String> bannerItemImgUrl = [
      "assets/images/banner01.jpg",
      "assets/images/banner02.jpg",
    ];

    // 2. 탭바 컨트롤러 생성
    return DefaultTabController(
      initialIndex: 0, // 처음 실행 시 탭바 인덱스
      length: menuItems.length, // 탭바의 총 길이
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '메뉴',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true, // 타이틀 가운데 위치
          backgroundColor: Colors.white, // 앱바 바탕 색상
          leading: Icon(
            Icons.home,
            color: Colors.grey,
          ), // 앱바 홈 아이콘
          // 3. 탭바 생성
          bottom: TabBar(
            tabs: List.generate(
              menuItems.length,
              (index) => Tab(
                text: menuItems[index],
              ),
            ),
            unselectedLabelColor: Colors.black38, // 선택되지 않은 라벨 Color입니다.
            labelColor: Colors.black,             // 기본 라벨 Color입니다.
            indicatorColor: Colors.black,         // 라벨 아래에 인디케이터의 Color입니다.
            indicatorSize: TabBarIndicatorSize.label, // 인티케이터 사이즈를 라벨사이즈로 만듭니다.
            isScrollable: true, // 탭바가 스크롤이 가능하도록 합니다.
          ),
        ),
        // 4. 탭바 뷰 생성
        body: TabBarView(
          children: [
            ListView(
              children: [
                // 1. 배너 위젯 적용위치
                BannerWidget(bannerItemImgUrl: bannerItemImgUrl),
                // 2. 오늘의 메뉴 위젯 적용위치
                TodayMenuWidget(),
              ],
            ),
            CoffeeMenuScreen(),
            Center(
              child: Text("빙수&아이스크림 화면입니다."),
            ),
            Center(
              child: Text("케이크 화면입니다."),
            ),
          ],
        ),
      ),
    );
  }
}


// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // 1. 메뉴 아이템 리스트 생성
//     List<String> menuItems = [
//       "New",
//       "커피&음로",
//       "아이스크림&빙수",
//       "케이크",
//     ];
//
//     // 2. 탭바 컨트롤러 생성
//     return DefaultTabController(
//       length: menuItems.length,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("메뉴"),
//           // 3. 탭바 생성
//           bottom: TabBar(
//             tabs: List.generate(
//               menuItems.length,
//                   (index) => Tab(
//                 text: menuItems[index],
//               ),
//             ),
//             // indicatorWeight: 2,
//             // unselectedLabelColor: Colors.black38,
//             // labelColor: Colors.black,
//             // indicatorColor: Colors.black,
//             // indicatorSize: TabBarIndicatorSize.label,
//             // isScrollable: true,
//           ),
//         ),
//         // 4. 탭바 뷰 생성
//         body: TabBarView(
//           children: [
//             Center(
//               child: Text("New 화면입니다."),
//             ),
//             Center(
//               child: Text("커피&음료 화면입니다."),
//             ),
//             Center(
//               child: Text("빙수&아이스크림 화면입니다."),
//             ),
//             Center(
//               child: Text("케이크 화면입니다."),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
