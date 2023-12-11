import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/shared_preference/shared_preference.dart';
import '../../chat_gpt/ui/home.dart';
import '../data/local_data_base.dart';
import '../data/model.dart';
import 'onboarding_states.dart';

class AppOnBoardingCubit extends Cubit<AppOnBoardingStates>{


  AppOnBoardingCubit(context) : super(AppInitialOnBoardingStates()){
    list=OnBoardingDataBase.onBoardingList(context);
    emit(AppGetData());
  }



  static AppOnBoardingCubit get(context)=>BlocProvider.of(context);
  List<OnBoardingModel> list=[];
  int page =0;
  void changingPageView(context){
    if(page == list.length-1){
      CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) =>
       {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()))
       });
    }
    else
    {
      //curve: Curves.easeInBack
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear, );
    }
    emit(AppChangingPageView());
  }

  PageController pageController=PageController();


}