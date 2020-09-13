import 'dart:math';

class Website {
  String allowedChars;
  String logoUrl;
  int pwlength;
  String siteName;

  Website({this.allowedChars, this.logoUrl, this.pwlength, this.siteName});

  Website.fromJson(Map<String, dynamic> json) {
    allowedChars = json['allowedChars'];
    logoUrl = json['logoUrl'];
    pwlength = json['pwlength'];
    siteName = json['siteName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowedChars'] = this.allowedChars;
    data['logoUrl'] = this.logoUrl;
    data['pwlength'] = this.pwlength;
    data['siteName'] = this.siteName;
    return data;
  }

  String generatePassword() {
    String password = '';

    for (int i = 0; i < this.pwlength; i++) {
      Random rnd = new Random();
      int max = this.pwlength;
      int index = rnd.nextInt(max);
      password += allowedChars[index];
    }
    return password;
  }
}
