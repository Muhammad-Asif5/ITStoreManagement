using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class InventoryController : Controller
    {
        // GET: Inventory
        Entities con = new Entities();

        #region Inventory
        public ActionResult Inventory()
        {

            coman();

            GetAllProduct();
            return View();
        }

        void coman()
        {
            var check = con.Inventory_Available.ToList();
            if (check.Count > 0)
            {
                var getID = (from q in con.Inventory_Available
                             select q.Inventory_No).Max().Substring(3);
                int InvenID = Convert.ToInt32(getID);
                InvenID++;
                string autoId = String.Format("{0:ISB0000000}", InvenID);
                ViewBag.Inventory_No = autoId;
            }
            else
            {
                ViewBag.Inventory_No = "ISB0000001";
            }
        }
        public ActionResult AddOrEdit(viewModeInventory_Available model)
        {

            if (model.Inventory_No == null)
            {
                GetAllProduct();
                return View();
            }
            else
            {
                var check = con.Inventory_Available.Where(x => x.Inventory_No == model.Inventory_No).FirstOrDefault();
                if (check == null)
                {
                    //add here
                    Inventory_Available obj = new Inventory_Available
                    {
                        Inventory_No = model.Inventory_No,
                        PID = model.PID,
                        Placement = model.Placement,
                        Status = model.Status
                    };

                    try
                    {
                        con.Inventory_Available.Add(obj);
                        con.SaveChanges();

                        var getID = (from q in con.Inventory_Available
                                     select q.Inventory_No).Max().Substring(3);
                        int InvenID = Convert.ToInt32(getID);

                        InvenID++;
                        string NewInventoryNo = String.Format("{0:ISB0000000}", InvenID);

                        return Json(new { success = true, NewInventoryNo, message = "Added" }, JsonRequestBehavior.AllowGet);
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
                        check.Inventory_No = model.Inventory_No;
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
        public void GetAllProduct()
        {
            var AllEmp = (from q in con.Products
                          join c in con.Categories
   on q.Cat_ID equals c.Cat_ID
                          select new
                          {
                              q.PID,
                              q.Cat_ID,
                              q.Model_Name,
                              q.Status,
                              c.Name
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allProduct = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.PID.ToString(),
                    Text = x.Name + " : Model No (" + x.Model_Name + ")",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
            else
            {
                var data = ViewBag.allProduct = AllEmp.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
        }
        public ActionResult AllInventory()
        {
            var emp = (from q in con.Inventory_Available
                       join p in con.Products
on q.PID equals p.PID
                       // where q.Status!="2"
                       select new viewModeInventory_Available
                       {
                           Inventory_No = q.Inventory_No,
                           PID = q.PID,
                           PName = p.Category.Name + " : " + p.Model_Name,
                           //Model_Name = q.Product.Model_Name,
                           Placement = q.Placement,
                           Status = q.Status

                       }).ToList();

            return View(emp);

        }

        public ActionResult GetInventoryById(string id)
        {
            var check = (from q in con.Inventory_Available
                         where q.Inventory_No == id
                         select q).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteInventoryByID(string id)
        {
            var r = (from q in con.Inventory_Available
                     where q.Inventory_No == id
                     select q).FirstOrDefault();
            if (r != null)
            {
                try
                {
                    con.Entry(r).State = EntityState.Deleted;
                    con.SaveChanges();
                    string NewInventoryNo = "";
                    var gelAllInvtID = con.Inventory_Available.ToList();
                    if (gelAllInvtID.Count > 0)
                    {
                        var getID2 = (from q in con.Inventory_Available
                                      select q.Inventory_No).Max().Substring(3);
                        int InventoryNo = Convert.ToInt32(getID2);
                        InventoryNo++;
                        NewInventoryNo = String.Format("{0:ISB0000000}", InventoryNo);
                    }
                    else
                        NewInventoryNo = "ISB0000001";


                    return Json(new { Delete = "Delete", NewInventoryNo, success = true, message = "Deleted successfully", JsonRequestBehavior.AllowGet });
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