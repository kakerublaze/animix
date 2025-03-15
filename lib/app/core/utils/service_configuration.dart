import 'package:anidex/app/core/utils/exports.dart';

class ServiceConfiguration {
  // --> Base URL
  static String baseUrl = dotenv.env['baseUrl'] ?? '';
  static String moviesBaseUrl = dotenv.env['movieUrl'] ?? '';
  static String imageBaseUrl = dotenv.env['imageUrl'] ?? '';
  // --> Airing Schedule API's
  static const String getAiringAnimeSchedule = 'meta/anilist/airing-schedule';
  // --> Recent Anime Episode API's
  static const String getAnimeRecentEpisodes = 'meta/anilist/recent-episodes';
  // --> Anime Details Data API's
  static const String getAnimeDetails = 'meta/anilist/info';
  // --> Anime Streaming Data API's
  static const String getAnimeStreaming = 'meta/anilist/watch';
  // --> Anime Streaming Data API's
  static const String getSearchedAnime = 'meta/anilist/advanced-search';
  // --> News API's Data
  static const String getLatestNews = 'news/ann/recent-feeds';
  // --> News Details API's Data
  static const String getLatestNewsData = 'news/ann/info';
  // --> TMDB Stream
  static const String getMovieStreaming = 'meta/tmdb/watch';
  // --> TMDB Info
  static const String getMovieDetails = 'meta/tmdb/info';
  // --> TMDB Search
  static const String getSearchedMovie = 'meta/tmdb';
  // --> Asian TV Data Info
  static const String getAsianDramaInfo = 'movies/dramacool/info';
  // --> Asain TV Stream
  static const String getAsianDramaStream = 'movies/dramacool/watch';
  // --> Asain TV Search
  static const String getSearchedAsianDrama = 'movies/dramacool';
  //--> Home Page API's
  static const String getSliderData = 'meta/tmdb/trending'; // Get Slider's Data
  // --> Popular Movies
  static const String getPopularMoviesList = '3/movie/popular';
  // --> Popular Celebs
  static const String getPopularCelebsList = '3/person/popular';
  // --> Top Rated Movies
  static const String getTopRatedMoviesList = '3/movie/top_rated';
  // --> Upcoming Movies
  static const String getUpcomingMoviesList = '3/movie/upcoming';
  // --> Movies Details
  static const String getMoviesDetails = '3/movie';
  // --> Trending Movies
  static const String getTrendingMoviesList =
      '3/trending/movie/day'; //{time_window} day/ week
  // --> Trending Celebs
  static const String getTrendingCelebsList =
      '3/trending/person/day'; //{time_window}' day/ week
  // --> Trending Series
  static const String getTrendingTVShowsList =
      '3/trending/tv/day'; //{time_window}' day/ week
  // --> Trending Movies Weekly
  static const String getTrendingMoviesListWeekly =
      '3/trending/movie/week'; //{time_window} day/ week
  // --> Trending Celebs Weekly
  static const String getTrendingCelebsListWeekly =
      '3/trending/person/weekly'; //{time_window}' day/ week
  // --> Trending Series Weekly
  static const String getTrendingTVShowsListWeekly =
      '3/trending/tv/week'; //{time_window}' day/ week
  
  // --> Popular Series
  static const String getPopularTVShowsList = '3/tv/popular';
  // --> Top Rated Series
  static const String getTopRatedTVShowsList = '3/tv/top_rated';
}
