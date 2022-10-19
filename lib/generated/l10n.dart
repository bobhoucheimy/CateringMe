// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened`
  String get errorHappened {
    return Intl.message(
      'Error Happened',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Data`
  String get errorLoadingData {
    return Intl.message(
      'Error Loading Data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Email Address is Required`
  String get emailAddressIsRequired {
    return Intl.message(
      'Email Address is Required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please input phone number`
  String get pleaseInputPhoneNumber {
    return Intl.message(
      'Please input phone number',
      name: 'pleaseInputPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePass {
    return Intl.message(
      'Change password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPass {
    return Intl.message(
      'Old password',
      name: 'oldPass',
      desc: '',
      args: [],
    );
  }

  /// `incorrect old password`
  String get wrongPass {
    return Intl.message(
      'incorrect old password',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `Company info`
  String get companyInfo {
    return Intl.message(
      'Company info',
      name: 'companyInfo',
      desc: '',
      args: [],
    );
  }

  /// `networkError`
  String get networkError {
    return Intl.message(
      'networkError',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `username or password is wrong`
  String get invalidCredentials {
    return Intl.message(
      'username or password is wrong',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `please Complete Field`
  String get pleaseCompleteField {
    return Intl.message(
      'please Complete Field',
      name: 'pleaseCompleteField',
      desc: '',
      args: [],
    );
  }

  /// `password Is Too Short`
  String get passwordIsTooShort {
    return Intl.message(
      'password Is Too Short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `refresh`
  String get refresh {
    return Intl.message(
      'refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Occasions`
  String get occasions {
    return Intl.message(
      'Occasions',
      name: 'occasions',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message(
      'Terms',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Quantity`
  String get minQuantity {
    return Intl.message(
      'Minimum Quantity',
      name: 'minQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Quantity`
  String get maxQuantity {
    return Intl.message(
      'Maximum Quantity',
      name: 'maxQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get Item {
    return Intl.message(
      'Item',
      name: 'Item',
      desc: '',
      args: [],
    );
  }

  /// ` SAR `
  String get sar {
    return Intl.message(
      ' SAR ',
      name: 'sar',
      desc: '',
      args: [],
    );
  }

  /// `Increment`
  String get increment {
    return Intl.message(
      'Increment',
      name: 'increment',
      desc: '',
      args: [],
    );
  }

  /// `Change quantity`
  String get changeQuantity {
    return Intl.message(
      'Change quantity',
      name: 'changeQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Friend name`
  String get friendName {
    return Intl.message(
      'Friend name',
      name: 'friendName',
      desc: '',
      args: [],
    );
  }

  /// `Update friend`
  String get updateFriend {
    return Intl.message(
      'Update friend',
      name: 'updateFriend',
      desc: '',
      args: [],
    );
  }

  /// `Create friend`
  String get createFriend {
    return Intl.message(
      'Create friend',
      name: 'createFriend',
      desc: '',
      args: [],
    );
  }

  /// `Select from contacts`
  String get selectFromContact {
    return Intl.message(
      'Select from contacts',
      name: 'selectFromContact',
      desc: '',
      args: [],
    );
  }

  /// `Occasion title`
  String get occasionTitle {
    return Intl.message(
      'Occasion title',
      name: 'occasionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Time of event`
  String get timeOfEvent {
    return Intl.message(
      'Time of event',
      name: 'timeOfEvent',
      desc: '',
      args: [],
    );
  }

  /// `Create occasion`
  String get createOccasion {
    return Intl.message(
      'Create occasion',
      name: 'createOccasion',
      desc: '',
      args: [],
    );
  }

  /// `Update Occasion`
  String get updateOccasion {
    return Intl.message(
      'Update Occasion',
      name: 'updateOccasion',
      desc: '',
      args: [],
    );
  }

  /// `What's your order ?`
  String get whatOrder {
    return Intl.message(
      'What\'s your order ?',
      name: 'whatOrder',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to order ?`
  String get whatOrderYouWant {
    return Intl.message(
      'What do you want to order ?',
      name: 'whatOrderYouWant',
      desc: '',
      args: [],
    );
  }

  /// `Update profile`
  String get updateProfile {
    return Intl.message(
      'Update profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Update successfully`
  String get updateSuccessfully {
    return Intl.message(
      'Update successfully',
      name: 'updateSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create Credit`
  String get createCredit {
    return Intl.message(
      'Create Credit',
      name: 'createCredit',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get credits {
    return Intl.message(
      'Credits',
      name: 'credits',
      desc: '',
      args: [],
    );
  }

  /// `Address title`
  String get titleAddress {
    return Intl.message(
      'Address title',
      name: 'titleAddress',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Building name`
  String get buildingName {
    return Intl.message(
      'Building name',
      name: 'buildingName',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Floor number`
  String get floorNumber {
    return Intl.message(
      'Floor number',
      name: 'floorNumber',
      desc: '',
      args: [],
    );
  }

  /// `Create address`
  String get createAddress {
    return Intl.message(
      'Create address',
      name: 'createAddress',
      desc: '',
      args: [],
    );
  }

  /// `Update address`
  String get updateAddress {
    return Intl.message(
      'Update address',
      name: 'updateAddress',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get totalPrice {
    return Intl.message(
      'Total price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Total Price Without Dabbrnie`
  String get totalPriceWithoutDabb {
    return Intl.message(
      'Total Price Without Dabbrnie',
      name: 'totalPriceWithoutDabb',
      desc: '',
      args: [],
    );
  }

  /// `Dabbrnie`
  String get dabbrnie {
    return Intl.message(
      'Dabbrnie',
      name: 'dabbrnie',
      desc: '',
      args: [],
    );
  }

  /// `CheckOut`
  String get checkOut {
    return Intl.message(
      'CheckOut',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `Total tax`
  String get totalTax {
    return Intl.message(
      'Total tax',
      name: 'totalTax',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Setup item`
  String get setupItem {
    return Intl.message(
      'Setup item',
      name: 'setupItem',
      desc: '',
      args: [],
    );
  }

  /// `Number of guest`
  String get numberOfGuest {
    return Intl.message(
      'Number of guest',
      name: 'numberOfGuest',
      desc: '',
      args: [],
    );
  }

  /// `Delivering to`
  String get deliveringTo {
    return Intl.message(
      'Delivering to',
      name: 'deliveringTo',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
