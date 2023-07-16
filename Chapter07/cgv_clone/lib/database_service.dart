import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference reviewsCollection = firestore.collection('review');

void addReview(String movieTitle, String name, String comment, String evaluation) {
  reviewsCollection.add({
    'movie_title': movieTitle,  // 영화 제목을 저장합니다.
    'name': name,               // 리뷰 작성자 이름을 저장합니다.
    'comment': comment,         // 리뷰 내용을 저장합니다.
    'evaluation': evaluation,   // 평가 내용을 저장합니다 (GOOD! 또는 BAD.)
    'registration_date': DateTime.now(),  // 저장 시간을 현재 시간으로 설정합니다.
  }).then((value) => print('review added'));
}

Stream<QuerySnapshot> getReviews(String movieTitle) {
  return reviewsCollection.where("movie_title", isEqualTo: movieTitle).snapshots();
}