import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Haven\'t got an account yet?'**
  String get noAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @enterNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter an email'**
  String get enterNumber;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter a code'**
  String get enterCode;

  /// No description provided for @yourPhoneNumberWillBeUsed.
  ///
  /// In en, this message translates to:
  /// **'You\'ll use your email address number to sign in to your account'**
  String get yourPhoneNumberWillBeUsed;

  /// No description provided for @enterYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterYourPhoneNumber;

  /// No description provided for @saveUser.
  ///
  /// In en, this message translates to:
  /// **'Save User'**
  String get saveUser;

  /// No description provided for @continee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continee;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'By pressing Continue, you agree to the Terms of Service and Privacy Policy'**
  String get termsOfService;

  /// No description provided for @twoStepVerificiation.
  ///
  /// In en, this message translates to:
  /// **'2-step verification'**
  String get twoStepVerificiation;

  /// No description provided for @receivingPhoneCall.
  ///
  /// In en, this message translates to:
  /// **'You will receive a an confirmation message from a unique email'**
  String get receivingPhoneCall;

  /// No description provided for @lastFourdigits.
  ///
  /// In en, this message translates to:
  /// **'Please enter the last 4 digits of this message'**
  String get lastFourdigits;

  /// No description provided for @confirmInAnother.
  ///
  /// In en, this message translates to:
  /// **'Confirm in another way'**
  String get confirmInAnother;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInfo;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @createPass.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createPass;

  /// No description provided for @enterPass.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPass;

  /// No description provided for @confirmThePass.
  ///
  /// In en, this message translates to:
  /// **'Confirm the password'**
  String get confirmThePass;

  /// No description provided for @protectAccount.
  ///
  /// In en, this message translates to:
  /// **'In order to protect your account, create a strong password'**
  String get protectAccount;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @stories.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get stories;

  /// No description provided for @addStory.
  ///
  /// In en, this message translates to:
  /// **'Add Story'**
  String get addStory;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @followings.
  ///
  /// In en, this message translates to:
  /// **'Followings'**
  String get followings;

  /// No description provided for @dayAgo.
  ///
  /// In en, this message translates to:
  /// **'day ago'**
  String get dayAgo;

  /// No description provided for @minuteAgo.
  ///
  /// In en, this message translates to:
  /// **'minute ago'**
  String get minuteAgo;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @profiles.
  ///
  /// In en, this message translates to:
  /// **'Profiles'**
  String get profiles;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @likedYourPost.
  ///
  /// In en, this message translates to:
  /// **'Liked your post'**
  String get likedYourPost;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @clubs.
  ///
  /// In en, this message translates to:
  /// **'Clubs'**
  String get clubs;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @typeSomeText.
  ///
  /// In en, this message translates to:
  /// **'Type some text'**
  String get typeSomeText;

  /// No description provided for @publish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get publish;

  /// No description provided for @createPost.
  ///
  /// In en, this message translates to:
  /// **'Create a post'**
  String get createPost;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get edit;

  /// No description provided for @newPost.
  ///
  /// In en, this message translates to:
  /// **'New post'**
  String get newPost;

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s up?'**
  String get whatsNew;

  /// No description provided for @postOnWall.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get postOnWall;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get copyLink;

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @addToBookMarks.
  ///
  /// In en, this message translates to:
  /// **'Add to bookmarks'**
  String get addToBookMarks;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @loginMustHaveMoreThan.
  ///
  /// In en, this message translates to:
  /// **'Login must have more than 4 symbols'**
  String get loginMustHaveMoreThan;

  /// No description provided for @passMustHaveMoreThan.
  ///
  /// In en, this message translates to:
  /// **'Password must have more than 4 symbols'**
  String get passMustHaveMoreThan;

  /// No description provided for @enterYourNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your valid email address'**
  String get enterYourNumber;

  /// No description provided for @enterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please, enter your Name'**
  String get enterYourName;

  /// No description provided for @enterYourSurname.
  ///
  /// In en, this message translates to:
  /// **'Please, enter your Surname'**
  String get enterYourSurname;

  /// No description provided for @enterYourLogin.
  ///
  /// In en, this message translates to:
  /// **'Login must have at least 5 characters'**
  String get enterYourLogin;

  /// No description provided for @enterYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Please enter your date of birth. It can\'t be changed afterwards'**
  String get enterYourDateOfBirth;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @changeAvatar.
  ///
  /// In en, this message translates to:
  /// **'Change profile avatar'**
  String get changeAvatar;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select image'**
  String get selectImage;

  /// No description provided for @imageWasNotSelected.
  ///
  /// In en, this message translates to:
  /// **'Image was not selected'**
  String get imageWasNotSelected;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @saves.
  ///
  /// In en, this message translates to:
  /// **'Saves'**
  String get saves;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
