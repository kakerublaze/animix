import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/core/utils/extensions.dart';
import 'package:anidex/app/core/utils/service_configuration.dart';
import 'package:anidex/app/modules/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return Obx(() {
      return Container(
        decoration: BoxDecoration(color: AppColors.appDarkModeBaseColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (controller.sliderDataList.isNotEmpty)
              CarouselSlider.builder(
                itemCount: controller.sliderDataList.length,
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                itemBuilder: (context, index, realIndex) {
                  var carousleData = controller.sliderDataList[index];
                  return Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Image.network(
                      carousleData.image ?? '',
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            30.heightBox,
            // Popular Movies
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Movies',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularMoviesList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.popularMoviesList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Popular TV Shows
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular TV Shows',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularTVShowsList.length,
                itemBuilder: (context, index) {
                  var tvShowsData = controller.popularTVShowsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (tvShowsData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Popular Celebrities
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Celebrities',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularCelebsList.length,
                itemBuilder: (context, index) {
                  var celebsData = controller.popularCelebsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (celebsData.profilePath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Trending Movies
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trending Movies',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.trendingMoviesList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.trendingMoviesList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Trending TV Shows
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trending TV Shows',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.trendingTVShowsList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.trendingTVShowsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Trending Celebrities
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trending Celebrities',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.trendingCelebsList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.trendingCelebsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.profilePath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Top-Rated Movies
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Top-Rated Movies',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.topRatedMoviesList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.topRatedMoviesList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Top-Rated TV Shows
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Top-Rated TV Shows',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.topRatedTVShowsList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.topRatedTVShowsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ServiceConfiguration.imageBaseUrl +
                            (movieData.posterPath ?? ''),
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Trending Animes
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Trending Animes',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.trendingAnimeDataList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.trendingAnimeDataList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movieData.image ?? '',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Popular Anime
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular Animes',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularAnimeDataList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.popularAnimeDataList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movieData.image ?? '',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            // AV Videos
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Popular AV\'s',
                  style: TextStyle(
                    color: AppColors.appDarkBasedTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.seeAllTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).paddingOnly(left: 15, right: 15),
            SizedBox(
              height: 310,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 20, bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: controller.avVidsList.length,
                itemBuilder: (context, index) {
                  var movieData = controller.avVidsList[index];
                  return Container(
                    width: 200,
                    height: 250,
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 20 : 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        movieData.defaultThumb?.src ?? '',
                        width: 200,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
