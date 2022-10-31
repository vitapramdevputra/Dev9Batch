public class LoopDemo {
   public void print_int_while(){
       integer count = 1;
       while (count <=25) {
           system.debug(count);
           count++;
       }
   }

   public void print_N_numbers(integer n){
       for (Integer i = 0; i < n; i++) {
            system.debug(i);
       }
   }

   public void print_N_odd_numbers(integer startInt, integer endInt){
       if(startInt > endInt){
           system.debug('start number CANNOT be greater than end number. ok?');
       } else {
            for (Integer i = startInt; i < endint; i++) {
                integer modI = math.mod(i, 2);
                if(modI == 1){
                    system.debug(i);
                }
            }
       }
   }
}
