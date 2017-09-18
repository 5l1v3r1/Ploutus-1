using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Word;
using System.Configuration;

public partial class Marketing_Resumes : System.Web.UI.Page
{
    string conn1 = (ConfigurationManager.AppSettings["Resumes"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (ViewState["filename"].ToString() != "")
            {
                string filename = ViewState["filename"].ToString();

                if (filename != "")
                {
                    string path = conn1;
                    System.IO.FileInfo file1 = new System.IO.FileInfo(path);
                    if (file1.Exists)
                    {
                        ApplicationClass wordApp = new ApplicationClass();

                        object file = path;

                        object nullobj = System.Reflection.Missing.Value;

                        Microsoft.Office.Interop.Word.Document doc = wordApp.Documents.Open(

                        ref file, ref nullobj, ref nullobj,

                        ref nullobj, ref nullobj, ref nullobj,

                        ref nullobj, ref nullobj, ref nullobj,

                        ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj, ref nullobj);



                        doc.ActiveWindow.Selection.WholeStory();

                        doc.ActiveWindow.Selection.Copy();

                        string sFileText = doc.Content.Text;

                        doc.Close(ref nullobj, ref nullobj, ref nullobj);

                        wordApp.Quit(ref nullobj, ref nullobj, ref nullobj);


                        txtResume.Text = sFileText;
                        popsystem.Show();
                    }
                }
            }
            else
            {
                //lblResume.Visible = true;
                //lblResume.Text = "Sorry Resume not availble please upload resume new resume once again";
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}
                    