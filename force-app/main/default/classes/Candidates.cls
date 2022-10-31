public class Candidates {
    public string name;
    public string gender;
    public static string companyName;
    public static integer candidateCount = 0;

    public Candidates(){
        candidateCount++; 
    }

    public void printCandidate(){
        system.debug('Candidate name is ' + name + '('+ gender +')');
        system.debug('company name is ' + companyName);
        system.debug('=====END=====');
    }

    public static void printCandidateInfo() {
        //static variable inside static method? YES.
        system.debug('company name is ' + companyName); 

        //non-static variable inside static method?
        //system.debug('name is ' + name);
    }
}
