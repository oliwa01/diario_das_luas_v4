
class Usuario2 {


  String _email;
  String _senha;
  int _numberPictures;
  String _nomefamilia;
  String _dataPicket1;
  String _dataPicket2;

  String _nome1;
  String _nome2;

  double _distanciadb1;
  double _distanciadb2;

  int _luadiadb1;
  int _luadiadb2;

  String _proximodb1;
  String _proximodb2;

  String _signosdb1;
  String _signosdb2;

  String _timedb1;
  String _timedb2;

  String _codvenda;
  Usuario2();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {

      "email" : this.email,
      "numberPicture" : this._numberPictures,
      "nomefamilia" : this._nomefamilia,

      "dataPicket1" : this._dataPicket1,
      "dataPicket2" : this._dataPicket2,

      "nome1" : this._nome1,
      "nome2" : this._nome2,


      "distanciadb1" : this._distanciadb1,
      "distanciadb2" : this._distanciadb2,


      "luadiadb1" : this._luadiadb1,
      "luadiadb2" : this._luadiadb2,


      "proximodb1" : this._proximodb1,
      "proximodb2" : this._proximodb2,


      "signo1" : this._signosdb1,
      "signo2" : this._signosdb2,


      "timedb1" : this._timedb1,
      "timedb2" : this._timedb2,


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

  String get nomefamilia => _nomefamilia;

  set nomefamilia(String value) {
    _nomefamilia = value;
  }

  int get numberPicture => _numberPictures;

  set numberPicture(int value) {
    _numberPictures = value;
  }
//data
  String get dataPicket1 => _dataPicket1;

  set dataPicket1(String value) {
    _dataPicket1 = value;
  }

  String get dataPicket2 => _dataPicket2;

  set dataPicket2(String value) {
    _dataPicket2 = value;
  }


  // nome
  String get nome1 => _nome1;

  set nome1(String value) {
    _nome1 = value;
  }

  String get nome2 => _nome2;

  set nome2(String value) {
    _nome2 = value;
  }
// distancia
  double get distanciaDb1 => _distanciadb1;

  set distanciaDb1(double value) {
    _distanciadb1 = value;
  }
  //
  double get distanciaDb2 => _distanciadb2;

  set distanciaDb2(double value) {
    _distanciadb2 = value;
  }
  //
  //
  //

//lua dia
  int get luadiadb1 => _luadiadb1;

  set luadiadb1(int value) {
    _luadiadb1 = value;
  }
  //
  int get luadiadb2 => _luadiadb2;

  set luadiadb2(int value) {
    _luadiadb2 = value;
  }
  //
  //
  //
  //

//proximo

  String get proximodb1 => _proximodb1;

  set proximodb1(String value) {
    _proximodb1 = value;
  }
  //
  String get proximodb2 => _proximodb2;

  set proximodb2(String value) {
    _proximodb2 = value;
  }
  //
  //
  //
  //
//signo
  String get signosdb1 => _signosdb1;

  set signosdb1(String value) {
    _signosdb1 = value;
  }
  //
  String get signosdb2 => _signosdb2;

  set signosdb2(String value) {
    _signosdb2 = value;
  }
  //
  //
  //
  //
//time
  String get timedb1 => _timedb1;

  set timedb1(String value) {
    _timedb1 = value;
  }
  //
  String get timedb2 => _timedb2;

  set timedb2(String value) {
    _timedb2 = value;
  }
  //
  //
  //
  //

//cod venda
  String get codVenda => _codvenda;

  set codVenda(String value) {
    _codvenda = value;
  }

}