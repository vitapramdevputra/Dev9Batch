SetDemo.citySet();
SetDemo.randomIntegerSet();


list<integer> l2 = new list<integer>();
l2.add(10);
l2.add(15);
l2.add(21);
l2.add(15);
l2.add(15);
set<integer> setInteger = SetDemo.setFromList(l2);
system.debug('setInteger ==>> ' + setInteger);


set<string> cities = new set<string>();
cities.add('Tokyo');
cities.add('Nairobi');
cities.add('Lisbon');
cities.add('Berlin');
cities.add('Tokyo');
cities.add('Berlin');
cities.add('Nairobi');
set<string> capCities = SetDemo.capitalizeAllSet(cities);
system.debug('cap cities => ' + capCities);
