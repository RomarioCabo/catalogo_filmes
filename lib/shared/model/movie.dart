import 'package:filmcatalog/shared/model/rating.dart';

class Movie {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Rating>? ratings;
  String? metaScore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  Movie({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metaScore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    title = json.containsKey('Title') && json['Title'] != null
        ? json['Title']
        : null;
    year =
        json.containsKey('Year') && json['Year'] != null ? json['Year'] : null;
    rated = json.containsKey('Rated') && json['Rated'] != null
        ? json['Rated']
        : null;
    released = json.containsKey('Released') && json['Released'] != null
        ? json['Released']
        : null;
    runtime = json.containsKey('Runtime') && json['Runtime'] != null
        ? json['Runtime']
        : null;
    genre = json.containsKey('Genre') && json['Genre'] != null
        ? json['Genre']
        : null;
    director = json.containsKey('Director') && json['Director'] != null
        ? json['Director']
        : null;
    writer = json.containsKey('Writer') && json['Writer'] != null
        ? json['Writer']
        : null;
    actors = json.containsKey('Actors') && json['Actors'] != null
        ? json['Actors']
        : null;
    plot =
        json.containsKey('Plot') && json['Plot'] != null ? json['Plot'] : null;
    language = json.containsKey('Language') && json['Language'] != null
        ? json['Language']
        : null;
    country = json.containsKey('Country') && json['Country'] != null
        ? json['Country']
        : null;
    awards = json.containsKey('Awards') && json['Awards'] != null
        ? json['Awards']
        : null;
    poster = json.containsKey('Poster') && json['Poster'] != null
        ? json['Poster']
        : null;
    if (json.containsKey('Ratings') && json['Ratings'] != null) {
      ratings = <Rating>[];
      json['Ratings'].forEach((v) {
        ratings!.add(Rating.fromJson(v));
      });
    }
    metaScore = json.containsKey('Metascore') && json['Metascore'] != null
        ? json['Metascore']
        : null;
    imdbRating = json.containsKey('imdbRating') && json['imdbRating'] != null
        ? json['imdbRating']
        : null;
    imdbVotes = json.containsKey('imdbVotes') && json['imdbVotes'] != null
        ? json['imdbVotes']
        : null;
    imdbID = json.containsKey('imdbID') && json['imdbID'] != null
        ? json['imdbID']
        : null;
    type =
        json.containsKey('Type') && json['Type'] != null ? json['Type'] : null;
    dvd = json.containsKey('DVD') && json['DVD'] != null ? json['DVD'] : null;
    boxOffice = json.containsKey('BoxOffice') && json['BoxOffice'] != null
        ? json['BoxOffice']
        : null;
    production = json.containsKey('Production') && json['Production'] != null
        ? json['Production']
        : null;
    website = json.containsKey('Website') && json['Website'] != null
        ? json['Website']
        : null;
    response = json.containsKey('Response') && json['Response'] != null
        ? json['Response']
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Country'] = country;
    data['Awards'] = awards;
    data['Poster'] = poster;
    if (ratings != null) {
      data['Ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['Metascore'] = metaScore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['DVD'] = dvd;
    data['BoxOffice'] = boxOffice;
    data['Production'] = production;
    data['Website'] = website;
    data['Response'] = response;
    return data;
  }
}
