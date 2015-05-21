using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcApp1.Controllers
{
    public class DemoController : Controller
    {
        //
        // GET: /Demo/

        public ActionResult DemoTest() 
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
