@AbapCatalog.sqlViewName: 'ZDDLS_CDS_20'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Union in CDS View'
define view Zddls_Cds_20_Union as select from snwd_so as a join snwd_bpa as b
on a.buyer_guid = b.node_key {
    key b.bp_id,
    b.company_name,
    sum(a.gross_amount) as total_gross_amount,
    'Small' as category
}
group by b.bp_id, b.company_name
having sum(a.gross_amount) < 100000

union all 

select from snwd_so as a join snwd_bpa as b 
on a.buyer_guid = b.node_key
{
key b.bp_id,
    b.company_name,
    sum(a.gross_amount) as total_gross_amount,
    'Large' as category
}
group by b.bp_id, b.company_name
having sum(a.gross_amount) >= 100000