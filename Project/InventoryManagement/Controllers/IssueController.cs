using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class IssueController : Controller
    {
        // GET: Issue
        Entities con = new Entities();

        #region Sales

        public ActionResult Issue()
        {
            GetAllOfferProgram();
            return View();
        }
        public ActionResult AddOrEdit(viewModelSales_Issue model)
        {

            if (model.Emp_ID == null)
            {
                GetAllOfferProgram();
                return View();
            }
            else
            {
                var check = con.Sales_Issue.Where(x => x.Issued_ID == model.Issued_ID).FirstOrDefault();
                if (check == null)
                {
                    //add here
                    Sales_Issue obj = new Sales_Issue
                    {
                        Emp_ID = model.Emp_ID,
                        Comments = model.Comments,
                        Placement = model.Placement,
                        Status = model.Status
                    };

                    try
                    {
                        con.Sales_Issue.Add(obj);
                        con.SaveChanges();
                        var id = con.Sales_Issue.Select(x => x.Issued_ID).Max();
                        return Json(new { success = true, id = id, message = "Added" }, JsonRequestBehavior.AllowGet);
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
                        check.Comments = model.Comments;
                        check.Placement = model.Placement;
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
        public void GetAllOfferProgram()
        {
            var AllEmp = (from q in con.Employees
                          select new
                          {
                              q.Emp_ID,
                              q.Name
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allEmployees = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.Emp_ID.ToString(),
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
        public ActionResult AllSales()
        {
            var emp = (from q in con.Sales_Issue
                       select new viewModelSales_Issue
                       {
                           Issued_ID = q.Issued_ID,
                           Emp_ID = q.Emp_ID,
                           eName = q.Employee.Name,
                           Comments = q.Comments,
                           Placement = q.Placement,
                           Created_Date = q.Created_Date,
                           Status = q.Status

                       }).ToList();

            return View(emp);

        }

        public ActionResult GetSalesById(int id)
        {
            var check = (from q in con.Sales_Issue
                         where q.Issued_ID == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteSalesByID(string id)
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


        #region Sales Details
        public void GetAllProduct()
        {
            var AllEmp = (from q in con.Products
                          join c in con.Categories
   on q.Cat_ID equals c.Cat_ID
                          select new
                          {
                              q.Cat_ID,
                              q.PID,
                              c.Name,
                              q.Model_Name
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allEmployees = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.PID.ToString(),
                    Text = x.Name + " " + x.Model_Name,
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
        public ActionResult SalesDetails(int? Issued_ID)
        {
            GetAllProduct();
            if (Issued_ID == null)
            {
                return RedirectToAction("Sales");
            }
            else
            {
                var r = (from q in con.Sales_Issue_Details
                         select new viewModelSales_Issue_Details
                         {
                             Issued_ID = q.Issued_ID,
                             //Cat_ID=q.Cat_ID,
                             //cName = p.Category.Name,
                             //PID = q.PID,
                             //pName = p.Model_Name,
                             Inventory_No = q.Inventory_No,
                             Comments = q.Comments,
                             Issued_From = q.Issued_From,
                             Issued_By = q.Issued_By,
                             Issue_Type = q.Issue_Type,
                             Issued_Date = q.Issued_Date,
                             Status = q.Status
                         }).ToList();
                return View(r);
            }


            return View();
        }

        public ActionResult GetSalesDetailsById(string id)
        {
            var check = (from q in con.Sales_Issue_Details
                         where q.Inventory_No == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteSalesDetailsByID(string id)
        {
            var r = (from q in con.Sales_Issue_Details
                     where q.Inventory_No == id
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