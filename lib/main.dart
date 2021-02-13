import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ProviderServices/MoviesProvider.dart';
import 'Ui/HomeScreen/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesProvider>(
      create: (context) => MoviesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          appBarTheme: AppBarTheme(color: Colors.pink),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MoviesHome()

        /*Scaffold(
            body: SplashScreen(
              loaderColor: Colors.pink,
              seconds: 5,
              imageBackground: AssetImage('assets/splash1.jpg'),
              navigateAfterSeconds: MoviesHome(),
            ))*/,
      ),
    );
  }
}
