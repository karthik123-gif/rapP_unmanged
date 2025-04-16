@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS for Analytics'
@Analytics.dataCategory: #CUBE
@Metadata.ignorePropagatedAnnotations: true
define root view entity zanalytic_cds as select from zanalytic
{
    @UI: {
      facet: [
        { id: 'Employee', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, 
          label: 'Employee', position: 10 }
      ]
    }

    @UI.selectionField: [{ position: 10 }]
    @UI.lineItem: [{ position: 10, label: 'SalesOrg' }]
    @UI.identification: [{ position: 10, label: 'SalesOrg' }]
    @Search.defaultSearchElement: true
    key sales_org as SalesOrg,

    @UI.selectionField: [{ position: 20 }]
    @UI.lineItem: [{ position: 20, label: 'Customer' }]
    @UI.identification: [{ position: 20, label: 'Customer' }]
    @Search.defaultSearchElement: true
    key customer as Customer,
 
    @UI.selectionField: [{ position: 30 }]
    @UI.lineItem: [{ position: 30, label: 'Material' }]
    @UI.identification: [{ position: 30, label: 'Material' }]
    @Search.defaultSearchElement: true
    key material as Material,

    @UI.selectionField: [{ position: 40 }]
    @UI.lineItem: [{ position: 40, label: 'SalesDate' }]
    @UI.identification: [{ position: 40, label: 'SalesDate' }]
    @Search.defaultSearchElement: true
    key sales_date as SalesDate,

    @UI.lineItem: [{ position: 50, label: 'Sales Amount' }]
    @DefaultAggregation: #SUM
    sales_amount as SalesAmount,

    @AnalyticsDetails.exceptionAggregationSteps: [
        { exceptionAggregationBehavior: #COUNT, exceptionAggregationElements: [ 'sales_org' ] }
        
    ]
    case 
        when sales_amount > 0 then 1 
        else 0 
    end as PositiveSalesCount
}
