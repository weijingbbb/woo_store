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

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get zh {
    return Intl.message(
      'Chinese',
      name: 'zh',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang_en {
    return Intl.message(
      'English',
      name: 'lang_en',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get lang_zh {
    return Intl.message(
      'Chinese',
      name: 'lang_zh',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navigation_home {
    return Intl.message(
      'Home',
      name: 'navigation_home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get navigation_cart {
    return Intl.message(
      'Cart',
      name: 'navigation_cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navigation_profile {
    return Intl.message(
      'Profile',
      name: 'navigation_profile',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Star`
  String get start {
    return Intl.message(
      'Star',
      name: 'start',
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

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message(
      'No Data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `No More Data`
  String get no_more_data {
    return Intl.message(
      'No More Data',
      name: 'no_more_data',
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

  /// `Welcome to login!`
  String get login_page_title {
    return Intl.message(
      'Welcome to login!',
      name: 'login_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get login_page_forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'login_page_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get login_page_sign_up {
    return Intl.message(
      'Sign Up',
      name: 'login_page_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get login_button {
    return Intl.message(
      'Sign In',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to sign up!`
  String get signup_page_title {
    return Intl.message(
      'Welcome to sign up!',
      name: 'signup_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_button {
    return Intl.message(
      'Sign Up',
      name: 'signup_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signup_page_tips {
    return Intl.message(
      'Already have an account?',
      name: 'signup_page_tips',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get username_iput_label {
    return Intl.message(
      'User Name',
      name: 'username_iput_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_iput_label {
    return Intl.message(
      'Password',
      name: 'password_iput_label',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_iput_label {
    return Intl.message(
      'Email',
      name: 'email_iput_label',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name_iput_label {
    return Intl.message(
      'First Name',
      name: 'first_name_iput_label',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name_iput_label {
    return Intl.message(
      'Last Name',
      name: 'last_name_iput_label',
      desc: '',
      args: [],
    );
  }

  /// `Register Pin`
  String get register_pin_appbar_title {
    return Intl.message(
      'Register Pin',
      name: 'register_pin_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get register_pin_page_title {
    return Intl.message(
      'Verification',
      name: 'register_pin_page_title',
      desc: '',
      args: [],
    );
  }

  /// `we will send you a Pin to continue your account.`
  String get register_pin_page_tips {
    return Intl.message(
      'we will send you a Pin to continue your account.',
      name: 'register_pin_page_tips',
      desc: '',
      args: [],
    );
  }

  /// `Pin is incorrect.`
  String get register_pin_error {
    return Intl.message(
      'Pin is incorrect.',
      name: 'register_pin_error',
      desc: '',
      args: [],
    );
  }

  /// `Registered Successfully`
  String get register_pin_success {
    return Intl.message(
      'Registered Successfully',
      name: 'register_pin_success',
      desc: '',
      args: [],
    );
  }

  /// `Fail To Register`
  String get register_pin_fail {
    return Intl.message(
      'Fail To Register',
      name: 'register_pin_fail',
      desc: '',
      args: [],
    );
  }

  /// `This field is required.`
  String get validator_required {
    return Intl.message(
      'This field is required.',
      name: 'validator_required',
      desc: '',
      args: [],
    );
  }

  /// `username must have between 6 and 18 digits.`
  String get validator_username {
    return Intl.message(
      'username must have between 6 and 18 digits.',
      name: 'validator_username',
      desc: '',
      args: [],
    );
  }

  /// `password must have between 6 and 18 digits.`
  String get validator_password {
    return Intl.message(
      'password must have between 6 and 18 digits.',
      name: 'validator_password',
      desc: '',
      args: [],
    );
  }

  /// `email must be a valid email address.`
  String get validator_email {
    return Intl.message(
      'email must be a valid email address.',
      name: 'validator_email',
      desc: '',
      args: [],
    );
  }

  /// `must have between 3 and 18 digits.`
  String get validator_length {
    return Intl.message(
      'must have between 3 and 18 digits.',
      name: 'validator_length',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Desire Product`
  String get welcomeOneTitle {
    return Intl.message(
      'Choose Your Desire Product',
      name: 'welcomeOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contrary to popular belief, Lorem Ipsum is not simply random text`
  String get welcomeOneDesc {
    return Intl.message(
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
      name: 'welcomeOneDesc',
      desc: '',
      args: [],
    );
  }

  /// `Complete your shopping`
  String get welcomeTwoTitle {
    return Intl.message(
      'Complete your shopping',
      name: 'welcomeTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contrary to popular belief, Lorem Ipsum is not simply random text`
  String get welcomeTwoDesc {
    return Intl.message(
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
      name: 'welcomeTwoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Get product at your door`
  String get welcomeThreeTitle {
    return Intl.message(
      'Get product at your door',
      name: 'welcomeThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contrary to popular belief, Lorem Ipsum is not simply random text`
  String get welcomeThreeDesc {
    return Intl.message(
      'Contrary to popular belief, Lorem Ipsum is not simply random text',
      name: 'welcomeThreeDesc',
      desc: '',
      args: [],
    );
  }

  /// `likes`
  String get my_page_likes {
    return Intl.message(
      'likes',
      name: 'my_page_likes',
      desc: '',
      args: [],
    );
  }

  /// `favorites`
  String get my_page_favorites {
    return Intl.message(
      'favorites',
      name: 'my_page_favorites',
      desc: '',
      args: [],
    );
  }

  /// `receipt`
  String get my_page_receipt {
    return Intl.message(
      'receipt',
      name: 'my_page_receipt',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get my_page_orders {
    return Intl.message(
      'orders',
      name: 'my_page_orders',
      desc: '',
      args: [],
    );
  }

  /// `personal data`
  String get my_page_personal_data {
    return Intl.message(
      'personal data',
      name: 'my_page_personal_data',
      desc: '',
      args: [],
    );
  }

  /// `invoice address`
  String get my_page_invoice_address {
    return Intl.message(
      'invoice address',
      name: 'my_page_invoice_address',
      desc: '',
      args: [],
    );
  }

  /// `shipping address`
  String get my_page_shipping_address {
    return Intl.message(
      'shipping address',
      name: 'my_page_shipping_address',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get my_page_language {
    return Intl.message(
      'language',
      name: 'my_page_language',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get my_page_theme {
    return Intl.message(
      'theme',
      name: 'my_page_theme',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get my_page_logout {
    return Intl.message(
      'logout',
      name: 'my_page_logout',
      desc: '',
      args: [],
    );
  }

  /// `setting theme`
  String get theme_page_title {
    return Intl.message(
      'setting theme',
      name: 'theme_page_title',
      desc: '',
      args: [],
    );
  }

  /// `system`
  String get theme_page_system {
    return Intl.message(
      'system',
      name: 'theme_page_system',
      desc: '',
      args: [],
    );
  }

  /// `light`
  String get theme_page_light {
    return Intl.message(
      'light',
      name: 'theme_page_light',
      desc: '',
      args: [],
    );
  }

  /// `dark`
  String get theme_page_dark {
    return Intl.message(
      'dark',
      name: 'theme_page_dark',
      desc: '',
      args: [],
    );
  }

  /// `setting language`
  String get language_page_title {
    return Intl.message(
      'setting language',
      name: 'language_page_title',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
