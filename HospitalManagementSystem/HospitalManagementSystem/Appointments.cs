using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace HospitalManagementSystem
{
    public partial class Appointments : Form
    {
        public Appointments()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
        }

        private void Appointments_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet1.AppointmentList' table. You can move, or remove it, as needed.
            this.appointmentListTableAdapter.Fill(this.dataSet1.AppointmentList);
            // TODO: This line of code loads data into the 'dataSet1.AppointmentList' table. You can move, or remove it, as needed.
            this.appointmentListTableAdapter.Fill(this.dataSet1.AppointmentList);

        }

        private void appointmentListBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.appointmentListBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void appointmentListBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            this.Validate();
            this.appointmentListBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            new CreateExcel(appointmentListDataGridView, @"C:\Users\user\OneDrive\Desktop\HospitalManagementSystem\HospitalManagementSystem\Downloads\AppointmentsList");
        }

        private void appointmentListDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            AppointmentAdd AD = new AppointmentAdd();
            AD.ShowDialog();
            this.appointmentListTableAdapter.Fill(this.dataSet1.AppointmentList);
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Delete the appointment?", "Hospital Management System", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int apptID;
                apptID = (int)appointmentListDataGridView.CurrentRow.Cells["ID"].Value;
                procedures1.AppointmentDelete(apptID);
                this.appointmentListTableAdapter.Fill(this.dataSet1.AppointmentList);
            }
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            int apptID;
            apptID = (int)appointmentListDataGridView.CurrentRow.Cells["ID"].Value;
            AppointmentEdit appt = new AppointmentEdit();
            appt.PatientID = apptID;
            appt.ShowDialog();
            this.appointmentListTableAdapter.Fill(dataSet1.AppointmentList);
        }
    }
}
