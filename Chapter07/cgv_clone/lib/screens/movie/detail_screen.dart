// import 'package:cgv_clone/database_service.dart';
import 'package:cgv_clone/database_service.dart';
import 'package:cgv_clone/models/moives.dart';
import 'package:cgv_clone/screens/movie/review_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.thisMovie});

  final Movie thisMovie;

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          thisMovie.title,
          style: Theme.of(context).textTheme.titleLarge, // 텍스트 테마를 적용합니다.
        ),
        backgroundColor: Colors.white, // 앱바의 배경색을 흰색으로 설정합니다.
        iconTheme: IconThemeData(
          color: Colors.black87, // 앱바 아이콘의 색을 검정색으로 설정합니다.
        ),
      ),
      // body: Text("${thisMovie.title} 영화가 전달 됐습니다."),
      body: ListView(
        children: [
          // 영화 상세 정보 영역
          Stack(
            children: [
              // 배경 이미지
              Image.asset(
                thisMovie.imageUrl, // 이미지 파일 경로를 작성합니다.
                width: appSize.width, // 너비를 화면의 너비로 설정합니다.
                height: 300, // 높이를 300px로 설정합니다.
                fit: BoxFit.cover, // 이미지를 크기에 꽉 채웁니다
              ),
              // 배경 이미지를 어둡게 처리
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // 그라데이션을 적용합니다.
                    begin: Alignment.topCenter, // 위쪽 가운데에서 시작합니다.
                    end: Alignment.bottomCenter, // 아래쪽 가운데에서 종료합니다.`
                    colors: [
                      Colors.grey.withOpacity(0.4), // 시작 색상을 회색으로 설정합니다
                      Colors.black, // 종료 색상을 검정색으로 설정합니다.
                    ],
                  ),
                ),
              ),
              // 영화 포스터, 영화 제목 및 내용
              Positioned(
                // 위치를 설정합니다.
                left: 10.0,
                bottom: 14.0,
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // 수직 방향 아래에 배치합니다.
                  children: [
                    Image.asset(
                      thisMovie.imageUrl, // 이미지 경로입니다.
                      width: appSize.width * 0.25, // 너비를 화면 크기의 1/4 설정합니다.
                      fit: BoxFit.contain, // 포스터를 원본 비율로 설정합니다.
                    ),
                    Padding(
                      // 여백을 줍니다.
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // 수평 방향 좌측 정렬합니다.
                        children: [
                          // 영화 제목
                          Text(
                            thisMovie.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            thisMovie.subTitle, // 영화 부제목
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            thisMovie.runTime, // 영화 상영 시간
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 관람평 작성 화면 이동 버튼
          Padding(
            // 여백을 줍니다.
            padding: const EdgeInsets.all(4.0),
            child: OutlinedButton(
              child: Text(
                "실관람평 등록하기",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              style: OutlinedButton.styleFrom(
                // 스타일을 설정합니다.
                side: BorderSide(color: Colors.black87), // 테두리 색상을 검정색으로 설정합니다.
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // 테두리 모서리를 둥글게 만듭니다.
                ),
              ),
              // 관람평 작성 화면으로 이동
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReviewScreen(item: thisMovie)),
                );
              },
            ),
          ),
          // 데이터베이스를 불러와 나열합니다.
          // Stream<QuerySnapshot>을 사용하여 리뷰 목록을 만듭니다.
          StreamBuilder<QuerySnapshot>(
            stream: getReviews(thisMovie.title), // 객체를 설정합니다.
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return const Text('Loading...'); // 데이터가 없을 때 로딩 상태 표시
              return Column(
                // 수직으로 위젯을 배치합니다.
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  // return Text("${document['name']} : ${document['comment']}" );
                  return ListTile(
                    leading: CircleAvatar( // 아바타 로고를 만듭니다.
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.black),
                    ),
                    title: Column(
                      // 위젯을 수직으로 배치합니다.
                      crossAxisAlignment:
                      CrossAxisAlignment.start, // 수평 방향 좌측 정렬합니다.
                      children: [
                        Text(
                          document['evaluation'], // 평가 내용을 보여줍니다.
                          style: TextStyle(color: Colors.brown),
                        ),
                        Row(
                          children: [
                            Text(
                              document['name'], // 작성자 명을 보여줍니다.
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Spacer(),
                            Text(
                              (document["registration_date"])
                                  .toDate()
                                  .toString(), // 작성 날짜를 보여줍니다.
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text(document['comment']), // 리뷰 내용을 보여줍니다.
                  );
                }).toList(),
              );
            },
          ),

        ],
      ),
    );
  }
}
