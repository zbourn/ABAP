@AbapCatalog.sqlViewName: 'ZDDLS_CDS_13A'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Base CDS view'
define view Zcdsv_Base as select from snwd_so as a {
    a.so_id as order_id,
    a.buyer_guid,
    a.currency_code,
    a.gross_amount
}