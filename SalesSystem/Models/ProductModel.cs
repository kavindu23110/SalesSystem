using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SalesSystem.Models
{
    public class ProductModel
    {
        public int SupplierId { get; set; }
        public int ProductCategoryId { get; set; }
        public int BrandIdId { get; set; }
        public string warrenty { get; set; }
        public string Details { get; set; }
        public float ProfitMargin { get; set; }

        public List<> SupplierName { get; set; }
    }
}