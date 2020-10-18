using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SalesSystem.Models
{
    public class UserModel
    {
        public UserModel()
        {
            lstUserTypes = new List<string>();
            lstUserTypes.Add("Select item");
        }
        [Required]
        public String Firstname { get; set; }
        [Required]
        public String Lastname { get; set; }
        [Required]
        public String username { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public String Password { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public String Email { get; set; }
        [Required]
        [DataType(DataType.PhoneNumber)]
        public String ContactNo { get; set; }
        [Required]
        public String UserType { get; set; }

        public List<string> lstUserTypes { get; set; }

    }
}