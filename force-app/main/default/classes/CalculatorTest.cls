@isTest
public class CalculatorTest {
    @isTest
    private static void testCalculator() {
        Calculator calc = new Calculator();
        calc.printNewMessage('this is coming from a test method. so chill.');
    }
    @isTest
    private static void testCalPrint2() {
        Calculator calc = new Calculator();
        string returnmsg = calc.printAndReturnMessage('this is coming from a test method, again. so chill.');
        string expectedReturnMsg = 'this is coming from a test method, again. so chill....OK Cool';
        system.assertEquals(expectedReturnMsg, returnmsg);
    }
}
