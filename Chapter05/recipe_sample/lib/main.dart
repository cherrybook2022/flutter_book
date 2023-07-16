import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Padding titleSection = Padding( // 여백을 작성합니다.
      padding: const EdgeInsets.all(24.0),
      child: Column( // 위젯을 세로 방향으로 배치 합니다.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          const Text(
            '아스파라거스토마토구이 & 아스파라거스마늘볶음',
            style: TextStyle(
              fontWeight: FontWeight.bold, // 굵기를 ‘진하게’ 설정합니다.
              fontSize: 24,								 // 글자 크기를 24px로 설정합니다.
            ),
          ),
          // 소개
          Text(
            '맛남의광장에서 나온 아스파라거스요리!\n'
                '입에 감기는 맛이지만, 쉬운 요리법에\n'
                '술안주, 밥반찬으로 추천!',
            style: TextStyle(
              color: Colors.grey[800],	// 글자 색상을 회색으로 설정합니다.
              fontSize: 16,           // 글자 크기를 16px로 설정합니다.
            ),
          ),
        ],
      ),
    );

    Row iconSection = Row( // 아이콘, 텍스트 위젯을 가로로 배치합니다.
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 왼쪽 정렬
      children: [
        buildIconLabelRow(Icons.people, '4인분',Colors.grey),    // 조리량
        buildIconLabelRow(Icons.alarm, '15분이내',Colors.grey, ),  // 조리시간
        buildIconLabelRow(Icons.star, '아무나',Colors.grey),      // 난이도정보
     ],
    );

    Widget stepSection = Padding( // 여백을 작성합니다.
      padding: EdgeInsets.all(16.0),
      child: Column( // 위젯을 세로로 배치합니다.
        crossAxisAlignment: CrossAxisAlignment.start, // 가로 방향으로 왼쪽 정렬합니다.
        children:  [
          // 조리 순서 제목
          Text(
            '조리 순서',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // 조리 순번, 설명, 조리 과정의 이미지를 가로로 배치합니다.
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // 세로 방향의 위쪽에 정렬합니다.
            children: [
              // 조리 순서 번호
              Padding( // Text위젯에 여백을 줍니다.
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              // 조리 순서 설명
              SizedBox( // Text위젯에 크기를 지정해 줍니다.
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '[아스파라거스 토마토 구이] 아스파라거스는 4~5cm 길이로 자른다.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              // 조리 순서 이미지
              Image.asset(
                'assets/step01.jpg',
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.contain,
              ),
            ],
          ),
          buildIconLabelRow(
            Icons.lightbulb,
            '굵기가 얇은 아스파라거스를 사용해도 좋아요.',
            Colors.teal,
          ),
          buildIconLabelRow(
            Icons.shopping_cart,
            '라오메뜨 천연세라믹 양면도마',
            Colors.grey,
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Example'),
      ),
      body: ListView(
        children: [
          // 레시피 사진 영역
          Image.asset(
            'assets/image01.jpg',
          ),
          // 레시피 소개 영역
          titleSection,
          // 레시피 사진 영역
          iconSection,
          // 조리 순서 영역
          stepSection,
        ]
      ),
    );
  }

  Row buildIconLabelRow(IconData icon, String label, Color color,) {
    return Row( // 아이콘, 텍스트 위젯을 가로로 배치합니다.
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: color), // 아이콘을 작성합니다.
        Container(
          margin: const EdgeInsets.only(left: 8.0), // 왼쪽 여백을 줍니다.
          child: Text( // 텍스트를 작성합니다.
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
