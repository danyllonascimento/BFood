import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _produtosCarrinho = prefs
              .getStringList('ff_produtosCarrinho')
              ?.map((x) {
                try {
                  return ProdutoAddStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _produtosCarrinho;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_editMode')) {
        try {
          final serializedData = prefs.getString('ff_editMode') ?? '{}';
          _editMode =
              EditModeStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_QrPedido')) {
        try {
          final serializedData = prefs.getString('ff_QrPedido') ?? '{}';
          _QrPedido =
              QrPedidoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _initPedidoQR = prefs.getBool('ff_initPedidoQR') ?? _initPedidoQR;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _updateApp = false;
  bool get updateApp => _updateApp;
  set updateApp(bool value) {
    _updateApp = value;
  }

  double _valorProduto = 0.0;
  double get valorProduto => _valorProduto;
  set valorProduto(double value) {
    _valorProduto = value;
  }

  List<ProdutoAddStruct> _produtosCarrinho = [];
  List<ProdutoAddStruct> get produtosCarrinho => _produtosCarrinho;
  set produtosCarrinho(List<ProdutoAddStruct> value) {
    _produtosCarrinho = value;
    prefs.setStringList(
        'ff_produtosCarrinho', value.map((x) => x.serialize()).toList());
  }

  void addToProdutosCarrinho(ProdutoAddStruct value) {
    produtosCarrinho.add(value);
    prefs.setStringList('ff_produtosCarrinho',
        _produtosCarrinho.map((x) => x.serialize()).toList());
  }

  void removeFromProdutosCarrinho(ProdutoAddStruct value) {
    produtosCarrinho.remove(value);
    prefs.setStringList('ff_produtosCarrinho',
        _produtosCarrinho.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProdutosCarrinho(int index) {
    produtosCarrinho.removeAt(index);
    prefs.setStringList('ff_produtosCarrinho',
        _produtosCarrinho.map((x) => x.serialize()).toList());
  }

  void updateProdutosCarrinhoAtIndex(
    int index,
    ProdutoAddStruct Function(ProdutoAddStruct) updateFn,
  ) {
    produtosCarrinho[index] = updateFn(_produtosCarrinho[index]);
    prefs.setStringList('ff_produtosCarrinho',
        _produtosCarrinho.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProdutosCarrinho(int index, ProdutoAddStruct value) {
    produtosCarrinho.insert(index, value);
    prefs.setStringList('ff_produtosCarrinho',
        _produtosCarrinho.map((x) => x.serialize()).toList());
  }

  double _totalCarrinho = 0.0;
  double get totalCarrinho => _totalCarrinho;
  set totalCarrinho(double value) {
    _totalCarrinho = value;
  }

  String _mesaAtual = '';
  String get mesaAtual => _mesaAtual;
  set mesaAtual(String value) {
    _mesaAtual = value;
  }

  EditModeStruct _editMode = EditModeStruct();
  EditModeStruct get editMode => _editMode;
  set editMode(EditModeStruct value) {
    _editMode = value;
    prefs.setString('ff_editMode', value.serialize());
  }

  void updateEditModeStruct(Function(EditModeStruct) updateFn) {
    updateFn(_editMode);
    prefs.setString('ff_editMode', _editMode.serialize());
  }

  QrPedidoStruct _QrPedido = QrPedidoStruct();
  QrPedidoStruct get QrPedido => _QrPedido;
  set QrPedido(QrPedidoStruct value) {
    _QrPedido = value;
    prefs.setString('ff_QrPedido', value.serialize());
  }

  void updateQrPedidoStruct(Function(QrPedidoStruct) updateFn) {
    updateFn(_QrPedido);
    prefs.setString('ff_QrPedido', _QrPedido.serialize());
  }

  bool _initPedidoQR = false;
  bool get initPedidoQR => _initPedidoQR;
  set initPedidoQR(bool value) {
    _initPedidoQR = value;
    prefs.setBool('ff_initPedidoQR', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
