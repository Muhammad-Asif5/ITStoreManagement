using CrystalDecisions.CrystalReports.Engine;
using InventoryManagement.Dataset;
using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryManagement.Forms
{
    public partial class DetailedReport : System.Web.UI.Page
    {
        Entities db = new Entities();
        ds_Issued ds;
        DataTable dt = new DataTable();
        private static string GetConStr
        {
            get
            {
                string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["InventoryManagement.Properties.Settings.Setting"].ConnectionString;
                return strConnection;
            }
        }
        SqlConnection con = new SqlConnection(GetConStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string IssuedID = Request.QueryString["IssuedID"];
                //string InvoiceNo = Request.QueryString["InvNo"];

                ChangeFunction(IssuedID);
            }
            else
            {
                ReportDocument doc = (ReportDocument)Session["EmpSalesReport"];
                Employee_Report.ReportSource = doc;
            }
        }

        public void ChangeFunction(string IssuedID)
        {
            ds = new ds_Issued();
            // SqlCommand cmd = new SqlCommand("SELECT        Employee.Emp_Id, Employee.Name, Employee.Designation_ID, "
            //+ " Department.Dept_Desc, Sale_Invoice.Issue_Date, Sale_Invoice.Received_By, Sale_Invoice.Comments, "
            //+ " Sale_Invoice.Gross_Amount, "
            //+ " Item_Stock.Brand_name, Sale_InvDET.SQty, Sale_InvDET.SPrice_PerItem, Sale_InvDET.Requested_Qty, "
            //+ " Sale_InvDET.SPrice_PerUnit, Sale_InvDET.TSPrice_PerItem, Sale_Invoice.Invoice_no, "
            //+ " Sale_Invoice.Created_By, Sale_Invoice.Created_Date, Designation.Designation_Title "
            //+ " FROM Item_Stock INNER JOIN "
            //          + "    Sale_InvDET ON Item_Stock.Stock_no = Sale_InvDET.Stock_no INNER JOIN "
            //          + "   Sale_Invoice ON Sale_InvDET.Invoice_no = Sale_Invoice.Invoice_no INNER JOIN "
            //          + "    Employee INNER JOIN "
            //          + "   Department ON Employee.Dept_ID = Department.Dept_ID ON Sale_Invoice.Customer_Code = Employee.Emp_Id INNER JOIN "
            //          + "    Designation ON Employee.Designation_ID = Designation.Designation_ID "
            // + " WHERE        (Sale_Invoice.Invoice_no = " + IssuedID + ")", con);
            SqlCommand cmd = new SqlCommand("select * from v_SalesDetails where Issued_ID=" + IssuedID + "", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "EmployeeIssued");

            ReportDocument po = new ReportDocument();
            po.Load(Server.MapPath("~/Reports/rptDetailed.rpt"));
            po.SetDataSource(ds);
            Session["EmpSalesReport"] = po;
            Employee_Report.ReportSource = po;
            Employee_Report.DataBind();
            Employee_Report.RefreshReport();

            //this.Employee_Report.BestFitPage = true;
            //this.Employee_Report.HasExportButton = true;
            //this.Employee_Report.EnableDrillDown = true;
            //this.Employee_Report.ShowAllPageIds = true;
            //this.Employee_Report.Zoom(100);
            //this.Employee_Report.HasPrintButton = true;
            //this.Employee_Report.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            ViewReport();
        }
        private void ViewReport()
        {
            this.Employee_Report.BestFitPage = true;
            this.Employee_Report.HasExportButton = true;
            this.Employee_Report.EnableDrillDown = true;
            this.Employee_Report.ShowAllPageIds = true;
            this.Employee_Report.Zoom(100);
            this.Employee_Report.HasPrintButton = true;
            this.Employee_Report.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
            //this.Employee_Report.SeparatePages = false;

            this.Employee_Report.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;
            //this.Employee_Report.ShowAllPageIds = true;

            int myFOpts = (int)(CrystalDecisions.Shared.ViewerExportFormats.ExcelRecordFormat | CrystalDecisions.Shared.ViewerExportFormats.PdfFormat | CrystalDecisions.Shared.ViewerExportFormats.RptrFormat | CrystalDecisions.Shared.ViewerExportFormats.ExcelFormat | CrystalDecisions.Shared.ViewerExportFormats.WordFormat | CrystalDecisions.Shared.ViewerExportFormats.XLSXFormat);
            this.Employee_Report.AllowedExportFormats = myFOpts;
        }
    }
}