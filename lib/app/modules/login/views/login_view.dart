import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/components/index.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Log In'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Gap(24),
          const Text(
            'Enter your progressive credentials to enable Canopy Connect to securely retrieve your insurance information.',
          ),
          const Gap(24),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Email Address'),
              hintText: 'Enter email address',
            ),
          ),
          const Gap(24),
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Password'),
              hintText: 'Enter password',
            ),
            obscureText: true,
            obscuringCharacter: '*',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
          ),
          const Gap(24),
          ElevatedButton(
            onPressed: () => Get.toNamed(Routes.SEARCH_BY_VIN),
            child: const Text('Log In'),
          )
        ],
      ),
    );
  }
}
