public class Car { //class is similar to custom object
   //Class body. Inside of the class.
    public string carColor = ''; //class variables is similar fields
    public string carName = '';

    integer maxSpeedKmPerHr = 150; //this a class variable? YES. Private.

   public void switchOn(){
       //method body
       System.debug('starting the car NOW');
   }

   public void drive(){
       switchOn();
       system.debug('driving .... ' + carName);
   }
   public void driveAtMaxSpeed(){
       drive();
       string description = 'Driving ' + carName + ' at max speed of ' + maxSpeedKmPerHr + 'km/hr';
       system.debug(description);
   }
}

//outside of the class.
