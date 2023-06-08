// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdb.dart';

// ignore_for_file: type=lint
class $CallTableTable extends CallTable
    with TableInfo<$CallTableTable, CallTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CallTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _callIdMeta = const VerificationMeta('callId');
  @override
  late final GeneratedColumn<int> callId = GeneratedColumn<int>(
      'call_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _site_IdMeta =
      const VerificationMeta('site_Id');
  @override
  late final GeneratedColumn<String> site_Id = GeneratedColumn<String>(
      'site_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_start_dateMeta =
      const VerificationMeta('cll_start_date');
  @override
  late final GeneratedColumn<DateTime> cll_start_date =
      GeneratedColumn<DateTime>('cll_Start_dat', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cll_end_dateMeta =
      const VerificationMeta('cll_end_date');
  @override
  late final GeneratedColumn<DateTime> cll_end_date = GeneratedColumn<DateTime>(
      'cll_end_dat', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cll_durationMeta =
      const VerificationMeta('cll_duration');
  @override
  late final GeneratedColumn<String> cll_duration = GeneratedColumn<String>(
      'call_duration', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_roomMeta =
      const VerificationMeta('cll_room');
  @override
  late final GeneratedColumn<String> cll_room = GeneratedColumn<String>(
      'cll_room', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_typeMeta =
      const VerificationMeta('cll_type');
  @override
  late final GeneratedColumn<String> cll_type = GeneratedColumn<String>(
      'cll_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_zoneMeta =
      const VerificationMeta('cll_zone');
  @override
  late final GeneratedColumn<String> cll_zone = GeneratedColumn<String>(
      'cll_zone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_unit_IDMeta =
      const VerificationMeta('cll_unit_ID');
  @override
  late final GeneratedColumn<String> cll_unit_ID = GeneratedColumn<String>(
      'cll_unit_ID', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_db_ref_idMeta =
      const VerificationMeta('cll_db_ref_id');
  @override
  late final GeneratedColumn<String> cll_db_ref_id = GeneratedColumn<String>(
      'cll_db_ref_id ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_db_date_idMeta =
      const VerificationMeta('cll_db_date_id');
  @override
  late final GeneratedColumn<String> cll_db_date_id = GeneratedColumn<String>(
      'cll_db_date_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_db_time_idMeta =
      const VerificationMeta('cll_db_time_id');
  @override
  late final GeneratedColumn<String> cll_db_time_id = GeneratedColumn<String>(
      'cll_db_time_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_call_group_IDMeta =
      const VerificationMeta('cll_call_group_ID');
  @override
  late final GeneratedColumn<String> cll_call_group_ID =
      GeneratedColumn<String>('cll_call_group_ID', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_worked_throughMeta =
      const VerificationMeta('cll_worked_through');
  @override
  late final GeneratedColumn<String> cll_worked_through =
      GeneratedColumn<String>('cll_worked_through ', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_carerMeta =
      const VerificationMeta('cll_carer');
  @override
  late final GeneratedColumn<String> cll_carer = GeneratedColumn<String>(
      'cll_carer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_call_tracking_refMeta =
      const VerificationMeta('cll_call_tracking_ref');
  @override
  late final GeneratedColumn<String> cll_call_tracking_ref =
      GeneratedColumn<String>('cll_call_tracking_ref', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_clearMeta =
      const VerificationMeta('cll_clear');
  @override
  late final GeneratedColumn<String> cll_clear = GeneratedColumn<String>(
      'cll_clear ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_fb_record_idMeta =
      const VerificationMeta('cll_fb_record_id');
  @override
  late final GeneratedColumn<String> cll_fb_record_id = GeneratedColumn<String>(
      'cll_fb_record_id ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_panel_nameMeta =
      const VerificationMeta('cll_panel_name');
  @override
  late final GeneratedColumn<String> cll_panel_name = GeneratedColumn<String>(
      'cll_panel_name ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_journey_refMeta =
      const VerificationMeta('cll_journey_ref');
  @override
  late final GeneratedColumn<String> cll_journey_ref = GeneratedColumn<String>(
      'cll_journey_ref ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_caregroupMeta =
      const VerificationMeta('cll_caregroup');
  @override
  late final GeneratedColumn<String> cll_caregroup = GeneratedColumn<String>(
      'cll_caregroup ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cll_carehomeMeta =
      const VerificationMeta('cll_carehome');
  @override
  late final GeneratedColumn<String> cll_carehome = GeneratedColumn<String>(
      'cll_carehome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _careHome_idMeta =
      const VerificationMeta('careHome_id');
  @override
  late final GeneratedColumn<String> careHome_id = GeneratedColumn<String>(
      'careHome_id ', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        callId,
        site_Id,
        cll_start_date,
        cll_end_date,
        cll_duration,
        cll_room,
        cll_type,
        cll_zone,
        cll_unit_ID,
        cll_db_ref_id,
        cll_db_date_id,
        cll_db_time_id,
        cll_call_group_ID,
        cll_worked_through,
        cll_carer,
        cll_call_tracking_ref,
        cll_clear,
        cll_fb_record_id,
        cll_panel_name,
        cll_journey_ref,
        cll_caregroup,
        cll_carehome,
        careHome_id
      ];
  @override
  String get aliasedName => _alias ?? 'call_table';
  @override
  String get actualTableName => 'call_table';
  @override
  VerificationContext validateIntegrity(Insertable<CallTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('call_id')) {
      context.handle(_callIdMeta,
          callId.isAcceptableOrUnknown(data['call_id']!, _callIdMeta));
    }
    if (data.containsKey('site_id')) {
      context.handle(_site_IdMeta,
          site_Id.isAcceptableOrUnknown(data['site_id']!, _site_IdMeta));
    } else if (isInserting) {
      context.missing(_site_IdMeta);
    }
    if (data.containsKey('cll_Start_dat')) {
      context.handle(
          _cll_start_dateMeta,
          cll_start_date.isAcceptableOrUnknown(
              data['cll_Start_dat']!, _cll_start_dateMeta));
    } else if (isInserting) {
      context.missing(_cll_start_dateMeta);
    }
    if (data.containsKey('cll_end_dat')) {
      context.handle(
          _cll_end_dateMeta,
          cll_end_date.isAcceptableOrUnknown(
              data['cll_end_dat']!, _cll_end_dateMeta));
    } else if (isInserting) {
      context.missing(_cll_end_dateMeta);
    }
    if (data.containsKey('call_duration')) {
      context.handle(
          _cll_durationMeta,
          cll_duration.isAcceptableOrUnknown(
              data['call_duration']!, _cll_durationMeta));
    } else if (isInserting) {
      context.missing(_cll_durationMeta);
    }
    if (data.containsKey('cll_room')) {
      context.handle(_cll_roomMeta,
          cll_room.isAcceptableOrUnknown(data['cll_room']!, _cll_roomMeta));
    } else if (isInserting) {
      context.missing(_cll_roomMeta);
    }
    if (data.containsKey('cll_type')) {
      context.handle(_cll_typeMeta,
          cll_type.isAcceptableOrUnknown(data['cll_type']!, _cll_typeMeta));
    } else if (isInserting) {
      context.missing(_cll_typeMeta);
    }
    if (data.containsKey('cll_zone')) {
      context.handle(_cll_zoneMeta,
          cll_zone.isAcceptableOrUnknown(data['cll_zone']!, _cll_zoneMeta));
    } else if (isInserting) {
      context.missing(_cll_zoneMeta);
    }
    if (data.containsKey('cll_unit_ID')) {
      context.handle(
          _cll_unit_IDMeta,
          cll_unit_ID.isAcceptableOrUnknown(
              data['cll_unit_ID']!, _cll_unit_IDMeta));
    } else if (isInserting) {
      context.missing(_cll_unit_IDMeta);
    }
    if (data.containsKey('cll_db_ref_id ')) {
      context.handle(
          _cll_db_ref_idMeta,
          cll_db_ref_id.isAcceptableOrUnknown(
              data['cll_db_ref_id ']!, _cll_db_ref_idMeta));
    } else if (isInserting) {
      context.missing(_cll_db_ref_idMeta);
    }
    if (data.containsKey('cll_db_date_id')) {
      context.handle(
          _cll_db_date_idMeta,
          cll_db_date_id.isAcceptableOrUnknown(
              data['cll_db_date_id']!, _cll_db_date_idMeta));
    } else if (isInserting) {
      context.missing(_cll_db_date_idMeta);
    }
    if (data.containsKey('cll_db_time_id')) {
      context.handle(
          _cll_db_time_idMeta,
          cll_db_time_id.isAcceptableOrUnknown(
              data['cll_db_time_id']!, _cll_db_time_idMeta));
    } else if (isInserting) {
      context.missing(_cll_db_time_idMeta);
    }
    if (data.containsKey('cll_call_group_ID')) {
      context.handle(
          _cll_call_group_IDMeta,
          cll_call_group_ID.isAcceptableOrUnknown(
              data['cll_call_group_ID']!, _cll_call_group_IDMeta));
    } else if (isInserting) {
      context.missing(_cll_call_group_IDMeta);
    }
    if (data.containsKey('cll_worked_through ')) {
      context.handle(
          _cll_worked_throughMeta,
          cll_worked_through.isAcceptableOrUnknown(
              data['cll_worked_through ']!, _cll_worked_throughMeta));
    } else if (isInserting) {
      context.missing(_cll_worked_throughMeta);
    }
    if (data.containsKey('cll_carer')) {
      context.handle(_cll_carerMeta,
          cll_carer.isAcceptableOrUnknown(data['cll_carer']!, _cll_carerMeta));
    } else if (isInserting) {
      context.missing(_cll_carerMeta);
    }
    if (data.containsKey('cll_call_tracking_ref')) {
      context.handle(
          _cll_call_tracking_refMeta,
          cll_call_tracking_ref.isAcceptableOrUnknown(
              data['cll_call_tracking_ref']!, _cll_call_tracking_refMeta));
    } else if (isInserting) {
      context.missing(_cll_call_tracking_refMeta);
    }
    if (data.containsKey('cll_clear ')) {
      context.handle(_cll_clearMeta,
          cll_clear.isAcceptableOrUnknown(data['cll_clear ']!, _cll_clearMeta));
    } else if (isInserting) {
      context.missing(_cll_clearMeta);
    }
    if (data.containsKey('cll_fb_record_id ')) {
      context.handle(
          _cll_fb_record_idMeta,
          cll_fb_record_id.isAcceptableOrUnknown(
              data['cll_fb_record_id ']!, _cll_fb_record_idMeta));
    } else if (isInserting) {
      context.missing(_cll_fb_record_idMeta);
    }
    if (data.containsKey('cll_panel_name ')) {
      context.handle(
          _cll_panel_nameMeta,
          cll_panel_name.isAcceptableOrUnknown(
              data['cll_panel_name ']!, _cll_panel_nameMeta));
    } else if (isInserting) {
      context.missing(_cll_panel_nameMeta);
    }
    if (data.containsKey('cll_journey_ref ')) {
      context.handle(
          _cll_journey_refMeta,
          cll_journey_ref.isAcceptableOrUnknown(
              data['cll_journey_ref ']!, _cll_journey_refMeta));
    } else if (isInserting) {
      context.missing(_cll_journey_refMeta);
    }
    if (data.containsKey('cll_caregroup ')) {
      context.handle(
          _cll_caregroupMeta,
          cll_caregroup.isAcceptableOrUnknown(
              data['cll_caregroup ']!, _cll_caregroupMeta));
    } else if (isInserting) {
      context.missing(_cll_caregroupMeta);
    }
    if (data.containsKey('cll_carehome')) {
      context.handle(
          _cll_carehomeMeta,
          cll_carehome.isAcceptableOrUnknown(
              data['cll_carehome']!, _cll_carehomeMeta));
    } else if (isInserting) {
      context.missing(_cll_carehomeMeta);
    }
    if (data.containsKey('careHome_id ')) {
      context.handle(
          _careHome_idMeta,
          careHome_id.isAcceptableOrUnknown(
              data['careHome_id ']!, _careHome_idMeta));
    } else if (isInserting) {
      context.missing(_careHome_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {callId};
  @override
  CallTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CallTableData(
      callId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}call_id'])!,
      site_Id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}site_id'])!,
      cll_start_date: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}cll_Start_dat'])!,
      cll_end_date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cll_end_dat'])!,
      cll_duration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}call_duration'])!,
      cll_room: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_room'])!,
      cll_type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_type'])!,
      cll_zone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_zone'])!,
      cll_unit_ID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_unit_ID'])!,
      cll_db_ref_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_db_ref_id '])!,
      cll_db_date_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_db_date_id'])!,
      cll_db_time_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_db_time_id'])!,
      cll_call_group_ID: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cll_call_group_ID'])!,
      cll_worked_through: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cll_worked_through '])!,
      cll_carer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_carer'])!,
      cll_call_tracking_ref: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cll_call_tracking_ref'])!,
      cll_clear: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_clear '])!,
      cll_fb_record_id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cll_fb_record_id '])!,
      cll_panel_name: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cll_panel_name '])!,
      cll_journey_ref: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cll_journey_ref '])!,
      cll_caregroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_caregroup '])!,
      cll_carehome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cll_carehome'])!,
      careHome_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}careHome_id '])!,
    );
  }

  @override
  $CallTableTable createAlias(String alias) {
    return $CallTableTable(attachedDatabase, alias);
  }
}

class CallTableData extends DataClass implements Insertable<CallTableData> {
  final int callId;
  final String site_Id;
  final DateTime cll_start_date;
  final DateTime cll_end_date;
  final String cll_duration;
  final String cll_room;
  final String cll_type;
  final String cll_zone;
  final String cll_unit_ID;
  final String cll_db_ref_id;
  final String cll_db_date_id;
  final String cll_db_time_id;
  final String cll_call_group_ID;
  final String cll_worked_through;
  final String cll_carer;
  final String cll_call_tracking_ref;
  final String cll_clear;
  final String cll_fb_record_id;
  final String cll_panel_name;
  final String cll_journey_ref;
  final String cll_caregroup;
  final String cll_carehome;
  final String careHome_id;
  const CallTableData(
      {required this.callId,
      required this.site_Id,
      required this.cll_start_date,
      required this.cll_end_date,
      required this.cll_duration,
      required this.cll_room,
      required this.cll_type,
      required this.cll_zone,
      required this.cll_unit_ID,
      required this.cll_db_ref_id,
      required this.cll_db_date_id,
      required this.cll_db_time_id,
      required this.cll_call_group_ID,
      required this.cll_worked_through,
      required this.cll_carer,
      required this.cll_call_tracking_ref,
      required this.cll_clear,
      required this.cll_fb_record_id,
      required this.cll_panel_name,
      required this.cll_journey_ref,
      required this.cll_caregroup,
      required this.cll_carehome,
      required this.careHome_id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['call_id'] = Variable<int>(callId);
    map['site_id'] = Variable<String>(site_Id);
    map['cll_Start_dat'] = Variable<DateTime>(cll_start_date);
    map['cll_end_dat'] = Variable<DateTime>(cll_end_date);
    map['call_duration'] = Variable<String>(cll_duration);
    map['cll_room'] = Variable<String>(cll_room);
    map['cll_type'] = Variable<String>(cll_type);
    map['cll_zone'] = Variable<String>(cll_zone);
    map['cll_unit_ID'] = Variable<String>(cll_unit_ID);
    map['cll_db_ref_id '] = Variable<String>(cll_db_ref_id);
    map['cll_db_date_id'] = Variable<String>(cll_db_date_id);
    map['cll_db_time_id'] = Variable<String>(cll_db_time_id);
    map['cll_call_group_ID'] = Variable<String>(cll_call_group_ID);
    map['cll_worked_through '] = Variable<String>(cll_worked_through);
    map['cll_carer'] = Variable<String>(cll_carer);
    map['cll_call_tracking_ref'] = Variable<String>(cll_call_tracking_ref);
    map['cll_clear '] = Variable<String>(cll_clear);
    map['cll_fb_record_id '] = Variable<String>(cll_fb_record_id);
    map['cll_panel_name '] = Variable<String>(cll_panel_name);
    map['cll_journey_ref '] = Variable<String>(cll_journey_ref);
    map['cll_caregroup '] = Variable<String>(cll_caregroup);
    map['cll_carehome'] = Variable<String>(cll_carehome);
    map['careHome_id '] = Variable<String>(careHome_id);
    return map;
  }

  CallTableCompanion toCompanion(bool nullToAbsent) {
    return CallTableCompanion(
      callId: Value(callId),
      site_Id: Value(site_Id),
      cll_start_date: Value(cll_start_date),
      cll_end_date: Value(cll_end_date),
      cll_duration: Value(cll_duration),
      cll_room: Value(cll_room),
      cll_type: Value(cll_type),
      cll_zone: Value(cll_zone),
      cll_unit_ID: Value(cll_unit_ID),
      cll_db_ref_id: Value(cll_db_ref_id),
      cll_db_date_id: Value(cll_db_date_id),
      cll_db_time_id: Value(cll_db_time_id),
      cll_call_group_ID: Value(cll_call_group_ID),
      cll_worked_through: Value(cll_worked_through),
      cll_carer: Value(cll_carer),
      cll_call_tracking_ref: Value(cll_call_tracking_ref),
      cll_clear: Value(cll_clear),
      cll_fb_record_id: Value(cll_fb_record_id),
      cll_panel_name: Value(cll_panel_name),
      cll_journey_ref: Value(cll_journey_ref),
      cll_caregroup: Value(cll_caregroup),
      cll_carehome: Value(cll_carehome),
      careHome_id: Value(careHome_id),
    );
  }

  factory CallTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CallTableData(
      callId: serializer.fromJson<int>(json['callId']),
      site_Id: serializer.fromJson<String>(json['site_Id']),
      cll_start_date: serializer.fromJson<DateTime>(json['cll_start_date']),
      cll_end_date: serializer.fromJson<DateTime>(json['cll_end_date']),
      cll_duration: serializer.fromJson<String>(json['cll_duration']),
      cll_room: serializer.fromJson<String>(json['cll_room']),
      cll_type: serializer.fromJson<String>(json['cll_type']),
      cll_zone: serializer.fromJson<String>(json['cll_zone']),
      cll_unit_ID: serializer.fromJson<String>(json['cll_unit_ID']),
      cll_db_ref_id: serializer.fromJson<String>(json['cll_db_ref_id']),
      cll_db_date_id: serializer.fromJson<String>(json['cll_db_date_id']),
      cll_db_time_id: serializer.fromJson<String>(json['cll_db_time_id']),
      cll_call_group_ID: serializer.fromJson<String>(json['cll_call_group_ID']),
      cll_worked_through:
          serializer.fromJson<String>(json['cll_worked_through']),
      cll_carer: serializer.fromJson<String>(json['cll_carer']),
      cll_call_tracking_ref:
          serializer.fromJson<String>(json['cll_call_tracking_ref']),
      cll_clear: serializer.fromJson<String>(json['cll_clear']),
      cll_fb_record_id: serializer.fromJson<String>(json['cll_fb_record_id']),
      cll_panel_name: serializer.fromJson<String>(json['cll_panel_name']),
      cll_journey_ref: serializer.fromJson<String>(json['cll_journey_ref']),
      cll_caregroup: serializer.fromJson<String>(json['cll_caregroup']),
      cll_carehome: serializer.fromJson<String>(json['cll_carehome']),
      careHome_id: serializer.fromJson<String>(json['careHome_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'callId': serializer.toJson<int>(callId),
      'site_Id': serializer.toJson<String>(site_Id),
      'cll_start_date': serializer.toJson<DateTime>(cll_start_date),
      'cll_end_date': serializer.toJson<DateTime>(cll_end_date),
      'cll_duration': serializer.toJson<String>(cll_duration),
      'cll_room': serializer.toJson<String>(cll_room),
      'cll_type': serializer.toJson<String>(cll_type),
      'cll_zone': serializer.toJson<String>(cll_zone),
      'cll_unit_ID': serializer.toJson<String>(cll_unit_ID),
      'cll_db_ref_id': serializer.toJson<String>(cll_db_ref_id),
      'cll_db_date_id': serializer.toJson<String>(cll_db_date_id),
      'cll_db_time_id': serializer.toJson<String>(cll_db_time_id),
      'cll_call_group_ID': serializer.toJson<String>(cll_call_group_ID),
      'cll_worked_through': serializer.toJson<String>(cll_worked_through),
      'cll_carer': serializer.toJson<String>(cll_carer),
      'cll_call_tracking_ref': serializer.toJson<String>(cll_call_tracking_ref),
      'cll_clear': serializer.toJson<String>(cll_clear),
      'cll_fb_record_id': serializer.toJson<String>(cll_fb_record_id),
      'cll_panel_name': serializer.toJson<String>(cll_panel_name),
      'cll_journey_ref': serializer.toJson<String>(cll_journey_ref),
      'cll_caregroup': serializer.toJson<String>(cll_caregroup),
      'cll_carehome': serializer.toJson<String>(cll_carehome),
      'careHome_id': serializer.toJson<String>(careHome_id),
    };
  }

  CallTableData copyWith(
          {int? callId,
          String? site_Id,
          DateTime? cll_start_date,
          DateTime? cll_end_date,
          String? cll_duration,
          String? cll_room,
          String? cll_type,
          String? cll_zone,
          String? cll_unit_ID,
          String? cll_db_ref_id,
          String? cll_db_date_id,
          String? cll_db_time_id,
          String? cll_call_group_ID,
          String? cll_worked_through,
          String? cll_carer,
          String? cll_call_tracking_ref,
          String? cll_clear,
          String? cll_fb_record_id,
          String? cll_panel_name,
          String? cll_journey_ref,
          String? cll_caregroup,
          String? cll_carehome,
          String? careHome_id}) =>
      CallTableData(
        callId: callId ?? this.callId,
        site_Id: site_Id ?? this.site_Id,
        cll_start_date: cll_start_date ?? this.cll_start_date,
        cll_end_date: cll_end_date ?? this.cll_end_date,
        cll_duration: cll_duration ?? this.cll_duration,
        cll_room: cll_room ?? this.cll_room,
        cll_type: cll_type ?? this.cll_type,
        cll_zone: cll_zone ?? this.cll_zone,
        cll_unit_ID: cll_unit_ID ?? this.cll_unit_ID,
        cll_db_ref_id: cll_db_ref_id ?? this.cll_db_ref_id,
        cll_db_date_id: cll_db_date_id ?? this.cll_db_date_id,
        cll_db_time_id: cll_db_time_id ?? this.cll_db_time_id,
        cll_call_group_ID: cll_call_group_ID ?? this.cll_call_group_ID,
        cll_worked_through: cll_worked_through ?? this.cll_worked_through,
        cll_carer: cll_carer ?? this.cll_carer,
        cll_call_tracking_ref:
            cll_call_tracking_ref ?? this.cll_call_tracking_ref,
        cll_clear: cll_clear ?? this.cll_clear,
        cll_fb_record_id: cll_fb_record_id ?? this.cll_fb_record_id,
        cll_panel_name: cll_panel_name ?? this.cll_panel_name,
        cll_journey_ref: cll_journey_ref ?? this.cll_journey_ref,
        cll_caregroup: cll_caregroup ?? this.cll_caregroup,
        cll_carehome: cll_carehome ?? this.cll_carehome,
        careHome_id: careHome_id ?? this.careHome_id,
      );
  @override
  String toString() {
    return (StringBuffer('CallTableData(')
          ..write('callId: $callId, ')
          ..write('site_Id: $site_Id, ')
          ..write('cll_start_date: $cll_start_date, ')
          ..write('cll_end_date: $cll_end_date, ')
          ..write('cll_duration: $cll_duration, ')
          ..write('cll_room: $cll_room, ')
          ..write('cll_type: $cll_type, ')
          ..write('cll_zone: $cll_zone, ')
          ..write('cll_unit_ID: $cll_unit_ID, ')
          ..write('cll_db_ref_id: $cll_db_ref_id, ')
          ..write('cll_db_date_id: $cll_db_date_id, ')
          ..write('cll_db_time_id: $cll_db_time_id, ')
          ..write('cll_call_group_ID: $cll_call_group_ID, ')
          ..write('cll_worked_through: $cll_worked_through, ')
          ..write('cll_carer: $cll_carer, ')
          ..write('cll_call_tracking_ref: $cll_call_tracking_ref, ')
          ..write('cll_clear: $cll_clear, ')
          ..write('cll_fb_record_id: $cll_fb_record_id, ')
          ..write('cll_panel_name: $cll_panel_name, ')
          ..write('cll_journey_ref: $cll_journey_ref, ')
          ..write('cll_caregroup: $cll_caregroup, ')
          ..write('cll_carehome: $cll_carehome, ')
          ..write('careHome_id: $careHome_id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        callId,
        site_Id,
        cll_start_date,
        cll_end_date,
        cll_duration,
        cll_room,
        cll_type,
        cll_zone,
        cll_unit_ID,
        cll_db_ref_id,
        cll_db_date_id,
        cll_db_time_id,
        cll_call_group_ID,
        cll_worked_through,
        cll_carer,
        cll_call_tracking_ref,
        cll_clear,
        cll_fb_record_id,
        cll_panel_name,
        cll_journey_ref,
        cll_caregroup,
        cll_carehome,
        careHome_id
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CallTableData &&
          other.callId == this.callId &&
          other.site_Id == this.site_Id &&
          other.cll_start_date == this.cll_start_date &&
          other.cll_end_date == this.cll_end_date &&
          other.cll_duration == this.cll_duration &&
          other.cll_room == this.cll_room &&
          other.cll_type == this.cll_type &&
          other.cll_zone == this.cll_zone &&
          other.cll_unit_ID == this.cll_unit_ID &&
          other.cll_db_ref_id == this.cll_db_ref_id &&
          other.cll_db_date_id == this.cll_db_date_id &&
          other.cll_db_time_id == this.cll_db_time_id &&
          other.cll_call_group_ID == this.cll_call_group_ID &&
          other.cll_worked_through == this.cll_worked_through &&
          other.cll_carer == this.cll_carer &&
          other.cll_call_tracking_ref == this.cll_call_tracking_ref &&
          other.cll_clear == this.cll_clear &&
          other.cll_fb_record_id == this.cll_fb_record_id &&
          other.cll_panel_name == this.cll_panel_name &&
          other.cll_journey_ref == this.cll_journey_ref &&
          other.cll_caregroup == this.cll_caregroup &&
          other.cll_carehome == this.cll_carehome &&
          other.careHome_id == this.careHome_id);
}

class CallTableCompanion extends UpdateCompanion<CallTableData> {
  final Value<int> callId;
  final Value<String> site_Id;
  final Value<DateTime> cll_start_date;
  final Value<DateTime> cll_end_date;
  final Value<String> cll_duration;
  final Value<String> cll_room;
  final Value<String> cll_type;
  final Value<String> cll_zone;
  final Value<String> cll_unit_ID;
  final Value<String> cll_db_ref_id;
  final Value<String> cll_db_date_id;
  final Value<String> cll_db_time_id;
  final Value<String> cll_call_group_ID;
  final Value<String> cll_worked_through;
  final Value<String> cll_carer;
  final Value<String> cll_call_tracking_ref;
  final Value<String> cll_clear;
  final Value<String> cll_fb_record_id;
  final Value<String> cll_panel_name;
  final Value<String> cll_journey_ref;
  final Value<String> cll_caregroup;
  final Value<String> cll_carehome;
  final Value<String> careHome_id;
  const CallTableCompanion({
    this.callId = const Value.absent(),
    this.site_Id = const Value.absent(),
    this.cll_start_date = const Value.absent(),
    this.cll_end_date = const Value.absent(),
    this.cll_duration = const Value.absent(),
    this.cll_room = const Value.absent(),
    this.cll_type = const Value.absent(),
    this.cll_zone = const Value.absent(),
    this.cll_unit_ID = const Value.absent(),
    this.cll_db_ref_id = const Value.absent(),
    this.cll_db_date_id = const Value.absent(),
    this.cll_db_time_id = const Value.absent(),
    this.cll_call_group_ID = const Value.absent(),
    this.cll_worked_through = const Value.absent(),
    this.cll_carer = const Value.absent(),
    this.cll_call_tracking_ref = const Value.absent(),
    this.cll_clear = const Value.absent(),
    this.cll_fb_record_id = const Value.absent(),
    this.cll_panel_name = const Value.absent(),
    this.cll_journey_ref = const Value.absent(),
    this.cll_caregroup = const Value.absent(),
    this.cll_carehome = const Value.absent(),
    this.careHome_id = const Value.absent(),
  });
  CallTableCompanion.insert({
    this.callId = const Value.absent(),
    required String site_Id,
    required DateTime cll_start_date,
    required DateTime cll_end_date,
    required String cll_duration,
    required String cll_room,
    required String cll_type,
    required String cll_zone,
    required String cll_unit_ID,
    required String cll_db_ref_id,
    required String cll_db_date_id,
    required String cll_db_time_id,
    required String cll_call_group_ID,
    required String cll_worked_through,
    required String cll_carer,
    required String cll_call_tracking_ref,
    required String cll_clear,
    required String cll_fb_record_id,
    required String cll_panel_name,
    required String cll_journey_ref,
    required String cll_caregroup,
    required String cll_carehome,
    required String careHome_id,
  })  : site_Id = Value(site_Id),
        cll_start_date = Value(cll_start_date),
        cll_end_date = Value(cll_end_date),
        cll_duration = Value(cll_duration),
        cll_room = Value(cll_room),
        cll_type = Value(cll_type),
        cll_zone = Value(cll_zone),
        cll_unit_ID = Value(cll_unit_ID),
        cll_db_ref_id = Value(cll_db_ref_id),
        cll_db_date_id = Value(cll_db_date_id),
        cll_db_time_id = Value(cll_db_time_id),
        cll_call_group_ID = Value(cll_call_group_ID),
        cll_worked_through = Value(cll_worked_through),
        cll_carer = Value(cll_carer),
        cll_call_tracking_ref = Value(cll_call_tracking_ref),
        cll_clear = Value(cll_clear),
        cll_fb_record_id = Value(cll_fb_record_id),
        cll_panel_name = Value(cll_panel_name),
        cll_journey_ref = Value(cll_journey_ref),
        cll_caregroup = Value(cll_caregroup),
        cll_carehome = Value(cll_carehome),
        careHome_id = Value(careHome_id);
  static Insertable<CallTableData> custom({
    Expression<int>? callId,
    Expression<String>? site_Id,
    Expression<DateTime>? cll_start_date,
    Expression<DateTime>? cll_end_date,
    Expression<String>? cll_duration,
    Expression<String>? cll_room,
    Expression<String>? cll_type,
    Expression<String>? cll_zone,
    Expression<String>? cll_unit_ID,
    Expression<String>? cll_db_ref_id,
    Expression<String>? cll_db_date_id,
    Expression<String>? cll_db_time_id,
    Expression<String>? cll_call_group_ID,
    Expression<String>? cll_worked_through,
    Expression<String>? cll_carer,
    Expression<String>? cll_call_tracking_ref,
    Expression<String>? cll_clear,
    Expression<String>? cll_fb_record_id,
    Expression<String>? cll_panel_name,
    Expression<String>? cll_journey_ref,
    Expression<String>? cll_caregroup,
    Expression<String>? cll_carehome,
    Expression<String>? careHome_id,
  }) {
    return RawValuesInsertable({
      if (callId != null) 'call_id': callId,
      if (site_Id != null) 'site_id': site_Id,
      if (cll_start_date != null) 'cll_Start_dat': cll_start_date,
      if (cll_end_date != null) 'cll_end_dat': cll_end_date,
      if (cll_duration != null) 'call_duration': cll_duration,
      if (cll_room != null) 'cll_room': cll_room,
      if (cll_type != null) 'cll_type': cll_type,
      if (cll_zone != null) 'cll_zone': cll_zone,
      if (cll_unit_ID != null) 'cll_unit_ID': cll_unit_ID,
      if (cll_db_ref_id != null) 'cll_db_ref_id ': cll_db_ref_id,
      if (cll_db_date_id != null) 'cll_db_date_id': cll_db_date_id,
      if (cll_db_time_id != null) 'cll_db_time_id': cll_db_time_id,
      if (cll_call_group_ID != null) 'cll_call_group_ID': cll_call_group_ID,
      if (cll_worked_through != null) 'cll_worked_through ': cll_worked_through,
      if (cll_carer != null) 'cll_carer': cll_carer,
      if (cll_call_tracking_ref != null)
        'cll_call_tracking_ref': cll_call_tracking_ref,
      if (cll_clear != null) 'cll_clear ': cll_clear,
      if (cll_fb_record_id != null) 'cll_fb_record_id ': cll_fb_record_id,
      if (cll_panel_name != null) 'cll_panel_name ': cll_panel_name,
      if (cll_journey_ref != null) 'cll_journey_ref ': cll_journey_ref,
      if (cll_caregroup != null) 'cll_caregroup ': cll_caregroup,
      if (cll_carehome != null) 'cll_carehome': cll_carehome,
      if (careHome_id != null) 'careHome_id ': careHome_id,
    });
  }

  CallTableCompanion copyWith(
      {Value<int>? callId,
      Value<String>? site_Id,
      Value<DateTime>? cll_start_date,
      Value<DateTime>? cll_end_date,
      Value<String>? cll_duration,
      Value<String>? cll_room,
      Value<String>? cll_type,
      Value<String>? cll_zone,
      Value<String>? cll_unit_ID,
      Value<String>? cll_db_ref_id,
      Value<String>? cll_db_date_id,
      Value<String>? cll_db_time_id,
      Value<String>? cll_call_group_ID,
      Value<String>? cll_worked_through,
      Value<String>? cll_carer,
      Value<String>? cll_call_tracking_ref,
      Value<String>? cll_clear,
      Value<String>? cll_fb_record_id,
      Value<String>? cll_panel_name,
      Value<String>? cll_journey_ref,
      Value<String>? cll_caregroup,
      Value<String>? cll_carehome,
      Value<String>? careHome_id}) {
    return CallTableCompanion(
      callId: callId ?? this.callId,
      site_Id: site_Id ?? this.site_Id,
      cll_start_date: cll_start_date ?? this.cll_start_date,
      cll_end_date: cll_end_date ?? this.cll_end_date,
      cll_duration: cll_duration ?? this.cll_duration,
      cll_room: cll_room ?? this.cll_room,
      cll_type: cll_type ?? this.cll_type,
      cll_zone: cll_zone ?? this.cll_zone,
      cll_unit_ID: cll_unit_ID ?? this.cll_unit_ID,
      cll_db_ref_id: cll_db_ref_id ?? this.cll_db_ref_id,
      cll_db_date_id: cll_db_date_id ?? this.cll_db_date_id,
      cll_db_time_id: cll_db_time_id ?? this.cll_db_time_id,
      cll_call_group_ID: cll_call_group_ID ?? this.cll_call_group_ID,
      cll_worked_through: cll_worked_through ?? this.cll_worked_through,
      cll_carer: cll_carer ?? this.cll_carer,
      cll_call_tracking_ref:
          cll_call_tracking_ref ?? this.cll_call_tracking_ref,
      cll_clear: cll_clear ?? this.cll_clear,
      cll_fb_record_id: cll_fb_record_id ?? this.cll_fb_record_id,
      cll_panel_name: cll_panel_name ?? this.cll_panel_name,
      cll_journey_ref: cll_journey_ref ?? this.cll_journey_ref,
      cll_caregroup: cll_caregroup ?? this.cll_caregroup,
      cll_carehome: cll_carehome ?? this.cll_carehome,
      careHome_id: careHome_id ?? this.careHome_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (callId.present) {
      map['call_id'] = Variable<int>(callId.value);
    }
    if (site_Id.present) {
      map['site_id'] = Variable<String>(site_Id.value);
    }
    if (cll_start_date.present) {
      map['cll_Start_dat'] = Variable<DateTime>(cll_start_date.value);
    }
    if (cll_end_date.present) {
      map['cll_end_dat'] = Variable<DateTime>(cll_end_date.value);
    }
    if (cll_duration.present) {
      map['call_duration'] = Variable<String>(cll_duration.value);
    }
    if (cll_room.present) {
      map['cll_room'] = Variable<String>(cll_room.value);
    }
    if (cll_type.present) {
      map['cll_type'] = Variable<String>(cll_type.value);
    }
    if (cll_zone.present) {
      map['cll_zone'] = Variable<String>(cll_zone.value);
    }
    if (cll_unit_ID.present) {
      map['cll_unit_ID'] = Variable<String>(cll_unit_ID.value);
    }
    if (cll_db_ref_id.present) {
      map['cll_db_ref_id '] = Variable<String>(cll_db_ref_id.value);
    }
    if (cll_db_date_id.present) {
      map['cll_db_date_id'] = Variable<String>(cll_db_date_id.value);
    }
    if (cll_db_time_id.present) {
      map['cll_db_time_id'] = Variable<String>(cll_db_time_id.value);
    }
    if (cll_call_group_ID.present) {
      map['cll_call_group_ID'] = Variable<String>(cll_call_group_ID.value);
    }
    if (cll_worked_through.present) {
      map['cll_worked_through '] = Variable<String>(cll_worked_through.value);
    }
    if (cll_carer.present) {
      map['cll_carer'] = Variable<String>(cll_carer.value);
    }
    if (cll_call_tracking_ref.present) {
      map['cll_call_tracking_ref'] =
          Variable<String>(cll_call_tracking_ref.value);
    }
    if (cll_clear.present) {
      map['cll_clear '] = Variable<String>(cll_clear.value);
    }
    if (cll_fb_record_id.present) {
      map['cll_fb_record_id '] = Variable<String>(cll_fb_record_id.value);
    }
    if (cll_panel_name.present) {
      map['cll_panel_name '] = Variable<String>(cll_panel_name.value);
    }
    if (cll_journey_ref.present) {
      map['cll_journey_ref '] = Variable<String>(cll_journey_ref.value);
    }
    if (cll_caregroup.present) {
      map['cll_caregroup '] = Variable<String>(cll_caregroup.value);
    }
    if (cll_carehome.present) {
      map['cll_carehome'] = Variable<String>(cll_carehome.value);
    }
    if (careHome_id.present) {
      map['careHome_id '] = Variable<String>(careHome_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CallTableCompanion(')
          ..write('callId: $callId, ')
          ..write('site_Id: $site_Id, ')
          ..write('cll_start_date: $cll_start_date, ')
          ..write('cll_end_date: $cll_end_date, ')
          ..write('cll_duration: $cll_duration, ')
          ..write('cll_room: $cll_room, ')
          ..write('cll_type: $cll_type, ')
          ..write('cll_zone: $cll_zone, ')
          ..write('cll_unit_ID: $cll_unit_ID, ')
          ..write('cll_db_ref_id: $cll_db_ref_id, ')
          ..write('cll_db_date_id: $cll_db_date_id, ')
          ..write('cll_db_time_id: $cll_db_time_id, ')
          ..write('cll_call_group_ID: $cll_call_group_ID, ')
          ..write('cll_worked_through: $cll_worked_through, ')
          ..write('cll_carer: $cll_carer, ')
          ..write('cll_call_tracking_ref: $cll_call_tracking_ref, ')
          ..write('cll_clear: $cll_clear, ')
          ..write('cll_fb_record_id: $cll_fb_record_id, ')
          ..write('cll_panel_name: $cll_panel_name, ')
          ..write('cll_journey_ref: $cll_journey_ref, ')
          ..write('cll_caregroup: $cll_caregroup, ')
          ..write('cll_carehome: $cll_carehome, ')
          ..write('careHome_id: $careHome_id')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CallTableTable callTable = $CallTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [callTable];
}
