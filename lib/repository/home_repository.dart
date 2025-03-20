import 'package:matchingsport/data/network/base_api_services.dart';
import 'package:matchingsport/data/network/network_api_services.dart';
import 'package:matchingsport/models/movies_model.dart';
import 'package:matchingsport/res/widgets/app_urls.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchMoviesList() async {
    try {
      print("first line fetchMoviesList function");
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
