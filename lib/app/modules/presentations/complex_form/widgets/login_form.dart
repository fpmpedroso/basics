part of '../complex_form_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with Messages<LoginForm> {
  //chave do form
  final _formKey = GlobalKey<FormState>();

  //controladoras
  final _emailEC = TextEditingController();
  final _papsswordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  //descarte das controladoras
  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _papsswordEC.dispose();
    _confirmPasswordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFieldWidget(
            controller: _emailEC,
            label: 'Email',
            validator: Validatorless.multiple([
              Validatorless.required('Email obrigatório'),
              Validatorless.email('Email inválido')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldWidget(
            controller: _papsswordEC,
            label: 'Senha',
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Mínimo de 6 caracteres'),
            ]),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormFieldWidget(
            controller: _confirmPasswordEC,
            label: 'Confirmação de senha',
            validator: Validatorless.multiple([
              Validatorless.required('Confirmação obrigatória'),
              Validatorless.compare(_papsswordEC, 'Confirmação diferente'),
            ]),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Esqueceu a senha?',
                style: context.textsApp.textRegular.copyWith(
                  fontSize: 11,
                  color: context.colors.darkGrey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ButtonWidget(
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;

                if (formValid) {
                  showSuccess(
                      '${_emailEC.text} validado, chama-se a controller');
                }
              },
              style: context.buttonsApp.primaryButton,
              labelStyle: context.textsApp.textButtonLabel,
              label: 'Log in'),
        ],
      ),
    );
  }
}
