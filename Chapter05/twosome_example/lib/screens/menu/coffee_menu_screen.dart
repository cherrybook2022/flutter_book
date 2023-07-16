import 'package:flutter/material.dart';
import 'package:twosome_example/models/coffee.dart';
import 'package:twosome_example/screens/menu/menu_detail_screen.dart';

class CoffeeMenuScreen extends StatelessWidget {
  const CoffeeMenuScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        // coffees 길이만큼 리스트를 만듭니다.
        coffees.length,
        (index) => Container(
          height: 150.0,
          // 리스트뷰의 아이템 클릭 시
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MenuDetailScreen(item: coffees[index]),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                // 위젯을 수평 방향으로 배치합니다.
                children: [
                  // 메뉴 이미지
                  Image.asset("${coffees[index].imageUrl}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // 수직 방향으로 중앙 정렬
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // 가로 방향으로 왼쪽 맞춤 정렬
                      children: [
                        // 메뉴명
                        Text(
                          "${coffees[index].title}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        // 금액
                        Text(
                          "${coffees[index].price}원",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
