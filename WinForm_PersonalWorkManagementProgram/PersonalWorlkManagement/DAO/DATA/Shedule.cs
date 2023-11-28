namespace DAO.DATA
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Shedule")]
    public partial class Shedule
    {
        [Key]
        public int maLichHoc { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayHoc { get; set; }

        public int gioBatDau { get; set; }

        public int gioKetThuc { get; set; }

        [Required]
        [StringLength(15)]
        public string lopHoc { get; set; }

        [StringLength(50)]
        public string tenMonHoc { get; set; }

        public bool kiemTra { get; set; }

        public string baiTapVeNha { get; set; }
    }
}
