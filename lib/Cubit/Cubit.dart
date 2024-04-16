import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../API/Dio_Helper.dart';
import '../Sharedpref/Cache_Helper.dart';
import '../moduels/Science.dart';
import '../moduels/Setting.dart';
import '../moduels/Sports.dart';
import '../moduels/business.dart';
import 'States.dart';
import 'darklightcubit_cubit.dart';

class NewsCubit extends Cubit<NewsState>{
NewsCubit () : super(initial());
static NewsCubit get(context)=> BlocProvider.of(context);
int Currentindex=0;
List<BottomNavigationBarItem> bottomitems=[
  BottomNavigationBarItem(label: "Business",
      icon:Icon( Icons.business_center_sharp)


  ),
  BottomNavigationBarItem(label: "Sports",
      icon:Icon( Icons.sports_basketball_rounded)


  ),
  BottomNavigationBarItem(label: "Science",
      icon:Icon( Icons.science)


  ),




];
void onTap(index){
  Currentindex=index;
  getbusiness();

  if(index==1){
    getSports();

  }

  if(index==2){
    getScience();

  }
  emit(bottomnav());
}
List<Widget> Screens=[
  BusinesScreen(),
  SportsScreen(),
  ScienceScreen(),
];
List<dynamic>Business=[];
List<dynamic>Science=[];
List<dynamic>Sports=[];
 getbusiness(){
  emit(NEWSBUSINESSloading());
  DioHelper.getdata(url:"v2/top-headlines", query: {'country':'us','category':'business','apiKey':'7499b235249645bbaaa2d37190e46dfa'}).then(

          (value) {
            print(value);
         Business = value?.data['articles'];
         print(Business[0]['title']);

         emit(NEWSBUSINESSSUCESS());
          }).catchError((e){
    print(e.toString());
    emit(NEWSBUSINESFAILED(e));
  });
  }
 getScience(){
  emit(NEWSScienceloading());
  if(Science.length==0){
    DioHelper.getdata(url:"v2/top-headlines", query: {'country':'us','category':'science','apiKey':'7499b235249645bbaaa2d37190e46dfa'}).then(

            (value) {
          Science = value?.data['articles'];
          print(Science[0]['title']);

          emit(NEWSScienceSUCESS());
        }).catchError((e){
      print(e.toString());
      emit(NEWSScienceFAILED(e));
    }
    );}
  else{
    emit(NEWSScienceloading());
  }


  }
 getSports(){
  emit(NEWSSportsloading());
  if(Sports.length==0){
    DioHelper.getdata(url:"v2/top-headlines", query: {'country':'us','category':'sports','apiKey':'7499b235249645bbaaa2d37190e46dfa'}).then(

            (value) {
          Sports = value?.data['articles'];
          print(Sports[0]['title']);

          emit(NEWSSportsSUCESS());
        }).catchError((e){
      print(e.toString());
      emit(NEWSBUSINESFAILED(e));
    }
    );}

  else{
    emit(NEWSSportsloading());

  }


  }
  List <dynamic>Search=[];
getsearch(String value){
  Search=[];

  DioHelper.getdata(url:"v2/everything", query: {'q':'${value}','apiKey':'7499b235249645bbaaa2d37190e46dfa'}).then(

          (value) {
            Search = value?.data['articles'];
            emit(NEWSsearchSUCESS());

      }).catchError((e){
    print(e.toString());
    emit(NEWSsearchFAILED(e));
  });
}
}