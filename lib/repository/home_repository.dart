import 'package:mvvm_flutter_prac/data/network/BaseApiServices.dart';
import 'package:mvvm_flutter_prac/data/network/NetworkApiService.dart';
import 'package:mvvm_flutter_prac/model/MoviesModel.dart';
import 'package:mvvm_flutter_prac/res/appurls.dart';

class HomeRepository{
  final BaseApiServices _apiServices = NetworkApi();
  Future<MoviesModel> getMoviesApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      response = MoviesModel.fromJson(response);
      return response;
    }
    catch(error){
      rethrow;
    }
  }
}