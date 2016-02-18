@AbapCatalog.sqlViewName: 'ZDDLS_CDS_10'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Aggregation and Literal in CDs view'
define view Zddls_Cds_10_Agg_And_Lit as select from snwd_so as a
inner join snwd_bpa as b
    on a.buyer_guid = b.node_key {
    key b.bp_id as customer_id,
    b.company_name,
    'Literal' as string_literal,
    42 as integer_literal,
    a.currency_code,
    sum( a.gross_amount ) as total_gross_amount
}
group by b.bp_id, b.company_name, a.currency_code
having sum( a.gross_amount ) > 1000;