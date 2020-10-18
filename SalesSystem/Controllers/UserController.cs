using SalesSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SalesSystem.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult UserRegistration()
        {
            UserModel userModel = new UserModel();
            return View("Registration",userModel);
        }

        public ActionResult RegistrationProcess(UserModel user)
        {
            UserModel userModel = new UserModel();
            return View("Registration", userModel);
        }

    }
}