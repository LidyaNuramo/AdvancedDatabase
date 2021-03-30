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
    public partial class Patients : Form
    {
        public Patients()
        {
            InitializeComponent();
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Patients_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet1.PatientList' table. You can move, or remove it, as needed.
            this.patientListTableAdapter.Fill(this.dataSet1.PatientList);

        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            new CreateExcel(patientListDataGridView, @"C:\Users\user\OneDrive\Desktop\HospitalManagementSystem\HospitalManagementSystem\Downloads\PatientsList");
        }
    }
}
