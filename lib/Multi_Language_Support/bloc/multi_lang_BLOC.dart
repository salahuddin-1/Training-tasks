import 'package:flutter/cupertino.dart';
import 'package:neosoft_training_tasks/l10n/l10n.dart';
import 'package:rxdart/rxdart.dart';

class MultiLangBLOC {
  Locale? get locale => _streamCntrl.value;

  final _streamCntrl = BehaviorSubject<Locale?>.seeded(Locale('en'));

  Stream<Locale?> get stream => _streamCntrl.stream;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _streamCntrl.add(locale);
  }

  void clearLocale() {
    _streamCntrl.add(null);
  }

  void dispose() {
    _streamCntrl.close();
  }
}
