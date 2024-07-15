import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'criar_mesa_widget.dart' show CriarMesaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarMesaModel extends FlutterFlowModel<CriarMesaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldNumeroMesa widget.
  FocusNode? textFieldNumeroMesaFocusNode;
  TextEditingController? textFieldNumeroMesaTextController;
  String? Function(BuildContext, String?)?
      textFieldNumeroMesaTextControllerValidator;
  String? _textFieldNumeroMesaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldDescricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MesasRecord? mesa;

  @override
  void initState(BuildContext context) {
    textFieldNumeroMesaTextControllerValidator =
        _textFieldNumeroMesaTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNumeroMesaFocusNode?.dispose();
    textFieldNumeroMesaTextController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();
  }
}
