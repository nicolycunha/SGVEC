using System;
using System.Web.UI;
using SGVEC.Controller;
using MySql.Data.MySqlClient;
using SGVEC.Models;

namespace SGVEC.View
{
    public partial class DashBoard : System.Web.UI.Page
    {
        private Connect cnt = new Connect();
        private DataManipulation dtManip = new DataManipulation();
        private GeneralComponent gc = new GeneralComponent();

        protected void Page_Load(object sender, EventArgs e)
        {
            cnt.DataBaseConnect();
            MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + 0 + "', '" + gc.CPF + "', '" + gc.Nome + "')");

            if (leitor.Read())lblNomeFunc.Text = leitor[2].ToString();            
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

        protected void imgButtonReport_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("http://localhost:52149/View/Screen/Report#");
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://localhost:52149/Login#");
        }
    }
}