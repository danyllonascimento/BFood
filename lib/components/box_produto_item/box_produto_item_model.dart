import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'box_produto_item_widget.dart' show BoxProdutoItemWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BoxProdutoItemModel extends FlutterFlowModel<BoxProdutoItemWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - somarTotalCarrinho] action in Icon widget.
  double? totalCarrinho;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Custom Action - somarTotalCarrinho] action in CountController widget.
  double? totalW;
  // Stores action output result for [Custom Action - somarTotalCarrinho] action in CountController widget.
  double? total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
