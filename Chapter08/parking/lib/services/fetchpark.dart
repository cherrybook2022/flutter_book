import 'package:http/http.dart' as http;
import 'package:parking/models/park.dart';
import 'package:parking/key/key.dart';
import 'dart:convert';

Future<List<Park>> fetchPark() async{
  late List<Park> parkingList;
  //공영주차장정보
  String url = "http://openapi.seoul.go.kr:8088/"+apiKey+"/json/GetParkInfo/1/5/역삼";
  final response = await http.get(Uri.parse(url));
  final responseBody = response.body;

  //json.decode를 통해 json형식으로 변환하여 jsonMap 변수에 할당
  final jsonMap = json.decode(responseBody);

  //jsonMap에 GetParkingInfo 라는 키가 있을 경우 주차장 정보가 있음
  //주차장정보가 있는경우 List<Park> 형태로 List생성
  //주차장정보가 없는경우 empty List 생성
  parkingList = jsonMap.containsKey("GetParkInfo")
      ? (jsonMap['GetParkInfo']['row'] as List)
          .map((e) => Park.fromJson(e))
          .toList()
      : List.empty();

  if(response.statusCode == 200) {
    return parkingList;
  }else{
    throw Exception('Failed to load park info');
  }
}