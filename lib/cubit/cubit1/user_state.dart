class UserState {}

//final class UserInitial extends UserState {}
///1 Login
class LoginInitialState extends UserState {}

class LoginSuccessState extends UserState {}

class LoginLoadingState extends UserState {}

class LoginErrorState extends UserState {}

class NotShownLogin extends UserState {}

class ShownLogin extends UserState {}

class ShownPassword extends UserState {}

class NotShownPassword extends UserState {}

class ChangingText extends UserState {}

class ChangedText extends UserState {}

///
///2  SngUp
///
class SngUpInitialState extends UserState {}

class SngUpSuccessState extends UserState {}

class SngUpLoadingState extends UserState {}

class SngUpErrorState extends UserState {}

class SngUpError422State extends UserState {}

class ObscureTextInSngUnBody extends UserState {}

class NotObscureTextInSngUnBody extends UserState {}

class NotShownSngUnBody extends UserState {}

class ShownSngUnBody extends UserState {}

class OkDateSngUnBody extends UserState {}

class NotDateSngUnBody extends UserState {}

///3 lost
class LostInitialState extends UserState {}

class LostSuccessState extends UserState {}

class LostLoadingState extends UserState {}

class LostErrorState extends UserState {}

class LostOkCheekInLostPasswordBody extends UserState {}

class LostNotOkCheekInLostPasswordBody extends UserState {}

///4 sure
class SureInitialState extends UserState {}

class SureSuccessState extends UserState {}

class SureLoadingState extends UserState {}

class SureErrorState extends UserState {}

class SureColor extends UserState {}
