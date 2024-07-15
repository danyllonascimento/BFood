import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? RoteamentoWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? RoteamentoWidget() : LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'homePageGarcon',
          path: '/homePageGarcon',
          builder: (context, params) => HomePageGarconWidget(),
        ),
        FFRoute(
          name: 'pedidosPage',
          path: '/pedidosPage',
          builder: (context, params) => PedidosPageWidget(),
        ),
        FFRoute(
          name: 'detalhesPedido',
          path: '/detalhesPedido',
          builder: (context, params) => DetalhesPedidoWidget(
            pedidoRef: params.getParam(
              'pedidoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'pedidos'],
            ),
          ),
        ),
        FFRoute(
          name: 'produtosEstabelecimento',
          path: '/produtosEstabelecimento',
          builder: (context, params) => ProdutosEstabelecimentoWidget(),
        ),
        FFRoute(
          name: 'homePageAdmin',
          path: '/homePageAdmin',
          builder: (context, params) => HomePageAdminWidget(),
        ),
        FFRoute(
          name: 'Estabelecimentos',
          path: '/estabelecimentos',
          builder: (context, params) => EstabelecimentosWidget(),
        ),
        FFRoute(
          name: 'Roteamento',
          path: '/roteamento',
          builder: (context, params) => RoteamentoWidget(),
        ),
        FFRoute(
          name: 'categoriaProduto',
          path: '/categoriaProduto',
          builder: (context, params) => CategoriaProdutoWidget(
            categoriaRef: params.getParam(
              'categoriaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'categorias'],
            ),
          ),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'homeEstabelecimento',
          path: '/homeEstabelecimento',
          builder: (context, params) => HomeEstabelecimentoWidget(),
        ),
        FFRoute(
          name: 'Criar_Produto',
          path: '/criarProduto',
          builder: (context, params) => CriarProdutoWidget(),
        ),
        FFRoute(
          name: 'Criar_Categoria',
          path: '/criarCategoria',
          builder: (context, params) => CriarCategoriaWidget(),
        ),
        FFRoute(
          name: 'Criar_Garcon',
          path: '/criarGarcon',
          builder: (context, params) => CriarGarconWidget(),
        ),
        FFRoute(
          name: 'categoriasEstabelecimento',
          path: '/categoriasEstabelecimento',
          builder: (context, params) => CategoriasEstabelecimentoWidget(),
        ),
        FFRoute(
          name: 'garcons',
          path: '/garcons',
          builder: (context, params) => GarconsWidget(),
        ),
        FFRoute(
          name: 'Criar_Mesa',
          path: '/criarMesa',
          builder: (context, params) => CriarMesaWidget(),
        ),
        FFRoute(
          name: 'Editar_Produto',
          path: '/editarProduto',
          builder: (context, params) => EditarProdutoWidget(
            refProduto: params.getParam(
              'refProduto',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'produtos'],
            ),
          ),
        ),
        FFRoute(
          name: 'Pagina_Produto',
          path: '/paginaProduto',
          builder: (context, params) => PaginaProdutoWidget(
            refProduto: params.getParam(
              'refProduto',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'produtos'],
            ),
            mesa: params.getParam(
              'mesa',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'mesas'],
            ),
          ),
        ),
        FFRoute(
          name: 'Editar_Categoria',
          path: '/editarCategoria',
          builder: (context, params) => EditarCategoriaWidget(
            categoriaRef: params.getParam(
              'categoriaRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'categorias'],
            ),
          ),
        ),
        FFRoute(
          name: 'Pedido_Mesa',
          path: '/pedidoMesa',
          builder: (context, params) => PedidoMesaWidget(),
        ),
        FFRoute(
          name: 'Pedidos_garcom',
          path: '/pedidosGarcom',
          builder: (context, params) => PedidosGarcomWidget(),
        ),
        FFRoute(
          name: 'Editar_Perfil_garcom',
          path: '/editarPerfilGarcom',
          builder: (context, params) => EditarPerfilGarcomWidget(),
        ),
        FFRoute(
          name: 'Editar_Estabelecimento',
          path: '/editarEstabelecimento',
          builder: (context, params) => EditarEstabelecimentoWidget(),
        ),
        FFRoute(
          name: 'Editar_Pedido',
          path: '/editarPedido',
          builder: (context, params) => EditarPedidoWidget(
            refPedido: params.getParam(
              'refPedido',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'pedidos'],
            ),
          ),
        ),
        FFRoute(
          name: 'PageMesa',
          path: '/pageMesa',
          builder: (context, params) => PageMesaWidget(
            mesa: params.getParam(
              'mesa',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'mesas'],
            ),
          ),
        ),
        FFRoute(
          name: 'CardapioQR',
          path: '/cardapioQR',
          builder: (context, params) => CardapioQRWidget(
            mesa: params.getParam(
              'mesa',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'mesas'],
            ),
            esta: params.getParam(
              'esta',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos'],
            ),
          ),
        ),
        FFRoute(
          name: 'CarrinhoQR',
          path: '/carrinhoQR',
          builder: (context, params) => CarrinhoQRWidget(
            mesa: params.getParam(
              'mesa',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'mesas'],
            ),
            esta: params.getParam(
              'esta',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos'],
            ),
          ),
        ),
        FFRoute(
          name: 'Editar_Mesa',
          path: '/editarMesa',
          builder: (context, params) => EditarMesaWidget(
            mesa: params.getParam(
              'mesa',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['estabelecimentos', 'mesas'],
            ),
          ),
        ),
        FFRoute(
          name: 'homePageAddProduto',
          path: '/homePageAddProduto',
          builder: (context, params) => HomePageAddProdutoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/IconApp.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
