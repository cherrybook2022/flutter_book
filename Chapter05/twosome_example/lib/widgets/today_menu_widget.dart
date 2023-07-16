import 'package:flutter/material.dart';

class TodayMenuWidget extends StatelessWidget {
  const TodayMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> todayMenuImgUrl = [
      "assets/images/cake01.jpg",
      "assets/images/cake02.jpg",
      "assets/images/dessert01.jpg",
      "assets/images/dessert02.jpg",
      "assets/images/cake03.jpg",
    ];

    return Padding(
      // 여백을 설정합니다.
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // 위젯을 세로 방향으로 배치합니다.
        crossAxisAlignment: CrossAxisAlignment.start, // 가로 방향의 시작 부분에 정렬합니다.
        children: [
          Text(
            "투썸의 오늘 인기 메뉴",
            style: Theme.of(context).textTheme.titleLarge, // 텍스트 테마를 적용합니다.
          ),
          GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: todayMenuImgUrl.length, // todayMenuImgUrl 개수만큼 생성합니다.
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 그리드에 컬럼 개수를 3개로 설정합니다.
            ),
            itemBuilder: (context, index) {
              return Padding(
                // 여백을 설정합니다.
                padding: const EdgeInsets.all(8.0),
                child:
                    Image.asset("${todayMenuImgUrl[index]}"), // 이미지 경로를 작성합니다.
              );
            },
          ),
        ],
      ),
    );
  }
}
