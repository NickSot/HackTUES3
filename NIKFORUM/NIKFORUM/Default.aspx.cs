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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Middle.pageCounter = 1;
            Middle.previousPage = "Default.aspx";

            SqlQuestions.ConnectionString = Middle.sqlConnectionString;
            SqlQuestions.SelectCommand = "SELECT Top 5 Id, SubjectNick, SubjectDate, PostSubject from RPost order by id desc";
            GridQuestions.DataBind();

            int counter = 0;

            for (int i = 0; i < GridQuestions.Rows.Count; i++, counter++) {
                ((LinkButton)GridQuestions.Rows[i].FindControl("LBtnAnswer")).CommandArgument = GridQuestions.Rows[i].Cells[0].Text;
                
            }

                if (!IsPostBack)
                {
                    if (Session["username"] == null)
                    {
                        Session["username"] = "";
                        Session["isLogged"] = "N";
                    }
                }
            this.lblLogin.Text = Session["username"].ToString();

            if (Session["IsLogged"].ToString() == "Y") {
                this.lbtnLogin.Text = "Logout";
                this.lBtnRegister.Visible = false;
            }
            else {
                this.lbtnLogin.Text = "Login";
                this.lBtnRegister.Visible = true;
            }
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            if (this.lbtnLogin.Text == "Logout") {
                Session["isLogged"] = "N";
                Session["username"] = "";
                this.lbtnLogin.Text = "Login";
                this.lblLogin.Text = "";
                this.lBtnRegister.Visible = true;
            }
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable Dt = new DataTable();
            SqlDataAdapter Da = new SqlDataAdapter("SELECT * from RUser where UserNick = '" + this.TxtUser.Text + "' and UserPass = '" + this.TxtPass.Text + "'", Middle.getConnection());
            Da.Fill(Dt);
            if (Dt.Rows.Count == 0)
            {
                this.lblErrLogin.Text = "Wrong Username or paswsword...";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "showLoginA();", true);
                return;
            }
            else {
                Session["isLogged"] = "Y";
                Session["username"] = Dt.Rows[0][1].ToString();
                this.lblLogin.Text = Dt.Rows[0][1].ToString();
                this.lbtnLogin.Text = "Logout";
                this.lBtnRegister.Visible = false;
            }
        }

        protected void lBtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewRegistration.aspx");
        }

        protected void newQuestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewQuestion.aspx");
        }

        protected void btnAllQuestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllQuestions.aspx");
        }

        protected void GridQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LBtnAnswer_Click(object sender, EventArgs e)
        {
            Middle.currentQuestionId = ((LinkButton)sender).CommandArgument;
            Response.Redirect("Answers.aspx");
        }


    }
}   