import 'package:flutter_bloc/flutter_bloc.dart';

class IsSignUpCubit extends Cubit<bool> {
  IsSignUpCubit() : super(false);
  void change({bool? value}) {
    if (value != null) {
      emit(value);
    } else {
      emit(!state);
    }
  }
}
