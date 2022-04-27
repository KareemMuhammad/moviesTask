import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/backend/blocs/details_bloc/details_cubit.dart';
import 'package:movies_task/backend/blocs/movies_bloc/movies_cubit.dart';
import 'package:movies_task/backend/repository/movies_repo.dart';
import 'package:movies_task/frontend/screens/popular_movies_screen.dart';
import 'package:movies_task/frontend/screens/splash_screen.dart';
import 'backend/services/remote_config_services.dart';

RemoteConfigService? remoteConfigService;

Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if(!kReleaseMode) {
    debugPrint("Handling a background message: ${message.messageId}");
  }

}

Future initializeRemoteConfig() async {
  remoteConfigService = await RemoteConfigService.getInstance();
  await remoteConfigService!.initialize();
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeRemoteConfig();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(MoviesRepository()),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(MoviesRepository()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
         primaryColor: Colors.white70,
        ),
        home: const PopularMoviesScreen(),
      ),
    );
  }
}
