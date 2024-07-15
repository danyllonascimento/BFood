import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'login_widget.dart' show LoginWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for tfCdigo widget.
  FocusNode? tfCdigoFocusNode;
  TextEditingController? tfCdigoTextController;
  String? Function(BuildContext, String?)? tfCdigoTextControllerValidator;
  String? _tfCdigoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for nomeEstab widget.
  FocusNode? nomeEstabFocusNode;
  TextEditingController? nomeEstabTextController;
  String? Function(BuildContext, String?)? nomeEstabTextControllerValidator;
  String? _nomeEstabTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 3) {
      return 'Mínimo de 3 caractéres';
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for passwordCad widget.
  FocusNode? passwordCadFocusNode;
  TextEditingController? passwordCadTextController;
  late bool passwordCadVisibility;
  String? Function(BuildContext, String?)? passwordCadTextControllerValidator;
  String? _passwordCadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 8) {
      return 'Mínimo de 8 caractéres';
    }

    return null;
  }

  // State field(s) for passwordConfirmCad widget.
  FocusNode? passwordConfirmCadFocusNode;
  TextEditingController? passwordConfirmCadTextController;
  late bool passwordConfirmCadVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmCadTextControllerValidator;
  String? _passwordConfirmCadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 8) {
      return 'Mínimo de 8 caractéres';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EstabelecimentosRecord? estabelecimento;
  // State field(s) for emailLogin widget.
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginTextController;
  String? Function(BuildContext, String?)? emailLoginTextControllerValidator;
  // State field(s) for passwordLogin widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tfCdigoTextControllerValidator = _tfCdigoTextControllerValidator;
    nomeEstabTextControllerValidator = _nomeEstabTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordCadVisibility = false;
    passwordCadTextControllerValidator = _passwordCadTextControllerValidator;
    passwordConfirmCadVisibility = false;
    passwordConfirmCadTextControllerValidator =
        _passwordConfirmCadTextControllerValidator;
    passwordLoginVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    tfCdigoFocusNode?.dispose();
    tfCdigoTextController?.dispose();

    nomeEstabFocusNode?.dispose();
    nomeEstabTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordCadFocusNode?.dispose();
    passwordCadTextController?.dispose();

    passwordConfirmCadFocusNode?.dispose();
    passwordConfirmCadTextController?.dispose();

    emailLoginFocusNode?.dispose();
    emailLoginTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();
  }
}
