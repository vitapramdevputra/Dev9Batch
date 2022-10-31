Map<string, country_code__c> cc = country_code__c.getAll();
system.debug('country code map --> ' + cc);

for (string eachCountry : cc.keySet()) {
    Country_code__c eachCC = cc.get(eachCountry);
    string isoCode = eachCC.iso_Code__c;
    system.debug(eachCountry + ' ISO Code is ' + isoCode);
}

//if we want to get iso code for Canada
country_code__c can = Country_code__c.getInstance('Canada');
system.debug('Canada iso code is ' + can.iso_Code__c);