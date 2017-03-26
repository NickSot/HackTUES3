using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

//Клас за отговорите на въпросите

namespace NIKFORUM
{
    public partial class Answers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Middle.pageCounter = 3;
            Middle.previousPage = "Answers.aspx";
            SqlQuestions.ConnectionString = Middle.sqlConnectionString;
            SqlQuestions.SelectCommand = "SELECT Top 5 Id, SubjectNick, SubjectDate, PostSubject from RPost where Id = " + Middle.currentQuestionId + " order by id desc";
            GridQuestions.DataBind();

            SqlAnswers.ConnectionString = Middle.sqlConnectionString;
            SqlAnswers.SelectCommand = "SELECT Id, AnswerText, AnswerDate, AnswerNick, QuestionId from RAnswers where QuestionId = " + Middle.currentQuestionId + " order by id desc";
            GridAnswers.DataBind();

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
        //Показване и скриване на логин формата
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
        //Препратка към регистрацията...
        protected void lBtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewRegistration.aspx");
        }

        //Препратката към страницата за нов въпрос
        protected void newQuestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewQuestion.aspx");
        }
        //Логика на Хоум бутона
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void GridQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //Логика за изпращане на отговор и проверки за Логина
        protected void sendAnswer_Click(object sender, EventArgs e)
        {
            if (Session["isLogged"].ToString() == "N")
            {
                this.lblErr.ForeColor = System.Drawing.Color.Red;
                this.lblErr.Text = "You are not logged in...";
                return;
            }
            if (this.TxtAnswer.Text.Trim() == "")
            {
                this.lblErr.ForeColor = System.Drawing.Color.Red;
                this.lblErr.Text = "This answer is empty...";
                return;
            }
            this.lblErr.ForeColor = System.Drawing.Color.Blue;
            this.lblErr.Text = "Successfully posted an answer!!!";
            
            string a = Session["username"].ToString();
            SqlCommand cmd = new SqlCommand("Insert RAnswers (AnswerText, AnswerDate, AnswerNick, QuestionId) Select '" + this.TxtAnswer.Text.Replace("\r\n", "<br/>") + "', GetDate(), '" + Session["username"].ToString() + "', " + Middle.currentQuestionId , Middle.getConnection());
            cmd.ExecuteNonQuery();
            Middle.sqlConnection.Close();
            this.TxtAnswer.Text = "";
            this.GridAnswers.DataBind();
        }

        //Препратка към Всички въпроси
        protected void btnHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AllQuestions.aspx");
        }

        
    }
}