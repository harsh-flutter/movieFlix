class Movies {
  int id;
  String poster_path;
  String title;
  final List<int> genreIds;
  DateTime release_date;
  final double popularity;
  final String overview;

  Movies(
      this.id, this.title, this.poster_path, this.genreIds, this.release_date,this.popularity,this.overview);

  factory Movies.fromJson(dynamic json) {
    return Movies(
      json['id'] as int,
      json['title'] as String,
      json['poster_path'] as String,
      List<int>.from(json["genre_ids"].map((x) => x)),
      DateTime.parse(json["release_date"]) as DateTime,
      json["popularity"].toDouble(),
      json["overview"] as String,
    );
  }

  @override
  String toString() {
    return '{ $id, $title, $poster_path,$genreIds, $release_date, $popularity, $overview,$genreIds}';
  }
}

