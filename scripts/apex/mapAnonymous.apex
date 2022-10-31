map<string, string> mapCountryCurrency = new map<string, string>();
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkiye', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
mapCountryCurrency.put('Canada', 'Dollar');
system.debug(mapCountryCurrency);

string Ind = 'India';
String IndiaCurrency = mapCountryCurrency.get(Ind);
String TurkiyeCurrency = mapCountryCurrency.get('Turkiye');

system.debug('India currency => ' + IndiaCurrency);
system.debug('Turkiye curency => ' + TurkiyeCurrency);

set<string> allCountries = mapCountryCurrency.keySet();
system.debug('all countries are ' + allCountries);

List<string> allCurrencies = mapCountryCurrency.values();
system.debug('all curreiencies ==> ' + allCurrencies);


set<string> countrySet = mapCountryCurrency.keySet();
//{Canada, El Salvador, France, India, Turkiye, USA}
for(string eachCountry: countrySet){
    system.debug('each Country ==> ' + eachCountry);
    //value? How to get value from KEY? 
    string eachCurrency = mapCountryCurrency.get(eachCountry);
    system.debug('each currency ==> ' + eachCurrency);
    system.debug('---------------');
}