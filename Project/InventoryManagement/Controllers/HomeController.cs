using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class HomeController : Controller
    {
        Entities con = new Entities();
        public ActionResult Home()
        {
            return View();
        }
        public ActionResult Alldata()
        {
            var emp = (from d in con.Departments
                       join e in con.Employees on d.Dept_ID equals e.Dept_ID
                       join si in con.Sales_Issue on e.Emp_ID equals si.Emp_ID
                       join sd in con.Sales_Issue_Details on si.Issued_ID equals sd.Issued_ID
                       select new AllIssuedViewModels
                       {
                           Emp_ID = si.Emp_ID,
                           EmpName = e.Name,
                           DeptName=d.Name,
                           Issued_ID =si.Issued_ID,
                           Comments =si.Comments,
                           Placement=si.Placement,
                           Created_Date=si.Created_Date,
                           Created_By = si.Created_By,
                           Modify_By =si.Modify_By,
                           Modify_Date=si.Modify_Date,                           
                           Status=si.Status
                       }).Distinct().ToList();

            return View(emp);
        }

    }
}