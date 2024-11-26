import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  InternetConnectivity._();
  static final InternetConnectivity instance = InternetConnectivity._();
  // bool isConnected = false;

  Future<void> initialize() async {
    await startListeningForInternetConnectivity();
  }

  final Connectivity _connectivity = Connectivity();

  // List<ConnectivityResult> _previousConnectivity = [];

  Future<void> startListeningForInternetConnectivity() async {
    _connectivity.onConnectivityChanged.listen(_showDialog);
  }

  void _showDialog(List<ConnectivityResult> result) {
    if (!_isConnected(result)) {
      // DialogService.instance.showDialog(
      //   message: Strings.internetError,
      //   textColor: ColorPallet.darkRed,
      //   icon: Assets.wifiOff,
      //   iconBackGroundColor: ColorPallet.darkRed,
      //   duration: const Duration(seconds: 3),
      // );
    }

    // _previousConnectivity = resul
  }

  bool _isConnected(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi);
  }
}
