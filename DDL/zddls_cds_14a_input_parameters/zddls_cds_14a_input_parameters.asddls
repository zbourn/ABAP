@AbapCatalog.sqlViewName: 'ZDDLS_CDS_14A'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS view with input parameters'
define view Zddls_Cds_14a_Input_Parameters
    with parameters customer_name : abap.char( 80 )
as select from snwd_so as a 
inner join snwd_bpa as b 
on a.buyer_guid = b.node_key {
    key a.so_id as order_id,
    $parameters.customer_name as param_customer_name,
    case when b.company_name = $parameters.customer_name then 'Found It!'
    else 'Not Found'
    end as found_customer
}
where b.company_name = $parameters.customer_name;