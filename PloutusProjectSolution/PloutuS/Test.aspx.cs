using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Microsoft.Office;
using System.Text.RegularExpressions;  

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {

        WordFileToRead.SaveAs(Server.MapPath(WordFileToRead.FileName));
        object filename = Server.MapPath(WordFileToRead.FileName);
        Microsoft.Office.Interop.Word.ApplicationClass AC = new Microsoft.Office.Interop.Word.ApplicationClass();
        Microsoft.Office.Interop.Word.Document doc = new Microsoft.Office.Interop.Word.Document();
        object readOnly = false;
        object isVisible = true;
        object missing = System.Reflection.Missing.Value;
        try
        {
            doc = AC.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref isVisible, ref isVisible, ref missing, ref missing, ref missing);

            StringReader sr = new StringReader(doc.Content.Text);

            string[] NameSurname1 = doc.Content.Text.Split('\r');

            string fullname = NameSurname1[0];

            string[] name = fullname.Split();
            if (name.Length == 3)
            {
                txtFname.Text = name[0];
                txtLname.Text = name[2];
            }
            else
            {
                txtFname.Text = name[0];
                txtLname.Text = name[1];
            }                
           
            const string MatchPhonePattern =@"\(?\d{3}\)?-? *\d{3}-? *-?\d{4}";
            Regex rx = new Regex(MatchPhonePattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            // Find matches.
            MatchCollection matches = rx.Matches(doc.Content.Text);
            // Report the number of matches found.
            int noOfMatches = matches.Count;
            // Report on each match.
           //  string tempPhoneNumbers = "";
            foreach (Match match in matches)
            {
                txtphoneNo.Text = txtphoneNo.Text + match.Value.ToString(); 
            }

            const string MatchEmailPattern = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"; 
              Regex rx1 = new Regex(MatchEmailPattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            // Find matches.
            MatchCollection matches1 = rx1.Matches(doc.Content.Text);
            // Report the number of matches found.
            int noOfMatches1 = matches1.Count;
            // Report on each match.
             string tempemail = "";
             foreach (Match match1 in matches1)
            {

                txtEmail.Text = txtEmail.Text + match1.Value.ToString(); 

            }

             const string Zipcode = @"\d{5}";
             Regex rxzipcode = new Regex(Zipcode, RegexOptions.Compiled | RegexOptions.IgnoreCase);
             // Find matches.
             MatchCollection matcheszip = rxzipcode.Matches(doc.Content.Text);
             // Report the number of matches found.
             int mat = matcheszip.Count;
             // Report on each match.           
             foreach (Match match2 in matcheszip)
             {

                 txtZip.Text = txtZip.Text + match2.Value.ToString();

             }           
             
            
          
        }
        catch (Exception ex)
        {

        }

    
    
    }  
}