enum AppEnvironmentType { dev, pro }

class AppEnvironment {
  static AppEnvironmentType _env = AppEnvironmentType.pro;
  static Map<String, dynamic> _config = {};

  AppEnvironment._();

  static void setEnvironment(AppEnvironmentType env) {
    _env = env;

    _config = switch (env) {
      AppEnvironmentType.dev =>
      {
        'baseUrl': 'https://ovan.otoviet.com',
        'apiPrefix': '/api',
      },
      AppEnvironmentType.pro =>
      {
        'baseUrl': 'https://ovan.otoviet.com',
        'apiPrefix': '/api',
      }
    };
  }

  static AppEnvironmentType get environment => _env;
  static Map<String, dynamic> get config => _config;
  static String get baseUrl => _config['baseUrl'];
  static String get apiPrefix => _config['apiPrefix'];
  // static String get publicPem => config['publicPem'];
  static String get firebaseRTDBUrl => config['firebase-rtdb-url'] as String;
  static String get firebaseAuthKey => config['firebase-auth-key'];
}