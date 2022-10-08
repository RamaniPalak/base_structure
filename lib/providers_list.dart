
import 'package:base_structure/app/data/datasource/auth_data.dart';
import 'package:base_structure/app/providers/auth_provider.dart';
import 'package:base_structure/app/repository/auth_repository.dart';

AuthProviderImpl get authProvider => AuthProviderImpl(AuthRepository(dataSource: AuthDataImpl()));
