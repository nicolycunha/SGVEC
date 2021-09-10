using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGVEC.View
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgButtonEmployee_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Employee#");
        }

        protected void imgButtonTypeProduct_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/TypeProduct#");
        }

        protected void imgButtonProduct_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Product#");
        }

        protected void imgButtonSupplier_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Supplier#");
        }

        protected void imgButtonStorege_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Storege#");
        }

        protected void imgButtonSales_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Sales#");
        }        
    }
}