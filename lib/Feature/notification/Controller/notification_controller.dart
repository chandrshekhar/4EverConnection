import 'package:forever_connection/Feature/Notification/Models/notification_model.dart';
import 'package:forever_connection/core/utils/toast_widget.dart';
import 'package:get/get.dart';
import '../../../Services/Notification Service/notification_service.dart';


class NotificationController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<GetNotificationModel> notificationList = <GetNotificationModel>[].obs;
  NotificationServices notificationServices = NotificationServices();
  getNotification() async {
    try {
      isLoading(true);
      notificationList.value = await notificationServices.getNotificationList();
      notificationList.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
      isLoading(false);
    } catch (e) {
      isLoading(false);
      ToastWidget.errorToast(error: e.toString());
    }
  }
  notificationLastSeen(int notificationId) async {
    try {
      final String res =
          await notificationServices.lastSeenUpdate(notificationId);
      ToastWidget.successToast(success: res);
    } catch (e) {
      ToastWidget.errorToast(error: e.toString());
    }
  }
}
