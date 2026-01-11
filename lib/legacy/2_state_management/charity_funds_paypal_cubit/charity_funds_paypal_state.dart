part of 'charity_funds_paypal_cubit.dart';

@immutable
sealed class CharityFundsPaypalState {}

final class CharityFundsPaypalInitial extends CharityFundsPaypalState {}

final class CharityFundsPaypalLoading extends CharityFundsPaypalState {}

final class CharityFundsPaypalLoaded extends CharityFundsPaypalState {}

final class CharityFundsPaypalError extends CharityFundsPaypalState {}
