@AbapCatalog.sqlViewName: 'ZDDLS_CDS_14B'
@ClientDependent: true
@AbapCatalog.compiler.CompareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consume input parameter CDS view'
define view Zddls_Cds_14b_Consumption as select from Zddls_Cds_14a_Input_Parameters( customer_name: 'SAP' ) as a {
    a.param_customer_name
}