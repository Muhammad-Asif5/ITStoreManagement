using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class DepartmentController : Controller
    {
        // GET: Department
        Entities con = new Entities();


        #region Department
        public ActionResult Department()
        {
            return View();
        }
        public ActionResult AddOrEdit(viewModelDepartment model)
        {
            
            if (model.Name == null)
            {
                return View();
            }
            else
            {
                var check = con.Departments.Where(x => x.Dept_ID == model.Dept_ID).FirstOrDefault();
                if (check == null)
                {
                    //add here
                    Department obj = new Department
                    {
                        Name = model.Name
                    };

                    try
                    {
                        con.Departments.Add(obj);
                        con.SaveChanges();
                        var id = con.Departments.Select(x => x.Dept_ID).Max();
                        return Json(new { success = true, id= id, message = "Added" }, JsonRequestBehavior.AllowGet);
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

        public ActionResult AllDepartment()
        {
            var emp = (from q in con.Departments
                       select new viewModelDepartment {
                           Dept_ID = q.Dept_ID,
                           Name = q.Name
                       }).ToList();

            return View(emp);

        }
        public ActionResult GetDepartmentById(int id)
        {
            var check = (from q in con.Departments
                         where q.Dept_ID == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteDepartmentByID(int id)
        {
            var r = (from q in con.Departments
                     where q.Dept_ID == id
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