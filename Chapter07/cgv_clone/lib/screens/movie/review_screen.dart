import 'package:cgv_clone/database_service.dart';
import 'package:cgv_clone/models/moives.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key , required this.item});

  final Movie item;

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  List<String> choices = ["GOOD!", "BAD."];
  int choice_index = 1;
  TextEditingController reviewIdController = new TextEditingController();
  TextEditingController reviewTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Movie thisMovie = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "관람평 등록",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: ListView(
        children: [
          // 평가 버튼 영역
          Container(
            color: Colors.black12, // 어두운 배경 색을 설정합니다.
            padding: EdgeInsets.all(12.0), // 전체 여백을 줍니다.
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0), // 제목에 여백을 줍니다.
                  child: Text(
                    "이 영화 어땠나요?",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Row(
                  // 버튼을 가로로 나열합니다.
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // 하위 위젯의 간격을 일정하게 설정합니다.
                  children: List<Widget>.generate(
                    choices.length,
                        (index) {
                      // choices 길이 만큼 리스트를 만듭니다.
                      return ChoiceChip(
                        padding: EdgeInsets.all(10.0),
                        label: Text(
                          choices[index], // 버튼에 표시할 글자입니다.
                          style: TextStyle(
                            // 선택된 버튼의 색상을 설정합니다.
                              color: (choice_index == index)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20),
                        ),
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 50), // 라벨에 여백을 설정합니다.
                        selected: choice_index == index,
                        onSelected: (value) {
                          setState(() {
                            // 선택된 버튼의 인덱스를 저장합니다.
                            choice_index = index;
                          });
                        },
                        backgroundColor: Colors.white, // 버튼 배경색입니다.
                        selectedColor: Colors.red, // 선택된 버튼의 색상입니다.
                        shape: ContinuousRectangleBorder(
                          // 테두리를 둥글게 만듭니다.
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      );
                    },
                  ).toList(), // CoiceChip 위젯을 리스트로 만듭니다.
                ), // Row
              ],
            ), // Column
          ), // Container
          // 리뷰 작성 영역
          Padding( // 여백을 만듭니다.
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 수평 방향으로 좌측 정렬 합니다.
              children: [
                // 제목
                Text(
                  "나의 감상평",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20), // 위아래 위젯 간의 간격을 띄웁니다.
                TextField( // 작성자를 입력하는 위젯입니다.
                  controller: reviewIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '작성자',
                  ),
                ),
                SizedBox(height: 10), // 위아래 위젯 간의 간격을 띄웁니다.
                TextField( // 내용을 입력하는 위젯입니다.
                  minLines: 1, // 입력할 수 있는 최소 줄 길이를 지정합니다.
                  maxLines: 5, // 입력할 수 있는 최대 줄 길이를 지정합니다.
                  keyboardType: TextInputType.multiline, // 여러 줄 입력가능하게 합니다.
                  controller: reviewTextController,
                  decoration: InputDecoration( // TextField 스타일을 지정합니다.
                    border: OutlineInputBorder(), // 테두리를 만듭니다.
                    labelText: '내용', // 라벨 명을 작성합니다.
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight, // 하위 위젯을 오른쪽 정렬합니다.
                  child: TextButton( // '제출' 버튼을 만듭니다.
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red, // 버튼 배경을 빨간색으로 설정합니다.
                    ),
                    onPressed: () {
                      // 유효값 체크 로직 등을 작성합니다.
                      if (reviewIdController.text.isEmpty ||
                          reviewTextController.text.isEmpty) {
                        // 체크에 검출되었을 때 다이얼로그를 띄웁니다.
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Text('리뷰를 입력하세요.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Database에 저장해줍니다.
                        addReview(thisMovie.title, reviewIdController.text, reviewTextController.text, choices[choice_index]);
                        // 이전 화면으로 나갑니다.
                        Navigator.pop(context);
                      }
                    },

                    child: Text(
                      '제출',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
