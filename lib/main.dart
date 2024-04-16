import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learnapi/API/Dio_Helper.dart';
import 'package:learnapi/Cubit/Cubit.dart';
import 'package:learnapi/Cubit/States.dart';
import 'Cubit/darklightcubit_cubit.dart';
import 'News.dart';
import 'Sharedpref/Cache_Helper.dart';
import 'moduels/Search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
DioHelper.init();
  await CacheHelper.init();
  bool? isdark=CacheHelper.getbool(key: "isdark") as bool?;
  runApp( MyApp(isdark!));

}

class MyApp extends StatelessWidget {
final bool isdark;
MyApp(this.isdark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>NewsCubit()..getbusiness()),
          BlocProvider(          create: (BuildContext context) =>languageanddarkCubit()..chandemode(fromshared: isdark),
          )
        ],
        child:
          BlocConsumer<languageanddarkCubit,DarklightcubitState>(
            listener: (context,state){

            },
            builder:(context,state){


              return MaterialApp(
                debugShowCheckedModeBanner: false,






                theme:
                ThemeData(

                    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed
                    ),
                    appBarTheme:
                    const
                    AppBarTheme(
                        textTheme: TextTheme(
                          bodyText1: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),

                        iconTheme: IconThemeData(
                            color: Colors.black
                        ),
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarBrightness: Brightness.dark
                        ),
                        elevation: 0.0,
                        titleTextStyle:TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold) ,
                        backgroundColor: Colors.white
                    )
    ),
                darkTheme:
                ThemeData(
                    textTheme: const TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        )
                    ),
                    appBarTheme: AppBarTheme(
                        iconTheme: IconThemeData(
                            color: Colors.white
                        ),
                        backwardsCompatibility: false,
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: HexColor("333739"),
                            statusBarBrightness: Brightness.light
                        ),
                        elevation: 0.0,
                        titleTextStyle:const TextStyle(color: Colors.blueAccent,fontSize: 30,fontWeight: FontWeight.bold) ,
                        backgroundColor: HexColor("333739")
                    ),

                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: HexColor("333739")
                    ),
                    scaffoldBackgroundColor:HexColor("333739")
    ),
                themeMode: languageanddarkCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,


                home: News());

              }


          ),
        );
  }
}

