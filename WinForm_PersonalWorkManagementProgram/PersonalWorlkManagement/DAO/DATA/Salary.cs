namespace DAO.DATA
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Salarys")]
    public partial class Salary
    {
        [Key]
        public int maLuong { get; set; }

        public int soGioCong { get; set; }

        public int soDonHang { get; set; }

        public int tienCong { get; set; }

        public int tienGiaoHang { get; set; }

        public int tongTien { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayBatDau { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayKetThuc { get; set; }
    }
}
