class GetAllListingsExceptUserException implements Exception {
  final String errorMessage;

  GetAllListingsExceptUserException(this.errorMessage);
}
