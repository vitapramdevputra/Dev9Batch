public class Cat {
    public string name;
    public string color;
    //parameterized consturctor
    //similar to method.
        //But does NOT return anything.
        //And name is same like classname
    public Cat(string n, string clr){
        name = n;
        color = clr;
        sleeping();
    }

    public Cat(){
        system.debug('Cat constructor called');
    }
    
    public void sleeping(){
        system.debug(name + ' is sleeping');
    }
}
