import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/authCntrollers.dart';

final authProvider = ChangeNotifierProvider<AuthController>((ref) => AuthController());