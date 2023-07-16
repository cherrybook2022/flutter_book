import 'package:flutter/material.dart';
import 'package:twosome_example/models/coffee.dart';

class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({super.key, required this.item});

  final Coffee item; // 전달된 item 을 Coffee 형식으로 선언합니다.

  @override
  _MenuDetailScreenState createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  String? choice = 'hot';

  Widget build(BuildContext context) {
    Coffee thisCoffee = widget.item; // 전달받은 값을 thisCoffee 변수에 담아 사용합니다.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '커피&음료',
          style: TextStyle(color: Colors.black), // 글자 색상을 검은색으로 설정합니다.
        ),
        centerTitle: true, // 타이틀을 중앙에 배치합니다.
        backgroundColor: Colors.white, // 배경색을 흰색으로 설정합니다.
        leading: const BackButton(
          // 뒤로가기 버튼을 설정합니다.
          color: Colors.grey, // 아이콘 색상을 회색으로 설정합니다.
        ),
      ),
      body: ListView(
        // 스크롤 가능한 목록으로 만듭니다.
        children: [
          Padding(
            // 여백을 설정합니다.
            padding: const EdgeInsets.all(40.0),
            child: Column(
              // 위젯을 세로 방향으로 배치합니다.
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    choice == 'hot'
                        ? "${thisCoffee.imageUrl}"
                        : "${thisCoffee.imageUrl2}",
                  ),
                ),
                Text(
                  "${thisCoffee.title}", // thisCoffee의 title을 출력합니다.
                  style:
                  Theme.of(context).textTheme.titleLarge, // 글자 테마를 적용합니다.
                ),
                Text(
                  "${thisCoffee.price} 원", // thisCoffee의 금액을 출력합니다.
                  style:
                  Theme.of(context).textTheme.bodyMedium, // 글자 테마를 적용합니다.
                ),
              ],
            ),
          ),
          Divider(),
          // 옵션 선택 영역
          Column(
            // 수직방향으로 위젯을 배치합니다.
            crossAxisAlignment: CrossAxisAlignment.start, // 수평방향 기준으로 왼쪽 정렬합니다.
            children: [
              // 옵션 명
              Padding(
                // 여백을 설정합니다.
                padding: const EdgeInsets.only(left: 20.0), // 왼쪽 여백을 설정합니다.
                child: Text("온도",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium // 텍스트 테마를 적용합니다.
                ),
              ),
              // 옵션 선택 버튼
              Row(
                // 위젯을 수평 방향으로 배치합니다.
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // 하위 위젯간 여백을 동일하게 주어 정렬합니다.
                children: [
                  // '핫' 버튼
                  ChoiceChip(
                    padding: EdgeInsets.all(8.0), // 여백을 설정합니다.
                    label: SizedBox(
                      width: 140,
                      child: Text('핫',
                          textAlign: TextAlign.center), //  글자를 '중앙' 정렬합니다.
                    ),
                    selected: choice == 'hot', // choice 값이 'hot' 일 경우 선택 표시됩니다.
                    onSelected: (selected) {
                      setState(() {
                        choice = 'hot';
                      });
                    },
                    selectedColor: Colors.white, // 선택된 버튼 색을 흰색으로 설정합니다.
                    shape: RoundedRectangleBorder(
                      // 버튼 모양을 모서리가 둥근 직사각형으로 설정합니다.
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                          color: choice == 'hot'
                              ? Colors.black
                              : Colors.grey), // 선택된 옵셔
                    ),
                  ),
                  // '아이스' 버튼
                  ChoiceChip(
                    padding: EdgeInsets.all(8.0), // 여백을 설정합니다.
                    label: SizedBox(
                      width: 140,
                      child: Text('아이스',
                          textAlign: TextAlign.center), //  글자를 '중앙' 정렬합니다.
                    ),
                    selected: choice == 'ice', // choice 값이 'ice' 일 경우 선택 표시됩니다.
                    onSelected: (selected) {
                      setState(() {
                        choice = 'ice';
                      });
                    },
                    selectedColor: Colors.white, // 선택된 버튼 색을 흰색으로 설정합니다.
                    shape: RoundedRectangleBorder(
                      // 버튼 모양을 모서리가 둥근 직사각형으로 설정합니다.
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                          color: choice == 'ice' ? Colors.black : Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // 하단에 고정시킵니다.
        color: Colors.black87, // 색상을 검정색으로 설정합니다.
        child: Row(
          // 위젯을 수평방향으로 나열합니다.
          children: [
            Container(
              // 붉은색 포인트 박스를 만듭니다.
              width: 100,
              height: 60,
              color: Colors.red,
            ),
            Expanded(
              // 최대 너비를 사용하여 배치합니다.
              child: Padding(
                // 여백을 줍니다.
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "${thisCoffee.price}원",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            TextButton(
              // 텍스트 버튼을 만듭니다.
              child: Text(
                // 텍스트를 작성합니다.
                "주문하기",
                style: TextStyle(color: Colors.red, fontSize: 22),
              ),
              onPressed: () {
                // 버튼이 클릭됐을때 실행할 코드를 작성합니다.(다이얼로그를 띄웁니다)
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('${thisCoffee.title}'),
                      content: Text('${thisCoffee.price}원 입니다.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
