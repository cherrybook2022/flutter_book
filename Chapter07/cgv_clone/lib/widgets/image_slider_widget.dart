import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    Key? key,
    required this.bannerUrlItems,
  }) : super(key: key);

  final List<String> bannerUrlItems;  // 이미지 경로가 담긴 리스트

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return CarouselSlider.builder(  // 이미지 슬라이드 위젯입니다.
      options: CarouselOptions(   // CarouselSlider 위젯에 설정 옵션을 줍니다.
        height: 160,          // CarouselSlider의 높이를 지정합니다.
        autoPlay: true,       // 자동 슬라이드 되게 합니다.
        viewportFraction: 1,  // 화면에 1개의 이미지가 보이게 합니다.
      ),
      itemCount: bannerUrlItems.length, // bannerUrlItems 길이 만큼 만듭니다.
      itemBuilder: (context, itemIndex, realIndex) {
        return Stack( // 슬라이드 이미지 위에 이미지 순번을 겹치게 배치합니다.
          children: [
            Image.asset(
              bannerUrlItems[itemIndex],// 이미지 파일 경로를 작성합니다.
              fit: BoxFit.cover,          // 이미지를 위젯의 크기에 맞춥니다.
              width: appSize.width,     // 너비를 화면의 너비로 설정합니다.
            ),
            Align(
              alignment: Alignment.bottomRight, // 순번을 하단 오른쪽에 정렬합니다.
              child: Container(
                color: Colors.black38,              // 배경색을 어둡게 적용합니다.
                padding: const EdgeInsets.all(4.0), // 여백을 줍니다.
                // 현재 순번을 보여줍니다. (현재 순번 / 이미지 경로 리스트 크기)
                child: Text(
                  (itemIndex + 1).toString() +
                      " / " +
                      bannerUrlItems.length.toString(),
                  style: TextStyle(color: Colors.white),  // 글자 색상을 '흰색'으로 설정합니다.
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
