import 'package:lovemoney_fe/core/helper/remote_event.dart';

import '../../../../domain/entities/plan.dart';

class BuildListPlanEvent extends RemoteEvent {
  final Plan plan;
  BuildListPlanEvent(this.plan);
}
