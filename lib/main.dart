import 'package:flutter/material.dart';

void main() {
  runApp(const TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  const TravelGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: const LoginPage(),
    );
  }
}

// ==================== LOGIN PAGE ====================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password'),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1565C0),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE3F2FD),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.flight_takeoff,
                          size: 42,
                          color: Color(0xFF1565C0),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Travel Guide',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1565C0),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Explore. Discover. Travel.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF1565C0),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // LOGIN
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1565C0),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // SIGN UP
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1565C0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== HOME PAGE ====================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travel Guide',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Travel Guide 🌍',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explore beautiful places and plan your next adventure.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1565C0),
                    Color(0xFF42A5F5),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.explore,
                    size: 55,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Explore the World',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover amazing destinations and create unforgettable memories.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Popular Destinations',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: destinationCard(
                    Icons.beach_access,
                    'Goa',
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: destinationCard(
                    Icons.landscape,
                    'Ooty',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: destinationCard(
                    Icons.temple_buddhist,
                    'Jaipur',
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: destinationCard(
                    Icons.location_city,
                    'Hyderabad',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text(
                  'Explore More Destinations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget destinationCard(
      IconData icon, String name) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color(0xFF1565C0),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== FORGOT PASSWORD PAGE ====================

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {
  final TextEditingController emailController =
      TextEditingController();

  void resetPassword() {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent to your email'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_reset,
              size: 80,
              color: Color(0xFF1565C0),
            ),

            const SizedBox(height: 20),

            const Text(
              'Reset Your Password',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Enter your email address to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon:
                    const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: resetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'RESET PASSWORD',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

// ==================== SIGN UP PAGE ====================

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  void createAccount() {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.person_add,
              size: 80,
              color: Color(0xFF1565C0),
            ),

            const SizedBox(height: 20),

            const Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your name',
                prefixIcon:
                    const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon:
                    const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Create a password',
                prefixIcon:
                    const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: createAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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