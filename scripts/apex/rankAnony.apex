RankHandler rh = new RankHandler();
string prize1 = rh.rankPrize(1);
system.debug('1 ---> ' + prize1);

string prize2 = rh.rankPrize(2);
system.debug('2 ---> ' + prize2);

string prize4 = rh.rankPrize(4);
system.debug('4 ---> ' + prize4);

string prize9 = rh.rankPrize(9);
system.debug('9 ---> ' + prize9);

string prize11 = rh.rankPrize(11);
system.debug('11 ---> ' + prize11);



RankHandler rhh = new RankHandler();
integer r1 = 1;
string prize1 = rhh.rankPrizeSwitch(r1);
system.debug('1 ---> ' + prize1);





string prize2 = rhh.rankPrizeSwitch(2);
system.debug('2 ---> ' + prize2);

string prize4 = rhh.rankPrizeSwitch(4);
system.debug('4 ---> ' + prize4);

string prize9 = rhh.rankPrizeSwitch(9);
system.debug('9 ---> ' + prize9);

string prize11 = rhh.rankPrizeSwitch(11);
system.debug('11 ---> ' + prize11);