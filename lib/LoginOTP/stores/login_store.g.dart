// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$isLoginLoadingAtom = Atom(name: 'LoginStoreBase.isLoginLoading');

  @override
  bool get isLoginLoading {
    _$isLoginLoadingAtom.reportRead();
    return super.isLoginLoading;
  }

  @override
  set isLoginLoading(bool value) {
    _$isLoginLoadingAtom.reportWrite(value, super.isLoginLoading, () {
      super.isLoginLoading = value;
    });
  }

  final _$isOtpLoadingAtom = Atom(name: 'LoginStoreBase.isOtpLoading');

  @override
  bool get isOtpLoading {
    _$isOtpLoadingAtom.reportRead();
    return super.isOtpLoading;
  }

  @override
  set isOtpLoading(bool value) {
    _$isOtpLoadingAtom.reportWrite(value, super.isOtpLoading, () {
      super.isOtpLoading = value;
    });
  }

  final _$loginScaffoldKeyAtom = Atom(name: 'LoginStoreBase.loginScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get loginScaffoldKey {
    _$loginScaffoldKeyAtom.reportRead();
    return super.loginScaffoldKey;
  }

  @override
  set loginScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$loginScaffoldKeyAtom.reportWrite(value, super.loginScaffoldKey, () {
      super.loginScaffoldKey = value;
    });
  }

  final _$otpScaffoldKeyAtom = Atom(name: 'LoginStoreBase.otpScaffoldKey');

  @override
  GlobalKey<ScaffoldState> get otpScaffoldKey {
    _$otpScaffoldKeyAtom.reportRead();
    return super.otpScaffoldKey;
  }

  @override
  set otpScaffoldKey(GlobalKey<ScaffoldState> value) {
    _$otpScaffoldKeyAtom.reportWrite(value, super.otpScaffoldKey, () {
      super.otpScaffoldKey = value;
    });
  }

  final _$firebaseUserAtom = Atom(name: 'LoginStoreBase.firebaseUser');

  @override
  FirebaseUser get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(FirebaseUser value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('LoginStoreBase.isAlreadyAuthenticated');

  @override
  Future<bool> isAlreadyAuthenticated() {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated());
  }

  final _$getCodeWithPhoneNumberAsyncAction =
      AsyncAction('LoginStoreBase.getCodeWithPhoneNumber');

  @override
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) {
    return _$getCodeWithPhoneNumberAsyncAction
        .run(() => super.getCodeWithPhoneNumber(context, phoneNumber));
  }

  final _$validateOtpAndLoginAsyncAction =
      AsyncAction('LoginStoreBase.validateOtpAndLogin');

  @override
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) {
    return _$validateOtpAndLoginAsyncAction
        .run(() => super.validateOtpAndLogin(context, smsCode));
  }

  final _$signOutAsyncAction = AsyncAction('LoginStoreBase.signOut');

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  @override
  String toString() {
    return '''
isLoginLoading: ${isLoginLoading},
isOtpLoading: ${isOtpLoading},
loginScaffoldKey: ${loginScaffoldKey},
otpScaffoldKey: ${otpScaffoldKey},
firebaseUser: ${firebaseUser}
    ''';
  }
}
