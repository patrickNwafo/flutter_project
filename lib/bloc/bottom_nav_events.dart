// import 'package:equatable/equatable.dart';
//
// // Define events
// abstract class BottomNavBlocEvent extends Equatable {
//   const BottomNavBlocEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// // Event for item tapped
// class OnItemTapped extends BottomNavBlocEvent {
//   final int index;
//
//   const OnItemTapped(this.index);
//
//   @override
//   List<Object?> get props => [index];
// }

abstract class BottomNavBarEvent{}

class OnItemTapped extends BottomNavBarEvent{
  final int index;
  OnItemTapped(this.index);
}
