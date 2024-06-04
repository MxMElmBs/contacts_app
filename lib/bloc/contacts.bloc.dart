import 'package:bloc/bloc.dart';

import '../model/contact.model.dart';

abstract class ContactsEvent {}

class LoadAllContact extends ContactsEvent {}
class LoadStudentsEvent extends ContactsEvent {}
class LoadDevelopersEvent extends ContactsEvent {}

enum RequestState {LOADING, LOADED, ERROR, NONE}

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;

  ContactsState({required this.contacts, required this.requestState, required this.errorMessage});
}

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(super.initialState){
    on<ContactsEvent>((ContactsEvent event, Emitter<ContactsState> emit){


    });
  }


}


