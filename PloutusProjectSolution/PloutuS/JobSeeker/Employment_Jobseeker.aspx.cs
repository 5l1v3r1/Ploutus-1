﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employment_Jobseeker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/JobSeeker/Acknowledgment_jobseeker.aspx", false);
    }
    protected void btnSkip_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/JobSeeker/UserHome.aspx", false);
    }
}