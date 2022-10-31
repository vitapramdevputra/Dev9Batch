public class StringDemoClass {
   public void stringMethod1(){
       string sessionDescription = 'learning string method in apex language';
       system.debug(sessionDescription);

       //1. length
       integer lengthOfStr = sessionDescription.length();
       system.debug('length of str is..... ' + lengthOfStr);

       //2. to upper case
       string sessionDescriptionInCaps = sessionDescription.toUpperCase();
       system.debug('session description in caps = ' + sessionDescriptionInCaps);

       //3. contains apex
       Boolean containsApex = sessionDescription.contains('apex');
       system.debug('contains apex???? ' + containsApex);

       //3.x contains APEX
       Boolean containsApex2 = sessionDescription.containsIgnoreCase('APEX');
       system.debug('contains apex2???? ' + containsApex2);

       //3.1 contains salesforce
       string s1 = 'salesforce';
       Boolean containsSalesforce = sessionDescription.containsIgnoreCase(s1);
       system.debug('contains salesforce???? ' + containsSalesforce);

   }
}
