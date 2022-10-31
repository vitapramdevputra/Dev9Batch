@isTest
public class Calculator2Test {
    @isTest
    private static void addTest1() {
        Calculator2 c = new Calculator2();
        integer sum = c.add(10, 15);
        system.assertEquals(25, sum);
    }
    @isTest
    private static void addTest2() {
        Calculator2 c = new Calculator2();
        integer sum = c.add(10, 15,5);
        system.assertEquals(30, sum);
    }
    @isTest
    private static void leapYearTest() {
        Calculator2 c2 = new Calculator2();
        date dtt = date.newInstance(2000, 01, 01);
        boolean isLeap2 = c2.leapYearCheck(dtt);
        system.assertEquals(true, isLeap2);
    }
}
