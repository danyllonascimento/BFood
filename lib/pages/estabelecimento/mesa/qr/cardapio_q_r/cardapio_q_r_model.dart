import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/box_produto/box_produto_widget.dart';
import '/components/drawer/drawer_widget.dart';
import '/components/empty_list_horizontal/empty_list_horizontal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cardapio_q_r_widget.dart' show CardapioQRWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CardapioQRModel extends FlutterFlowModel<CardapioQRWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProdutosRecord> simpleSearchResults = [];
  // Model for drawer component.
  late DrawerModel drawerModel;
  // Stores action output result for [Custom Action - somarTotalCarrinho] action in FloatingActionButton widget.
  double? total;
  // Stores action output result for [Custom Action - recuperarMesaEstabelecimento] action in FloatingActionButton widget.
  MesaEstaStruct? re;

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    drawerModel.dispose();
  }
}
