import 'package:cgv_clone/widgets/image_slider_widget.dart';
import 'package:cgv_clone/widgets/movie_chart_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      "홈",
      "이벤트",
      "무비톡",
      "패스트오더",
      "기프트샵",
      "@GCV",
    ];

    List<String> bannerUrlItems = [
      "assets/images/banner_01.jpg",
      "assets/images/banner_02.jpg",
      "assets/images/banner_03.jpg",
      "assets/images/banner_04.jpg",
    ];

    return DefaultTabController(
      // 탭바 컨트롤러 생성
      length: menuItems.length, // menuItems의 길이 만큼 만듭니다.
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "GCV", // 앱바의 타이틀을 만듭니다.
            style: TextStyle(
              fontSize: 26.0, // 글자 크기를 26px로 설정합니다.
              color: Colors.red, // 글자 색상을 빨간색으로 설정합니다.
              fontWeight: FontWeight.bold, // 글자 굵기를 '진하게'로 설정합니다.
            ),
          ),
          backgroundColor: Colors.white, // 앱바 배경을 흰색으로 만듭니다.
          actions: [
            // 앱바의 타이틀 외 다른 버튼 작성영역으로 부가적인 아이콘 목록을 만듭니다.
            IconButton(
              icon: const Icon(Icons.airplane_ticket_outlined),
              color: Colors.red,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.movie_outlined),
              color: Colors.red,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              color: Colors.red,
              child: TabBar(
                // 탭바 생성(탭바 아래에 각각의 Tab을 생성)
                tabs: List.generate(
                  menuItems.length,
                  (index) => Tab(
                    text: menuItems[index],
                  ),
                ),
                unselectedLabelColor:
                    Colors.white, // 선택되지 않은 탭의 색상을 흰색으로 설정합니다.
                labelColor: Colors.white, // 기본 라벨 색상을 흰색으로 설정합니다.
                indicatorColor: Colors.white, // 라벨 밑에 표시된 인디케이터 색상을 흰색으로 설정합니다.
                indicatorSize:
                    TabBarIndicatorSize.label, // 인디케이터 크기를 라벨크기로 만듭니다.
                isScrollable: true, // 메뉴가 스크롤 가능하도록 합니다.
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                // 이미지 슬라이드 위젯을 적용합니다.
                ImageSliderWidget(bannerUrlItems: bannerUrlItems),
                // 무비 차트 위젯을 적용합니다.
                MovieChartWidget(),
                Divider(thickness: 8.0),  // 영역을 구분합니다
                // 라벨 아이콘 영역을 작성합니다.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // 위젯 사이 간격을 일정하게 설정
                    children: [
                      buildLabelIcon(Icons.phone_android, "MY CGV"),
                      buildLabelIcon(Icons.photo, "포토플레이"),
                      buildLabelIcon(Icons.account_balance_wallet, "할인정보"),
                      buildLabelIcon(Icons.music_note, "CGV스토어"),
                    ],
                  ),
                ),
              ],
            ),
            // Center(
            //   child: Text("홈 화면 입니다."),
            // ),
            Center(
              child: Text("이벤트 화면 입니다."),
            ),
            Center(
              child: Text("무비톡 화면 입니다."),
            ),
            Center(
              child: Text("패스트오더 화면 입니다."),
            ),
            Center(
              child: Text("기프트샵 화면 입니다."),
            ),
            Center(
              child: Text("@GCV 화면 입니다."),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabelIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black12,
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 5.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
