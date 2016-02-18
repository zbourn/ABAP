@AbapCatalog.sqlViewName: 'ZDDLS_CDS_11'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Arithmetic and Cast in CDS'
define view Zddls_Cds_11_Arith_And_Cast as select from snwd_so as a 
inner join snwd_bpa as b 
    on a.buyer_guid = b.node_key {
    key b.bp_id as customer_id,
    b.company_name,
    ( a.gross_amount - a.net_amount ) as tax_amount,
    0.85 * cast( a.gross_amount as abap.fltp ) as reduced_gross_amount    
}
