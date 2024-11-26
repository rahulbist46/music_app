import 'package:music_app/src/utilities/app_error.dart';

class RemoteConfigService {
  RemoteConfigService._();
  static final RemoteConfigService instance = RemoteConfigService._();
  // final AppConfigRepo _repo = AppService.instance.appConfigRepo;

  // late AppConfigModel? config;

  Future<void> initialize() async {
    try {
      // config = await _repo.fetchAppConfig();
    } on AppError {
      // config = null;
    }
  }
}
