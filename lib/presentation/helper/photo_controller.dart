import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/photo_repository.dart';
import 'package:photo_app/Data/services/model/photo_exceptions.dart';
import 'package:photo_app/Data/services/model/photos.dart';

class InvoiceState extends Equatable {
  final String? errorMessage;
  final List<Photos> photo;
  final int pages;
  final bool isLoading;

  const InvoiceState(
      {this.errorMessage,
      required this.photo,
      required this.pages,
      required this.isLoading});

  factory InvoiceState.initial() {
    return const InvoiceState(
      photo: [],
      pages: 1,
      errorMessage: '',
      isLoading: false,
    );
  }

  bool get refreshError => errorMessage != '' && photo.length <= 10;

  InvoiceState copyWith(
      {final String? errorMessage,
      final bool? isLoading,
      final int? pages,
      final List<Photos>? photo}) {
    return InvoiceState(
      photo: photo ?? this.photo,
      pages: pages ?? this.pages,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [photo, errorMessage, pages];
}

final invoiceControllerProvider =
    StateNotifierProvider.autoDispose<InvoiceController, InvoiceState>(
  (ref) => InvoiceController(
    ref.watch(photoProvider),
  ),
);

class InvoiceController extends StateNotifier<InvoiceState> {
  final PhotoRepository _photoRepository;

  InvoiceController(
    this._photoRepository,
  ) : super(InvoiceState.initial()) {
    getPhoto();
  }

  Future<void> getPhoto() async {
    state = state.copyWith(isLoading: true);
    try {
      final photos = await _photoRepository.getPhoto(state.pages);
      print('loaded here');
      state = state
          .copyWith(photo: [...state.photo, ...photos], pages: state.pages + 1);
    } on PhotoException catch (e) {
      state.copyWith(errorMessage: e.message);
      state = state.copyWith(isLoading: false);
    }
  }

  void handleScrollWithIndex(int index, ScrollController scrollController) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 10 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 10;

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (requestMoreData && pageToRequest + 1 >= state.pages) {
          getPhoto();
        }
      }
    });
  }
}
