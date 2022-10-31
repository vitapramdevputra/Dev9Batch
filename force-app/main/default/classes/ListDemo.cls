public class ListDemo {
    //parameter => INDEX
    //return    ==> VALUE at that INDEX
   public static string candidatesList(integer i) {
       //null is null. null is NOT empty. Empty is not NULL.
       List<string> listCandidates = new list<string>();
       listCandidates.add('Marc'); //0
       listCandidates.add('Elon'); //1
       listCandidates.add('Bill'); //2
       listCandidates.add('Marc'); //3
       system.debug('candidates list is ' + listCandidates);
       string returnStr = '';
       //-5 < 4 => true
       if (i >= 0 && i < listCandidates.size()) {
           returnStr = listCandidates[i];
       } else {
           returnStr = 'NO Values FOUND.';
       }
       return returnStr;
   }

   public static void randomIntegerList() {
       list<integer> listInteger = new list<integer>();
       listInteger.add(10);
       listInteger.add(15);
       listInteger.add(21);
       listInteger.add(15);
       listInteger.add(15);

       system.debug('random integer list IS ' + listInteger);

       integer index3value = listInteger.get(3);
       system.debug('index 3 value => ' + index3value);

       integer index2value = listInteger[2];
       system.debug('index 2 value =? ' + index2value);
   }

   public static void allCats() {
        cat fluffy = new cat('fluffykins', 'white');
        cat vitapsCat = new cat('simba', 'brown');
        cat subramaniCat = new cat('smokey', 'grey');

        List<cat> cats = new list<cat>();
        cats.add(fluffy);
        cats.add(vitapsCat);
        cats.add(subramaniCat);
        cats.add(fluffy);

        system.debug('all cats => ' + cats);
        if (!cats.isEmpty()) {
            cat index3 = cats[3];
            system.debug('Cat at index 3 ==> ' + index3);
        }
   }
}
