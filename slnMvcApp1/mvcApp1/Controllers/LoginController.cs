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

        public ActionResult Login() 
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string loginName) 
        {
            return RedirectToAction("ShopList", new { loginName = loginName });
        }

        //public ActionResult Market() 
        //{
        //    return View();
        //}
        
        //public ActionResult Market(string loginName)
        //{
        //    return RedirectToAction("ShopList", new { loginName = loginName});
        //}

        public ActionResult shopList(string loginName, string password) 
        {
            ViewData["name"] = loginName;
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
