DatetimeMethodsDemo dm = new DatetimeMethodsDemo();
dm.printOfferEndDateTime();

dm.printSubscriptionEndDate();

dm.calculateAgeInMonths();
dm.calculateAgeInDays();



 datetime birthdate = datetime.newInstance(1990, 10, 9, 7, 30, 00);
 long longbirthdate = birthdate.getTime(); //returns millisends from 1970 Jan 1 0000 GMT
 system.debug('long birth date = ' + longbirthdate);