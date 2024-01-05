import 'core/app_event_channel.dart';

class ShowBottomNavEvent implements IAppEvent<bool> {
  @override
  bool data;

  ShowBottomNavEvent(this.data);
}