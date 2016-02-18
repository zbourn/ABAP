@AbapCatalog.sqlViewName: 'ZTRM_BOOK'
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Booking Data'
define view Ztrm_Book_DDL as select from sbook as a
join spfli as b on a.carrid = b.carrid and
                   a.connid = b.connid
//join scarr as c on a.carrid = c.carrid
//join sairport as d on b.airpfrom = d.id
//join sairport as e on b.airpto = e.id
//association [1] to spfli as b
//    on a.carrid = b.carrid and 
//       a.connid = b.connid
association [1] to scarr as c
on $projection.carrid = c.carrid        
association [1] to sairport as d
on $projection.airpfrom = d.id
association [1] to sairport as e
on $projection.airpto = e.id       
{
    a.carrid as carrid,
    a.connid as connid,
    fldate,
    bookid,
    passname,
    forcuram,
    b.airpfrom,
    d.name as airportfrom,
    cityfrom,
    countryfr,
    airpto,
    e.name as airportto,
    countryto,
    cityto,
    c.carrname,
    c.url,
    class,
    loccuram,
    loccurkey,
    order_date,
    agencynum
  //  _association_name // Make association public
    
} 