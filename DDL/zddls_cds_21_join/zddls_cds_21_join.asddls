@AbapCatalog.sqlViewName: 'ZDDLS_CDS_21'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Join in CDS view'
define view Zddls_Cds_21_Join as select from snwd_so as a
inner join snwd_bpa as b
    on a.buyer_guid = b.node_key 
    left outer join snwd_so_inv_head as c on a.node_key = c.so_guid {
    key a.so_id,
    b.company_name,
    a.delivery_status,
    c.payment_status
}