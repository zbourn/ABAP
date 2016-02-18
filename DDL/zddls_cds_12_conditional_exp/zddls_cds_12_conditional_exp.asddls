@AbapCatalog.sqlViewName: 'ZDDLS_CDS_12'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Conditional expression in CDS view'
define view Zddls_Cds_12_Conditional_Exp as select from snwd_so as a
left outer join snwd_so_inv_head as b
    on a.node_key = b.so_guid {
    key a.so_id,
    a.currency_code,
    a.gross_amount,
    case a.delivery_status 
    when ' ' then 'OPEN'
    when 'D' then 'DELIVERED'
    else a.delivery_status
    end as delivery_status_long,
    
    case when a.gross_amount > 1000
    then 'High Volume Sales Order'
    else ' '
    end as high_volume_text,
    coalesce( b.payment_status, 'Not yet invoiced' ) as payment_status
}