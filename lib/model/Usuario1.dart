
class Usuario1 {


  String _email;
  String _senha;
  int _numberPictures;
  String _dataPicket1;
  String _nome1;
  String _codvenda;
  double _distanciadb1;
  int _luadiadb1;
  String _proximodb1;
  String _signosdb1;
  String _timedb1;
  Usuario1();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "email" : this.email,
      "numberPicture" : this._numberPictures,
      "dataPicket1" : this._dataPicket1,
      "nome1" : this._nome1,
      "distanciadb1" : this._distanciadb1,
      "luadiadb1" : this._luadiadb1,
      "proximodb1" : this._proximodb1,
      "signo1" : this._signosdb1,
      "timedb1" : this._timedb1,
      "codVenda" : this._codvenda
    };

    return map;

  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }


  int get numberPicture => _numberPictures;

  set numberPicture(int value) {
    _numberPictures = value;
  }

  String get dataPicket1 => _dataPicket1;

  set dataPicket1(String value) {
    _dataPicket1 = value;
  }

  String get nome1 => _nome1;

  set nome1(String value) {
    _nome1 = value;
  }

  String get codVenda => _codvenda;

  set codVenda(String value) {
    _codvenda = value;
  }

  double get distanciaDb1 => _distanciadb1;

  set distanciaDb1(double value) {
    _distanciadb1 = value;
  }

  int get luadiadb1 => _luadiadb1;

  set luadiadb1(int value) {
    _luadiadb1 = value;
  }

  String get proximodb1 => _proximodb1;

  set proximodb1(String value) {
    _proximodb1 = value;
  }

  String get signosdb1 => _signosdb1;

  set signosdb1(String value) {
    _signosdb1 = value;
  }

  String get timedb1 => _timedb1;

  set timedb1(String value) {
    _timedb1 = value;
  }
}