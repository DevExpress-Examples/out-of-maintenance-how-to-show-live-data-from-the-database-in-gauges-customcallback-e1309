<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dxg" %>
<%@ Register assembly="DevExpress.Web.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTimer" tagprefix="dxt" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dxg" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dxg" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dxg" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dxg" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v9.1, Version=9.1.0.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dxg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
            <div>With CustomCallBack
                <dxg:ASPxGaugeControl ID="gauge" runat="server" Height="250px" Width="250px" 
            BackColor="White" 
    EnableClientSideAPI="True" oncustomcallback="gauge_CustomCallback">
                    <Gauges>
                        <dxg:LinearGauge Bounds="0, 0, 250, 250" Name="Gauge0">
                            <scales>
                                <dxg:LinearScaleComponent AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                            EndPoint="62.5, 35" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                            MajorTickmark-ShapeOffset="-20" MajorTickmark-ShapeType="Linear_Style1_1" 
                            MajorTickmark-TextOffset="-32" MaxValue="300" MinorTickCount="4" 
                            MinorTickmark-ShapeOffset="-14" MinorTickmark-ShapeType="Linear_Style1_2" 
                            Name="Gauge0_Scale1" StartPoint="62.5, 215" AcceptOrder="0">
                                </dxg:LinearScaleComponent>
                            </scales>
                            <levels>
                                <dxg:LinearScaleLevelComponent Name="Gauge0_Level1" ScaleID="Gauge0_Scale1" 
                            Shader="&lt;ShaderObject Type=&quot;Gray&quot;/&gt;" ShapeType="Style4" 
                            ZOrder="-50" AcceptOrder="50" LinearScale="" />
                            </levels>
                            <labels>
                                <dxg:LabelComponent AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                            Name="Gauge0_Label1" Text="UnitPrice" ZOrder="-1001" AcceptOrder="1001" />
                            </labels>
                        </dxg:LinearGauge>
                    </Gauges>
                    <ClientSideEvents EndCallback="function(s, e) { timer.Start(); }" />
                </dxg:ASPxGaugeControl>
                </div>
    <dxt:ASPxTimer ID="timer" runat="server" Interval="2000">
    <ClientSideEvents Tick="function(s, e) { timer.Stop(); gauge.PerformCallback(); }" />
    </dxt:ASPxTimer>
    <asp:sqldatasource runat="server" ID="SqlDataSource1" 
        SelectCommand="SELECT MAX(UnitPrice) AS Expr1 FROM Products">
    </asp:sqldatasource>
    </form>
</body>
</html>