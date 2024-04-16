abstract class NewsState{}
class initial extends NewsState{}
class bottomnav extends NewsState{}
class NEWSBUSINESSloading extends NewsState{}
class NEWSBUSINESSSUCESS extends NewsState{}
class NEWSBUSINESFAILED extends NewsState{
  late final String error;
  NEWSBUSINESFAILED(this.error);
}class NEWSSportsloading extends NewsState{}
class NEWSSportsSUCESS extends NewsState{}
class NEWSSportsFAILED extends NewsState{
  late final String error;
  NEWSSportsFAILED(this.error);
}class NEWSScienceloading extends NewsState{}
class NEWSScienceSUCESS extends NewsState{}
class NEWSScienceFAILED extends NewsState{
  late final String error;
  NEWSScienceFAILED(this.error);
}class NEWSSearchloading extends NewsState{}
class NEWSsearchSUCESS extends NewsState{}
class NEWSsearchFAILED extends NewsState{
  late final String error;
  NEWSsearchFAILED(this.error);
}
