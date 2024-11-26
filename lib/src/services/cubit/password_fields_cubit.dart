import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordFieldsCubit extends Cubit<bool> {
  PasswordFieldsCubit() : super(true);
  void change() => emit(!state);
}
