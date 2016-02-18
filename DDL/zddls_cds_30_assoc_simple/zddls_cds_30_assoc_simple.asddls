@AbapCatalog.sqlViewName: 'ZDDLS_CDS_30'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Simple Association in CDS view'
define view Zddls_Cds_30_Assoc_Simple as select from snwd_so as a
association [1] to snwd_bpa as b
on a.buyer_guid = b.node_key
association [0..1] to snwd_so_inv_head as c
on a.node_key = c.so_guid
     {
       key a.so_id as order_id,
       a.delivery_status,
       c.payment_status,
       c.currency_code,
       sum(c.gross_amount) as total_gross_amount    
}
where b.company_name = 'SAP'
group by a.so_id, a.delivery_status, c.payment_status, c.currency_code
having sum(a.gross_amount) > 3000;