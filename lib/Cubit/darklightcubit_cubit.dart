import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Sharedpref/Cache_Helper.dart';

part 'darklightcubit_state.dart';

class languageanddarkCubit extends Cubit<DarklightcubitState> {
  languageanddarkCubit() : super(DarklightcubitInitial());
  static languageanddarkCubit get(context)=> BlocProvider.of(context);

  bool isdark=false;
  void chandemode({fromshared}){
if(fromshared != null)
  {
    isdark=fromshared;
  }
else {
  isdark = !(isdark);
  CacheHelper.putbool(key: "isdark", value: isdark);

}
    emit(appchangemodestate());
  }
}
