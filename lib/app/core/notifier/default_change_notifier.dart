//serve para fazer o utilitário de Mensagens de erro, sucesso e info + loader para serem usados
//de uma maneira mais eficiente pela controller e pelas page, sem que seja necessário
//fazer listeners a todo momento, assim como foi feito na classe ListenerLoaderPage( )

//será uma classe que todas as controllers irão estender, pois ela já estende ChangeNotifer, logo
//as controllers terão ChangeNotifier e também essa classe

import 'package:flutter/material.dart';

class DefaultChangeNotifier extends ChangeNotifier {
  //inicia a tela de carregamento como falsa
  bool _loading = false;

  //inicia a tela de sucesso como falso
  bool _success = false;

  //msg de erro
  String? _error;

  //método do tipo get para retornar os valores das variáveis
  bool get loading => _loading;
  bool get hasError => _error != null;
  String? get error => _error;
  bool get isSuccess => _success;

  //método para alterar o valor de loading
  void showLoading() => _loading = true;
  void hideLoading() => _loading = false;

  //método para alterar o valor de success
  void success() => _success = true;

  //método para alterar _error
  void setError(String? error) => _error = error;

  //método para resetar o erro para null e succsses como false
  void resetState() {
    setError(null);
    _success = false;
  }

  //método que mostra o loading e reseta o state
  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }
}
