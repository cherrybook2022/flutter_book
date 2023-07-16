import 'package:cgv_clone/models/moives.dart';
import 'package:cgv_clone/screens/movie/detail_screen.dart';
import 'package:flutter/material.dart';

class MovieChartWidget extends StatelessWidget {
  const MovieChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          // 제목 영역 입니다.
          Row(
            children: [
              Text(
                "무비차트", // 무비차트 제목을 작성합니다.
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(), // Text 위젯과 TextButton 위젯 사이를 띄워줍니다.
              TextButton(
                // 전체보기 버튼을 구성합니다.
                child: Row(
                  children: [
                    Text(
                      '전체보기', // 전체보기 텍스트를 나타냅니다.
                      style: TextStyle(color: Colors.grey), // 글자 색을 회색으로 설정합니다.
                    ),
                    Icon(
                      Icons.arrow_forward_ios, // 화살표 아이콘을 나타냅니다.
                      color: Colors.grey, // 아이콘 색을 회색으로 설정합니다.
                      size: 10.0, // 아이콘 크기를 10px로 설정합니다.
                    ),
                  ],
                ),
                onPressed: () {}, // 클릭했을 때 동작을 작성합니다.
              ),
            ],
          ),
          // 영화 포스터 영역입니다.
          Container(
            height: 280.0,
            child: ListView(
              scrollDirection: Axis.horizontal, // 스크롤 방향을 수평으로 설정합니다.
              children: List.generate(
                movieList.length, // movieList 길이만큼 리스트 생성
                (index) => GestureDetector(
                  // 제스처 위젯
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(thisMovie: movieList[index])),
                    );
                  },
                  child: buildRankPoster(movieList[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRankPoster(Movie movie) {
    return Padding(
      // 여백을 줍니다.
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // 위젯을 수직 방향으로 배치합니다.
        children: [
          // 1. 포스터 이미지
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                // 컨테이너에 그림자를 설정합니다.
                BoxShadow(
                  color: Colors.black38, // 그림자 색상을 설정합니다.
                  offset: Offset(5, 5), // 그림자 오프셋을 지정합니다.
                  blurRadius: 4.0, //그림자의 크기를 설정합니다.
                ),
              ],
            ),
            child: Stack(
              children: [
                // 영화 포스터 이미지
                ClipRRect(
                  // 이미지 테두리를 둥글게 만듭니다.
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    movie.imageUrl, // 영화 포스터 이미지
                    fit: BoxFit.contain,
                    width: 130.0,
                  ),
                ),
                // 영화의 순위
                Positioned(
                  // 하위 위젯의 위치를 설정합니다.
                  left: 2.0,
                  bottom: -8.0,
                  child: Text(
                    movie.rank.toString(), // 영화의 순위
                    style: TextStyle(
                      fontSize: 50.0, // 글자 크기를 50px로 설정합니다.
                      fontStyle: FontStyle.italic, // 글자 스타일을 '기울림'으로 설정합니다.
                      fontWeight: FontWeight.bold, // 글자 두께를 '두껍게' 설정합니다.
                      color: Colors.white,
                      shadows: [
                        // 글자에 그림자를 설정합니다.
                        Shadow(
                          color: Colors.black54, // 그림자 색상을 설정합니다.
                          offset: Offset(2, 2), // 그림자 오프셋을 지정합니다.
                          blurRadius: 4.0, //그림자의 크기를 설정합니다.
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0), // 위젯 사이 간격을 띄웁니다.
          // 2. 영화 제목
          Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.bold, // 글자 두께를 '굵게' 설정합니다.
            ),
          ),
          // 2. 영화 예매율
          Text(
            "현재 예매율 ${movie.rating}",
            style: TextStyle(
              color: Colors.grey, // 글자 색을 '회색'으로 설정합니다.
              fontSize: 10, // 글자 크기를 10px로 설정합니다.
            ),
          ),
        ],
      ),
    );
  }
}
