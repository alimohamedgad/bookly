// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

import 'package:bookly/features/home/data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(
    this.homeRepo,
  ) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> newestBook() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestList();
    result.fold(
      (failure) => emit(
        NewestBooksError(msgError: failure.msgError),
      ),
      (books) => emit(
        NewestBooksSuccess(books: books),
      ),
    );
  }
}
