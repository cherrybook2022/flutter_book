import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // 인덱스 변수를 선언합니다.
  int _selectedIndex = 0;

  // 하단 내비게이션이 선택되었을 때, 실제로 보여줄 Text위젯을 List로 작성합니다.
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      '0번째 : Home',
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
    ),
    Text(
      '1번째 : Search',
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
    ),
    Text(
      '2번째 : Profile',
      style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body:
      Center(
        // 선택된 인덱스에 해당하는 widgetOptions의 Text위젯을 화면에 보여줍니다.
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottomNavigationBar 영역을 작성합니다.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,  // 내비게이션바 아이템을 고정합니다
        selectedItemColor: Colors.yellowAccent, //선택된 아이템의 색상
        unselectedItemColor: Colors.grey[50], //선택 안된 아이템의 색상
        currentIndex: _selectedIndex,         //현재 선택된 Index

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            backgroundColor: Colors.deepPurple,
          ),
        ],
        onTap: (int index) { // 아이콘이 선택되었을 때 동작합니다.
          // 선택된 index를 변경해주는 setState()를 작성합니다.
          // statefulWidget으로 작성되어야 화면의 상태를 변경할 수 있습니다.
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

