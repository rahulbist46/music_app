import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/src/utilities/logger.dart';

class Observer extends BlocObserver {
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.error('Error: $error\n Stacktrace: $stackTrace');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _stopwatch.start();
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _stopwatch.stop();
    Log.info(
      'Bloc ${bloc.runtimeType} took ${_stopwatch.elapsedMilliseconds}ms to process event $change',
    );
    _stopwatch.reset();
  }
}
