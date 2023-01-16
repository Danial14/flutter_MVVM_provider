import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/data/response/api_response.dart';
import 'package:mvvm_flutter_prac/model/MoviesModel.dart';
import 'package:mvvm_flutter_prac/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier{
  final HomeRepository _homeRepository = HomeRepository();
  ApiResponse<MoviesModel?> _apiResponse = ApiResponse.loading();
  void setMoviesModel(ApiResponse<MoviesModel> apiResponse){
    _apiResponse = apiResponse;
    notifyListeners();
  }
  ApiResponse<MoviesModel?> getMoviesList(){
    return _apiResponse;
  }
  Future<void> fetchMoviesList() async{
    _homeRepository.getMoviesApi().then((moviesModel){
      setMoviesModel(ApiResponse.coMpleted(moviesModel));
    }).onError((error, stackTrace){
      setMoviesModel(ApiResponse.error(error.toString()));
      notifyListeners();
    });
  }
}