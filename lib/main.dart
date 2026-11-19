import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GymForzaApp());
}

class GymForzaApp extends StatelessWidget {
  const GymForzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF101827);
    const gold = Color(0xFFE5B94B);
    return MaterialApp(
      title: 'Gym Forza',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: gold,
          brightness: Brightness.dark,
          surface: const Color(0xFF1B2638),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});
  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) => const LoginScreen();
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFE5B94B);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B2638),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: gold.withValues(alpha: .35)),
                    ),
                    child: const Icon(Icons.fitness_center, color: gold, size: 34),
                  ),
                  const SizedBox(height: 34),
                  const Text('GYM FORZA',
                      style: TextStyle(color: gold, letterSpacing: 3, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  const Text('Tu espacio.\nTu progreso.',
                      style: TextStyle(fontSize: 34, height: 1.12, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 12),
                  const Text('Inicia sesión para consultar tu membresía y acceder al gimnasio.',
                      style: TextStyle(color: Color(0xFF9AA6B8), height: 1.5)),
                  const SizedBox(height: 32),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _decoration('Correo electrónico', Icons.mail_outline),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _password,
                    obscureText: _obscure,
                    decoration: _decoration('Contraseña', Icons.lock_outline).copyWith(
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _obscure = !_obscure),
                        icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                    onSubmitted: (_) => _login(),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _loading ? null : _login,
                    style: FilledButton.styleFrom(
                      backgroundColor: gold,
                      foregroundColor: const Color(0xFF101827),
                      minimumSize: const Size.fromHeight(54),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: _loading
                        ? const SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Text('Iniciar sesión', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 22),
                  const Text('Acceso exclusivo para socios Gym Forza',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF718096), fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _decoration(String label, IconData icon) => InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF9AA6B8)),
        filled: true,
        fillColor: const Color(0xFF1B2638),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      );

  Future<void> _login() async {
    // La autenticación y persistencia segura se conectarán al servicio de Supabase.
    if (_email.text.trim().isEmpty || _password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Escribe tu correo y contraseña.')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('La conexión con Supabase se está integrando.')),
    );
  }
}
