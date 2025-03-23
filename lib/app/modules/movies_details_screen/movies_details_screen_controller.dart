import 'dart:convert';

import 'package:anidex/app/core/utils/exports.dart';
import 'package:anidex/app/data/models/get_movies_detail_response_model.dart';

class MoviesDetailsScreenController extends GetxController {
  RestServices restServices = RestServices();
  Map<String, dynamic> getArgs = {};
  Rx<GetMoviesDetailsReponseModel> getMoviesDetailsReponseModel =
      GetMoviesDetailsReponseModel().obs;

  // Get Selected Movie Details
  Future<void> getSelectedMoviesDetails({int? movieId}) async {
    await restServices
        .getResponse(
          uri: '${ServiceConfiguration.getMoviesDetails}/$movieId',
          method: Method.get,
          token: apiToken,
          isTMDB: true,
        )
        .then((response) {
          if (response != '') {
            getMoviesDetailsReponseModel.value =
                GetMoviesDetailsReponseModel.fromJson(json.decode(response));
          }
        });
  }

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      getArgs = Get.arguments as Map<String, dynamic>;
      await getSelectedMoviesDetails(movieId: getArgs['id']);
    }
    super.onInit();
  }
}
