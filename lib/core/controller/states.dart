abstract class NewsStates {}

class NewsInitState extends NewsStates {}

class ChangeIndexState extends NewsStates {}

class GetBusinessData extends NewsStates {}

class ErrorBusinessData extends NewsStates {}

class GetSportsData extends NewsStates {}

class ErrorSportsData extends NewsStates {}

class GetScienceData extends NewsStates {}

class ErrorScienceData extends NewsStates {}

class GetGeneralDataLoad extends NewsStates {}

class GetGeneralData extends NewsStates {}

class ErrorGeneralData extends NewsStates {}

class SearchData extends NewsStates {}

class ErrorSearch extends NewsStates {}

class ChangeCountry extends NewsStates {}
