import 'package:drift/drift.dart';

class CallTable extends Table {
  IntColumn get callId => integer().autoIncrement()();
  TextColumn get site_Id => text().named('site_id')();
  DateTimeColumn get cll_start_date => dateTime().named('cll_Start_dat')();
  DateTimeColumn get cll_end_date => dateTime().named('cll_end_dat')();
  TextColumn get cll_duration => text().named('call_duration')();
  TextColumn get cll_room => text().named('cll_room')();
  TextColumn get cll_type => text().named('cll_type')();
  TextColumn get cll_zone => text().named('cll_zone')();
  TextColumn get cll_unit_ID => text().named('cll_unit_ID')();
  TextColumn get cll_db_ref_id => text().named('cll_db_ref_id ')();
  TextColumn get cll_db_date_id => text().named('cll_db_date_id')();
  TextColumn get cll_db_time_id => text().named('cll_db_time_id')();
  TextColumn get cll_call_group_ID => text().named('cll_call_group_ID')();
  TextColumn get cll_worked_through => text().named('cll_worked_through ')();
  TextColumn get cll_carer => text().named('cll_carer')();
  TextColumn get cll_call_tracking_ref =>
      text().named('cll_call_tracking_ref')();
  TextColumn get cll_clear => text().named('cll_clear ')();
  TextColumn get cll_fb_record_id => text().named('cll_fb_record_id ')();
  TextColumn get cll_panel_name => text().named('cll_panel_name ')();

  TextColumn get cll_journey_ref => text().named('cll_journey_ref ')();
  TextColumn get cll_caregroup => text().named('cll_caregroup ')();
  TextColumn get cll_carehome => text().named('cll_carehome')();

  TextColumn get careHome_id => text().named('careHome_id ')();
}
