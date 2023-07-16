class Park {
  final String parking_name;  //주차장명
  final String parking_code;  //주차장코드
  final double lat;           //주차장 위치 위도
  final double lng;           //주차장 위치 경도

  Park({required this.parking_name, required this.parking_code, required this.lat, required this.lng});

  /*
  * json 형식을 Park 오브젝트로 변환
  */
  Park.fromJson(Map<String, dynamic> json)
      : parking_name = json['PARKING_NAME'],
        parking_code = json['PARKING_CODE'],
        lat = json['LAT'],
        lng = json['LNG'];

  /*
  * Park 오브젝트를 json 형식으로 변환
  */
  Map<String, dynamic> toJson() =>
      {
        'PARKING_NAME': parking_name,
        'PARKING_CODE': parking_code,
        'LAT': lat,
        'LNG': lng
      };
}