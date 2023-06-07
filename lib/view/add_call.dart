import 'package:arquella_hub/view/widgets/custem_text_form_field.dart';
import 'package:arquella_hub/view/widgets/custom_date_picker_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCallPage extends StatefulWidget {
  const AddCallPage({super.key});

  @override
  State<AddCallPage> createState() => _AddCallPageState();
}

class _AddCallPageState extends State<AddCallPage> {
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
  final TextEditingController created_at_controller = TextEditingController();
  final TextEditingController updated_at_controller = TextEditingController();
  DateTime? created_at;
  DateTime? updated_at;
  DateTime? _callstrtDate;
  DateTime? _callendDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Care Call"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
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
                txtLabel: 'Birth Date',
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
            CustomDatePicker(
                controller: updated_at_controller,
                txtLabel: "updated_at",
                callback: () {
                  pickupdatedAtDate(context);
                }),
            const SizedBox(
              height: 15,
            ),
            CustomDatePicker(
                controller: created_at_controller,
                txtLabel: "createdAt",
                callback: () {
                  pickcreatedAtDate(context);
                })
          ],
        ),
      ),
    );
  }

  Future<void> pickcreatedAtDate(BuildContext context) async {
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

  Future<void> pickupdatedAtDate(BuildContext context) async {
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
}
