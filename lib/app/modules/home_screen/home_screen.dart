import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:anidex/app/core/constants/asset_paths.dart';
import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/core/utils/extensions.dart';
import 'package:anidex/app/modules/home_screen/home_screen_controller.dart';
import 'package:anidex/app/routes/app_pages.dart';
import 'package:anidex/app/widgets/home_page_cards_widget.dart';
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
              Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount:
                        controller.sliderDataList.length > 8
                            ? 8
                            : controller.sliderDataList.length,
                    options: CarouselOptions(
                      height: Get.height * 0.5,
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      var carouselData = controller.sliderDataList[index];

                      return Stack(
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: ClipRRect(
                              child: controller.buildImageWithShimmer(
                                carouselData.image,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        carouselData.title ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(2, 2),
                                              blurRadius: 10,
                                              color: Colors.black87,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        carouselData.type ?? '',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 110,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.play_circle_fill,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      5.widthBox,
                                                      Text(
                                                        'Play',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                10.widthBox,
                                                Container(
                                                  width: 110,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      5.widthBox,
                                                      Text(
                                                        'My List',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(
                                            () => Row(
                                              children: List.generate(
                                                controller
                                                            .sliderDataList
                                                            .length >
                                                        8
                                                    ? 8
                                                    : controller
                                                        .sliderDataList
                                                        .length,
                                                (index) => AnimatedContainer(
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 3,
                                                      ),
                                                  width:
                                                      controller
                                                                  .currentIndex
                                                                  .value ==
                                                              index
                                                          ? 26
                                                          : 6,
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          3,
                                                        ),
                                                    color:
                                                        controller
                                                                    .currentIndex
                                                                    .value ==
                                                                index
                                                            ? Colors.blue
                                                            : Colors.white54,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: Get.mediaQuery.padding.top + 10,
                    left: 20,
                    child: Image.asset(
                      AssetPaths.appIcon,
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            30.heightBox,
            // Popular Movies
            MediaCardsListWidget(
              title: 'Popular Movies',
              itemList: controller.popularMoviesList,
              navigationPath: Routes.mainScreen,
              contentType: 'movies',
            ),
            30.heightBox,
            // Popular TV Shows
            MediaCardsListWidget(
              title: 'Popular TV Shows',
              itemList: controller.popularTVShowsList,
              navigationPath: Routes.mainScreen,
              contentType: 'tvShows',
            ),
            // Popular Celebrities
            30.heightBox,
            MediaCardsListWidget(
              title: 'Popular Celebrities',
              itemList: controller.popularCelebsList,
              navigationPath: Routes.mainScreen,
              contentType: 'celebs',
            ),
            // Trending Movies
            30.heightBox,
            MediaCardsListWidget(
              title: 'Trending Movies',
              itemList: controller.trendingMoviesList,
              navigationPath: Routes.mainScreen,
              contentType: 'movies',
            ),
            // Trending TV Shows
            30.heightBox,
            MediaCardsListWidget(
              title: 'Trending TV Shows',
              itemList: controller.trendingTVShowsList,
              navigationPath: Routes.mainScreen,
              contentType: 'tvShows',
            ),
            // Trending Celebrities
            30.heightBox,
            MediaCardsListWidget(
              title: 'Trending Celebrities',
              itemList: controller.trendingCelebsList,
              navigationPath: Routes.mainScreen,
              contentType: 'celebs',
            ),
            // Top-Rated Movies
            30.heightBox,
            MediaCardsListWidget(
              title: 'Top-Rated Movies',
              itemList: controller.topRatedMoviesList,
              navigationPath: Routes.mainScreen,
              contentType: 'movies',
            ),
            // Top-Rated TV Shows
            30.heightBox,
            MediaCardsListWidget(
              title: 'Top-Rated TV Shows',
              itemList: controller.topRatedTVShowsList,
              navigationPath: Routes.mainScreen,
              contentType: 'tvShows',
            ),
            // Trending Animes
            30.heightBox,
            MediaCardsListWidget(
              title: 'Trending Animes',
              itemList: controller.trendingAnimeDataList,
              navigationPath: Routes.mainScreen,
              contentType: 'anime',
            ),
            // Popular Anime
            30.heightBox,
            MediaCardsListWidget(
              title: 'Popular Animes',
              itemList: controller.popularAnimeDataList,
              navigationPath: Routes.mainScreen,
              contentType: 'anime',
            ),
            // AV Videos
            // 30.heightBox,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Popular AV\'s',
            //       style: TextStyle(
            //         color: AppColors.appDarkBasedTextColor,
            //         fontSize: 28,
            //         fontWeight: FontWeight.w800,
            //       ),
            //     ),
            //     Text(
            //       'See All',
            //       style: TextStyle(
            //         color: AppColors.seeAllTextColor,
            //         fontSize: 20,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ],
            // ).paddingOnly(left: 15, right: 15),
            // SizedBox(
            //   height: 310,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     padding: EdgeInsets.only(top: 20, bottom: 10),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: controller.avVidsList.length,
            //     itemBuilder: (context, index) {
            //       var movieData = controller.avVidsList[index];
            //       return Container(
            //         width: 200,
            //         height: 250,
            //         margin: EdgeInsets.only(
            //           right: 10,
            //           left: index == 0 ? 20 : 10,
            //         ),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(10),
            //           child: Image.network(
            //             movieData.defaultThumb?.src ?? '',
            //             width: 200,
            //             height: 250,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
