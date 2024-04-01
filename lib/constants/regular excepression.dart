class RegularExceprationsConstants
{
  static const username = r"^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$";
  static const email =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const password = r'^.{7,}$';
}
class ConstantsMessage
{
  static const username = "invalid username";
  static const email =  "invalid email";
  static const password = "invalid password";
}
