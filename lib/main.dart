import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    primarySwatch: getColor(
                        condition: BlocProvider.of<GetWeatherCubit>(context)
                            .wheatherModel
                            ?.weatherComdition)),
                home: MediaQuery.of(context).orientation == Orientation.portrait
                    ? const HomeView()
                    : const HomeView(),
              );
            },
          ),
        ));
  }
}

MaterialColor getColor({String? condition}) {
  if (condition == null)
    return Colors.green;
  else if (condition == 'Sunny')
    return Colors.deepOrange;
  else if (condition == '"Heavy rain"')
    return Colors.blueGrey;
  else
    return Colors.lightBlue;
}
