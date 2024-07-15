import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/box_produto/box_produto_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'adicionar_produt_pedido_widget.dart' show AdicionarProdutPedidoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarProdutPedidoModel
    extends FlutterFlowModel<AdicionarProdutPedidoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for BoxProduto component.
  late BoxProdutoModel boxProdutoModel;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    boxProdutoModel = createModel(context, () => BoxProdutoModel());
  }

  @override
  void dispose() {
    boxProdutoModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
