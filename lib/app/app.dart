import 'package:shopping/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shopping/ui/views/home/home_view.dart';
import 'package:shopping/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: StartupView,
      initial: true,
    ),
    AdaptiveRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
