using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace NIKFORUM
{
    public partial class NewRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect(Middle.previousPage);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (this.TxtUser.Text.Trim() == "") {
                this.lblErrRegister.Text = "Empty username...";
                return;
            }
            if (this.TxtEmail.Text.Trim() == "") {
                this.lblErrRegister.Text = "Empty email...";
                return;
            }
            if (this.TxtPass.Text == "")
            {
                this.lblErrRegister.Text = "Empty password...";
                return;
            }
            if (this.TxtPass.Text != this.TxtPassConf.Text) {
                this.lblErrRegister.Text = "Passwords don't match...";
                return;
            }
            DataTable Dt = new DataTable();
            SqlDataAdapter Da = new SqlDataAdapter("Select UserNick from RUser where UserNick='" + this.TxtUser.Text + "'", Middle.getConnection());
            Da.Fill(Dt);

            if (Dt.Rows.Count > 0)
            {
                this.lblErrRegister.ForeColor = System.Drawing.Color.Red;
                this.lblErrRegister.Text = "Username already exists...";
                return;
            }
            SqlCommand cmd = new SqlCommand("Insert RUser (UserNick, UserPass, UserEmail) Select '" + this.TxtUser.Text.Trim() + "', '" + this.TxtPass.Text + "', '" + this.TxtEmail.Text.Trim() + "'", Middle.getConnection());
            cmd.ExecuteNonQuery();
            this.lblErrRegister.ForeColor = System.Drawing.Color.White;
            this.lblErrRegister.Text = "Successfully created a user! Please proceed to login...";
            Response.Redirect(Middle.previousPage);
        }
    }
}