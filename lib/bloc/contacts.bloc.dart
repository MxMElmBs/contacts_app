import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/repositories/contact.repo.dart';

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
  ContactsRepository contactsRepository;
  ContactsBloc(super.initialState, this.contactsRepository){
    on<ContactsEvent>((ContactsEvent event, Emitter<ContactsState> emit) async*{
      if(event is LoadAllContact) {
         yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, errorMessage: "");
         try {
            List<Contact> data = await contactsRepository.allContacts();
            yield ContactsState(contacts: data, requestState: RequestState.LOADED, errorMessage: "");
         } catch(e) {
            print(e);
            yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.toString());
         }

      } else if(event is LoadDevelopersEvent){

      } else if(event is LoadStudentsEvent){

      }
    });
  }


}


