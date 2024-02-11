using InventoryManagement.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InventoryManagement.Controllers
{
    public class SalesController : Controller
    {
        // GET: Sales
        Entities con = new Entities();

        #region Sales

        public ActionResult Sales()
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
                        Status = model.Status,
                        Created_Date = DateTime.Now,
                        Created_By = "System"
                    };

                    try
                    {
                        con.Sales_Issue.Add(obj);
                        con.SaveChanges();
                        var id = con.Sales_Issue.Select(x => x.Issued_ID).Max();
                        var infoData = (from q in con.Sales_Issue
                                        where q.Issued_ID == id
                                        select q).FirstOrDefault();

                        return Json(new { success = true, infoData, message = "Added" }, JsonRequestBehavior.AllowGet);
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
                        check.Placement = model.Placement;
                        check.Status = model.Status;
                        check.Modify_Date = DateTime.Now;
                        check.Modify_By = "m.asif";

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
                    Text = x.Emp_ID + " : " + x.Name,
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


        public ActionResult returnAllItems(string IssueID, string Comments)
        {
            int issueID = Convert.ToInt32(IssueID);
            var check2 = (from q in con.Sales_Issue
                          where q.Issued_ID == issueID
                          select q).FirstOrDefault();
            if (check2 != null)
            {
                var check = (from q in con.Sales_Issue_Details
                             where q.Issued_ID == issueID
                             select q).ToList();
                for (int i = 0; i < check.Count; i++)
                {
                    var invNo = check[i].Inventory_No;
                    int sr = check[i].SerialNo;
                    var check3 = (from q in con.Sales_Issue_Details
                                  where q.Issued_ID == issueID && q.Inventory_No == invNo && q.SerialNo == sr
                                  select q).FirstOrDefault();

                    check3.Comments = "Received";
                    check3.Status = "N";

                    con.Entry(check3).State = EntityState.Modified;
                    con.SaveChanges();
                }
                check2.Comments = Comments;
                check2.Status = "0";
                con.Entry(check2).State = EntityState.Modified;
                con.SaveChanges();
            }

            return Json("", JsonRequestBehavior.AllowGet);
        }
        #endregion




        #region Sales Details
        public void GetAllProduct()
        {
            var AllEmp = (from q in con.Inventory_Available
                          join p in con.Products on q.PID equals p.PID
                          where q.Status == "1"
                          select new
                          {
                              p.Cat_ID,
                              p.Category.Name,
                              p.Model_Name,
                              q.Inventory_No,
                              q.PID,
                              q.Status
                          }).ToList();

            if (AllEmp.Count > 0)
            {
                var data = ViewBag.allAvailableInventory = AllEmp.Select(x => new SelectListItem
                {
                    Value = x.Inventory_No.ToString(),
                    Text = x.Name + " " + x.Model_Name + " (" + x.Inventory_No + ")",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
            else
            {
                var data = ViewBag.allAvailableInventory = AllEmp.Select(x => new SelectListItem
                {
                    Value = "",
                    Text = "No Data Found",
                    //Selected = (x.STOCK_NO==""),
                    //Disabled=(x.STOCK_NO=="")
                }).Distinct().ToList();
            }
        }
        public ActionResult DDLInventoryAvailable()
        {
            var AllEmp = (from q in con.Inventory_Available
                          join p in con.Products on q.PID equals p.PID
                          where q.Status == "1"
                          select new
                          {
                              p.Cat_ID,
                              p.Category.Name,
                              p.Model_Name,
                              q.Inventory_No,
                              q.PID,
                              q.Status
                          }).ToList();
            return Json(AllEmp, JsonRequestBehavior.AllowGet);
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
                var r = (from q in con.v_SalesDetails
                         where q.Issued_ID == Issued_ID
                         select q).ToList();

                //var r = (from d in con.Departments
                //         join e in con.Employees on d.Dept_ID equals e.Dept_ID
                //         join des in con.Designations on e.Designation_ID equals des.Designation_ID
                //         join si in con.Sales_Issue on e.Emp_ID equals si.Emp_ID
                //         join sid in con.Sales_Issue_Details on si.Issued_ID equals sid.Issued_ID
                //         join ia in con.Inventory_Available on sid.Inventory_No equals ia.Inventory_No
                //         join p in con.Products on ia.PID equals p.PID
                //         join c in con.Categories on p.Cat_ID equals c.Cat_ID
                //         let Sales_IssueStatus=si.Status
                //         let SalesDetailsStatus = sid.Status
                //         let CatName = c.Name let DeptName = d.Name let Sales_Issue_DetailsComments= sid.Comments
                //         select new 
                //         {
                //             si.Emp_ID, e.Name, si.Comments, si.Placement, si.Created_Date, Sales_IssueStatus,
                //             sid.Inventory_No, sid.Issued_From, sid.Issued_By, sid.Issue_Type, sid.Issued_Date,
                //             SalesDetailsStatus, CatName, p.Model_Name, si.Issued_ID, DeptName, sid.SerialNo,
                //             Sales_Issue_DetailsComments, sid.Modify_Date, sid.Modify_By, sid.Description,
                //             des.Designation_Title, e.Designation_ID
                //         }).ToList();
                int asif = 1;
                //var r = (from q in con.Sales_Issue_Details
                //         select new viewModelSales_Issue_Details
                //         {
                //             Issued_ID = q.Issued_ID,
                //             Inventory_No = q.Inventory_No,
                //             //cName = p.Category.Name,
                //             //PID = q.PID,
                //             //pName = p.Model_Name,
                //             Inventory_No = q.Inventory_No,
                //             Comments = q.Comments,
                //             Issued_From = q.Issued_From,
                //             Issued_By = q.Issued_By,
                //             Issue_Type = q.Issue_Type,
                //             Issued_Date = q.Issued_Date,
                //             Status = q.Status
                //         }).ToList();
                return View(r);
            }
        }

        public ActionResult GetSalesDetailsById(string id)
        {
            int SerialNo = Convert.ToInt32(id.Substring(10));
            var Inventno = id.Substring(0, 10);

            var check = (from q in con.Sales_Issue_Details
                         join ia in con.Inventory_Available on q.Inventory_No equals ia.Inventory_No
                         join p in con.Products on ia.PID equals p.PID
                         join c in con.Categories on p.Cat_ID equals c.Cat_ID
                         where q.Inventory_No == Inventno && q.SerialNo == SerialNo
                         select new
                         {
                             p.Cat_ID,
                             c.Name,
                             p.Model_Name,
                             q.Description,
                             ia.Inventory_No,
                             ia.PID,
                             ia.Status,
                             //q.Issued_ID,
                             //q.Comments,
                             q.Issued_By,
                             q.Issued_From,
                             q.Issue_Type,
                             q.Issued_Date,
                             q.Modify_Date,
                             q.Modify_By

                         }).ToList();
            if (check.Count > 0)
            {
                return Json(check, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("No Data Found", JsonRequestBehavior.AllowGet);

        }

        public ActionResult DeleteSalesDetailsByID(string id)
        {
            var InventNo = id.Substring(0, 10);
            int SerialNo = Convert.ToInt32(id.Substring(10));

            var r = (from q in con.Sales_Issue_Details
                     where q.Inventory_No == InventNo && q.SerialNo == SerialNo
                     select q).FirstOrDefault();
            if (r != null)
            {
                try
                {
                    con.Entry(r).State = EntityState.Deleted;
                    con.SaveChanges();

                    var d = con.Inventory_Available.Where(x => x.Inventory_No == InventNo).FirstOrDefault();
                    d.Status = "1";
                    con.Entry(d).State = EntityState.Modified;
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

        public ActionResult AddOrEditsalesDetails(string IssuedID, string Inventory_No, string Issued_From, string Description, string Issue_Type)
        {
            int isuue = Convert.ToInt32(IssuedID);
            // GetAllOfferProgram();

            var check = con.Sales_Issue_Details.Where(x => x.Inventory_No == Inventory_No && x.Issued_ID == isuue
            && x.Status == "Y").FirstOrDefault();
            if (check == null)
            {
                var GetserialNo = con.Sales_Issue_Details.Where(x => x.Inventory_No == Inventory_No && x.Issued_ID == isuue)
                                    .Select(x => x.SerialNo).ToList();
                int serialNo = 0;
                if (GetserialNo.Count == 0)
                {
                    serialNo = 1;
                }
                else
                {
                    serialNo = GetserialNo.Max();
                    serialNo++;
                }

                //add here
                Sales_Issue_Details obj = new Sales_Issue_Details();
                obj.Inventory_No = Inventory_No;
                obj.Issued_ID = isuue;
                obj.SerialNo = serialNo;
                obj.Inventory_No = Inventory_No;
                obj.Description = Description;
                obj.Issued_From = Issued_From;
                obj.Issue_Type = Issue_Type;
                obj.Issued_By = "system";
                obj.Issued_Date = DateTime.Now;
                obj.Status = "Y";

                //{
                //    Inventory_No = Inventory_No,
                //    Issued_ID = isuue,
                //    Inventory_No = Inventory_No,
                //    Comments = Comments,
                //    Issued_From = Issued_From,
                //    Issued_By = "UserDI",
                //    Issue_Type = Issue_Type,
                //    Issued_Date = DateTime.Now,
                //    Status = Status
                //};

                try
                {
                    con.Sales_Issue_Details.Add(obj);
                    con.SaveChanges();
                    var id = con.Sales_Issue_Details.Where(x => x.Inventory_No == Inventory_No).Select(x => x.SerialNo).Max();

                    var d = con.Inventory_Available.Where(x => x.Inventory_No == Inventory_No).FirstOrDefault();
                    d.Status = "2";
                    con.Entry(d).State = EntityState.Modified;
                    con.SaveChanges();

                    return Json(new { success = true, id = Inventory_No + "" + id, message = "Added" }, JsonRequestBehavior.AllowGet);
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
                    check.Inventory_No = Inventory_No;
                    check.Description = Description;
                    check.Issued_From = Issued_From;
                    check.Issue_Type = Issue_Type;
                    check.Modify_By = "asif";
                    check.Modify_Date = DateTime.Now;

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

        public ActionResult returnItems(string IssueID, string InventNo, string Comments)
        {
            int issueId = Convert.ToInt32(IssueID);
            int SerialNo = Convert.ToInt32(InventNo.Substring(10));
            var Inventno = InventNo.Substring(0, 10);

            var r = (from q in con.Sales_Issue_Details
                     where q.Issued_ID == issueId && q.Inventory_No == Inventno && q.SerialNo == SerialNo
                     select q).FirstOrDefault();
            r.Status = "N";
            r.Comments = Comments;
            con.Entry(r).State = EntityState.Modified;
            con.SaveChanges();

            var rr = (from q in con.Inventory_Available
                      where q.Inventory_No == Inventno
                      select q).FirstOrDefault();
            rr.Status = "1";
            con.Entry(rr).State = EntityState.Modified;
            con.SaveChanges();

            return Json("", JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}