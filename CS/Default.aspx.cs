using System;
using DevExpress.Web.ASPxGauges.Gauges.Linear;
using DevExpress.Web.ASPxGauges;
using System.Data;
using System.Web.UI;

namespace WebApplication1 {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Init(object sender, EventArgs e) {
            if (!IsPostBack && !IsCallback) {
                UpdateGauge();
            }
        }
        private void SetupDataSourceInternal() {
            SqlDataSource1.ConnectionString = "Data Source=(local);Initial Catalog=Northwind;Integrated Security=True";
            SqlDataSource1.DataSourceMode = System.Web.UI.WebControls.SqlDataSourceMode.DataSet;
        }
        private void UpdateGauge() {
            SetupDataSourceInternal();
            UpdateScaleInternal(gauge);
        }
        private void UpdateScaleInternal(ASPxGaugeControl gauge) {
            float oldValue = ((LinearGauge)gauge.Gauges[0]).Scales[0].Value;
            //Dennis: use a random value, just for demonstration purposes.
            //DataView dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            //float newValue = Convert.ToSingle(dv.Table.Rows[0][0]);
            float newValue = new Random().Next(300);
            if (oldValue != newValue) {
                ((LinearGauge)gauge.Gauges[0]).Scales[0].Value = newValue;
                gauge.DataBind();
            }
        }
        protected void gauge_CustomCallback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
            UpdateGauge();
        }
    }
}