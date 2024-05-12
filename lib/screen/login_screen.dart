import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/providers.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: LoginForm(),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, 'add_user'),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(155, 189, 19, 19).withOpacity(0.1),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        '¿No tienes una cuenta? Créala',
                        style: TextStyle(
                          color: Colors.deepPurple,
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

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key});

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
              decoration: InputDecoration( // Corregido: "InputDecortions" a "InputDecoration"
                hintText: 'Ingrese su correo',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email), // Cambiado: "Icons.people" a "Icons.email"
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
              decoration: InputDecoration( // Corregido: "InputDecortions" a "InputDecoration"
                hintText: '************',
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock), // Cambiado: "Icons.lock_outline" a "Icons.lock"
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
                      final String? errorMessage = await authService.login(
                          loginForm.email, loginForm.password);
                      if (errorMessage == null) {
                        Navigator.pushNamed(context, 'home');
                      } else {
                        print(errorMessage);
                      }
                      loginForm.isLoading = false;
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: Text(
                  'Ingresar',
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