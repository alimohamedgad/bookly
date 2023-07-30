// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBooksSuccess({
    required this.books,
  });
}

class NewestBooksError extends NewestBooksState {
  final String msgError;
  const NewestBooksError({
    required this.msgError,
  });
}
