using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvcApp1.Controllers
{
    public class MainController : Controller
    {
        //
        // GET: /Main/

        public ActionResult main() 
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
