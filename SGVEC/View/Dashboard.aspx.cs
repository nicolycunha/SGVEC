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

            if (leitor.Read())
            {
                lblNomeFunc.Text = leitor[2].ToString();
            }

            if (gc.CodFunc == 1)
            {
                imgButtonEmployee.Enabled = false;
                imgButtonTypeProduct.Enabled = false;
                imgButtonProduct.Enabled = true;
                ImageButtonSupplier.Enabled = false;
                imgButtonStorege.Enabled = false;
                imgButtonSales.Enabled = true;
                imgButtonReport.Enabled = false;
            }
            else if (gc.CodFunc == 2)
            {
                imgButtonEmployee.Enabled = false;
                imgButtonTypeProduct.Enabled = false;
                imgButtonProduct.Enabled = false;
                ImageButtonSupplier.Enabled = false;
                imgButtonStorege.Enabled = false;
                imgButtonSales.Enabled = true;
                imgButtonReport.Enabled = false;
            }
            else if (gc.CodFunc == 3)
            {
                imgButtonEmployee.Enabled = true;
                imgButtonTypeProduct.Enabled = true;
                imgButtonProduct.Enabled = true;
                ImageButtonSupplier.Enabled = true;
                imgButtonStorege.Enabled = true;
                imgButtonSales.Enabled = true;
                imgButtonReport.Enabled = true;
            }
            else if (gc.CodFunc == 4)
            {
                imgButtonEmployee.Enabled = true;
                imgButtonTypeProduct.Enabled = true;
                imgButtonProduct.Enabled = true;
                ImageButtonSupplier.Enabled = false;
                imgButtonStorege.Enabled = true;
                imgButtonSales.Enabled = true;
                imgButtonReport.Enabled = false;
            }
            else if (gc.CodFunc == 5)
            {
                imgButtonEmployee.Enabled = false;
                imgButtonTypeProduct.Enabled = false;
                imgButtonProduct.Enabled = true;
                ImageButtonSupplier.Enabled = false;
                imgButtonStorege.Enabled = false;
                imgButtonSales.Enabled = true;
                imgButtonReport.Enabled = false;
            }
            else if (gc.CodFunc == 6)
            {
                imgButtonEmployee.Enabled = false;
                imgButtonTypeProduct.Enabled = false;
                imgButtonProduct.Enabled = true;
                ImageButtonSupplier.Enabled = true;
                imgButtonStorege.Enabled = true;
                imgButtonSales.Enabled = false;
                imgButtonReport.Enabled = false;
            }
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