import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:parking/repositories/dbhelper.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {

  // 구글맵 패키지 사용을 위한 컨트롤러 선언
  Completer<GoogleMapController> _controller = Completer();

  // 지도 클릭 시 표시할 장소에 대한 마커 목록
  final List<Marker> markers = [];

  //마커의 표시유무를 위한 토글스위치 용도 변수
  bool _isMarkerShow = false;

  // 마커가 추가될때 구글맵 위에 마커표시를 하기위해 setState를 통해 위젯을 다시 그려주는 메소드
  // Marker() 위젯은 google_maps_flutter 패키지에서 제공되는 위젯으로
  // position : LatLng 위젯을 사용해 위도,경도 정보를 전달한다.
  // markerId : marker의 id로 사용할 값을 전달한다.
  // infoWindow : 화면에 표시될 정보를 전달한다.
  addMarker(cordinate, marker_id, marker_name) {
    markers.add(Marker(
        position: cordinate,
        markerId: MarkerId(marker_id),
        infoWindow: InfoWindow(title: marker_name)));
  }

  //앱실행시 초기위치
  final CameraPosition position = CameraPosition(
    target: LatLng(37.500784, 127.0368148), //역삼역
    zoom: 15, //숫자가 작을수록 넓은 면적이 조회됨
  );

  //db에서 조회해와서 마킹추가
  void _add_marker() {
    setState(() {
      //_isMarkerShow 토글 스위치를 반대로 만들어준다.
      _isMarkerShow = !_isMarkerShow;
      DBHelper dbHelper = DBHelper();
      dbHelper.parks().then((value) => value.forEach((element) {
        //로그 확인을 위한 콘솔 출력
        //print('parking_code: ${element.parking_code}, parking_name: ${element.parking_name}');
        //addMarker를 호출하여 마커를 표시한다.
        addMarker(LatLng(element.lat, element.lng), element.parking_code,element.parking_name);
      }));
    });
  }

  //지도에 표시된 마커 지우기
  void _remove_marker(){
    setState(() {
      //_isMarkerShow 토글 스위치를 반대로 만들어준다.
      _isMarkerShow = !_isMarkerShow;
      //markers 리스트를 초기화 하여 마커 정보를 삭제한다.
      markers.clear();
    });
  }

  void _moveToCurrentLocation() async{
    final GoogleMapController controller = await _controller.future;
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.low, forceAndroidLocationManager: true);
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          bearing: 0,
          target: LatLng(position.latitude, position.longitude),
          zoom: 17
      ),
    ));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: position,
            markers: markers.toSet(),
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 60, right: 10),
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton.extended(
                  label: Text('주차장위치'),
                  icon: Icon(Icons.local_parking),
                  backgroundColor: Colors.deepPurpleAccent[400],
                  //_isMarkerShow 에 의해 마커표시를 할지 삭제를 할지 체크한다
                  onPressed: _isMarkerShow ? _remove_marker : _add_marker,
                ),
                SizedBox(height: 10),
                FloatingActionButton.extended(
                  label: Text('현재위치'),
                  icon: Icon(Icons.gps_fixed),
                  backgroundColor: Colors.green[400],
                  onPressed: (){
                    _moveToCurrentLocation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
