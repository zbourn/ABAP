@AbapCatalog.sqlViewAppendName: 'ZDDLS_CDS_13C'
@EndUserText.label: 'Extend view in CDS'
extend view Zcdsv_Base with zcdsv_customer_extension {
    a.delivery_status,
    a.billing_status,
    a.created_at,
    a.created_by
}