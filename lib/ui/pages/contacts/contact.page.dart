import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:flutter/material.dart';
//import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ContactsBloc>().add(LoadAllContact());
                    },
                    child: Text("All Students"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      //textStyle: TextStyle(color: Colors.white, ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // Rounded corners
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Students"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      //textStyle: TextStyle(color: Colors.white, ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // Rounded corners
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Developers"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      //textStyle: TextStyle(color: Colors.white, ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0), // Rounded corners
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
              if (state.requestState == RequestState.LOADING) {
                return CircularProgressIndicator();
              } else if (state.requestState == RequestState.ERROR) {
                return Column(
                  children: [
                    Text("${state.errorMessage}"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Retry"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        //textStyle: TextStyle(color: Colors.white, ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(0), // Rounded corners
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state.requestState == RequestState.LOADED) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            children: [Text("${state.contacts[index].name}")],
                          ),
                        );
                      }),
                );
              } else {
                return Container();
              }
            }),
          ],
        ));
  }
}
