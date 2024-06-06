import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/repositories/contact.repo.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/contact.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactsBloc(ContactsState(contacts: [], requestState: RequestState.NONE, errorMessage: ""), new ContactsRepository()))
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          indicatorColor: Colors.white,
        ),
        routes: {
          "/contacts" : (context) => ContactsPage()
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
