# bloc_demo

BoilerPlate to setup your flutter bloc

# Includes:

Repository Pattern

Clean Architecture Implementation

Bloc Usage Sample for Authentication and Application

GetIt Boilerplates for the Repo Pattern


# What and Why?

BLoC (Business Logic Component) design pattern

Separate the user interface (UI) from the business logic of the application.

Promotes separation of concerns, testability, and maintainability in Flutter applications.


# Layers in Bloc:

The UI component, which includes the widgets that make up the user interface.

The Bloc component, which handles the business logic and communicates with the UI component.

The Repository component, which handles data storage and retrieval.



Events: Define Events that represent the user's interaction with the application.

States: Define States that represent the state of the application.

Bloc: Define a class that extends the Bloc class from the library and implement mapEventToState methods to handle events and update the state of the application.



# Use cases of Bloc widgets:

BlocProvider: Provides a bloc to its children via BlocProvider.of<T>(context).

MultiBlocProvider is a Flutter widget that merges multiple BlocProvider widgets into one.

BlocBuilder is a Flutter widget which requires a bloc and a builder function. BlocBuilder handles building the widget in response to new states.

BlocListener should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar, showing a Dialog, etc...

BlocConsumer: Reduces the amount of boilerplate needed. Should only be used when it is necessary to both rebuild UI and execute other reactions to state changes in the bloc.
