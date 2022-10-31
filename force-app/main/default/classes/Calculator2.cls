public class Calculator2 {
    //starts here
    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }

    public integer add(integer a, integer b, integer c){
        system.debug('inside add method with 3 params');
        integer sum = a + b + c;
        return sum;
    }

    public boolean leapYearCheck(date dt){
        integer year = dt.year(); //clear?
        //in date class.
        //method name is isLeapYear --> one parameter, integer -> year
        //it returns boolean
        boolean isLeap = date.isLeapYear(year);
        return isLeap;
    }
//ENDS HERE
}
