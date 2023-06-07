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
  final TextEditingController _callendDateController = TextEditingController();
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
            CustomDatePicker(
                controller: _callStartDateController,
                txtLabel: 'Call Start Date',
                callback: () {
                  pickcallStartDate(context);
                }),
            CustomDatePicker(
                controller: _callendDateController,
                txtLabel: 'Birth Date',
                callback: () {
                  pickCallEndDate(context);
                }),
            CustomTextFormField(
              controller: _callDurationController,
              txtLabel: 'Call Duration',
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
                controller: _cll_roomController, txtLabel: 'Calll Room'),
            const SizedBox(height: 8),
            CustomTextFormField(
                controller: cll_zoneController, txtLabel: 'Call zone'),
            CustomTextFormField(
                controller: cll_typeController, txtLabel: 'Call typpe'),
            CustomTextFormField(
                controller: _cll_unit_ID_Controller, txtLabel: 'Call unit ID'),
            const SizedBox(height: 8),
            CustomTextFormField(
                controller: cll_db_ref_id_controller, txtLabel: "Call Db  Ref")
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
}
