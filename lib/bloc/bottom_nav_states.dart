abstract class BottomNavState{}

class BottomNavBarInitial extends BottomNavState{}

class BottomNavBarSelected extends BottomNavState{
  final int selectedIndex;
  BottomNavBarSelected(this.selectedIndex);
}


// import 'package:equatable/equatable.dart';
//
// // Define states
// abstract class BottomNavBlocState extends Equatable {
//   const BottomNavBlocState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// // Initial state
// class BottomNavBarInitial extends BottomNavBlocState {}
//
// // State when a navigation item is selected
// class BottomNavBarSelected extends BottomNavBlocState {
//   final int index;
//
//   const BottomNavBarSelected(this.index);
//
//   @override
//   List<Object?> get props => [index];
// }

