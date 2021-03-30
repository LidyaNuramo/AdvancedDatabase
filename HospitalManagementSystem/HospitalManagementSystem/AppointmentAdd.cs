using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlTypes;

namespace HospitalManagementSystem
{
    public partial class AppointmentAdd : Form
    {
        public AppointmentAdd()
        {
            InitializeComponent();
        }

        private void AppointmentAdd_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet1.RoomList' table. You can move, or remove it, as needed.
            this.roomListTableAdapter.Fill(this.dataSet1.RoomList);
            // TODO: This line of code loads data into the 'dataSet1.NurseList' table. You can move, or remove it, as needed.
            this.nurseListTableAdapter.Fill(this.dataSet1.NurseList);
            // TODO: This line of code loads data into the 'dataSet1.DoctorList' table. You can move, or remove it, as needed.
            this.doctorListTableAdapter.Fill(this.dataSet1.DoctorList);
            // TODO: This line of code loads data into the 'dataSet1.PatientList' table. You can move, or remove it, as needed.
            this.patientListTableAdapter.Fill(this.dataSet1.PatientList);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int? PatientID = (int)patientListComboBox.SelectedValue;
            int? DoctorID = (int)doctorListComboBox.SelectedValue;
            int? NurseID = (int)nurseListComboBox.SelectedValue;
            int? RoomID = (int)roomListComboBox.SelectedValue;
            DateTime date = dateTimePicker1.Value.Date;
            DateTime t2 = dateTimePicker2.Value;
            TimeSpan time = new TimeSpan(t2.Hour, t2.Minute, t2.Second);
            String note = textBox1.Text;
            String rec = null;
            procedures1.AppointmentInsert(PatientID, DoctorID, NurseID, RoomID, date, time, note, rec);
            Close();
        }

        private void fillToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.patientListTableAdapter.Fill(this.dataSet1.PatientList);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void iDLabel1_Click(object sender, EventArgs e)
        {

        }

        private void iDLabel_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void deptNameLabel_Click(object sender, EventArgs e)
        {

        }
    }
}
