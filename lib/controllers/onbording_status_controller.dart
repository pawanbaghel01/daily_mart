import 'package:shared_preferences/shared_preferences.dart';

class OnbordingStatusController {

  Future<void> saveOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingComplete', true);
  }

  Future<bool> shouldShowOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOnboardingComplete') ?? false;
  }

  Future<void> deleteOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingComplete', false);
  }
}
