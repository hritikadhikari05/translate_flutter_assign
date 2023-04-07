import 'package:get/get.dart';
import 'package:translator_task/features/homepage/homepage.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
