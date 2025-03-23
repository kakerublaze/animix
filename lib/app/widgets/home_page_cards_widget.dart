import 'package:anidex/app/core/constants/app_colors.dart';
import 'package:anidex/app/core/utils/extensions.dart';
import 'package:anidex/app/core/utils/service_configuration.dart';
import 'package:anidex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MediaCardsListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> itemList;
  final String navigationPath;
  final String contentType; // "movies", "koreanSeries", "tvShows", "celebs"

  const MediaCardsListWidget({
    super.key,
    required this.title,
    required this.itemList,
    required this.navigationPath,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & "See All" Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.appDarkBasedTextColor,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(navigationPath),
              child: Text(
                'See All',
                style: TextStyle(
                  color: AppColors.seeAllTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ).paddingOnly(left: 15, right: 15),
        10.heightBox,

        // Horizontal List
        SizedBox(
          height: 310,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            scrollDirection: Axis.horizontal,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              var itemData = itemList[index];

              return GestureDetector(
                onTap: () {
                  _navigateToDetails(itemData.id);
                },
                child: Container(
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
                    child: _buildImageWithShimmer(itemData.posterPath),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// Navigation based on content type
  void _navigateToDetails(int id) {
    switch (contentType) {
      case "movies":
        Get.toNamed(Routes.moviesDetails, arguments: {'id': id});
        break;
      case "koreanSeries":
        // Get.toNamed(Routes.koreanSeriesDetails, arguments: {'id': id});
        break;
      case "tvShows":
        // Get.toNamed(Routes.tvShowDetails, arguments: {'id': id});
        break;
      case "celebs":
        // Get.toNamed(Routes.celebsDetails, arguments: {'id': id});
        break;
      case "anime":
        // Get.toNamed(Routes.celebsDetails, arguments: {'id': id});
        break;
      // default:
      //   Get.toNamed(Routes.movieDetails, arguments: {'id': id});
    }
  }

  /// Shimmer Effect for Image
  Widget _buildImageWithShimmer(String? imagePath) {
    return imagePath != null && imagePath.isNotEmpty
        ? Image.network(
          ServiceConfiguration.imageBaseUrl + imagePath,
          width: 200,
          height: 250,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(width: 200, height: 250, color: Colors.white),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
            );
          },
        )
        : Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(width: 200, height: 250, color: Colors.white),
        );
  }
}
