import '../../common/app_error.dart';

enum CallFrom {signInScreen, signUpScreen, defaultLocation}

class HandleNetworkError {
  static const userNotExists = 'USER_NOT_EXISTS';
  static const countryNotExists = 'COUNTRY_NOT_EXISTS';
  static const weakPassword = 'WEAK_PASSWORD';
  static const emailAlreadyExists = 'EMAIL_ALREADY_EXISTS';
  static const phoneAlreadyExists = 'PHONE_ALREADY_EXISTS';
  static const invalidVerification = 'INVALID_VERIFICATION';
  static const expiredVerification = 'EXPIRED_VERIFICATION';
  static const userLocked = 'USER_LOCKED';
  static const invalidUserPassword = 'INVALID_USER_PASSWORD';
  static const locationExpired = 'LOCATION_EXPIRED';
  static const deviceNotRegistered = 'DEVICE_NOT_REGISTERED';
  static const requestVerifiedEmail = 'REQUIRE_VERIFIED_EMAIL';
  static const existsPatientCode = 'EXISTS_PATIENT_CODE';
  static const invalidCountryStateCity = 'INVALID_COUNTRY_STATE_CITY';
  static const blankCountryCode = 'BLANK_COUNTRY_CODE';
  static const blankPatientCode = 'BLANK_PATIENT_CODE';
  static const blankPatientName = 'BLANK_PATIENT_NAME';
  static const blankPatientCountry = 'BLANK_PATIENT_COUNTRY';
  static const blankPatientState = 'BLANK_PATIENT_STATE';
  static const blankPatientCity = 'BLANK_PATIENT_CITY';
  static const blankPatientRace = 'BLANK_PATIENT_RACE';
  static const blankPatientBirthday = 'BLANK_PATIENT_BIRTHDAY';
  static const blankPatientGender = 'BLANK_PATIENT_GENDER';
  static const patientHasAssessment = 'PATIENT_HAS_ASSESSMENT';
  static const patientNotExists = 'PATIENT_NOT_EXISTS';
  static const invalidNoteId = 'INVALID_NOTE_ID';
  static const noteNotExists = 'NOTE_NOT_EXISTS';

  HandleNetworkError._();

  /// handlerStatusMessage(String, String, dynamic) -> new mappedStatusMessage, originStatusMessage, body
  static void handleNetworkError(
    dynamic error,
    Function(String, String, dynamic) handlerStatusMessage,
    {CallFrom callFrom = CallFrom.defaultLocation}
  ) {
    var appErrorMessage = '';

    if (error is AppError && error.errorType == AppErrorType.networkError) {
      appErrorMessage = switch (error.statusMessage) {
        requestVerifiedEmail => error.body['data'],
        deviceNotRegistered => 'The device is unregistered',
        locationExpired => 'Your access has expired. Please renew your subscription.',
        invalidUserPassword when callFrom == CallFrom.signInScreen => 'Invalid username or password',
        invalidUserPassword when callFrom != CallFrom.signInScreen => 'Account does not exist, please check your email address',
        countryNotExists => 'Invalid country',
        weakPassword => 'Invalid password',
        emailAlreadyExists => 'Email has already been registered by another account',
        phoneAlreadyExists => 'Phone number has already been registered by another account',
        invalidVerification => 'Invalid verification code',
        expiredVerification => 'Expired verification code',
        userLocked => 'Account has been locked',
        existsPatientCode => 'MRN already exists',
        invalidCountryStateCity => 'Invalid nationality, state or city',
        blankCountryCode => 'The phone number is required',
        blankPatientCode => 'MRN is required',
        blankPatientName => 'Patient name is required',
        blankPatientCountry => 'Nationality is required',
        blankPatientState => 'State is required',
        blankPatientCity => 'City is required',
        blankPatientRace => 'Race is required',
        blankPatientBirthday => 'Date of birth is required',
        blankPatientGender => 'Gender is required',
        patientHasAssessment => 'Can\'t delete patient with assessment history',
        patientNotExists => 'Patient does not exist, please try again later',
        invalidNoteId => 'Note does not exist, please try again later',
        noteNotExists => 'Note does not exist, please try again later',
        _ => error.message
      };

      handlerStatusMessage.call(appErrorMessage, error.statusMessage, error.body);
    }
  }
}