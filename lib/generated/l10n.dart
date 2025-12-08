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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Hi! Welcome back, you've been missed`
  String get welcomeBack {
    return Intl.message(
      'Hi! Welcome back, you\'ve been missed',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Success authorization`
  String get successAuthorization {
    return Intl.message(
      'Success authorization',
      name: 'successAuthorization',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Or sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Success registration`
  String get successRegistration {
    return Intl.message(
      'Success registration',
      name: 'successRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Fill your information below`
  String get fillYourInformationBelow {
    return Intl.message(
      'Fill your information below',
      name: 'fillYourInformationBelow',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Languages`
  String get languages {
    return Intl.message('Languages', name: 'languages', desc: '', args: []);
  }

  /// `Select the language that is most convenient for you to use the application in.`
  String get selectTheLanguageThatIsMostConvenientForYouTo {
    return Intl.message(
      'Select the language that is most convenient for you to use the application in.',
      name: 'selectTheLanguageThatIsMostConvenientForYouTo',
      desc: '',
      args: [],
    );
  }

  /// `My Bookings`
  String get myBookings {
    return Intl.message('My Bookings', name: 'myBookings', desc: '', args: []);
  }

  /// `Pick-Up Date`
  String get pickupDate {
    return Intl.message('Pick-Up Date', name: 'pickupDate', desc: '', args: []);
  }

  /// `Return Date`
  String get returnDate {
    return Intl.message('Return Date', name: 'returnDate', desc: '', args: []);
  }

  /// `Total price`
  String get totalPrice {
    return Intl.message('Total price', name: 'totalPrice', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `My Listings`
  String get myListings {
    return Intl.message('My Listings', name: 'myListings', desc: '', args: []);
  }

  /// `Listings`
  String get listings {
    return Intl.message('Listings', name: 'listings', desc: '', args: []);
  }

  /// `Requests`
  String get requests {
    return Intl.message('Requests', name: 'requests', desc: '', args: []);
  }

  /// `Delete Listing`
  String get deleteListing {
    return Intl.message(
      'Delete Listing',
      name: 'deleteListing',
      desc: '',
      args: [],
    );
  }

  /// `You're going to delete your listing. Are you sure?`
  String get youreGoingToDeleteYourListingAreYouSure {
    return Intl.message(
      'You\'re going to delete your listing. Are you sure?',
      name: 'youreGoingToDeleteYourListingAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Your profile`
  String get yourProfile {
    return Intl.message(
      'Your profile',
      name: 'yourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'areYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Logout`
  String get yesLogout {
    return Intl.message('Yes, Logout', name: 'yesLogout', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Search instrument...`
  String get searchInstrument {
    return Intl.message(
      'Search instrument...',
      name: 'searchInstrument',
      desc: '',
      args: [],
    );
  }

  /// `Recommended For You`
  String get recommendedForYou {
    return Intl.message(
      'Recommended For You',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password`
  String get enterYourEmailAddressAndWeWillSendYouA {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password',
      name: 'enterYourEmailAddressAndWeWillSendYouA',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message('Favourite', name: 'favourite', desc: '', args: []);
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Success updating profile`
  String get successUpdatingProfile {
    return Intl.message(
      'Success updating profile',
      name: 'successUpdatingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
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

  /// `About Yourself`
  String get aboutYourself {
    return Intl.message(
      'About Yourself',
      name: 'aboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `Enter about yourself...`
  String get enterAboutYourself {
    return Intl.message(
      'Enter about yourself...',
      name: 'enterAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Leave a Review`
  String get leaveAReview {
    return Intl.message(
      'Leave a Review',
      name: 'leaveAReview',
      desc: '',
      args: [],
    );
  }

  /// `Add detailed review`
  String get addDetailedReview {
    return Intl.message(
      'Add detailed review',
      name: 'addDetailedReview',
      desc: '',
      args: [],
    );
  }

  /// `Your overall rating`
  String get yourOverallRating {
    return Intl.message(
      'Your overall rating',
      name: 'yourOverallRating',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get addReview {
    return Intl.message('Add Review', name: 'addReview', desc: '', args: []);
  }

  /// `Enter here...`
  String get enterHere {
    return Intl.message('Enter here...', name: 'enterHere', desc: '', args: []);
  }

  /// `Filter by`
  String get filterBy {
    return Intl.message('Filter by', name: 'filterBy', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Price Range (Daily)`
  String get priceRangeDaily {
    return Intl.message(
      'Price Range (Daily)',
      name: 'priceRangeDaily',
      desc: '',
      args: [],
    );
  }

  /// `Clear Filter`
  String get clearFilter {
    return Intl.message(
      'Clear Filter',
      name: 'clearFilter',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Create your listing`
  String get createYourListing {
    return Intl.message(
      'Create your listing',
      name: 'createYourListing',
      desc: '',
      args: [],
    );
  }

  /// `Successful save listing`
  String get successfulSaveListing {
    return Intl.message(
      'Successful save listing',
      name: 'successfulSaveListing',
      desc: '',
      args: [],
    );
  }

  /// `Add photo of instrument`
  String get addPhotoOfInstrument {
    return Intl.message(
      'Add photo of instrument',
      name: 'addPhotoOfInstrument',
      desc: '',
      args: [],
    );
  }

  /// `Select several photos of the tool. The first photo will be on the listing cover.`
  String get selectSeveralPhotosOfTheToolTheFirstPhotoWill {
    return Intl.message(
      'Select several photos of the tool. The first photo will be on the listing cover.',
      name: 'selectSeveralPhotosOfTheToolTheFirstPhotoWill',
      desc: '',
      args: [],
    );
  }

  /// `Click the button to get your current location.`
  String get clickTheButtonToGetYourCurrentLocation {
    return Intl.message(
      'Click the button to get your current location.',
      name: 'clickTheButtonToGetYourCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Select the category to which the musical instrument will belong.`
  String get selectTheCategoryToWhichTheMusicalInstrumentWillBelong {
    return Intl.message(
      'Select the category to which the musical instrument will belong.',
      name: 'selectTheCategoryToWhichTheMusicalInstrumentWillBelong',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Enter description here...`
  String get enterDescriptionHere {
    return Intl.message(
      'Enter description here...',
      name: 'enterDescriptionHere',
      desc: '',
      args: [],
    );
  }

  /// `Enter price of the rent by hours`
  String get enterPriceOfTheRentByHours {
    return Intl.message(
      'Enter price of the rent by hours',
      name: 'enterPriceOfTheRentByHours',
      desc: '',
      args: [],
    );
  }

  /// `Enter name of the instrument`
  String get enterNameOfTheInstrument {
    return Intl.message(
      'Enter name of the instrument',
      name: 'enterNameOfTheInstrument',
      desc: '',
      args: [],
    );
  }

  /// `The transaction was successful. Your booking request has been sent. Please wait for a response from the listing author.`
  String get theTransactionWasSuccessfulYourBookingRequestHasBeenSent {
    return Intl.message(
      'The transaction was successful. Your booking request has been sent. Please wait for a response from the listing author.',
      name: 'theTransactionWasSuccessfulYourBookingRequestHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
  }

  /// `Review`
  String get review {
    return Intl.message('Review', name: 'review', desc: '', args: []);
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `Booking Calendar`
  String get bookingCalendar {
    return Intl.message(
      'Booking Calendar',
      name: 'bookingCalendar',
      desc: '',
      args: [],
    );
  }

  /// `To reserve an instrument, you must select the start and end dates of your reservation. If the instrument is occupied on the selected dates, it will not be available for reservation.`
  String get reserveInstruction {
    return Intl.message(
      'To reserve an instrument, you must select the start and end dates of your reservation. If the instrument is occupied on the selected dates, it will not be available for reservation.',
      name: 'reserveInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Read more `
  String get readMore {
    return Intl.message('Read more ', name: 'readMore', desc: '', args: []);
  }

  /// `Read less`
  String get readLess {
    return Intl.message('Read less', name: 'readLess', desc: '', args: []);
  }

  /// `Ratings & Reviews`
  String get ratingsReviews {
    return Intl.message(
      'Ratings & Reviews',
      name: 'ratingsReviews',
      desc: '',
      args: [],
    );
  }

  /// `{reviewerCounter} reviews`
  String reviewercounterReviews(Object reviewerCounter) {
    return Intl.message(
      '$reviewerCounter reviews',
      name: 'reviewercounterReviews',
      desc: '',
      args: [reviewerCounter],
    );
  }

  /// `Bookings weren't found`
  String get bookingsWerentFound {
    return Intl.message(
      'Bookings weren\'t found',
      name: 'bookingsWerentFound',
      desc: '',
      args: [],
    );
  }

  /// `No, Keep It.`
  String get noKeepIt {
    return Intl.message('No, Keep It.', name: 'noKeepIt', desc: '', args: []);
  }

  /// `No, Cancel It.`
  String get noCancelIt {
    return Intl.message(
      'No, Cancel It.',
      name: 'noCancelIt',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Delete It!`
  String get yesDeleteIt {
    return Intl.message(
      'Yes, Delete It!',
      name: 'yesDeleteIt',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Confirm It!`
  String get yesConfirmIt {
    return Intl.message(
      'Yes, Confirm It!',
      name: 'yesConfirmIt',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Booking`
  String get confirmBooking {
    return Intl.message(
      'Confirm Booking',
      name: 'confirmBooking',
      desc: '',
      args: [],
    );
  }

  /// `You're going to book this instrument. Are you sure?`
  String get youreGoingToBookThisInstrumentAreYouSure {
    return Intl.message(
      'You\'re going to book this instrument. Are you sure?',
      name: 'youreGoingToBookThisInstrumentAreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message('Book Now', name: 'bookNow', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `{distance} km`
  String distanceKm(Object distance) {
    return Intl.message(
      '$distance km',
      name: 'distanceKm',
      desc: '',
      args: [distance],
    );
  }

  /// `The operation was completed successfully. Check your email.`
  String get theOperationWasCompletedSuccessfullyCheckYourEmail {
    return Intl.message(
      'The operation was completed successfully. Check your email.',
      name: 'theOperationWasCompletedSuccessfullyCheckYourEmail',
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
      Locale.fromSubtags(languageCode: 'uk'),
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
