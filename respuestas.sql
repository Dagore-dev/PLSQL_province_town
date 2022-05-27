-- 1
create or replace procedure update_population (ciudad varchar, nueva_poblacion integer) 
as 
begin 
    update town 
    set population = nueva_poblacion 
    where id = (select id from town where town = ciudad); 
end;
-- 2
create or replace procedure start_with (s varchar)
is
    cursor c is
        select town
        from town
        where town like s || '%';
begin

    for registro in c
    loop
        dbms_output.put_line(registro.town);
    end loop;

end;
-- 3
create or replace function first_town
return varchar is
  nombre varchar(255);
begin

  select town into nombre
  from town
  order by town
  fetch first 1 rows only;

  return nombre;

end first_town;
-- 4
create or replace procedure contains (s varchar)
is
    cursor c is
        select town, province
        from town
        join province on idprovince = province.id
        where town like '%' || s || '%';
begin

    for registro in c
    loop
        dbms_output.put_line(registro.town || ' ' || registro.province);
    end loop;

end;
-- 5
create or replace function get_province (ciudad varchar)
return varchar is
    result varchar(255);
begin

    select province into result
    from province
    where id = (select idprovince from town where town = ciudad);
    
    return result;

end get_province;
-- 6
create or replace function most_populous_city
return varchar is
    result varchar(255);
begin
    
    select town into result
    from town
    where population = (select max(population) from town)
    fetch first 1 rows only;
    
    return result;
    
end most_populous_city;
-- 7
create or replace function number_of_towns (provincia varchar)
return integer is
    result integer;
begin

    select count(*) into result
    from town
    where idprovince = (select id from province where province = provincia);
    
    return result;

end number_of_towns;
-- 8
create or replace procedure list_towns
is
    cursor c is
        select province, count(*) as towns
        from town
        join province on idprovince = province.id
        group by province
        order by count(*);
begin

    for registro in c
    loop
        dbms_output.put_line(registro.province || ': ' || registro.towns);
    end loop;

end;
-- 9
create or replace function total_population (provincia varchar)  
return integer is 
    result integer; 
begin 
 
    select sum(population) into result 
    from town 
    join province on idprovince = province.id 
    where province = provincia; 
     
    return result; 
 
end total_population; 
