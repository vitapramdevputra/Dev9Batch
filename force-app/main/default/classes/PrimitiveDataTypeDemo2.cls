public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new date instance');
        //new date using YEAR, MONTH, DAY
        Date newDate = Date.newInstance(1997, 8, 18);
        system.debug('newDate is ' + newDate);

        date newDate2 = date.newinstance(2022, 2, 22);
        system.debug('newDate 2 is ' + newDate2);

        date todayDate = date.today();
        system.debug('today\'s date is ' + todayDate );
    }

    public void printNewTime(){
        //new time using HOUR, MINUTE, SECOND, MILLISECOND
        Time mytime = time.newInstance(18, 25, 15, 52);
        system.debug(mytime);

        Time mytime2 = time.newInstance(5, 15, 35, 5);
        system.debug(mytime2);
    }

    public void printNewDateTime(){
        Date todayDate = date.today();
        Time mytime = time.newInstance(18, 25, 15, 52);

        //1. New datetime from Date and Time
        Datetime dt1 = datetime.newInstance(todayDate, mytime);
        system.debug('dt1 is --> ' + dt1);

        //2. datetime using YEAR, MONTH, DAY
        datetime dt2 = datetime.newInstance(2025,9,14); //this is MIDNIGHT FOR Pacific time (SF user's timezone). So gmt is +7
        system.debug('dt2 is --> ' + dt2); //it prints in GMT

        //3. datetime with YEAR, MONTH, DAY, HOUR, MINUTE, SECOND   
        datetime dt3 = datetime.newInstance(2022, 5, 15, 1, 45, 6); //It will create pacific time (SF user's timezone). 
        system.debug('dt3 --> ' + dt3);// but it will print GMT. 

        //4. longtime
        long longTime = 1467854987654L;
        datetime dt4 = datetime.newInstance(longTime);

        long longTimeZero = 0;
        datetime dt41 = datetime.newInstance(longTimeZero);

        system.debug('dt 4 --> '  + dt4);
        system.debug('dt 41 --> ' + dt41);

        //5. gmt 
        datetime dt5 = datetime.newInstanceGmt(2022, 5, 15, 1, 45, 6);
        system.debug('dt5 --> ' + dt5); //prints in GMT

        //6. now
        datetime dt6 = datetime.now();
        system.debug('dt6 --> ' + dt6);
        datetime dt7 = System.now();
        system.debug('dt7 --> ' + dt7);

    }
}
