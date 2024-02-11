using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        Entities con = new Entities();

        #region Employee
        public ActionResult Product()
        {
            GetAllOfferProduct();
            return View();
        }
        public ActionResult AddOrEdit(viewModeProduct model)
        {
            if (model.Model_Name == null)
            {
                GetAllOfferProduct();
                return View();
            }
            else
            {
                var check = con.Products.Where(x => x.PID == model.PID).FirstOrDefault();
                if (check == null)
                {
                    //add here
                    int getPID = 0;
                    var getAllPID = con.Products.ToList();
                    if (getAllPID.Count > 0)
                    {
                        getPID = con.Products.Select(x => x.PID).Max();
                        if (getPID == 0)
                        {
                            getPID = 100;
                        }
                        else
                        {
                            getPID++;
                        }
                    }
                    else
                        getPID = 100;

                    Product obj = new Product
                    {
                        PID = getPID,
                        Cat_ID = model.Cat_ID,
                        Model_Name = model.Model_Name,
                        Status = model.Status
                    };

                    try
                    {
                        con.Products.Add(obj);
                        con.SaveChanges();
                        //var id = con.Products.Select(x => x.PID).Max();
                        return Json(new { success = true, id = getPID, message = "Added" }, JsonRequestBehavior.AllowGet);
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
                        check.Cat_ID = model.Cat_ID;
                        check.Model_Name = model.Model_Name;
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
        public void GetAllOfferProduct()
        {
            var AllEmp = (from q in con.Categories
                          select new
                          {
                              q.Cat_ID,
                              q.Name
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allCategories = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.Cat_ID.ToString(),
                    Text = x.Name,
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
            else
            {
                var data = ViewBag.allCategories = AllEmp.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
        }
        public ActionResult AllProduct()
        {
            var emp = (from q in con.Products
                       select new viewModeProduct
                       {
                           PID = q.PID,
                           Cat_ID = q.Cat_ID,
                           CatName = q.Category.Name,
                           Model_Name = q.Model_Name,
                           Status = q.Status

                       }).ToList();

            return View(emp);

        }

        public ActionResult GetProductById(int id)
        {
            var check = (from q in con.Products
                         where q.PID == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteProductByID(int id)
        {
            var r = (from q in con.Products
                     where q.PID == id
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