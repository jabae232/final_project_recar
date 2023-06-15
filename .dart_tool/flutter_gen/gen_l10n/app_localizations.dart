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

  /// No description provided for @selectImageAvatar.
  ///
  /// In en, this message translates to:
  /// **'Select image for avatar'**
  String get selectImageAvatar;

  /// No description provided for @selectImageBackground.
  ///
  /// In en, this message translates to:
  /// **'Select image for background'**
  String get selectImageBackground;

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

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'comments'**
  String get comments;

  /// No description provided for @ago.
  ///
  /// In en, this message translates to:
  /// **'ago'**
  String get ago;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get justNow;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'days ago'**
  String get daysAgo;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'minutes ago'**
  String get minutesAgo;

  /// No description provided for @comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get comment;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @subscribe.
  ///
  /// In en, this message translates to:
  /// **'Subscribe'**
  String get subscribe;

  /// No description provided for @suggestPost.
  ///
  /// In en, this message translates to:
  /// **'Suggest post'**
  String get suggestPost;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @mightBeInterested.
  ///
  /// In en, this message translates to:
  /// **'Might be interested'**
  String get mightBeInterested;

  /// No description provided for @clubCreation.
  ///
  /// In en, this message translates to:
  /// **'Club creation'**
  String get clubCreation;

  /// No description provided for @clubCreationDescription.
  ///
  /// In en, this message translates to:
  /// **'Publish materials in different formats, communicate with readers, create events in different formats, study statistics. Start by choosing a club type'**
  String get clubCreationDescription;

  /// No description provided for @clubMotorcycle.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle club'**
  String get clubMotorcycle;

  /// No description provided for @newsClub.
  ///
  /// In en, this message translates to:
  /// **'News channel'**
  String get newsClub;

  /// No description provided for @clubVehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicles club'**
  String get clubVehicle;

  /// No description provided for @clubBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand club'**
  String get clubBrand;

  /// No description provided for @clubVehicleDescription.
  ///
  /// In en, this message translates to:
  /// **'These clubs bring together like-minded enthusiasts who appreciate a specific type of vehicle, such as classic cars, sports cars, and off-road vehicles. Members often engage in a variety of activities, including group drives, car shows, track days, events, and social gatherings.'**
  String get clubVehicleDescription;

  /// No description provided for @clubMotorcycleDescription.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle clubs are organized groups of motorcycle enthusiasts who come together to share their love for motorcycles and the open road. These clubs provide a sense of community, camaraderie, and belonging among riders who share a common interest in motorcycles'**
  String get clubMotorcycleDescription;

  /// No description provided for @clubBrandDescription.
  ///
  /// In en, this message translates to:
  /// **'Brand clubs are organized communities of individuals who are dedicated enthusiasts and owners of vehicles from a specific automotive brand. These clubs bring together people who share a deep appreciation for a particular brand, such as BMW, Ford, Porsche, or Tesla, among others.'**
  String get clubBrandDescription;

  /// No description provided for @newsClubDescription.
  ///
  /// In en, this message translates to:
  /// **'News and posters, blogs, and content in the environment of vehicles'**
  String get newsClubDescription;

  /// No description provided for @createClub.
  ///
  /// In en, this message translates to:
  /// **'Create a club'**
  String get createClub;

  /// No description provided for @nameOfClub.
  ///
  /// In en, this message translates to:
  /// **'Club name'**
  String get nameOfClub;

  /// No description provided for @fillDescription.
  ///
  /// In en, this message translates to:
  /// **'Fill in the description'**
  String get fillDescription;

  /// No description provided for @whyClubInteresting.
  ///
  /// In en, this message translates to:
  /// **'Tell us why your club is so interesting'**
  String get whyClubInteresting;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @addDescription.
  ///
  /// In en, this message translates to:
  /// **'Add description'**
  String get addDescription;

  /// No description provided for @youAreAmember.
  ///
  /// In en, this message translates to:
  /// **'You are a member of the club'**
  String get youAreAmember;

  /// No description provided for @members.
  ///
  /// In en, this message translates to:
  /// **'members'**
  String get members;

  /// No description provided for @createEvent.
  ///
  /// In en, this message translates to:
  /// **'Create event'**
  String get createEvent;

  /// No description provided for @followed.
  ///
  /// In en, this message translates to:
  /// **'Followed'**
  String get followed;

  /// No description provided for @attendToEvent.
  ///
  /// In en, this message translates to:
  /// **'Attend to an Event'**
  String get attendToEvent;

  /// No description provided for @membersWillAttend.
  ///
  /// In en, this message translates to:
  /// **'members will attend an event'**
  String get membersWillAttend;

  /// No description provided for @participants.
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get participants;
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
