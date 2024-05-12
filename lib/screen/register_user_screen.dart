import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/providers.dart';


class RegisterUserScreen extends StatelessWidget {
  const RegisterUserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 150),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Registra una cuenta',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple, // Cambia el color del texto
                      ),
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: RegisterForm(),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, 'login'),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.indigo.withOpacity(0.1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        '¿Ya tienes una cuenta? Autentifícate',
                        style: TextStyle(
                          color: Colors.deepPurple, // Cambia el color del texto
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Ingrese su correo',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email), // Cambia el ícono
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                return (value != null && value.length >= 4)
                    ? null
                    : 'El usuario no puede estar vacío';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '************',
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock), // Cambia el ícono
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 4)
                    ? null
                    : 'La contraseña no puede estar vacía';
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      final String? errorMessage = await authService.create_user(
                          loginForm.email, loginForm.password);
                      if (errorMessage == null) {
                        Navigator.pushNamed(context, 'login');
                      } else {
                        print(errorMessage);
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Cambia el color del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}