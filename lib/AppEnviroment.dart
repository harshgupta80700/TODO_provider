abstract class AppEnvironment{

  static String baseAPIUrl;
  static String headerKey;

  static setupEnv(Environment env){
    switch(env){
      case Environment.dev:
        {
          headerKey = 'Authorization';
          baseAPIUrl = 'https://api-todo-flutter.herokuapp.com';
          break;
        }

      case Environment.prod:
        {
          headerKey = 'Authorization';
          baseAPIUrl = 'https://api-todo-flutter.herokuapp.com';
          break;
        }
    }
  }



}

enum Environment{
  prod,
  dev
}