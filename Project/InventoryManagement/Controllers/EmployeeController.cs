using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        Entities con = new Entities();

        #region Employee
        public ActionResult Employee()
        {
            GetAllOfferProgram();
            GetAllDesignations();
            return View();
        }
        public ActionResult AddOrEdit(viewModeEmployee model)
        {

            if (model.Emp_ID == null)
            {
                GetAllOfferProgram();
                GetAllDesignations();
                return View();
            }
            else
            {
                var check = con.Employees.Where(x => x.Emp_ID == model.Emp_ID).FirstOrDefault();
                if (check == null)
                {
                    //add here
                    Employee obj = new Employee
                    {
                        Emp_ID = model.Emp_ID,
                        Name = model.Name,
                        Dept_ID = model.Dept_ID,
                        Designation_ID = model.Designation_ID,
                        Email = model.Email,
                        Status = model.Status
                    };

                    try
                    {
                        con.Employees.Add(obj);
                        con.SaveChanges();
                        //var id = con.Departments.Select(x => x.Dept_ID).Max();
                        return Json(new { success = true,  message = "Added" }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new
                        {
                            Delete = "Exception",
                            success = false,
                            message = "Error " + ex.Message
                        }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    //update here
                    try
                    {
                        check.Name = model.Name;
                        check.Dept_ID = model.Dept_ID;
                        check.Designation_ID = model.Designation_ID;
                        check.Name = model.Name;
                        check.Email = model.Email;
                        check.Status = model.Status;

                        con.Entry(check).State = EntityState.Modified;
                        con.SaveChanges();
                        return Json(new
                        {
                            success = true,
                            message = "Updated successfully"
                        }, JsonRequestBehavior.AllowGet);
                    }
                    catch (Exception ex)
                    {
                        return Json(new
                        {
                            Delete = "Exception",
                            success = false,
                            message = "Error " + ex.Message
                        }, JsonRequestBehavior.AllowGet);
                    }


                }
            }
        }

        

        public void GetAllDesignations()
        {
            var AllEmp = (from q in con.Designations
                          select new
                          {
                              q.Designation_ID,
                              q.Designation_Title,
                              q.desig_priority
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allDesignations = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.Designation_ID.ToString(),
                    Text = x.Designation_Title,
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
            else
            {
                var data = ViewBag.allDesignations = AllEmp.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
        }
        public void GetAllOfferProgram()
        {
            var AllEmp = (from q in con.Departments
                          select new
                          {
                              q.Dept_ID,
                              q.Name
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allDepartments = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.Dept_ID.ToString(),
                    Text = x.Name,
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
            else
            {
                var data = ViewBag.allDepartments = AllEmp.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
        }
        public ActionResult AllEmployee()
        {
            var emp = (from q in con.Employees
                       select new viewModeEmployee
                       {
                           Emp_ID = q.Emp_ID,
                           Name = q.Name,
                           DName = q.Department.Name,
                           Email = q.Email,
                           Status = q.Status

                       }).ToList();

            return View(emp);

        }

        public ActionResult GetEmployeeById(string id)
        {
            var check = (from q in con.Employees
                         where q.Emp_ID == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteEmployeeByID(string id)
        {
            var r = (from q in con.Employees
                     where q.Emp_ID == id
                     select q).FirstOrDefault();
            if (r != null)
            {
                try
                {
                    con.Entry(r).State = EntityState.Deleted;
                    con.SaveChanges();
                    return Json(new { Delete = "Delete", success = true, message = "Deleted successfully", JsonRequestBehavior.AllowGet });
                }
                catch (Exception)
                {
                    return Json(new { Delete = "NO", success = true, message = "Please remove All their data first", JsonRequestBehavior.AllowGet });
                }
            }
            return Json(new { success = false, message = "Error", JsonRequestBehavior.AllowGet });
        }

        #endregion
    }
}