import 'dart:convert';

import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/data/models/get_popular_anime_response_model.dart';
import 'package:anidex/app/data/models/get_popular_av_vids_response_model.dart';
import 'package:anidex/app/data/models/get_popular_celebs_response_model.dart';
import 'package:anidex/app/data/models/get_popular_movies_response_model.dart';
import 'package:anidex/app/data/models/get_popular_tv_shows_response_model.dart';
import 'package:anidex/app/data/models/get_slider_data_response_model.dart';
import 'package:anidex/app/data/models/get_top_rated_movies_response_model.dart';
import 'package:anidex/app/data/models/get_top_rated_tv_shows_response_model.dart';
import 'package:anidex/app/data/models/get_trending_anime_response_model.dart';
import 'package:anidex/app/data/models/get_trending_celebs_response_model.dart';
import 'package:anidex/app/data/models/get_trending_movies_response_model.dart';
import 'package:anidex/app/data/models/get_trending_tv_shows_response_model.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends GetxController {
  RestServices restServices = RestServices();
  Rx<GetSliderDataResponseModel> sliderDataResponseModel =
      GetSliderDataResponseModel().obs;
  // Popular Response Models
  Rx<GetPopularTVShowsResponseModel> getPopularTVShowsResponseModel =
      GetPopularTVShowsResponseModel().obs;
  Rx<GetPopularMoviesResponseModel> getPopularMoviesResponseModel =
      GetPopularMoviesResponseModel().obs;
  Rx<GetPopularCelebsResponseModel> getPopularCelebsResponseModel =
      GetPopularCelebsResponseModel().obs;
  // Trending Response Models
  Rx<GetTrendingMoviesResponseModel> getTrendingMoviesResponseModel =
      GetTrendingMoviesResponseModel().obs;
  Rx<GetTrendingTVShowsResponseModel> getTrendingTVShowsResponseModel =
      GetTrendingTVShowsResponseModel().obs;
  Rx<GetTrendingCelebsResponseModel> getTrendingCelebsResponseModel =
      GetTrendingCelebsResponseModel().obs;
  // Top Rated Response Models
  Rx<GetTopRatedMoviesResponseModel> getTopRatedMoviesResponseModel =
      GetTopRatedMoviesResponseModel().obs;
  Rx<GetTopRatedTVShowsResponseModel> getTopRatedTVShowsResponseModel =
      GetTopRatedTVShowsResponseModel().obs;

  // Anime
  Rx<GetPopularAnimeResponseModel> getPopularAnimeResponseModel =
      GetPopularAnimeResponseModel().obs;
  Rx<GetTrendingAnimeResponseModel> getTrendingAnimeResponseModel =
      GetTrendingAnimeResponseModel().obs;

  // AV Videos
  Rx<GetPopularAVVidsResponseModel> getPopularAVVidsResponseModel =
      GetPopularAVVidsResponseModel().obs;

  RxList<SliderData> sliderDataList = <SliderData>[].obs;
  // Popular List
  RxList<PopularMovies> popularMoviesList = <PopularMovies>[].obs;
  RxList<PopularTVShows> popularTVShowsList = <PopularTVShows>[].obs;
  RxList<PopularCelebs> popularCelebsList = <PopularCelebs>[].obs;
  // Trending List
  RxList<TrendingTVShows> trendingTVShowsList = <TrendingTVShows>[].obs;
  RxList<TrendingMovie> trendingMoviesList = <TrendingMovie>[].obs;
  RxList<TrendingCelebs> trendingCelebsList = <TrendingCelebs>[].obs;
  // Top Rated List
  RxList<TopRatedMovies> topRatedMoviesList = <TopRatedMovies>[].obs;
  RxList<TopRatedTVShows> topRatedTVShowsList = <TopRatedTVShows>[].obs;
  // Anime List
  RxList<PopularAnimeData> popularAnimeDataList = <PopularAnimeData>[].obs;
  RxList<TrendingAnime> trendingAnimeDataList = <TrendingAnime>[].obs;
  // AV Vids List
  // RxList<AVVids> avVidsList = <AVVids>[].obs;

  Rx<int> currentIndex = 0.obs;
  @override
  Future<void> onInit() async {
    sliderDataList.value = [];
    await getSliderData();
    await getPopularMovies();
    await getPopularTVShows();
    await getPopularCelebs();
    await getTrendingMovies();
    await getTrendingTVShows();
    await getTrendingCelebs();
    await getTopRatedMovies();
    await getTopRatedTVShows();
    await getPopularAnimes();
    await getTrendingAnimes();
    // await getPopularAV();
    super.onInit();
  }

  // Get Slider Data
  Future<void> getSliderData() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getSliderData,
          method: Method.get,
          token: apiToken,
        )
        .then((response) {
          if (response != '') {
            sliderDataResponseModel.value = GetSliderDataResponseModel.fromJson(
              json.decode(response),
            );
            sliderDataList.addAll(
              sliderDataResponseModel.value.trendingMovies ?? [],
            );
          }
        });
  }

  // Get Popular Movies
  Future<void> getPopularMovies() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getPopularMoviesList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getPopularMoviesResponseModel.value =
                GetPopularMoviesResponseModel.fromJson(json.decode(response));
            popularMoviesList.addAll(
              getPopularMoviesResponseModel.value.popularMovies ?? [],
            );
          }
        });
  }

  // Get Popular TV Shows
  Future<void> getPopularTVShows() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getPopularTVShowsList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getPopularTVShowsResponseModel.value =
                GetPopularTVShowsResponseModel.fromJson(json.decode(response));
            popularTVShowsList.addAll(
              getPopularTVShowsResponseModel.value.popularTVShows ?? [],
            );
          }
        });
  }

  // Get Popular Celebs
  Future<void> getPopularCelebs() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getPopularCelebsList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getPopularCelebsResponseModel.value =
                GetPopularCelebsResponseModel.fromJson(json.decode(response));
            popularCelebsList.addAll(
              getPopularCelebsResponseModel.value.popularCelebs ?? [],
            );
          }
        });
  }

  // Get Trending Celebs
  Future<void> getTrendingCelebs() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTrendingCelebsList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getTrendingCelebsResponseModel.value =
                GetTrendingCelebsResponseModel.fromJson(json.decode(response));
            trendingCelebsList.addAll(
              getTrendingCelebsResponseModel.value.trendingCelebs ?? [],
            );
          }
        });
  }

  // Get Trending Movies
  Future<void> getTrendingMovies() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTrendingMoviesList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getTrendingMoviesResponseModel.value =
                GetTrendingMoviesResponseModel.fromJson(json.decode(response));
            trendingMoviesList.addAll(
              getTrendingMoviesResponseModel.value.trendingMovies ?? [],
            );
          }
        });
  }

  // Get Trending TV Shows
  Future<void> getTrendingTVShows() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTrendingTVShowsList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getTrendingTVShowsResponseModel.value =
                GetTrendingTVShowsResponseModel.fromJson(json.decode(response));
            trendingTVShowsList.addAll(
              getTrendingTVShowsResponseModel.value.trendingTVShows ?? [],
            );
          }
        });
  }

  // Get Top Rated TV Shows
  Future<void> getTopRatedTVShows() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTopRatedTVShowsList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getTopRatedTVShowsResponseModel.value =
                GetTopRatedTVShowsResponseModel.fromJson(json.decode(response));
            topRatedTVShowsList.addAll(
              getTopRatedTVShowsResponseModel.value.topRatedTVShows ?? [],
            );
          }
        });
  }

  // Get Top Rated Movies
  Future<void> getTopRatedMovies() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTopRatedMoviesList,
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getTopRatedMoviesResponseModel.value =
                GetTopRatedMoviesResponseModel.fromJson(json.decode(response));
            topRatedMoviesList.addAll(
              getTopRatedMoviesResponseModel.value.topRatedMovies ?? [],
            );
          }
        });
  }

  // Get Popular Animes
  Future<void> getPopularAnimes() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getPopularAnime,
          method: Method.get,
          token: apiToken,
        )
        .then((response) {
          if (response != '') {
            getPopularAnimeResponseModel.value =
                GetPopularAnimeResponseModel.fromJson(json.decode(response));
            popularAnimeDataList.addAll(
              getPopularAnimeResponseModel.value.popularAnimeDataList ?? [],
            );
          }
        });
  }

  // Get Trending Animes
  Future<void> getTrendingAnimes() async {
    await restServices
        .getResponse(
          uri: ServiceConfiguration.getTrendingAnime,
          method: Method.get,
          token: apiToken,
        )
        .then((response) {
          if (response != '') {
            getTrendingAnimeResponseModel.value =
                GetTrendingAnimeResponseModel.fromJson(json.decode(response));
            trendingAnimeDataList.addAll(
              getTrendingAnimeResponseModel.value.trendingAnimes ?? [],
            );
          }
        });
  }

  // Get Popular AV's
  // Future<void> getPopularAV() async {
  //   await restServices
  //       .getResponse(
  //         isAV: true,
  //         uri: ServiceConfiguration.searchAVVideos,
  //         method: Method.get,
  //         queryParameters: {
  //           'query': 'all',
  //           'order': 'most-popular',
  //           'page': 1,
  //           'per_page': 20,
  //           'thumbsize': 'big',
  //           'gay': 0,
  //           'lq': 1,
  //           'format': 'json',
  //         },
  //         // token: apiToken,
  //       )
  //       .then((response) {
  //         if (response != '') {
  //           getPopularAVVidsResponseModel.value =
  //               GetPopularAVVidsResponseModel.fromJson(json.decode(response));
  //           avVidsList.addAll(getPopularAVVidsResponseModel.value.avVids ?? []);
  //         }
  //       });
  // }

  /// Function to Show Shimmer Effect
  Widget buildImageWithShimmer(String? imageUrl) {
    return imageUrl != null && imageUrl.isNotEmpty
        ? Image.network(
          imageUrl,
          width: Get.width,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey[900]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                width: Get.width,
                height: Get.height * 0.5,
                color: Colors.grey,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
            );
          },
        )
        : Shimmer.fromColors(
          baseColor: Colors.grey[900]!,
          highlightColor: Colors.grey[600]!,
          child: Container(
            width: Get.width,
            height: Get.height * 0.5,
            color: Colors.grey,
          ),
        );
  }
}
