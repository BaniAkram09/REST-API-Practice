class Result {
  String id = "";
  // String image = "";
  String title = "";
  String description = "";
  // String runtimeStr = "";
  // String genres = "";
  // List<String> genreList = ["key", "value"];
  // String contentRating = "";
  // String imDbRating = "";
  // String imDbRatingVotes = "";
  // String metacriticRating = "";
  // String plot = "";
  // String stars = "";
  // List<String> starList = ["id", "name"];

  Result({
    this.id = "",
    this.title = '',
    // this.image = "",
    this.description = "",
    // this.runtimeStr = "",
    // this.genres = "",
    // this.genreList = ["key", "value"],
    // this.contentRating = "",
    // this.imDbRating = "",
    // this.imDbRatingVotes = "",
    // this.metacriticRating = "",
    // this.plot = "",
    // this.stars = "",å
    // this.starList = ["id", "name"]
  });

  toJSON() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

  Result.fromJSON(Map map) {
    id = map['id'] ?? '';
    title = map['title'];
    description = map['description'];
  }
}
