import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences ?sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  //ازاي اودي واجيب بقا
static Future<bool?> putbool({
  required String key,
  required dynamic value
})async{
  return await  sharedPreferences?.setBool(key,value );
}static Object? getbool({
  required String key,

}){
  return  sharedPreferences?.get(key);
}
}