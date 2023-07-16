import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.bannerItemImgUrl,
  });
  final List<String> bannerItemImgUrl;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: bannerItemImgUrl.length, // bannerItemImgUrl의 길이만큼 생성합니다.
      options: CarouselOptions(
        viewportFraction: 1.0, // 화면에 1개의 이미지가 보이게 합니다.
      ),
      itemBuilder: (context, itemIndex, realIndex) {
        return Stack(
          // 이미지 위에 이미지 순서를 겹치게 배치합니다.
          children: [
            Image.asset(
                "${bannerItemImgUrl[itemIndex]}", // 이미지 경로를 작성합니다.
                fit: BoxFit.cover,
                width:
                MediaQuery.of(context).size.width, // 이미지 가로 길이를 앱사이즈로 설정합니다.
            ),
            Align(
              // 순서 표시한 위젯을 오른쪽 상단에 배치합니다.
              alignment: Alignment.topRight, // 오른쪽 상단에 배치합니다.
              child: Container(
                color: Colors.black38, // 배경을 회색으로 설정합니다.
                padding: const EdgeInsets.all(4.0), // 안쪽 여백을 줍니다.
                margin: EdgeInsets.all(16.0), // 바깥쪽 여백을 주어 이미지 안에 위치하게 합니다.
                child: Text(
                  // 현재 (이미지 인덱스 + 1 / 배너 아이템 이미지 길이) 순번을 작성합니다.
                  (itemIndex + 1).toString() +
                      " / " +
                      bannerItemImgUrl.length.toString(),
                  style: TextStyle(color: Colors.white), // 글자 색상을 흰색으로 설정합니다.
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}