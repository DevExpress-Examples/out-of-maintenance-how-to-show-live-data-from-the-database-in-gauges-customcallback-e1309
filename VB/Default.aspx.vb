Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGauges.Gauges.Linear
Imports DevExpress.Web.ASPxGauges
Imports System.Data
Imports System.Web.UI

Namespace WebApplication1
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
			If (Not IsPostBack) AndAlso (Not IsCallback) Then
				UpdateGauge()
			End If
		End Sub
		Private Sub SetupDataSourceInternal()
			SqlDataSource1.ConnectionString = "Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
			SqlDataSource1.DataSourceMode = System.Web.UI.WebControls.SqlDataSourceMode.DataSet
		End Sub
		Private Sub UpdateGauge()
			SetupDataSourceInternal()
			UpdateScaleInternal(gauge)
		End Sub
		Private Sub UpdateScaleInternal(ByVal gauge As ASPxGaugeControl)
			Dim oldValue As Single = (CType(gauge.Gauges(0), LinearGauge)).Scales(0).Value
			'Dennis: use a random value, just for demonstration purposes.
			'DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
			'float newValue = Convert.ToSingle(dv.Table.Rows[0][0]);
			Dim newValue As Single = New Random().Next(300)
			If oldValue <> newValue Then
				CType(gauge.Gauges(0), LinearGauge).Scales(0).Value = newValue
				gauge.DataBind()
			End If
		End Sub
		Protected Sub gauge_CustomCallback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
			UpdateGauge()
		End Sub
	End Class
End Namespace