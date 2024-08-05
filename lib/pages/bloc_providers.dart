import 'package:evo_finder/pages/application/bloc/app_bloc.dart';
import 'package:evo_finder/pages/register/bloc/register_bloc.dart';
import 'package:evo_finder/pages/signin/bloc/sign_in_bloc.dart';
import 'package:evo_finder/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => AppBloc()),
      ];
}
