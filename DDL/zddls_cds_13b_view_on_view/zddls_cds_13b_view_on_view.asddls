@AbapCatalog.sqlViewName: 'ZDDLS_CDS_13B'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View on view in CDS'
define view Zddls_Cds_13b_View_On_View as select from Zcdsv_Base as a
inner join snwd_bpa as b
    on a.buyer_guid = b.node_key {
    key b.bp_id,
    b.company_name,
    a.currency_code,
    a.gross_amount
}