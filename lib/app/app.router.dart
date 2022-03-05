// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../exports.dart';

class Routes {
  static const String homeView = '/';
  static const String helpView = '/help-view';
  static const String historyView = '/history-view';
  static const all = <String>{
    homeView,
    helpView,
    historyView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.helpView, page: HelpView),
    RouteDef(Routes.historyView, page: HistoryView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    HelpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HelpView(),
        settings: data,
      );
    },
    HistoryView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HistoryView(),
        settings: data,
      );
    },
  };
}
