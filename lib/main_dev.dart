import 'core/common/app_env.dart';
import 'main_delegate.dart';

void main() => mainDelegate(AppEnvironmentType.dev);

void runAppInDevMode() {
  mainDelegate(AppEnvironmentType.dev);
}