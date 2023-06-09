import 'package:arquella_hub/model/db/appdb.dart';
import 'package:arquella_hub/view/widgets/custem_text_form_field.dart';
import 'package:arquella_hub/view/widgets/custom_date_picker_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;

class EditCallPage extends StatefulWidget {
  const EditCallPage({super.key});

  @override
  State<EditCallPage> createState() => _EditCallPageState();
}

class _EditCallPageState extends State<EditCallPage> {
  late AppDb _db;

  final TextEditingController _siteIdController = TextEditingController();
  final TextEditingController _callDurationController = TextEditingController();
  final TextEditingController _cll_roomController = TextEditingController();
  final TextEditingController cll_zoneController = TextEditingController();
  final TextEditingController cll_typeController = TextEditingController();
  final TextEditingController _cll_unit_ID_Controller = TextEditingController();
  final TextEditingController cll_db_ref_id_controller =
      TextEditingController();
  final TextEditingController _callStartDateController =
      TextEditingController();
  final TextEditingController cll_db_date_id_Controller =
      TextEditingController();
  final TextEditingController cll_db_time_id_Controller =
      TextEditingController();
  final TextEditingController cll_call_group_ID_controller =
      TextEditingController();

  final TextEditingController _callendDateController = TextEditingController();
  final TextEditingController cll_worked_through_Controller =
      TextEditingController();
  final TextEditingController cll_carer_Controller = TextEditingController();
  final TextEditingController cll_call_tracking_ref_controller =
      TextEditingController();
  final TextEditingController cll_clear_controller = TextEditingController();
  final TextEditingController cll_fb_record_id_Controller =
      TextEditingController();
  final TextEditingController cll_panel_name_Controller =
      TextEditingController();
  final TextEditingController cll_journey_ref_controller =
      TextEditingController();
  final TextEditingController cll_caregroup_controller =
      TextEditingController();
  final TextEditingController cll_carehome_controller = TextEditingController();
  final TextEditingController careHome_id_Controller = TextEditingController();

  DateTime? _callstrtDate;
  DateTime? _callendDate;

  @override
  void initState() {
    super.initState();

    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    _siteIdController.dispose();
    _callDurationController.dispose();
    _callStartDateController.dispose();
    _callendDateController.dispose();
    cll_zoneController.dispose();
    _cll_roomController.dispose();
    cll_typeController.dispose();
    cll_db_date_id_Controller.dispose();
    cll_db_ref_id_controller.dispose();
    cll_db_time_id_Controller.dispose();
    cll_call_group_ID_controller.dispose();
    _cll_unit_ID_Controller.dispose();
    cll_fb_record_id_Controller.dispose();
    careHome_id_Controller.dispose();
    cll_panel_name_Controller.dispose();
    cll_worked_through_Controller.dispose();
    cll_carer_Controller.dispose();
    cll_call_tracking_ref_controller.dispose();
    cll_clear_controller.dispose();
    cll_caregroup_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Care Call"),
        centerTitle: true,
        actions: [IconButton(onPressed: addCall, icon: const Icon(Icons.save))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            CustomTextFormField(
                controller: _siteIdController, txtLabel: 'site Id'),
            const SizedBox(
              height: 15,
            ),
            CustomDatePicker(
                controller: _callStartDateController,
                txtLabel: 'Call Start Date',
                callback: () {
                  pickcallStartDate(context);
                }),
            const SizedBox(
              height: 15,
            ),
            CustomDatePicker(
                controller: _callendDateController,
                txtLabel: 'Call End Date',
                callback: () {
                  pickCallEndDate(context);
                }),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: _callDurationController,
              txtLabel: 'Call Duration',
            ),
            const SizedBox(height: 15),
            CustomTextFormField(
                controller: _cll_roomController, txtLabel: 'Calll Room'),
            const SizedBox(height: 15),
            CustomTextFormField(
                controller: cll_zoneController, txtLabel: 'Call zone'),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_typeController, txtLabel: 'Call typpe'),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: _cll_unit_ID_Controller, txtLabel: 'Call unit ID'),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_db_ref_id_controller, txtLabel: "Call Db  Ref"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_db_date_id_Controller,
                txtLabel: "cll_db_date_id "),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_db_time_id_Controller,
                txtLabel: "cll_db_time_id"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_call_group_ID_controller,
                txtLabel: "cll_call_group_ID"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_worked_through_Controller,
                txtLabel: "cll_worked_through"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_carer_Controller, txtLabel: "cll_carer"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_call_tracking_ref_controller,
                txtLabel: "cll_call_tracking_ref"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_clear_controller, txtLabel: "cll_clear"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_fb_record_id_Controller,
                txtLabel: "cll_fb_record_id"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_panel_name_Controller,
                txtLabel: "cll_panel_name"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_journey_ref_controller,
                txtLabel: "cll_journey_ref"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_caregroup_controller,
                txtLabel: "cll_caregroup"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: cll_carehome_controller, txtLabel: "cll_careHome"),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                controller: careHome_id_Controller, txtLabel: "careHome_id"),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickcallStartDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _callstrtDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: const ColorScheme.light(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      onSurface: Colors.black)),
              child: child ?? const Text(''),
            ));
    if (newDate == null) {
      return;
    }
    setState(() {
      _callstrtDate = newDate;
      String cllsrtdate = DateFormat('dd/MM/yyyy').format(newDate);
      _callStartDateController.text = cllsrtdate;
    });
  }

  Future<void> pickCallEndDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _callendDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: const ColorScheme.light(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      onSurface: Colors.black)),
              child: child ?? const Text(''),
            ));
    if (newDate == null) {
      return;
    }
    setState(() {
      _callstrtDate = newDate;
      String cllsrtdate = DateFormat('dd/MM/yyyy').format(newDate);
      _callendDateController.text = cllsrtdate;
    });
  }

  void addCall() {
    final entity = CallTableCompanion(
      site_Id: drift.Value(_siteIdController.text),
      cll_start_date: drift.Value(DateTime.now()),
      cll_end_date: drift.Value(DateTime.now()),
      cll_duration: drift.Value(_callDurationController.text),
      cll_room: drift.Value(_cll_roomController.text),
      cll_type: drift.Value(cll_typeController.text),
      cll_zone: drift.Value(cll_zoneController.text),
      cll_unit_ID: drift.Value(_cll_unit_ID_Controller.text),
      cll_db_ref_id: drift.Value(cll_db_ref_id_controller.text),
      cll_db_date_id: drift.Value(cll_db_date_id_Controller.text),
      cll_db_time_id: drift.Value(cll_db_time_id_Controller.text),
      cll_call_group_ID: drift.Value(cll_call_group_ID_controller.text),
      cll_worked_through: drift.Value(cll_worked_through_Controller.text),
      cll_carer: drift.Value(cll_carer_Controller.text),
      cll_call_tracking_ref: drift.Value(cll_call_tracking_ref_controller.text),
      cll_clear: drift.Value(cll_clear_controller.text),
      cll_fb_record_id: drift.Value(cll_fb_record_id_Controller.text),
      cll_journey_ref: drift.Value(cll_journey_ref_controller.text),
      cll_panel_name: drift.Value(cll_panel_name_Controller.text),
      careHome_id: drift.Value(careHome_id_Controller.text),
      cll_caregroup: drift.Value(cll_caregroup_controller.text),
      cll_carehome: drift.Value(cll_carehome_controller.text),
    );
    _db
        .insertCall(entity)
        .then((value) => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                content: Text(
                  "New Call Created: $value",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
