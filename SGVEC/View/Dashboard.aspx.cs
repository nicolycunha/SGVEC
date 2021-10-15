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
            MySqlDataReader leitor = dtManip.ExecuteDataReader("CALL PROC_SELECT_FUNC('" + 0 + "', '" + gc.CPF + "', '" + gc.Name + "')");

            if (leitor.Read())lblNomeFunc.Text = leitor[2].ToString();            
        }
       
    }
}