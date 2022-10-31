public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        //today date
        date todayDate = date.today();
        //birtdate
        date birthdate = date.newInstance(1990, 10, 9);

        integer ageInMonths = birthdate.monthsBetween(todayDate);
        system.debug('Vitap age in months is.. ' + ageInMonths);
    }
    public void calculateAgeInDays(){
        //today date
        date todayDate = date.today();
        //birtdate
        date birthdate = date.newInstance(1990, 10, 9);

        integer ageInDays = birthdate.daysBetween(todayDate);
        system.debug('Vitap age in days is.. ' + ageInDays);
    }

    public void printSubscriptionEndDate(){
        //today date = subs start date
        date subscriptionStartDate = date.today();

        date subscriptionEndDate = subscriptionStartDate.addDays(1000);//parameter is Integer. 
        //Can we pass negative number?
        system.debug('subscriptino will end ON ' + subscriptionEndDate);

        integer yearEndDate = subscriptionEndDate.year();
        integer monthEndDate = subscriptionEndDate.month();
        system.debug('Year and month of End Date is ' + yearEndDate + ', ' + monthEndDate);
    }

    public void printOfferEndDateTime(){
        datetime offerStartDt = datetime.now();

        datetime offerEndDt = offerStartDt.addHours(51);
        system.debug('offer ends datetime ' + offerEndDt);

        //fetch JUST date component
        Date offerEndDate = offerEndDt.date();
        system.debug('offerEndDate is ' + offerEndDate);
    }
}
