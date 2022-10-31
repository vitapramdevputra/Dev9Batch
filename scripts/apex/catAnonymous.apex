//IF we have NO constructor.
    //then new cat() --> will work.
//But if we Have a consturctor 
    //which TAKES parameters.
    //then new cat() --> will NOT work.
cat sf = new cat();
sf.name = 'dummy';
sf.color = 'white';
system.debug(sf);

//when we create new instance, 
    //consturctor is called.
//if constructor is expecting params, 
    //then we MUST pass it 
        //while creating new instance.
cat fluffy = new cat('fluffykins', 'white');
system.debug(fluffy);