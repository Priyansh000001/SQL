use world;
select * from country;
select * from city;

-- subquery --> show the country who have greater than population of kabul country
select name, population from city where population > (select population from city where name='Kabul');

-- now get the name of the city where the district is same as of that district of city name of amsterdam
select Name, District from city where District = (select District from city where Name = 'Amsterdam');

-- get the countrycode and the country name where the contenent matches with the contenent of the country 'Albania'
select Code,name from country
where Continent = (select Continent from country where Name = 'Albania');
-- get the continent the name of the country where the life expectancy matches with the life expectancy of the country 'cook island'
select Continent, Name from country
where LifeExpectancy = (select LifeExpectancy from country where Name = 'Cook Islands');
-- get the countrycode and the continent and gnp value for the countries where the region does not match with the region of the country name as 'benin'
select Code, Name, Continent, GNP from country 
where Region <> (select Region from country where Name = 'Benin');

-- i need the county name and the population for all the country avalable persent in the continent name as euraope
select Name, population from country where Continent = 'Europe';

--  NOTE --> moultirow subquery not allow arithmetic operations for example
select Name, population from country where Name = (select Name from country where Continent = 'Europe');
-- then we can use in or not in function for multirow subquery for example
select Name, population from country where Name in (select Name from country where Continent = 'Europe');

-- i need to get the country name and the country code where the lifeexpectancy match with the lideexpectancy of the contry name of 'Bahamas'
select Name, Code from country where LifeExpectancy = (select LifeExpectancy from country where Name = 'Bahamas');
select * from country;