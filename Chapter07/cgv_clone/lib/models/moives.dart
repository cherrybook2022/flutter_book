class Movie {
  final int rank;
  final String rating;
  final String title;
  final String subTitle;
  final String imageUrl;
  final String runTime;

  Movie({
    required this.rank,
    required this.rating,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.runTime,
  });
}

List<Movie> movieList = [
  Movie(
    rank: 1,
    rating: "59.5%",
    title: "공조2-인터내셔날",
    subTitle: "공조 이즈 백!",
    imageUrl: "assets/images/poster_01.jpg",
    runTime: "2시간 9분",
  ),
  Movie(
    rank: 2,
    rating: "8.7%",
    title: "알라딘",
    subTitle: "신비의 아그라바 왕국의 시대.",
    imageUrl: "assets/images/poster_02.jpg",
    runTime: "2시간 8분",
  ),
  Movie(
    rank: 3,
    rating: "7.8%",
    title: "육사오",
    subTitle: "남북 군인들간의 코믹 접선극",
    imageUrl: "assets/images/poster_03.jpg",
    runTime: "1시간 53분",
  ),
  Movie(
    rank: 4,
    rating: "5.2%",
    title: "탑건-매버릭",
    subTitle: "가장 압도적인 비행이 시작된다!",
    imageUrl: "assets/images/poster_04.jpg",
    runTime: "2시간 10분",
  ),
];
