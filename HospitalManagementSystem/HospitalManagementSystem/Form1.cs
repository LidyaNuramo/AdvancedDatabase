using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HospitalManagementSystem
{
    public partial class Form1 : Form
    {
        Appointments apps;
        public Form1()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
            apps = new Appointments();
            apps.MdiParent = this;
            apps.Show();
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            apps = new Appointments();
            apps.MdiParent = this;
            apps.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            Patients pat = new Patients();
            pat.MdiParent = this;
            pat.Show();
        }
    }
}
