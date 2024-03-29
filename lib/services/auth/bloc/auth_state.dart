import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/services/auth/auth_user.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({
    required this.isLoading,
    this.loadingText = 'Please wait a moment',
  });
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateRegistering extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateRegistering({required this.exception, required bool isLoading})
      : super(isLoading: isLoading);

  @override
  List<Object?> get props => [exception];
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn({
    required this.user,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}

class AuthStateEmailVerification extends AuthState {
  const AuthStateEmailVerification({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut({
    required this.exception,
    required bool isLoading,
    String? loadingText,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );

  @override
  List<Object?> get props => [exception, isLoading];
}

class AuthStateResetPassword extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;
  const AuthStateResetPassword({
    required this.hasSentEmail,
    required this.exception,
    required bool isLoading,
  }) : super(isLoading: isLoading);
}
