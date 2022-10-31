Calculator2 c2 = new Calculator2();
date today = date.today();
boolean isLeap = c2.leapYearCheck(today);
system.debug('this year is leap? ' + isLeap);

date dtt = date.newInstance(2000, 01, 01);
boolean isLeap2 = c2.leapYearCheck(dtt);
system.debug(dtt + ' falls in leap year? ' + isLeap2);


integer x = c2.add(3,5, 4);
system.debug('x is ' + x);


integer s = c2.add(5, 100);
system.debug('sum of 5 and 100 is ' + s);

