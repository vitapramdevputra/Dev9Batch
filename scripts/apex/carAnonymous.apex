car audi = new car();
audi.carColor = 'black';
system.debug('audi => ' + audi);
system.debug(audi.maxSpeedKmPerHr);
audi.switchOn();


Car vw = new car();
vw.carcolor = 'White';
vw.carName = 'polo';
system.debug(vw);
vw.driveAtMaxSpeed();


/*
Apex class - Here you will write your code and logics. example Car Class, StringDemoClass. 
You can deploy this classes from VS code to your salesforce Org.

Anonymous Window - Here You can write a simple code snippet to call the apex class and execute a method 
to verify the result. You CANNOT deploy this to your Salesforce Org.
/*