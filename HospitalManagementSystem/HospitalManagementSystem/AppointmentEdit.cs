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
    public partial class AppointmentEdit : Form
    {
        public int PatientID;
        public AppointmentEdit()
        {
            InitializeComponent();
        }

        private void AppointmentEdit_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet1.AppointmentList' table. You can move, or remove it, as needed.
            this.patientListTableAdapter.Fill(this.dataSet1.PatientList);
            if (PatientID == -1)
            {
                iDLabel1.Visible = false;
                appointmentLookupBindingSource.AddNew();
            }
            else
            {
                this.appointmentLookupTableAdapter.Fill(this.dataSet2.AppointmentLookup, PatientID);
            }
        }

        private void fillToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                //this.appointmentLookupTableAdapter.Fill(this.dataSet2.AppointmentLookup, new System.Nullable<int>(((int)(System.Convert.ChangeType(iDToolStripTextBox.Text, typeof(int))))));
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void patientNameLabel1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DateTime date = dateDateTimePicker.Value.Date;
            DateTime t2 = timeDateTimePicker.Value;
            TimeSpan time = new TimeSpan(t2.Hour, t2.Minute, t2.Second);
            Close();
        }
    }
}
