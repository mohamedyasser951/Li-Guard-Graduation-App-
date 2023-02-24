abstract class LayoutStates{}

class InitState extends LayoutStates{}
// change AppMode
class ChangeAppModeState extends LayoutStates{}

// Get Tasks
class GetTasksLoadingState extends LayoutStates{}
class GetTasksSuccessState extends LayoutStates{}
class GetTasksErrorState extends LayoutStates{}