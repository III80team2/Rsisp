using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcApp1.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Login(string loginName) 
        {
            
            return View();
        }
        //[HttpPost]
        //public ActionResult Login(string loginName) 
        //{
        //    return RedirectToAction("ShopList", new { loginName = loginName });
        //}

        public ActionResult shopList(string patientName) 
        {
            if(Session["kk"]==null)
                Session["kk"] = patientName;

            return View();
        }

        public ActionResult patientSelect(string loginName) 
        {
            if (Session["AA"] == null)
                Session["AA"] = loginName;

            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
