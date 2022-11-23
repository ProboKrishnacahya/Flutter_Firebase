part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isHide = true;
  bool isLoading = false;
  String data = '';
  String emailValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            !EmailValidator.validate(value.toString())
                                ? 'Incorrect email. Please try again.'
                                : null,
                        onChanged: (value) {
                          emailValue = value;
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: 'johndoe@gmail.com',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value!.length < 8
                            ? 'Password must be 8 characters or more.'
                            : null,
                        obscureText: isHide,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isHide = !isHide;
                              });
                            },
                            child: Icon(
                              isHide
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () async {},
                          icon: const Icon(Icons.login_outlined),
                          label: const Text('Sign in'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(thickness: 2),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Style.white,
                  foregroundColor: Style.blue500,
                ),
                onPressed: () async {
                  AuthenticationService.signInWithGoogle().then((value) {});
                },
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text("Sign in with Google"),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun?'),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Daftar',
                    style: TextStyle(color: Style.blue500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
