public class PrimitiveDataTypeDemo {
    //create a method
    public void printBasicDataType(){
        system.debug('printing primitive datatypes');
        string batchName = 'batch 9';
        integer totalCandidates = 70;
        boolean isAdminCompleted = true;

        system.debug(batchName);
        system.debug(totalCandidates);
        system.debug(isAdminCompleted);

        string batchDescription = batchName + ' is fantastic.';
        system.debug(batchDescription);

        Decimal decValue = 70987984.55;
        system.debug(decValue);

        Long longValue = 21;
        system.debug(longValue);

        Object obj = 'This is a string';
        Object obj2 = 40.5;
        Object obj3 = true;
        system.debug('obj is ' + obj);
        system.debug('obj2 value is ' + obj2);
        system.debug('obj3 is ' + obj3);

        Id id1 = '0015g00000s9qW2AAI';
        system.debug('id 1 is --> ' + id1);
    }
}
