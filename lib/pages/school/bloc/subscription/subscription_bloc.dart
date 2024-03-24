import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/subscription/model/subscription.dart';
import 'package:korbil_mobile/repository/subscription/subscription_repo.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc({SubscriptionRepo? subscriptionRepo})
      : _subscriptionRepo = subscriptionRepo ?? SubscriptionRepo(),
        super(SubscriptionInitial()) {
    on<GetAllSubscriptionLevels>(onGetAllSubscriptionLevels);
  }
  final SubscriptionRepo _subscriptionRepo;

  Future<void> onGetAllSubscriptionLevels(
      GetAllSubscriptionLevels event, Emitter<SubscriptionState> emit) async {
    emit(SubscriptionLoading());
    try {
      final response = await _subscriptionRepo.getAllSubscriptionLevels();
      emit(SubscriptionLoaded(subscriptionLevels: response.data));
    } catch (e) {
      emit(SubscriptionError(error: e.toString()));
    }
  }
}
