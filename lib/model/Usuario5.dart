
class Usuario5 {


  String _email;
  String _senha;
  int _numberPictures;
  String _nomefamilia;
  String _dataPicket1;
  String _dataPicket2;
  String _dataPicket3;
  String _dataPicket4;
  String _dataPicket5;

  String _nome1;
  String _nome2;
  String _nome3;
  String _nome4;
  String _nome5;


  double _distanciadb1;
  double _distanciadb2;
  double _distanciadb3;
  double _distanciadb4;
  double _distanciadb5;


  int _luadiadb1;
  int _luadiadb2;
  int _luadiadb3;
  int _luadiadb4;
  int _luadiadb5;


  String _proximodb1;
  String _proximodb2;
  String _proximodb3;
  String _proximodb4;
  String _proximodb5;


  String _signosdb1;
  String _signosdb2;
  String _signosdb3;
  String _signosdb4;
  String _signosdb5;


  String _timedb1;
  String _timedb2;
  String _timedb3;
  String _timedb4;
  String _timedb5;


  String _codvenda;
  Usuario5();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {

      "email" : this.email,
      "numberPicture" : this._numberPictures,
      "nomefamilia" : this._nomefamilia,

      "dataPicket1" : this._dataPicket1,
      "dataPicket2" : this._dataPicket2,
      "dataPicket3" : this._dataPicket3,
      "dataPicket4" : this._dataPicket4,
      "dataPicket5" : this._dataPicket5,

      "nome1" : this._nome1,
      "nome2" : this._nome2,
      "nome3" : this._nome3,
      "nome4" : this._nome4,
      "nome5" : this._nome5,


      "distanciadb1" : this._distanciadb1,
      "distanciadb2" : this._distanciadb2,
      "distanciadb3" : this._distanciadb3,
      "distanciadb4" : this._distanciadb4,
      "distanciadb5" : this._distanciadb5,



      "luadiadb1" : this._luadiadb1,
      "luadiadb2" : this._luadiadb2,
      "luadiadb3" : this._luadiadb3,
      "luadiadb4" : this._luadiadb4,
      "luadiadb5" : this._luadiadb5,


      "proximodb1" : this._proximodb1,
      "proximodb2" : this._proximodb2,
      "proximodb3" : this._proximodb3,
      "proximodb4" : this._proximodb4,
      "proximodb5" : this._proximodb5,


      "signo1" : this._signosdb1,
      "signo2" : this._signosdb2,
      "signo3" : this._signosdb3,
      "signo4" : this._signosdb4,
      "signo5" : this._signosdb5,


      "timedb1" : this._timedb1,
      "timedb2" : this._timedb2,
      "timedb3" : this._timedb3,
      "timedb4" : this._timedb4,
      "timedb5" : this._timedb5,


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

  String get dataPicket3 => _dataPicket3;

  set dataPicket3(String value) {
    _dataPicket3 = value;
  }

  String get dataPicket4 => _dataPicket4;

  set dataPicket4(String value) {
    _dataPicket4 = value;
  }

  String get dataPicket5 => _dataPicket5;

  set dataPicket5(String value) {
    _dataPicket5 = value;
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
  String get nome3 => _nome3;

  set nome3(String value) {
    _nome3 = value;
  }
  String get nome4 => _nome4;

  set nome4(String value) {
    _nome4 = value;
  }
  String get nome5 => _nome5;

  set nome5(String value) {
    _nome5 = value;
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
  double get distanciaDb3 => _distanciadb3;

  set distanciaDb3(double value) {
    _distanciadb3 = value;
  }
  //
  double get distanciaDb4 => _distanciadb4;

  set distanciaDb4(double value) {
    _distanciadb4 = value;
  }
  //
  double get distanciaDb5 => _distanciadb5;

  set distanciaDb5(double value) {
    _distanciadb5 = value;
  }
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
  int get luadiadb3 => _luadiadb3;

  set luadiadb3(int value) {
    _luadiadb3 = value;
  }
  //
  int get luadiadb4 => _luadiadb4;

  set luadiadb4(int value) {
    _luadiadb4 = value;
  }
  //
  int get luadiadb5 => _luadiadb5;

  set luadiadb5(int value) {
    _luadiadb5 = value;
  }
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
  String get proximodb3 => _proximodb3;

  set proximodb3(String value) {
    _proximodb3 = value;
  }
  //
  String get proximodb4 => _proximodb4;

  set proximodb4(String value) {
    _proximodb4 = value;
  }
  //
  String get proximodb5 => _proximodb5;

  set proximodb5(String value) {
    _proximodb5 = value;
  }
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
  String get signosdb3 => _signosdb3;

  set signosdb3(String value) {
    _signosdb3 = value;
  }
  //
  String get signosdb4 => _signosdb4;

  set signosdb4(String value) {
    _signosdb4 = value;
  }
  //
  String get signosdb5 => _signosdb5;

  set signosdb5(String value) {
    _signosdb5 = value;
  }
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
  String get timedb3 => _timedb3;

  set timedb3(String value) {
    _timedb3 = value;
  }
  //
  String get timedb4 => _timedb4;

  set timedb4(String value) {
    _timedb4 = value;
  }
  //
  String get timedb5 => _timedb5;

  set timedb5(String value) {
    _timedb5 = value;
  }
  //
  //

//cod venda
  String get codVenda => _codvenda;

  set codVenda(String value) {
    _codvenda = value;
  }

}