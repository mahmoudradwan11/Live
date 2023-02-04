import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/constants/constants.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/core/network/dio_helper.dart';
import 'package:live/models/business_model.dart';
import 'package:live/models/sports_model.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);
  SportsModel? sportsModel;
  BusinessModel? businessModel;
  String selectedCountry = 'eg';

  void changeCountry(country)
  {
     selectedCountry = country;
     emit(ChangeCountry());
  }
  void getSports() {
    DioHelper.getData(
        url: AppConstant.egyptSportNews,
        query:
        {
          'country': country,
          'category': AppConstant.cateSports,
          'apiKey': AppConstant.apiKey,
        }
    ).
    then((value) {
      sportsModel = SportsModel.fromJson(value.data);
      print('Source = ${sportsModel!.articles[0].source!.name!}');
      print('Title = ${sportsModel!.articles[0].title}');
      emit(GetSportsData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSportsData());
    });
  }
  void getBusiness() {
    DioHelper.getData(
        url: AppConstant.egyptSportNews,
        query:
        {
          'country': country,
          'category': AppConstant.cateBusiness,
          'apiKey': AppConstant.apiKey,
        }
    ).
    then((value) {
      businessModel = BusinessModel.fromJson(value.data);
      print('Source = ${businessModel!.articles[0].source!.name!}');
      print('Title = ${businessModel!.articles[0].title}');
      emit(GetBusinessData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorBusinessData());
    });
  }
}