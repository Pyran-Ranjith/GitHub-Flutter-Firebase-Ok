__________________________________________________________
# Flutter BLOC | Firebase Auth using Bloc | Bloc Master Class
[Flutter BLOC | Firebase Auth using Bloc | Bloc Master Class](https://youtu.be/eK5RCXVY2rc?t=2016)

- [Resources]()

## Bookmarks Vedio
- Date: 21-Aug-2024
- Bookmark: 

## Instalation
- Folder path: E:\Users\Public\AA-FLUTTER-WORK\0101-FB-Bloc-FlutterFly-FB-Auth-MasterClass
### GitHub
[firebasebloc](https://github.com/jobinsebastianralfiz/firebasebloc.git)

- $ flutter create . --template=app --platforms=android --org=com.ranjith --project-name=flutter_firebase_modal
## Extensions neededed
- Flutter Widget Snippets
- Error Lense

- Install Dependents 
    $ flutter pub add firebase_core
    $ flutter pub add firebase_auth
- OR
- Include Dependents in pubspec.yamal
  cupertino_icons: ^1.0.6
  firebase_core: ^2.30.1
  firebase_auth: ^4.20.0

- IF ERROR FOUND IN MAIN.DART
    - $ flutter clean -v
    - $ flutter packages get
    - $ flutter packages upgrade
    - $ dart fix --apply
    - in command palete (F1) type 'Reload Window'

## How BLOC functionrd
1. define the state in _state.dart file
````
final class HomeInitial extends HomeState {}
...
abstract class Home1ActionState extends HomeState {}
...
````

2. define the event in event.dart file
````
class HomeWishlistNavigateButtonClickedEvent extends HomeEvent {
  HomeWishlistNavigateButtonClickedEvent();
}
````

3. define in _bloc.dart, also create method by clicking a bulb
````
class Home2Bloc extends Bloc<Home2Event, Home2State> {
  Home2Bloc() : super(Home2Initial()) {
    // product button click
    on<Home2WishlistNavigateButtonClickedEvent>(home2WishlistNavigateButtonClickedEvent);
  }

  FutureOr<void> home2WishlistNavigateButtonClickedEvent(Home2WishlistNavigateButtonClickedEvent event, Emitter<Home2State> emit) {
  }
}
````

4. now define the event in home.dart
````
final Home1Bloc home1Bloc = Home1Bloc();

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Home1Bloc, Home1State>(
      bloc: home1Bloc,
      listenWhen: (previous, current) => current is Home1ActionState,
      buildWhen: (previous, current) => current is! Home1ActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: Text(
              'Home1 - Ranjith\'s Grocery App',
              style: TextStyle(
                color: Colors.black,
                // fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    // home1Bloc.add(Home1WishlistNavigateButtonClickedEvent());
                    home1Bloc.add(Home1WishlistNavigateButtonClickedEvent());
                  },
                  icon: Icon(Icons.favorite_border)),
            ],
          ),
        );
      },
    );
  }
}
````

3. now define the event in home.dart 
