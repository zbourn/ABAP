@AbapCatalog.sqlViewName: 'ZDDLS_CDS_00'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Simple CDS View'
define view Zddls_Cds_00_Simple as select from snwd_so {
    snwd_so.so_id as order_id,
    snwd_so.gross_amount,
    snwd_so.currency_code 
}