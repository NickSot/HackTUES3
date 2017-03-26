using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

//Това е класът, съдържащ логиката на задаване на въпросите

namespace NIKFORUM
{
    public partial class NewQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Middle.previousPage = "NewQuestion.aspx";
            //Проверка за първо влизане в страницата и инициализация на Session променливите
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Session["username"] = "";
                    Session["isLogged"] = "N";
                }
            }
            this.lblLogin.Text = Session["username"].ToString();

            if (Session["IsLogged"].ToString() == "Y")
            {
                this.lbtnLogin.Text = "Logout";
                this.lBtnRegister.Visible = false;
            }
            else
            {
                this.lbtnLogin.Text = "Login";
                this.lBtnRegister.Visible = true;
            }
        }
        //Event, който връща към предишната страница
        protected void btnHome_Click(object sender, EventArgs e)
        {
            switch (Middle.pageCounter) { 
                case 1:
                    Response.Redirect("Default.aspx");
                    break;
                case 2:
                    Response.Redirect("AllQuestions.aspx");
                    break;
                case 3:
                    Response.Redirect("Answers.aspx");
                    break;
                default:
                    Response.Redirect("Default.aspx");
                    break;

            }
        }
        //Проверка и извеждане на формата за логин
        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            if (this.lbtnLogin.Text == "Logout")
            {
                Session["isLogged"] = "N";
                Session["username"] = "";
                this.lbtnLogin.Text = "Login";
                this.lblLogin.Text = "";
                this.lBtnRegister.Visible = true;
            }
        }
        //Пренос към регистрационната страница
        protected void lBtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewRegistration.aspx");
        }

        //Логика на логин
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
            else
            {
                Session["isLogged"] = "Y";
                Session["username"] = Dt.Rows[0][1].ToString();
                this.lblLogin.Text = Dt.Rows[0][1].ToString();
                this.lbtnLogin.Text = "Logout";
                this.lBtnRegister.Visible = false;
            }
        }
        
        //Логика на събмит бутона за въпроса
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["isLogged"].ToString() == "N") {
                this.lblErr.ForeColor = System.Drawing.Color.Red;
                this.lblErr.Text = "You are not logged in...";
                return;
            }
            if (this.TxtQuestion.Text.Trim() == "") {
                this.lblErr.ForeColor = System.Drawing.Color.Red;
                this.lblErr.Text = "This question is empty...";
                return;
            }
            this.lblErr.ForeColor = System.Drawing.Color.Blue;
            this.lblErr.Text = "Successfully posted a question!!!";
            string a = Session["username"].ToString();
            SqlCommand cmd = new SqlCommand("Insert RPost (SubjectNick, SubjectDate, PostSubject) Select '" + Session["username"].ToString() + "', GetDate(), '" + this.TxtQuestion.Text.Replace("\r\n", "<br/>") + "'", Middle.getConnection());
            cmd.ExecuteNonQuery();
            Middle.sqlConnection.Close();
        }
    }
}