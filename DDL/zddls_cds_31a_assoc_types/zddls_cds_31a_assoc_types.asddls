@AbapCatalog.sqlViewName: 'ZDDLS_CDS_31A'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Association types in CDS view'
define view Zddls_Cds_31a_Assoc_Types as select from snwd_so as a
association [1] to snwd_bpa as b
on a.buyer_guid = $projection.buyer_guid 
association [0..1] to snwd_so_inv_head as c
on a.buyer_guid = c.so_guid    
    {
    key a.so_id as order_id,
    --Ad-hoc association
    a.delivery_status,
    --exposed association
    -- field used in the ON condition
    a.buyer_guid,
    -- exposing association b (business_partners)
    b
}