using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAO.DATA;
using BUS;
using System.Text.RegularExpressions;

namespace GUI
{
    public partial class frmHome : Form
    {
        private readonly CalendarService calendarService = new CalendarService();
        private DateTime monthDefault = DateTime.Now;
        public frmHome()
        {
            InitializeComponent();
        }
        #region Method
        //Tinh tien lam trong 1 ngay
        private long tinhTienLamTrong1Ngay(int soGio)
        {
            return soGio * 25;
        }

        //Format tien
        private string FormatMoney(long tien)
        {
            return String.Format("{0:n0}", tien);
        }

        //Load lich lam 
        private void LoadLichLam(List<Calendar> cld)
        {
            
            dgvLichLam.Rows.Clear();
            foreach (Calendar item in cld)
            {

                    
                    int index = dgvLichLam.Rows.Add();
                    DataGridViewRow row = dgvLichLam.Rows[index];

                    row.Cells["clNgayLam"].Value = item.ngayLam.ToString("dd/MM/yyyy");
                    row.Cells["clGioBatDau"].Value = item.gioBatDau.ToString();
                    row.Cells["clGioKetThuc"].Value = item.gioKetThuc.ToString();
                    if (item.gioKetThuc == 23)
                    {
                        row.Cells["clGioKetThuc"].Style.BackColor = Color.Red;
                        row.Cells["clGioKetThuc"].Style.ForeColor = Color.White;
                    }
                    int soGioLam = item.gioKetThuc - item.gioBatDau;
                    row.Cells["clSoGioLam"].Value = soGioLam.ToString();
                    long thanhTien;
                    if (item.Holiday != true)
                        thanhTien = soGioLam * 25000;
                    else
                        thanhTien = soGioLam * 25000 * 4;
                    row.Cells["clThanhTien"].Value = FormatMoney(thanhTien);
                    row.Cells["clHoliday"].Value = item.Holiday;
            }
        }


        #endregion
        private void dgvTrangChu_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void frmHome_Load(object sender, EventArgs e)
        {
            txtDate.Text = monthDefault.ToString("MM/yyyy");
            List<Calendar> calendars = calendarService.LayTheoThangNam(monthDefault);
            LoadLichLam(calendars);
        }



        //Nếu click vào button Before thì giảm đi 1 tháng
        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            monthDefault = monthDefault.AddMonths(-1);
            frmHome_Load(sender, e);
        }


        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            monthDefault = monthDefault.AddMonths(1);
            frmHome_Load(sender, e);
        }


        private void txtDate_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                toolStripButton3_Click(sender, e);  
            }
        }   
        private void toolStripButton3_Click(object sender, EventArgs e)
        {

            try
            {
                bool isValidFormat = Regex.IsMatch(txtDate.Text, @"^\d{2}/\d{4}$");
                if (!isValidFormat)
                    throw new Exception("Tháng Năm nhập vào không đúng định dạng\n Yêu cầu MM/yyyy");
                //txtDate.Text = "01/"+txtDate.Text;
                monthDefault = DateTime.Parse(txtDate.Text);
                frmHome_Load(sender, e);
            }
            catch (Exception ex)
            {
                    MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        //Kiem tra neu no trung voi thoi gian nao thi chon thoi gian do
        
        private void dgvLichLam_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //int index = dgvLichLam.Rows.Add();
            DataGridViewRow row = dgvLichLam.SelectedRows[0];
            DateTime date = DateTime.Parse((string)row.Cells["clNgayLam"].Value);
            int beginTime = int.Parse(row.Cells["clGioBatDau"].Value.ToString());
            int endTime = int.Parse(row.Cells["clGioKetThuc"].Value.ToString());
            bool isHolidate = bool.Parse(row.Cells["clHoliday"].Value.ToString());

            dtpDate.Value = date;
            if(cmbBegin.)
        }
    }
}
