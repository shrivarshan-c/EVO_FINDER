import 'package:evo_finder/pages/welcome/bloc/welcome_event.dart';
import 'package:evo_finder/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState(page: 0)) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
