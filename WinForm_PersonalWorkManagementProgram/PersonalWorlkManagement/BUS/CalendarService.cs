using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO.DATA;
namespace BUS
{
    public  class CalendarService
    {
        Data db = new Data();
        public List<Calendar> GetAll()
        {
            return db.Calendars.ToList();
        }

        public List<Calendar> LayTheoThangNam(DateTime date)
        {
            return db.Calendars.Where(p=>p.ngayLam.Month == date.Month && p.ngayLam.Year == date.Year).ToList();
        }

    }
}
