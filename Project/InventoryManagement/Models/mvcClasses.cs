using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace InventoryManagement.Models
{
    public class AllIssuedViewModels
    {
        public string Emp_ID { get; set; }
        public string EmpName { get; set; }
        public string DeptName { get; set; }
        public int Issued_ID { get; set; }
        public string Comments { get; set; }
        public string Placement { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MMM/yyyy}")]
        public DateTime? Created_Date { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MMM/yyyy}")]
        public DateTime? Modify_Date { get; set; }
        public string Modify_By { get; set; }
        public string Created_By { get; set; }
        public string Status { get; set; }
        public string Inventory_No { get; set; }
        public int SerialNo { get; set; }
    }
    public class viewModelDepartment
    {
        public int? Dept_ID { get; set; }
       
        [DisplayName("Department Name")]
        public string Name { get; set; }
    }
    public class viewModeEmployee
    {
        public string DName { get; set; }
        //[Required]
        [DisplayName("Employee ID")]
        public string Emp_ID { get; set; }
        //[Required]
        [DisplayName("Select Department")]
        public Nullable<int> Dept_ID { get; set; }
        [DisplayName("Select Designation")]
        public Nullable<int> Designation_ID { get; set; }
        //[Required]
        [DisplayName("Employee Name")]
        public string Name { get; set; }
        //[Required]
        [DisplayName("Employee Email")]
        public string Email { get; set; }
        //[Required]
        [DisplayName("Employee Status")]
        public string Status { get; set; }
       
    }
    public class viewModeCategory
    {
        public int Cat_ID { get; set; }
        [Required]
        [DisplayName("Category Name")]
        public string Name { get; set; }
    }
    public class viewModeProduct
    {
        [DisplayName("Category Name")]
        public string CatName { get; set; }
        public int PID { get; set; }
        // [Required]
        [DisplayName("Select Category")]
        public Nullable<int> Cat_ID { get; set; }
       // [Required]
        [DisplayName("Model No")]
        public string Model_Name { get; set; }
        public string Image { get; set; }
        //[Required]
        [DisplayName("Status")]
        public string Status { get; set; }
    }
    public class viewModeInventory_Available
    {
        public string Model_Name { get; set; }
        public string PName { get; set; }
        //[Required]
        [DisplayName("Select Product")]
        public Nullable<int> PID { get; set; }
        [DisplayName("Inventory No")]
        public string Inventory_No { get; set; }
        public string Placement { get; set; }
        //[Required]
        [DisplayName("Status")]
        public string Status { get; set; }
    }
    public class viewModelSales_Issue
    {
        public string eName { get; set; }
        public int? Issued_ID { get; set; }
        public string Emp_ID { get; set; }
        public string Comments { get; set; }
        public string Placement { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public string Status { get; set; }

    }
    public class viewModelSales_Issue_Details
    {
        public string cName { get; set; }
        public string pName { get; set; }
        public string Inven_ID { get; set; }
        public int Issued_ID { get; set; }
        public int PID { get; set; }
        public string Inventory_No { get; set; }
        public string Comments { get; set; }
        public string Issued_From { get; set; }
        public string Issued_By { get; set; }
        public string Issue_Type { get; set; }
        public Nullable<System.DateTime> Issued_Date { get; set; }
        public string Status { get; set; }

    }



    public class vv_SalesDetails
    {
        public string Emp_ID { get; set; }
        public string Name { get; set; }
        public string Comments { get; set; }
        public string Placement { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public string Status { get; set; }
        public string Inventory_No { get; set; }
        public string Issued_From { get; set; }
        public string Issued_By { get; set; }
        public string Issue_Type { get; set; }
        public Nullable<System.DateTime> Issued_Date { get; set; }
        public string SalesDetailsStatus { get; set; }
        public string CatName { get; set; }
        public string Model_Name { get; set; }
        public int Issued_ID { get; set; }
        public string Inven_ID { get; set; }
    }

}